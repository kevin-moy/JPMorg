//
//  Launch.m
//  JPM
//
//  Created by Kevin on 2/20/18.
//  Copyright © 2018 Kevin. All rights reserved.
//

#import "Launch.h"
#import "NSString+DateString.h"
@implementation Launch

-(id)initWithData:(NSDictionary *)data {
    self = [super init];
    
    if (self) {
        self.flightNumber = [[data objectForKey:@"flight_number"] doubleValue];
        self.year = [data objectForKey:@"launch_year"];
        self.site = [data objectForKey:@"launch_site"][@"site_name"];
        self.date = [data objectForKey:@"launch_date_utc"];
        self.date = [self.date convertDateToShort:self.date];
        NSDictionary *rocketData = [data objectForKey:@"rocket"];
        self.rocket = [[Rocket alloc] initWithData:rocketData];
    }
    return self;
}

@end
