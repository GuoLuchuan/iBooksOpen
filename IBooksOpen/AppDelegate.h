//
//  AppDelegate.h
//  IBooksOpen
//
//  Created by guo luchuan on 13-3-6.
//  Copyright (c) 2013年 . All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BookShelfViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) BookShelfViewController *bookShelfViewController;

@end
