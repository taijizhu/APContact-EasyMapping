#import "NSDateFormatter+CKEasyMappingAdditions.h"

NSString * const EKThreadDateFormatterKey = @"EKThreadDateFormatter";

@implementation NSDateFormatter (CKEasyMappingAdditions)
    
+(NSDateFormatter *)ck_formatterForCurrentThread
    {
        NSMutableDictionary *dictionary = [[NSThread currentThread] threadDictionary];
        NSDateFormatter *dateFormatter = [dictionary objectForKey:EKThreadDateFormatterKey];
        if (!dateFormatter)
        {
            dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
            dateFormatter.dateFormat = EKISO_8601DateTimeFormat;
            dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
            [dictionary setObject:dateFormatter forKey:EKThreadDateFormatterKey];
        }
        return dateFormatter;
    }
    
    @end
