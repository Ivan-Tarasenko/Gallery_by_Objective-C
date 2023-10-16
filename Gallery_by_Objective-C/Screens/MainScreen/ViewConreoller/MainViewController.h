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

@interface MainViewController : UIViewController

@property (strong, nonatomic) CollectionView * collectionView;
@property (strong, nonatomic) CollectionViewDataSource * dataSource;
@property (strong, nonatomic) CollectionViewDelegate * delegate;
@property (strong, nonatomic) CollectionViewFlowLayout * layout;

- (void)initializingObjects;
- (void)setupDelegates;
- (void)setupCollectionView;

@end

