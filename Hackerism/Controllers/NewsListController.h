#import <UIKit/UIKit.h>

@interface NewsListController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) NSArray *items;
@end