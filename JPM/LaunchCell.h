//
//  LaunchCell.h
//  JPM
//
//  Created by Kevin on 2/21/18.
//  Copyright © 2018 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Launch.h"

@interface LaunchCell : UITableViewCell
- (id)initWithLaunch:(Launch *)launchObject;
@property (weak, nonatomic) IBOutlet UILabel *flightNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *launchYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *launchSiteLabel;
@property (weak, nonatomic) IBOutlet UILabel *launchDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *rocketNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *rocketTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *payloadIDLabel;
@property (nonatomic, strong) Launch *launch;
@end
