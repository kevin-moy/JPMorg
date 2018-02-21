//
//  Rocket.h
//  JPM
//
//  Created by Kevin on 2/20/18.
//  Copyright © 2018 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rocket : NSObject

-(id)initWithData:(NSDictionary *)data;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *payload;

@end
