//
//  NKParallaxDataSource.h
//  Parallax
//
//  Created by Nino Nhexie Kierulf on 15/4/13.
//  Copyright (c) 2013 Kierulf Pte Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Please design your views to with proper view constraints
 */
@protocol NKParallaxPageDataSource <NSObject>

- (UIView *)viewForLayerAtIndex:(NSInteger)layerIndex;

@end

@protocol NKParallaxDataSource <NSObject>

- (NSInteger)numberOfLayer;

/**
 1.0f is normal speed
 */
- (CGPoint)accelerationForLayerAtIndex:(NSInteger)layerIndex;

- (NSInteger)numberOfPages;
//- (CGRect)rectForViewAtPageIndex:(NSInteger)pageIndex; // to calculate whole scrollview

- (UIViewController<NKParallaxPageDataSource> *)viewControllerForPageAtIndex:(NSInteger)pageIndex;

@optional
- (UIView *)viewForLayerIndex:(NSInteger)layerIndex pageIndex:(NSInteger)pageIndex;

@end

/**
 This should be implemented by view controllers
 that has views they want to be included with a parallax effect
 
 */

