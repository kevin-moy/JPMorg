//
//  Rocket.m
//  JPM
//
//  Created by Kevin on 2/20/18.
//  Copyright © 2018 Kevin. All rights reserved.
//

#import "Rocket.h"

@implementation Rocket

-(id)initWithData:(NSDictionary *)data {
    self = [super init];
    
    if (self) {
        self.name = [data objectForKey:@"rocket_name"];
        self.type = [data objectForKey:@"rocket_type"];
    }
    return self;
}

@end
