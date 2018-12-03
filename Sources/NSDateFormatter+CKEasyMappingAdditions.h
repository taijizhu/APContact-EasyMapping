@import Foundation;

static NSString * const EKRFC_3339DatetimeFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
static NSString * const EKRFC_822DatetimeFormat = @"EEE, dd MMM yyyy HH:mm:ss z";
static NSString * const EKISO_8601DateTimeFormat = @"yyyy-MM-dd";

/**
 Category on NSDateFormatter, that allows getting NSDateFormatter for current thread.
 
 Note. On iOS 7 and higher and Mac OS X 10.7 and higher NSDateFormatter is thread-safe, so it's safe to use date formatter across multiple threads.
 */

@interface NSDateFormatter (CKEasyMappingAdditions)
    
    /**
     NSDateFormatter instance for current NSThread. It is lazily constructed, default date format - ISO 8601.
     */
+ (NSDateFormatter *)ck_formatterForCurrentThread;
    
    @end
