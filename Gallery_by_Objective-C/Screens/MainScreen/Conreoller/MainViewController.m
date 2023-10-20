//
//  ViewController.m
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 15.10.2023.
//

#import "MainViewController.h"

@interface MainViewController () {
    
    NSMutableArray *images;
}


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializingObjects];
    [self setupDelegates];
    [self setupCollectionView];
    
    [self fetchData];
    
    self.title = @"Navigation Controller";
    
}

- (void)initializingObjects {
    self.dataSource = [[CollectionViewDataSource alloc] init];
    self.delegate = [[CollectionViewDelegate alloc] init];
    self.layout = [[CollectionViewFlowLayout alloc] init];
    self.collectionView = [[CollectionView alloc] init];
    self.viewNodel = [[MainViewModel alloc] init];
}

- (void)fetchData {
    [self.viewNodel loadData:^(NSArray<NSArray *> *images, NSError *error) {
        
        if (images) {
//            NSLog(@"%@", images[1]);
            self.dataSource.images = images[0];
            [self.collectionView reloadData];
            
        } else {
            NSLog(@"Ошибка при загрузке данных: %@", error.localizedDescription);
        }
    }];
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
