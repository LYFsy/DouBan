//
//  ViewController.m
//  WebViewAndAudio
//
//  Created by 刘一峰 on 2017/5/17.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
@interface ViewController ()<WKUIDelegate,WKNavigationDelegate>
@property (strong, nonatomic) WKWebView *iWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.iWebView = [[WKWebView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.iWebView.UIDelegate = self;
    self.iWebView.navigationDelegate = self;
    [self.view addSubview:self.iWebView];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://121.40.47.177:8872/nightingale/h5Info.app?actionMethod=queryArticleInfo&appType=2&articleId=658&acctType=3&userId=5c452f6e55c04856a143a90ac8f167d3&flag=app"]];
    [self.iWebView loadRequest:request];
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSURL *URL = navigationAction.request.URL;
    NSString *scheme = [URL scheme];
    if ([scheme isEqualToString:@"haleyaction"]) {
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
