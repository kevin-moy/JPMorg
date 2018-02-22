//
//  ViewController.m
//  JPM
//
//  Created by Kevin on 2/20/18.
//  Copyright © 2018 Kevin. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "Constants.m"
#import "Launch.h"
#import "LaunchCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *datasourceArray;
@property (nonatomic, strong) NSString *startDateFilter;
@property (nonatomic, strong) NSString *endDateFilter;
@property (nonatomic, strong) NSString *launchYearFilter;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datasourceArray = [NSMutableArray array];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = @"yyyy-MM-dd";
    [self getUpcomingLaunches:nil forStartDateFilter:nil andEndDateFilter:nil];
}

-(void)getUpcomingLaunches: (NSString *)launchFilter forStartDateFilter: (NSString *)startDateFilter andEndDateFilter: (NSString *) endDateFilter {
    
    NSString *urlString = BASE_URL;
    if (launchFilter != nil) {
        urlString = [NSString stringWithFormat:@"%@%@", LAUNCH_YEAR_URL, launchFilter];
    }
    if (startDateFilter != nil) {
        urlString = [NSString stringWithFormat:@"%@%@", START_DATE_URL, startDateFilter];
    }
    if (endDateFilter != nil) {
        urlString = [NSString stringWithFormat:@"%@%@", END_DATE_URL, endDateFilter];
    }
    NSURL *url = [NSURL URLWithString:urlString];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *launchArray = [NSArray array];
        NSDictionary *dictionary = responseObject;
        //
        for (NSDictionary *data in dictionary) {
            Launch *launchObject = [[Launch alloc] initWithData:data];
            [self.datasourceArray addObject:launchObject];
        }
         [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
                                                                        message:[error localizedDescription]
                                                                       delegate:nil
                                                              cancelButtonTitle:@"OK"
                                                              otherButtonTitles:nil];
                    [alertView show];
        
    }];
}

#pragma mark - Table View Data Source
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    static NSString *CellIdentifier = @"cell";
      LaunchCell *cell = (LaunchCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = (LaunchCell *)[[LaunchCell alloc] init];
    }
    
    cell = [cell initWithLaunch:self.datasourceArray[indexPath.row]];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasourceArray.count;
}
- (IBAction)filterButtonPressed:(UIBarButtonItem *)sender {
    [self.navigationController setNavigationBarHidden:true animated:true];
    self.filterView.alpha = 1;
}

- (IBAction)cancelButtonPressed:(UIBarButtonItem *)sender {
    [self.navigationController setNavigationBarHidden:false animated:true];
    self.filterView.alpha = 0;
}

- (IBAction)applyButtonPressed:(UIBarButtonItem *)sender {
    self.filterView.alpha = 0;
    [self.launchYearTextField resignFirstResponder];
    [self.navigationController setNavigationBarHidden:false animated:true];
}

- (IBAction)startDateChanged:(UIDatePicker *)sender {
    self.startDateFilter = [self.dateFormatter stringFromDate:sender.date];
}

- (IBAction)endDateChanged:(UIDatePicker *)sender {
    self.endDateFilter = [self.dateFormatter stringFromDate:sender.date];
}
- (IBAction)launchYearFilterChanged:(UITextField *)sender {
    self.launchYearFilter = sender.text;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
    // Only accept numbers
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSCharacterSet *nonNumberSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    return ([string stringByTrimmingCharactersInSet:nonNumberSet].length > 0) || [string isEqualToString:@""];
}

@end
