//
//  BookView.h
//  IBooksOpen
//
//  Created by guo luchuan on 13-3-6.
//  Copyright (c) 2013年. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookView : UIView

@property (nonatomic) UIView *cover;
@property (nonatomic) UIView *content;

- (void)setupBookCoverImage:(UIImage *)image;

@end
