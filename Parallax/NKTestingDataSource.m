//
//  NKTestingDataSource.m
//  Parallax
//
//  Created by Nino Nhexie Kierulf on 15/4/13.
//  Copyright (c) 2013 Kierulf Pte Ltd. All rights reserved.
//

#import "NKTestingDataSource.h"
#import "NKFirstPageViewController.h"

@implementation NKTestingDataSource


- (NSInteger)numberOfLayer
{
    return 4;
}

- (NSInteger)numberOfPages;
{
    return 4;
}

- (UIViewController<NKParallaxPageDataSource> *)viewControllerForPageAtIndex:(NSInteger)pageIndex
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil];
    UIViewController<NKParallaxPageDataSource> *pageViewController = [sb instantiateViewControllerWithIdentifier:@"FirstPageVC"];
    //UIViewController<NKParallaxPageDataSource> *pageViewController = [[NKFirstPageViewController alloc] initWithNibName:@"NKFirstPageViewController" bundle:nil];
    UIView *view = pageViewController.view; // call to create views
    
    return pageViewController;
}

- (CGPoint)accelerationForLayerAtIndex:(NSInteger)layerIndex
{
    CGFloat speedMultiplier = 1.0f;
    switch (layerIndex)
    {
        case 0:
            speedMultiplier = 1.0f;
            break;
        case 1:
            speedMultiplier = 2.0f;
            break;
        case 2:
            speedMultiplier = 4.0f;
            break;
        case 3:
            speedMultiplier = 16.0f;
            break;
        default:
            break;
    }
    
    return CGPointMake(speedMultiplier, 1.0f);
}


@end
