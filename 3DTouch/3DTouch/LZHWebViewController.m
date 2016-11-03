//
//  LZHWebViewController.m
//  3DTouch
//
//  Created by 刘志恒 on 16/10/27.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import "LZHWebViewController.h"

@interface LZHWebViewController ()

@end

@implementation LZHWebViewController

-(void)loadView{
    
    self.view = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = (UIWebView *)self.view;
    
    NSURL *url = [NSURL URLWithString:self.url];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];

}

#pragma mark peek出来之后 操作上拉 可以显示如下的几个items
-(NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    
    //创建“收藏”的操作
    UIPreviewAction *item1 = [UIPreviewAction actionWithTitle:@"收藏" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"你点击了收藏");
    }];
    //创建“举报”的操作
    UIPreviewAction *item2 = [UIPreviewAction actionWithTitle:@"举报" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"你点击了举报");
    }];
    
    //创建“确定”的操作
    UIPreviewAction *item3 = [UIPreviewAction actionWithTitle:@"确定" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"你点击了确定");
    }];
    
    
    //创建一个操作组 显示的是组的效果
    UIPreviewActionGroup *group = [UIPreviewActionGroup actionGroupWithTitle:@"" style:UIPreviewActionStyleDefault actions:@[item1,item2]];
    
    return @[group,item3];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
