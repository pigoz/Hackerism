#import "NewsCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation NewsCell
@synthesize title = _title;
@synthesize time = _time;
@synthesize details = _details;
@synthesize url = _url;

- (UIColor *)lightBackgroundStop
{
    return [UIColor whiteColor];
}

- (UIColor *)darkBackgroundStop
{
    static float darkGrayComponent = 0.922;
    return [UIColor colorWithRed:darkGrayComponent
                           green:darkGrayComponent
                            blue:darkGrayComponent
                           alpha:1.0];
}

- (void)awakeFromNib
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = @[(id)[[self lightBackgroundStop] CGColor],
                        (id)[[self darkBackgroundStop] CGColor]];
    [self.layer insertSublayer:gradient atIndex:0];
}

@end