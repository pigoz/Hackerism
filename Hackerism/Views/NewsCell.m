#import "NewsCell.h"

@implementation NewsCell
@synthesize title = _title;
@synthesize time = _time;
@synthesize details = _details;
@synthesize url = _url;

+ (NewsCell *)cellWithIdentifier:(NSString *)identifier
                    forTableView:(UITableView*)tableView
{
    NewsCell *cell = (NewsCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"NewsCell" bundle:nil]
        forCellReuseIdentifier:identifier];
        cell = (NewsCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    }

    return cell;
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