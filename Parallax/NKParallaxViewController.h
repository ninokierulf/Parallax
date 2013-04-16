//
//  NKParallaxViewController.h
//  Parallax
//
//  Created by Nino Nhexie Kierulf on 15/4/13.
//  Copyright (c) 2013 Kierulf Pte Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NKParallaxDataSource.h"
#import "NKParallaxScrollView.h"

/**
 Note that my implementation of parallax currently uses struts and not autolayout
 TODO: auto layout support
 */
@interface NKParallaxViewController : UIViewController


// Outlets
@property (nonatomic, strong) IBOutlet NKParallaxScrollView *scrollView;

// Paging
@property (nonatomic, assign) BOOL usePaging;
@property (nonatomic, assign) BOOL showPageControl;


// DataSource
@property (nonatomic, assign) IBOutlet id<NKParallaxDataSource> dataSource;


@end
