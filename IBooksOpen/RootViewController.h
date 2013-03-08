//
//  RootViewController.h
//  IBooksOpen
//
//  Created by guo luchuan on 13-3-7.
//  Copyright (c) 2013年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookView.h"

@interface RootViewController : UIViewController
{
    @protected
    BookView *_bookView;
    
}

- (void)glcPresentViewController:(UIViewController *)viewController animated: (BOOL)animated completion:(void (^)(void))completion;

- (void)glcDismissViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion;

@end
