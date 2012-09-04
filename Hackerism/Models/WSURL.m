#import "WSURL.h"

#define __HOME_URL   @"http://hndroidapi.appspot.com/news/format/json/page/?appid=hackerism"

#define __NEWEST_URL @"http://hndroidapi.appspot.com/newest/format/json/page/?appid=Hackerism"

@implementation WSHOMEURL
- (NSURL *) url {
    return [NSURL URLWithString:__HOME_URL];
}
@end

@implementation WSNEWESTURL
- (NSURL *) url {
    return [NSURL URLWithString:__NEWEST_URL];
}
@end