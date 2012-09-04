#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
#import "../Views/NetworkHUD.h"
#import "../Models/WSURL.h"

@interface NewsListController : UITableViewController <UITableViewDataSource, UITableViewDelegate, EGORefreshTableHeaderDelegate>
@property(nonatomic, assign, getter=isReloading) BOOL reloading;
@property(nonatomic, retain) NSArray *items;
@property(nonatomic, retain) EGORefreshTableHeaderView *refreshHeaderView;
@property(nonatomic, retain) NetworkHUD *hud;
@property(nonatomic, retain) IBOutlet NSObject<WSURL> *url;
@end