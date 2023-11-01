//
//  ViewController.m
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 15.10.2023.
//

#import "MainViewController.h"
#import "CollectionViewCell.h"

@interface MainViewController ()


@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializingObjects];
    [self setupDelegates];
    [self setupCollectionView];
    
    
    self.title = @"Navigation Controller";
    
}

- (void)initializingObjects {
    self.dataSource = [[CollectionViewDataSource alloc] init];
    self.delegate = [[CollectionViewDelegate alloc] init];
    self.layout = [[CollectionViewFlowLayout alloc] init];
    self.collectionView = [[CollectionView alloc] init];

}

- (void)setupDelegates {
    self.collectionView.delegate = self.delegate;
    self.collectionView.dataSource = self.dataSource;
}


- (void)setupCollectionView {
    self.collectionView.frame = self.view.bounds;
    [self.view addSubview: _collectionView];  
}

@end
