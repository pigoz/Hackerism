#import <UIKit/UIKit.h>

@interface NewsDetailViewController : UIViewController
@property(nonatomic, retain) IBOutlet UIWebView *webView;
@property(nonatomic, retain) NSString *url;
@end