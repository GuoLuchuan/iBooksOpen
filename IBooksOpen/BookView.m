//
//  BookView.m
//  IBooksOpen
//
//  Created by guo luchuan on 13-3-6.
//  Copyright (c) 2013年. All rights reserved.
//

#import "BookView.h"
#import "BookReadViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface BookView ()
{
    
    
}

@end

@implementation BookView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        _cover = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        
        [self addSubview:_cover];
                
    }
    return self;
}

- (void)setupBookCoverImage:(UIImage *)image
{
    _cover.layer.contents = (__bridge id)(image.CGImage);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}


@end
