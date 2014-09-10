//
//  DateFormatter.h
//  Stickle
//
//  Created by Nethery, Matt on 8/22/14.
//
//

#import <Foundation/Foundation.h>

@interface DateFormatter : NSObject

+(NSString*)dateWithShortStringFromDate:(NSDate*)date;
+(NSString*)dateWithFullStringFromDate:(NSDate*)date;
+(NSString*)dateWithScheduledFormat:(NSDate*)date;
    
@end
