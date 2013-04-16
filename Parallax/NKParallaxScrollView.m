//
//  NKParallaxScrollView.m
//  Parallax
//
//  Created by Nino Nhexie Kierulf on 15/4/13.
//  Copyright (c) 2013 Kierulf Pte Ltd. All rights reserved.
//

#import "NKParallaxScrollView.h"

CGPoint const DefaultAcceleration = (CGPoint){1.0f, 1.0f};

@interface NKParallaxScrollView ()
@property (nonatomic, strong) NSMutableDictionary *accelerationsOfSubViews;

- (void)_init;

@end

@implementation NKParallaxScrollView

//====================================================================
#pragma mark - memory & initialization

// common init
- (void)_init
{
    _accelerationsOfSubViews = [[NSMutableDictionary alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _init];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self _init];
    }
    return self;
}


//====================================================================
#pragma mark - logic

- (void)addSubview:(UIView *)view
{
    [self addSubview:view withAcceleration:DefaultAcceleration];
}


- (void)addSubview:(UIView *)view withAcceleration:(CGPoint) acceleration
{
    // add to super
    [super addSubview:view];
    [self setAcceleration:acceleration forView:view];
}


- (void)setAcceleration:(CGPoint) acceleration forView:(UIView *)view
{
    // store acceleration
    NSValue *pointValue = [NSValue valueWithCGPoint:acceleration];
    _accelerationsOfSubViews[@((int)view)] = pointValue;
}

- (CGPoint)accelerationForView:(UIView *)view
{
    // return
    CGPoint acceleration;
    
    // get acceleration
    NSValue *pointValue = _accelerationsOfSubViews[@((int)view)];
    if(pointValue == nil)
    {
        acceleration = CGPointZero;
    }
    else
    {
        [pointValue getValue:&acceleration];
    }
    
    return acceleration;
}

- (void)willRemoveSubview:(UIView *)subview
{
    [_accelerationsOfSubViews removeObjectForKey:@((int)subview)];
}

//====================================================================
#pragma mark - layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    for (UIView *view in self.subviews)
    {
        // get acceleration
        CGPoint acceleration = [self accelerationForView:view];
        
        // move the view
        view.transform = CGAffineTransformMakeTranslation(self.contentOffset.x*(1.0f-acceleration.x),
                                                          self.contentOffset.y*(1.0f-acceleration.y));
    }
}

@end
