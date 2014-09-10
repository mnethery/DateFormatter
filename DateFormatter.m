//
//  DateFormatter.m
//  Stickle
//
//  Created by Nethery, Matt on 8/22/14.
//
//

#import "DateFormatter.h"

@implementation DateFormatter

+(NSString*)dateWithShortStringFromDate:(NSDate*)date{
    
    NSDate *today = [NSDate date];
    NSCalendar *calendarToday = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *todayComponents = [calendarToday components:(NSMonthCalendarUnit | NSWeekdayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit | NSWeekOfMonthCalendarUnit) fromDate:today];

    NSCalendar *calendarDate = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [calendarDate components:(NSMonthCalendarUnit | NSWeekdayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit | NSWeekOfMonthCalendarUnit) fromDate:date];
    
    NSInteger todayDay = [todayComponents weekday];
    NSInteger todayMonth = [todayComponents month];
    NSInteger todayYear = [todayComponents year];
    NSInteger todayWeek = [todayComponents weekOfMonth];

    NSInteger day = [dateComponents weekday];
    NSInteger month = [dateComponents month];
    NSInteger year = [dateComponents year];
    NSInteger week = [dateComponents weekOfMonth];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    if (day == todayDay && week == todayWeek && month == todayMonth && year == todayYear){
        //if today: return time with AM/PM
        [dateFormat setDateFormat:@"hh:mm a"];
        
    } else if (day == (todayDay - 1) && week == todayWeek && month == todayMonth && year == todayYear){
        //if yesterday, put text "Yesterday"
        return @"Yesterday";
        
    } else if (week == todayWeek && month == todayMonth && year == todayYear){
        //if this week, but not today: return name of day
        [dateFormat setDateFormat:@"EEEE"];

    }
    else {
        //if prior to this week, show date format 02/02/14
        [dateFormat setDateFormat:@"MM/dd/yy"];
    }
    
    NSString *dateString = [dateFormat stringFromDate:date];
    return dateString;
}

+(NSString*)dateWithFullStringFromDate:(NSDate*)date{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"hh:mm a, EEE MMMM dd yyyy"];
    return [dateFormat stringFromDate:date];
}

+(NSString*)dateWithScheduledFormat:(NSDate*)date{
    
    NSDate *today = [NSDate date];
    NSCalendar *calendarToday = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *todayComponents = [calendarToday components:(NSMonthCalendarUnit | NSWeekdayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit | NSWeekOfMonthCalendarUnit) fromDate:today];
    
    NSCalendar *calendarDate = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [calendarDate components:(NSMonthCalendarUnit | NSWeekdayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit | NSWeekOfMonthCalendarUnit) fromDate:date];
    
    NSInteger todayDay = [todayComponents weekday];
    NSInteger todayMonth = [todayComponents month];
    NSInteger todayYear = [todayComponents year];
    NSInteger todayWeek = [todayComponents weekOfMonth];
    
    NSInteger day = [dateComponents weekday];
    NSInteger month = [dateComponents month];
    NSInteger year = [dateComponents year];
    NSInteger week = [dateComponents weekOfMonth];
    
    NSString *dateString = @"";
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    if (day == todayDay && week == todayWeek && month == todayMonth && year == todayYear){
        //if today: return time with AM/PM
        [dateFormat setDateFormat:@"hh:mm a"];
        dateString = [dateString stringByAppendingFormat:@"Today, %@", [dateFormat stringFromDate:date]];
        
    } else if (day == (todayDay + 1) && week == todayWeek && month == todayMonth && year == todayYear){
        //if yesterday, put text "Yesterday"
        [dateFormat setDateFormat:@"hh:mm a"];
        dateString = [dateString stringByAppendingFormat:@"Tomorrow, %@", [dateFormat stringFromDate:date]];
        
    } else if (week == todayWeek && month == todayMonth && year == todayYear){
        //if this week, but not today: return name of day
        [dateFormat setDateFormat:@"EEEE, hh:mm a"];
        dateString = [dateFormat stringFromDate:date];
    }
    else {
        //if prior to this week, show date format 02/02/14
        [dateFormat setDateFormat:@"MM/dd/yy, hh:mm a"];
        dateString = [dateFormat stringFromDate:date];
    }
    
    return dateString;
}

@end
