#import "NewsDetailViewController.h"

@implementation NewsDetailViewController
@synthesize webView = _webView;
@synthesize url = _url;

- (void)viewDidLoad
{
    NSURL *nsurl = [NSURL URLWithString:self.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:nsurl];
    [self.webView loadRequest:request];
}

@end