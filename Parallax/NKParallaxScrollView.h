//
//  NKParallaxScrollView.m
//  Parallax
//
//  Created by Nino Nhexie Kierulf on 15/4/13.
//  Copyright (c) 2013 Kierulf Pte Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


/// default acceleration Behaviour is CGGoint{1.0f, 1.0f}
extern CGPoint const DefaultAcceleration;


@interface NKParallaxScrollView : UIScrollView

/**
 @description Adds a Subview to the Scrollview with a specific acceleration.
 @param view The View wich will be added as subview.
 @param acceleration Acceleration of a View. ScrollViews default behaviour is CGPoint{1.0f, 1.0f} (via [addSubview]).
 */
- (void)addSubview:(UIView *)view withAcceleration:(CGPoint) acceleration;


/**
 @description Sets the acceleration of a Subview.
 @param acceleration Acceleration of a View. ScrollViews default behaviour is CGPoint{1.0f, 1.0f} (via [addSubview]).
 @param view The View wich acceleration will be set.
 */
- (void)setAcceleration:(CGPoint) acceleration forView:(UIView *)view;


/**
 @description Gets the acceleration for a subview.
 @return acceleration Acceleration of the specified View.
 @param view The View wich acceleration should be returned.
 */
- (CGPoint)accelerationForView:(UIView *)view;

@end
