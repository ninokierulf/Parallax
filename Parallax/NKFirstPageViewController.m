//
//  NKFirstPageViewController.m
//  Parallax
//
//  Created by Nino Nhexie Kierulf on 15/4/13.
//  Copyright (c) 2013 Kierulf Pte Ltd. All rights reserved.
//

#import "NKFirstPageViewController.h"

@interface NKFirstPageViewController ()

@end

@implementation NKFirstPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Parallax Page Data Source

- (UIView *)viewForLayerAtIndex:(NSInteger)layerIndex
{
    UIView *view = nil;
    switch (layerIndex)
    {
        case 0:
            view = self.firstView;
            break;
        case 1:
            view = self.secondView;
            break;
        case 2:
            view = self.thirdView;
            break;
        case 3:
            view = self.fourthView;
            break;
        default:
            break;
    }
    
    return view;
}

@end
