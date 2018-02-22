//
//  ViewController.h
//  JPM
//
//  Created by Kevin on 2/20/18.
//  Copyright © 2018 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *filterView;
@property (weak, nonatomic) IBOutlet UINavigationItem *mainNavigationBar;
@property (weak, nonatomic) IBOutlet UITextField *launchYearTextField;


@end

