//
//  BookReadViewController.m
//  IBooksOpen
//
//  Created by guo luchuan on 13-3-6.
//  Copyright (c) 2013年. All rights reserved.
//

#import "BookReadViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface BookReadViewController ()

@end

@implementation BookReadViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        self.view.frame = [[UIScreen mainScreen] bounds];
                
        UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        aView.backgroundColor = [UIColor blueColor];
        
        UIView *bView = [[UIView alloc] initWithFrame:CGRectMake(150, 200, 100, 100)];
        bView.backgroundColor = [UIColor redColor];
        
        [self.view setBackgroundColor:[UIColor greenColor]];
        
        [self.view addSubview:aView];
        [self.view addSubview:bView];
                
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

@end
