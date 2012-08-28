#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface NetworkHUD : NSObject
@property(nonatomic, strong) MBProgressHUD *hud;
- (void)connectToParentView:(UIView *)parentView;
- (void)handleHUDTap:(UITapGestureRecognizer *)gr;
- (void)show;
@end