#import <UIKit/UIKit.h>

@protocol WSURL <NSObject>
- (NSURL *) url;
@end

@interface WSHOMEURL : NSObject <WSURL> @end
@interface WSNEWESTURL : NSObject <WSURL> @end