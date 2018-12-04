#import "NSDateFormatter+CKEasyMappingAdditions.h"

NSString * const CKThreadDateFormatterKey = @"CKThreadDateFormatter";

@implementation NSDateFormatter (CKEasyMappingAdditions)
    
+(NSDateFormatter *)ck_formatterForCurrentThread
    {
        NSMutableDictionary *dictionary = [[NSThread currentThread] threadDictionary];
        NSDateFormatter *dateFormatter = [dictionary objectForKey:CKThreadDateFormatterKey];
        if (!dateFormatter)
        {
            dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
            dateFormatter.dateFormat = CKISO_8601DateTimeFormat;
            dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
            [dictionary setObject:dateFormatter forKey:CKThreadDateFormatterKey];
        }
        return dateFormatter;
    }
    
    @end
