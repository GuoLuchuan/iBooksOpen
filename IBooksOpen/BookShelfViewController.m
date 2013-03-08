//
//  BookShelfViewController.m
//  IBooksOpen
//
//  Created by guo luchuan on 13-3-6.
//  Copyright (c) 2013年. All rights reserved.
//

#import "BookShelfViewController.h"

#import "BookReadViewController.h"

#import "BookView.h"

#import <QuartzCore/QuartzCore.h>

@interface BookShelfViewController ()
{
    BOOL _isNeedOpen;
}

@end

@implementation BookShelfViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
                
        self.view.frame = [[UIScreen mainScreen] bounds];
        self.view.backgroundColor = [UIColor grayColor];
        
        _bookView = [[BookView alloc] initWithFrame:CGRectMake(50, 50, 86, 108)];
        UIImage *image = [UIImage imageNamed:@"sw.jpg"];
        [_bookView setupBookCoverImage:image];
        
        UIGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openBooks)];
        
        [_bookView addGestureRecognizer:tapGesture];
        
        [self.view addSubview:_bookView];
        
        _isNeedOpen = YES;
        
    }
    return self;
}

- (void)openBooks
{
    if (_isNeedOpen) {
        NSLog(@"open books");
        
        BookReadViewController *bookReadViewController = [[BookReadViewController alloc] init];
        
        
        bookReadViewController.modalTransitionStyle = UIModalTransitionStyleOpenBooks;
                
        [self presentViewController:bookReadViewController animated:YES completion:^{
            NSLog(@"complete");
        }];
        
        _isNeedOpen = NO;
    }
    else
    {
                
        NSLog(@"close books");

        [self dismissModalViewControllerAnimated:YES];
        
        _isNeedOpen = YES;
    }
    
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

@end
