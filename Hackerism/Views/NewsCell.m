#import "NewsCell.h"

@implementation NewsCell
@synthesize title = _title;
@synthesize time = _time;
@synthesize details = _details;
@synthesize url = _url;

+ (NewsCell *)fromNib
{
    NSArray *nibFileEntries = [[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil];
    return nibFileEntries[0];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();

    CGGradientRef glossGradient;
    CGColorSpaceRef rgbColorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = {
        1.0, 1.0, 1.0, 1.0,  // Start color
        0.933, 0.933, 0.933, 1.0 }; // End color

    rgbColorspace = CGColorSpaceCreateDeviceRGB();
    glossGradient = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, num_locations);

    CGRect currentBounds = self.bounds;
    CGPoint topCenter = CGPointMake(CGRectGetMidX(currentBounds), 0.0f);
    CGPoint lowCenter = CGPointMake(CGRectGetMidX(currentBounds), CGRectGetHeight(currentBounds));
    CGContextDrawLinearGradient(currentContext, glossGradient, topCenter, lowCenter, 0);

    CGGradientRelease(glossGradient);
    CGColorSpaceRelease(rgbColorspace);
}
@end