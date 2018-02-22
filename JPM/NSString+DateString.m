//
//  NSString+DateString.m
//  JPM
//
//  Created by Kevin on 2/21/18.
//  Copyright © 2018 Kevin. All rights reserved.
//

#import "NSString+DateString.h"

@implementation NSString (DateString)

-(NSString *)convertDateToShort:(NSString *)dateString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    NSDate *date = [formatter dateFromString:dateString];
    formatter.dateFormat = @"MMM d, yyyy";
    NSString *shortDate = [formatter stringFromDate:date];
    return shortDate;
}
@end
