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
@property (strong, nonatomic) MainViewModel * viewNodel;

@property (strong, nonatomic) NSArray * largeImages;

- (void)initializingObjects;
- (void)fetchData;
- (void)setupDelegates;
- (void)setupCollectionView;
- (void)transitionOnDetailView;

@end

