//
//  TableViewController.m
//  3DTouch
//
//  Created by 刘志恒 on 16/10/27.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import "TableViewController.h"
#import "LZHModel.h"
#import "LZHWebViewController.h"

@interface TableViewController ()<UIViewControllerPreviewingDelegate>

@property(nonatomic,strong)NSMutableArray *arr;

@end

@implementation TableViewController

-(NSMutableArray *)arr{

    if (!_arr) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"help.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrM = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            
            LZHModel *model = [LZHModel modelWithDict:dict];
            
            [arrM addObject:model];
        }
        
        _arr = arrM;
    }
    
    return _arr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.view.backgroundColor = [UIColor grayColor];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LZHModel *model = self.arr[indexPath.row];
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    
    cell.textLabel.text = model.name;
    
#pragma mark PEEK 这里需要给cell注册 告诉哪一个cell可以去显示preview  可以去Peek
    [self registerForPreviewingWithDelegate:self sourceView:cell];
    
    return cell;
}

- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    
    //预览的controller
    LZHWebViewController *web = [[LZHWebViewController alloc]init];
    
    //转换坐标
    location = [self.tableView convertPoint:location fromView:[previewingContext sourceView]];
    
    //根据location去获取位置
    NSIndexPath *path = [self.tableView indexPathForRowAtPoint:location];
    
    //根据位置 获取模型数据
    
    LZHModel *model = self.arr[path.row];
    
    web.url = model.url;
    
    
    return web;
    
}

//使劲的时候push出来  pop
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    
    //隐藏底部的tabbar
    viewControllerToCommit.hidesBottomBarWhenPushed = YES;
    
    //跳转到peek 的controller 动画设置为无效
    [self.navigationController pushViewController:viewControllerToCommit animated:NO];
    
#pragma mark  viewControllerToCommit.hidesBottomBarWhenPushed = YES 可以自定义个TabBarController在push的时候 隐藏 不必在每次写这句代码

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    //点击了之后 返回来 cell的选中效果消失
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LZHModel *model = self.arr[indexPath.row];

    LZHWebViewController *web = [[LZHWebViewController alloc]init];
    
    web.url = model.url;
    
    web.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:web animated:YES];

}


@end
