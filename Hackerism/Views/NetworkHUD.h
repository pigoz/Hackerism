#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface NetworkHUD : NSObject
+ (MBProgressHUD *) networkFailure:(UIView *)parentView;
@end