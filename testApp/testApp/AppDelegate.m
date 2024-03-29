//
//  AppDelegate.m
//  testApp
//
//  Created by Aaron Burke on 4/9/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // float to int
    float courseVersionFloat = 2.0f;
    NSLog(@"Course version %.1f", courseVersionFloat);
    int courseVersionInt = (int)courseVersionFloat;
    NSLog(@"Course version %d", courseVersionInt);
    
    // Obstacle course vars
    int length = 100;
    BOOL ready = TRUE;
    
    // team size
    int team = 5;
    
    // attempts var
    int attempts = 0;
    
    // Warmup loop - stand alone for loop
    int warmupTime = 10;
    for (int i = 0; i <= warmupTime; i++) {
        if (warmupTime - i > 0) {
            NSLog(@"The warmup has %d minutes left.", warmupTime - i);
        } else {
            NSLog(@"The warmup is over!");
        }
    }
    
    // Run the course
    // while condition && w/ float, int, and BOOL
    while (length >= 0 && courseVersionFloat == 2.0 && ready) {
        if (attempts > 0) {
            NSLog(@"Attempting obstacle at marker %d again!", length);
        } else {
            NSLog(@"Marker = %d", length);
        }
        // individual obstacle locations
        if (length == 90 || length == 50 || length == 40 || length == 20) {
            // random number generated for true/false outcome binding
            int random = arc4random_uniform(2);
            // random attempt bool value
            BOOL attemptResult = random ? TRUE : FALSE;
            // check obstacle attempts - increment if failed 
            if (attemptResult) {
                NSLog(@"You completed the obstacle at marker %d!", length);
                attempts = 0;
                length--;
            } else {
                attempts++;
                NSLog(@"You failed the obstacle try again! This is your %d attempt.", attempts);
            }
        } else if ((length == 70 || length == 30 || length == 10) && team > 1) { // Team obstacles
            NSLog(@"This is a group obstacle gather your team!");
            // nested for loop 
            for (int i = 1; i <= team; i++) {
                NSLog(@"Team member #%d completed the obstacle.", i);
            }
            NSLog(@"The team has finished the obstacle.");
            length--;
        } else if (length == 0) {
            NSLog(@"Course completed!");
            length--;
        } else {
            NSLog(@"Keep moving!");
            attempts = 0;
            length--;
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
