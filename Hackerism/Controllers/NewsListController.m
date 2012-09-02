#import "NewsListController.h"
#import "AFNetworking.h"
#import "../Views/NewsCell.h"

@implementation NewsListController
@synthesize items = _items;
@synthesize refreshHeaderView = _refreshHeaderView;
@synthesize reloading = _reloading;
@synthesize hud = _hud;

#define __HOME_URL @"http://hndroidapi.appspot.com/news/format/json/page/?appid=hackerism"

- (void)reloadData
{
    [self startReloadTableViewDataSource];
    NSURL *url = [NSURL URLWithString:__HOME_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *fop = [AFJSONRequestOperation
        JSONRequestOperationWithRequest:request
        success:^(NSURLRequest *req, NSHTTPURLResponse* resp, id json) {
            self.items = [(NSDictionary *)json objectForKey:@"items"];
            [(UITableView *)self.view reloadData];
            [self doneLoadingTableViewData:NO];
        }
        failure:^(NSURLRequest *req, NSHTTPURLResponse *resp, NSError *error, id json) {
            if (!self.hud) {
                self.hud = [NetworkHUD new];
                [self.hud connectToParentView:self.navigationController.view];
            }
            [self.hud show];
            [self doneLoadingTableViewData:YES];
        }];
    [fop start];
}

- (void)viewDidLoad
{
    [self reloadData];

    if (_refreshHeaderView == nil) {
        EGORefreshTableHeaderView *thview = [[EGORefreshTableHeaderView alloc]
            initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height,
                                     self.view.frame.size.width, self.tableView.bounds.size.height)];
        thview.delegate = self;
        [self.tableView addSubview:thview];
        _refreshHeaderView = thview;
	}
}

- (NSString *)shortPostedAgo: (NSString *) postedAgo
{
    NSArray *words = [postedAgo componentsSeparatedByString:@" "];
    return [NSString stringWithFormat:@"%@%c", words[0], [words[1] characterAtIndex:0]];
}

#pragma mark - UITableDataViewsource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"newsIdentifier";
    NewsCell *cell = [NewsCell cellWithIdentifier:cellIdentifier
                                     forTableView:tableView];
    
    NSDictionary *newsItem = self.items[indexPath.row];
    cell.title.text = newsItem[@"title"];
    cell.time.text = [self shortPostedAgo:newsItem[@"time"]];
    cell.details.text = [NSString
         stringWithFormat:@"@%@, %@ - %@",
         newsItem[@"user"], newsItem[@"score"], newsItem[@"comments"]];
    cell.url.text = newsItem[@"url"];
    return cell;
}

#pragma mark - Data Source Loading / Reloading Methods
- (void)startReloadTableViewDataSource
{
    self.reloading = YES;
}

- (void)doneLoadingTableViewData:(BOOL)error
{
    if (!error) [_refreshHeaderView refreshLastUpdatedDate];
    self.reloading = NO;
    [self.refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
}


#pragma mark - UIScrollViewDelegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}

#pragma mark - EGORefreshTableHeaderDelegate methods
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view
{
    [self reloadData];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view
{
    return self.isReloading;
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view
{
    return [NSDate date];
}

@end