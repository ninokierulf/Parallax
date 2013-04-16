//
//  NKFirstPageViewController.h
//  Parallax
//
//  Created by Nino Nhexie Kierulf on 15/4/13.
//  Copyright (c) 2013 Kierulf Pte Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NKParallaxDataSource.h"

@interface NKFirstPageViewController : UIViewController <NKParallaxPageDataSource>

@property (strong, nonatomic) IBOutlet UIView *firstView;
@property (strong, nonatomic) IBOutlet UIView *secondView;
@property (strong, nonatomic) IBOutlet UIView *thirdView;
@property (strong, nonatomic) IBOutlet UIView *fourthView;
@end
