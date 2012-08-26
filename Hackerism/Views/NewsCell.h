#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *title;
@property (nonatomic, weak) IBOutlet UILabel *subtitle;
@property (nonatomic, weak) IBOutlet UILabel *details;
@property (nonatomic, weak) IBOutlet UILabel *url;

+ (NewsCell *) fromNib;
@end