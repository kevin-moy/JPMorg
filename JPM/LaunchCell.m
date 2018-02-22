//
//  LaunchCell.m
//  JPM
//
//  Created by Kevin on 2/21/18.
//  Copyright © 2018 Kevin. All rights reserved.
//

#import "LaunchCell.h"

@implementation LaunchCell

- (id)initWithLaunch:(Launch *)launchObject {
    self.launch = launchObject;
    if (self = [super init]) {
        [self setCellView:self.launch];
    }
    return self;
}

- (void)setCellView:(Launch *)launch {
    self.flightNumberLabel.text = [NSString stringWithFormat:@"Flight: %.0f", launch.flightNumber];
    self.launchYearLabel.text = [NSString stringWithFormat:@"Launch Year: %@", launch.year];
    self.launchSiteLabel.text = [NSString stringWithFormat:@"Launch Site: %@", launch.site];
    self.launchDateLabel.text = [NSString stringWithFormat:@"Launch Date: %@", launch.date];
    self.rocketNameLabel.text = [NSString stringWithFormat:@"Rocket Name: %@", launch.rocket.name];
    self.rocketTypeLabel.text = [NSString stringWithFormat:@"Rocket Type: %@", launch.rocket.type];
    self.payloadIDLabel.text = [NSString stringWithFormat:@"Payload ID: %@", launch.rocket.payloadID];
}

@end
