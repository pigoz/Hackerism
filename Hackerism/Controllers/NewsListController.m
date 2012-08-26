#import "NewsListController.h"
#import "AFNetworking.h"

#import "../Views/NewsCell.h"
#import "../Views/NetworkHUD.h"

@implementation NewsListController
@synthesize items = _items;

- (void) reloadData {
    NSURL *url = [NSURL URLWithString:@"http://api.ihackernews.com/page"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *fop = [AFJSONRequestOperation
        JSONRequestOperationWithRequest:request
                                success:^(NSURLRequest *req, NSHTTPURLResponse* resp, id json) {
                                    self.items = [(NSDictionary *)json objectForKey:@"items"];
                                    [(UITableView *)self.view reloadData];
                                }
                                failure:^(NSURLRequest *req, NSHTTPURLResponse *resp, NSError *error, id json) {
                                    [[NetworkHUD networkFailure:self.navigationController.view] show:YES];
                                }];
    [fop start];
}

- (void) viewDidLoad
{
    [self reloadData];
}

#pragma mark - UITableDataViewsource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"newsIdentifier";
    NewsCell *cell =  (NewsCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) cell = [NewsCell fromNib];
    
    NSDictionary *newsItem = self.items[indexPath.row];
    cell.title.text = newsItem[@"title"];
    cell.subtitle.text = [NSString stringWithFormat:@"%@ Points - %@ Comments",
                                 newsItem[@"points"], newsItem[@"commentCount"]];
    cell.details.text = [NSString stringWithFormat:@"Posted by %@, %@",
                          newsItem[@"postedBy"], newsItem[@"postedAgo"]];
    
    cell.url.text = newsItem[@"url"];
    return cell;
}

@end