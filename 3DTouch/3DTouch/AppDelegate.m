//
//  AppDelegate.m
//  3DTouch
//
//  Created by 刘志恒 on 16/10/26.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//点击items会调用
-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    
   
    
    
    UITabBarController *tabBarcontroller = (UITabBarController *)self.window.rootViewController;
    
    
    
    if ([shortcutItem.type isEqualToString:@"type1"]) {//点击了列表
        //就相当于点击了tabbar里的第一个item
        tabBarcontroller.selectedIndex = 0;
        
    }else{//点击了force
        
        tabBarcontroller.selectedIndex = 1;
    }
    
    
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    
    //创建两个item
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc]initWithType:@"type1" localizedTitle:@"列表"];
    
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc]initWithType:@"type2" localizedTitle:@"force"];
    //把items添加到application当中
    
    [UIApplication sharedApplication].shortcutItems = @[item1,item2];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
