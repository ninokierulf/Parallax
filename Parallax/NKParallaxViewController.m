//
//  NKParallaxViewController.h
//  Parallax
//
//  Created by Nino Nhexie Kierulf on 15/4/13.
//  Copyright (c) 2013 Kierulf Pte Ltd. All rights reserved.
//

#import "NKParallaxViewController.h"
#import "NKParallaxScrollView.h"

@interface NKParallaxViewController ()

@property (nonatomic, assign) NSInteger numberOfLayer;
@property (nonatomic, assign) NSInteger numberOfPages;

@end

@implementation NKParallaxViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    CGRect thisViewBounds = self.view.bounds;
    CGSize thisViewSize = thisViewBounds.size;
    
    
        //NSLog(@"scrollview content size. Width : %f, Height : %f", scrollViewContentSize.width, scrollViewContentSize.height);
    //scrollView.contentSize = scrollViewContentSize;
    
    //[self.view addSubview:scrollView];
    
    
    // scrollviews * numberOfLayer
    // scrollview[0] = backmost
    // scrollview[ i>0 && i<n ] = middle
    // scrollview[n] = topmost
    
    
    //---- DUMMY -----//
    
    /*
    
    NSArray *colors = @[[UIColor redColor], [UIColor greenColor], [UIColor yellowColor], [UIColor blueColor]];
    
    CGSize viewPortSize = scrollView.frame.size;
    for (int i = 0; i < colors.count; i++)
    {
        CGRect frame;
        frame.origin.x = viewPortSize.width * i;
        frame.origin.y = 0;
        frame.size = viewPortSize;
        
        UIView *subview = [[UIView alloc] initWithFrame:frame];
        subview.backgroundColor = colors[i];
        [scrollView addSubview:subview];
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * colors.count, scrollView.frame.size.height);
    
    [self.view addSubview:scrollView];
    */
    //---- DUMMY -----//
    
    
    //- (NSInteger)numberOfLayer;
    //- (CGFloat)speedMultiplierForLayerAtIndex:(NSInteger)layerIndex;
    
    //- (NSInteger)numberOfPages;
    //- (CGRect)rectForViewAtPageIndex:(NSInteger)pageIndex;
    
    NKParallaxScrollView *scrollView = _scrollView;
    
    CGRect scrollViewBounds = scrollView.bounds;
    CGSize scrollViewSize = scrollViewBounds.size;
    CGSize pageSize = scrollViewSize;
    // Page Size is scroll view size
    
    if(CGSizeEqualToSize(CGSizeZero, pageSize))
    {
        NSLog(@"Check %@ at %@, scrollview size is zero", [[self class] description], NSStringFromSelector(_cmd) );
    }
    
    NSLog(@"page size. width: %f, height : %f", pageSize.width, pageSize.height);
    
    
    // calculate necessary sizes for the creation of different scrollviews
    _numberOfLayer = [_dataSource numberOfLayer];
    _numberOfPages = [_dataSource numberOfPages];
    
    NSLog(@"layer count : %d", _numberOfLayer);
    NSLog(@"page  count : %d", _numberOfPages);
    
    // storage of acceleration per layer
    CGPoint acceleration[_numberOfLayer];
    
    // temp storage of precalculated content size
    CGSize layerSize[_numberOfLayer];
    
    for(int i = 0; i < _numberOfLayer; i++)
    {
        NSLog(@"layer %d", i);
        //
        CGPoint datasource_acceleration = [_dataSource accelerationForLayerAtIndex:i];
        // store acceleration for layer
        acceleration[i] = datasource_acceleration;
        NSLog(@"  acceleration : %f", datasource_acceleration.x);
        
        CGFloat width = pageSize.width * _numberOfPages * datasource_acceleration.x;
        
        // this is assuming horizontal mode of scrolling. // TODO: support vertical scrolling
        CGFloat height = pageSize.height;
        layerSize[i] = CGSizeMake(width, height);
        NSLog(@"  content size. Width : %f, Height : %f", width, height);
    }
    
    
    // TODO: move to viewDidLoad
    
    //scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    CGSize scrollViewContentSize = CGSizeMake(pageSize.width*_numberOfPages, pageSize.height);
    [scrollView setContentSize:scrollViewContentSize];
    
    
    //[scrollView setPagingEnabled:YES];
    //scrollView.showsHorizontalScrollIndicator = scrollView.showsVerticalScrollIndicator = NO;
    
    
    for (int pageIndex = 0; pageIndex < _numberOfPages; pageIndex++)
    {
        NSLog(@"page index : %d", pageIndex);
        
        UIViewController<NKParallaxPageDataSource> *pageViewController = [_dataSource viewControllerForPageAtIndex:pageIndex];
        
        for (int layerIndex = 0; layerIndex < _numberOfLayer; layerIndex++)
        {
            NSLog(@"  layer index : %d", layerIndex);
            
            UIView *pageDataSourceView = [pageViewController viewForLayerAtIndex:layerIndex];
            
            NSLog(@"      pageDataSourceView  frame x: %f, y: %f", pageDataSourceView.frame.origin.x, pageDataSourceView.frame.origin.y);
            NSLog(@"      pageDataSourceView bounds x: %f, y: %f", pageDataSourceView.bounds.origin.x, pageDataSourceView.bounds.origin.y);
            
            CGPoint viewAcceleration = acceleration[layerIndex];
            
            //CGFloat acceleration_x = viewAcceleration.x;
            //CGFloat acceleration_y = viewAcceleration.y;
            
            CGSize sizeForLayer = layerSize[layerIndex];
            
            CGFloat perPageMultipliedWidth = sizeForLayer.width/_numberOfPages;
            CGFloat perPageStartingX = pageIndex * perPageMultipliedWidth;
            CGFloat perPageCenteredX = perPageStartingX + ((perPageMultipliedWidth * 0.5) - (pageSize.width * 0.5));
            NSLog(@"    centered x: %f", perPageCenteredX);
            
            //CGRect frame = pageDataSourceView.frame;
            //frame.size = pageSize; // assuming pageSize isEqual to scrollViewSize
            NSAssert(CGSizeEqualToSize(pageSize, scrollViewSize), @"page and scroll size should be the same because they are initialized with pageSize");
            
            // this is for horizontal scrolling
            //frame.origin.x = perPageStartingX;
            //frame.origin.y = 0;
            
            // TODO: vertical scrolling origin
            // frame.origin.y = perPageCenteredY;
            
            //[pageDataSourceView setFrame:frame];
            //NSLog(@"    after calc frame. x: %f, y: %f", frame.origin.x, frame.origin.y);
            
            
            UIView *pageContainerView = [[UIView alloc] initWithFrame:CGRectMake(perPageStartingX, 0, pageSize.width, pageSize.height)];
            pageContainerView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            [pageContainerView setBackgroundColor:[UIColor colorWithHue:0.5f saturation:0.5 brightness:1 alpha:0.25]];
            [pageContainerView addSubview:pageDataSourceView];
            
            [scrollView addSubview:pageContainerView withAcceleration:viewAcceleration];
        }
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NKParallaxScrollView *scrollView = _scrollView;
    
    CGRect scrollViewBounds = scrollView.bounds;
    CGSize scrollViewSize = scrollViewBounds.size;
    CGSize pageSize = scrollViewSize;
    // Page Size is scroll view size
    
    if(CGSizeEqualToSize(CGSizeZero, pageSize))
    {
        NSLog(@"Check %@ at %@, scrollview size is zero", [[self class] description], NSStringFromSelector(_cmd) );
    }
    
    NSLog(@"page size. width: %f, height : %f", pageSize.width, pageSize.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
