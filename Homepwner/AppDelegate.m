//
//  AppDelegate.m
//  Homepwner
//
//  Created by Princess Sampson on 9/15/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import "AppDelegate.h"
#import "ItemStore.h"
#import "ItemsViewController.h"
#import "ImageStore.h"

@interface AppDelegate ()
@property(nonatomic) ItemStore *itemStore;

@end

@implementation AppDelegate


- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    BOOL success = [self.itemStore saveChanges];
    
    if (success) {
        NSLog(@"Saved %@ items to the store", @(self.itemStore.allItems.count));
    } else {
        NSLog(@"Failed to save items to the disk.");
    }
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    UINavigationController *navController = (UINavigationController*)self.window.rootViewController;
    ItemsViewController *ivc = (ItemsViewController*)navController.topViewController;
    self.itemStore = [ItemStore new];
    ivc.itemStore = self.itemStore;
    ivc.imageStore = [ImageStore new];
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}






@end
