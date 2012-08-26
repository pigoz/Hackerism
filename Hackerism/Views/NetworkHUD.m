#import "NetworkHUD.h"

@implementation NetworkHUD
+ (MBProgressHUD *) networkFailure:(UIView *)parentView
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:parentView];
    [parentView addSubview:hud];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error.png"]];
    hud.mode = MBProgressHUDModeCustomView;
	hud.labelText = @"Network error";
    return hud;
}
@end