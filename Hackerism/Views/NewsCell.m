#import "NewsCell.h"

@implementation NewsCell
@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize details = _details;
@synthesize url = _url;

+ (NewsCell *) fromNib
{
    NSArray *nibFileEntries = [[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil];
    return nibFileEntries[0];
}
@end