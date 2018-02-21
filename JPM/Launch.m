//
//  Launch.m
//  JPM
//
//  Created by Kevin on 2/20/18.
//  Copyright © 2018 Kevin. All rights reserved.
//

#import "Launch.h"

@implementation Launch

-(id)initWithData:(NSDictionary *)data {
    self = [super init];
    
    if (self) {
        self.flightNumber = [[data objectForKey:@"flight_number"] doubleValue];
        self.year = [data objectForKey:@"launch_year"];
        self.site = [data objectForKey:@"launch_site"];
        self.date = [data objectForKey:@"launc_date_utc"];
        
        NSArray *rocketData = [data objectForKey:@"rocket"];
        
       // for (NSDictionary *rocketData in rocketData) {
            self.rocket = [[Rocket alloc] initWithData:rocketData];
        //}
    }
    return self;
}

@end
