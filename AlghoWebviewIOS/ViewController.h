//
//  ViewController.h
//  AlghoWebviewIOS
//
//  Created by QuestIT on 10/06/22.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) IBOutlet WKWebView *webView;
@property (nonatomic, strong) NSString *productURL;

- (void) showToast:(int)param;
- (void) showInfo;

@end

