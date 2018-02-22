//
//  Launch.h
//  JPM
//
//  Created by Kevin on 2/20/18.
//  Copyright © 2018 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rocket.h"

@interface Launch : NSObject

-(id)initWithData:(NSDictionary *)data;

@property (strong, nonatomic) NSString *year;
@property (nonatomic) double flightNumber;
@property (strong, nonatomic) NSString *site;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) Rocket *rocket;
@end
