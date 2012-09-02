#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell
@property(nonatomic, weak) IBOutlet UILabel *title;
@property(nonatomic, weak) IBOutlet UILabel *time;
@property(nonatomic, weak) IBOutlet UILabel *details;
@property(nonatomic, weak) IBOutlet UILabel *url;

+ (NewsCell *)cellWithIdentifier:(NSString *)identifier
                    forTableView:(UITableView*)tableView;
@end