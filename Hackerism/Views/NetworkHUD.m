#import "NetworkHUD.h"

@implementation NetworkHUD
- (void)connectToParentView:(UIView *)parentView
{
    self.hud = [[MBProgressHUD alloc] initWithView:parentView];
    [parentView addSubview:self.hud];

    self.hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error.png"]];
    self.hud.mode = MBProgressHUDModeCustomView;
    self.hud.labelText = @"Network error";

    // handle click on hud
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]
        initWithTarget:self action:@selector(handleHUDTap:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.hud addGestureRecognizer:tap];
}

- (void)show
{
    [self.hud show:YES];
}

- (void)handleHUDTap:(UITapGestureRecognizer *)gr
{
    NSLog(@"tap1");
    [self.hud hide:NO];
    NSLog(@"tap2");
}
@end