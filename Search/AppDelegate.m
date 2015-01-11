//
//  AppDelegate.m
//  Search
//
//  Created by Sam Sheffres on 10/13/14.
//  Copyright (c) 2014 Sam Sheffres. All rights reserved.
//

#import "AppDelegate.h"
#import <Crashlytics/Crashlytics.h>
#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [Crashlytics startWithAPIKey:@"2e194fdc1c6231c65855f240e5c3f55d30fe2e4a"];
    
    [Parse setApplicationId:@"HasETiUYhJkoAAsjSjOA4gAqFmIE0kMVYtHYZ1cn"
                  clientKey:@"lpmgvdVVTFh07VtFS7MFwIjDHAr4RhazwysiSeVl"];
    
    if (![PFUser currentUser]) {
        [PFAnonymousUtils logInWithBlock:^(PFUser *user, NSError *error) {
            if (error) {
                NSLog(@"Anonymous login failed.");
            } else {
                NSLog(@"Anonymous user logged in.");
                [self updateUser];
            }
        }];
    } else {
        [self updateUser];
    }
    
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

- (void)updateUser {
    [[PFUser currentUser] incrementKey:@"RunCount"];
    
    [[PFUser currentUser] saveEventually:^(BOOL succeeded, NSError *error) {
        if (succeeded && !error)
            NSLog(@"Anonymous user updated.");
    }];
}

@end
