#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@interface NewsListController : UITableViewController <UITableViewDataSource, UITableViewDelegate, EGORefreshTableHeaderDelegate>
@property (nonatomic, assign, getter=isReloading) BOOL reloading;
@property (nonatomic, retain) NSArray *items;
@property (nonatomic, retain) EGORefreshTableHeaderView *refreshHeaderView;
@end