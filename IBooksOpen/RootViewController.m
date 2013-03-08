//
//  RootViewController.m
//  IBooksOpen
//
//  Created by guo luchuan on 13-3-7.
//  Copyright (c) 2013年. All rights reserved.
//

#import "RootViewController.h"
#import <QuartzCore/QuartzCore.h>

#define DURING_TIME         1.0

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


@interface RootViewController ()
{
    CGPoint _bookViewOrignCenter;
    
    UIModalTransitionStyle _modalTransitionStyle;
}

@end

@implementation RootViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)presentModalViewController:(UIViewController *)modalViewController animated:(BOOL)animated
{
    _modalTransitionStyle = modalViewController.modalTransitionStyle;
    if (_modalTransitionStyle == UIModalTransitionStyleOpenBooks) {
        
        [self presentViewController:modalViewController animated:animated completion:nil];

    }
    else
    {
        [super presentModalViewController:modalViewController animated:animated];
    }
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion
{
    _modalTransitionStyle = viewControllerToPresent.modalTransitionStyle;
    if (_modalTransitionStyle == UIModalTransitionStyleOpenBooks) {
        NSAssert(_bookView, @"_bookView can not be nil");
        
        _bookView.content = viewControllerToPresent.view;
        
        CGFloat scaleX = self.view.bounds.size.width / _bookView.bounds.size.width;
        CGFloat scaleY = self.view.bounds.size.height / _bookView.bounds.size.height;
        
        [_bookView insertSubview:_bookView.content aboveSubview:_bookView.cover];
        
        _bookView.content.transform = CGAffineTransformMakeScale(1/scaleX, 1/scaleY);
        
        _bookView.content.frame = CGRectMake(0, 0,CGRectGetWidth(_bookView.frame), CGRectGetHeight(_bookView.frame));
        
        
        CATransform3D transformblank = CATransform3DMakeRotation(-M_PI_2 / 1.01, 0.0, 1.0, 0.0);
        transformblank.m34 = 1.0f / 250.0f;
        
        _bookView.cover.layer.anchorPoint = CGPointMake(0, 0.5);
        _bookView.cover.center = CGPointMake(0.0, _bookView.cover.bounds.size.height/2.0); //compensate for anchor offset
        
        _bookView.cover.opaque = YES;
        
        _bookViewOrignCenter = _bookView.center;
        
        
        CGFloat duringTime = DURING_TIME;
        
        if (!flag) {
            duringTime = 0.0f;
        }
        
        [UIView animateWithDuration:duringTime delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionShowHideTransitionViews animations:^{
            
            _bookView.transform = CGAffineTransformMakeScale(scaleX,scaleY);
            _bookView.center = self.view.center;
            
            _bookView.cover.layer.transform = transformblank;
            
            [_bookView bringSubviewToFront:_bookView.cover];
            
        } completion:^(BOOL finished) {
            if (finished) {
                
                _bookView.cover.layer.hidden = YES;
                
                if (completion != nil) {
                    completion();
                }
            }
            
        } ];
    }
    else
    {
        
        NSAssert(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.0"), @" '- (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^)(void))completion' need ios 5.0+ ");
        
        [super presentViewController:viewControllerToPresent animated:flag completion:completion];
    }
}

- (void)dismissModalViewControllerAnimated:(BOOL)animated
{
    if (_modalTransitionStyle == UIModalTransitionStyleOpenBooks) {
        [self dismissViewControllerAnimated:animated completion:nil];
    }
    else
    {
        [super dismissModalViewControllerAnimated:animated];
    }
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
    if (_modalTransitionStyle == UIModalTransitionStyleOpenBooks) {
        
        NSAssert(_bookView, @"_bookView can not be nil");
        
        _bookView.cover.layer.hidden = NO;
        
        CGFloat duringTime = DURING_TIME;
        
        if (!flag) {
            duringTime = 0.0f;
        }
        
        [UIView animateWithDuration:duringTime delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionShowHideTransitionViews animations:^{
            
            _bookView.center = _bookViewOrignCenter;
            _bookView.transform = CGAffineTransformIdentity;
            _bookView.cover.layer.transform = CATransform3DIdentity;
            
        } completion:^(BOOL finished) {
            
            if (finished) {
                
                [_bookView.content removeFromSuperview];
                
                if (completion != nil) {
                    
                    completion();
                }
            }
            
        } ];
    }
    else
    {
        
        NSAssert(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.0"), @" '-- (void)dismissViewControllerAnimated: (BOOL)flag completion: (void (^)(void))completion' need ios 5.0+ ");
        
        [super dismissViewControllerAnimated:flag completion:completion];
    }
}

@end
