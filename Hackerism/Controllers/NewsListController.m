#import "NewsListController.h"
#import "AFNetworking.h"

#import "../Views/NewsCell.h"
#import "../Views/NetworkHUD.h"

@implementation NewsListController
@synthesize items = _items;

#define HOME_URL @"http://hndroidapi.appspot.com/news/format/json/page/?appid=hackerism"

- (void) reloadData {
    NSURL *url = [NSURL URLWithString:HOME_URL];
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

- (NSString *) shortPostedAgo: (NSString *) postedAgo
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
    NewsCell *cell =  (NewsCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) cell = [NewsCell fromNib];
    
    NSDictionary *newsItem = self.items[indexPath.row];
    cell.title.text = newsItem[@"title"];
    cell.time.text = [self shortPostedAgo:newsItem[@"time"]];
    cell.details.text = [NSString
         stringWithFormat:@"@%@, %@ - %@",
         newsItem[@"user"], newsItem[@"score"], newsItem[@"comments"]];
    cell.url.text = newsItem[@"url"];
    return cell;
}

@end