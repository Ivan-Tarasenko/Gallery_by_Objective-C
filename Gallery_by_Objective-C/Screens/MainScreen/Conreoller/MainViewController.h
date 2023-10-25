//
//  ViewController.h
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 15.10.2023.
//

#import <UIKit/UIKit.h>
#import "CollectionViewDataSource.h"
#import "CollectionViewDelegate.h"
#import "CollectionViewFlowLayout.h"
#import "CollectionView.h"
#import "CollectionViewCell.h"
#import "MainViewModel.h"
#import "DetailViewController.h"

@interface MainViewController : UIViewController

@property (strong, nonatomic) CollectionView * collectionView;
@property (strong, nonatomic) CollectionViewDataSource * dataSource;
@property (strong, nonatomic) CollectionViewDelegate * delegate;
@property (strong, nonatomic) CollectionViewFlowLayout * layout;
@property (strong, nonatomic) MainViewModel * viewModel;
@property (strong, nonatomic) UIActivityIndicatorView * activityIndicator;

@property (strong, nonatomic) NSMutableArray * largeImages;
@property (strong, nonatomic) NSMutableArray * testImages;

@property (strong, nonatomic) NSString * topic;
@property (assign, nonatomic) NSInteger page;

- (void)initializingObjects;
- (void)fetchData;
- (void)setupDelegates;
- (void)setupCollectionView;
- (void)transitionOnDetailView;
- (void)setupActivityIndicator;
- (void)stopActivityIndicator;

@end

