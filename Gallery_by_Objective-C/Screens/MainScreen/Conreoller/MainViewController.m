//
//  ViewController.m
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 15.10.2023.
//

#import "MainViewController.h"

@interface MainViewController ()
    
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializingObjects];
    [self setupDelegates];
    [self setupCollectionView];
    
    [self fetchData];
    
    [self transitionOnDetailView];
    
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
            self.dataSource.images = images[0];
            self.largeImages = images[1];
            
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

- (void)transitionOnDetailView {
    __weak typeof(self) weakSelf = self;

      self.delegate.cellSelectionBlock = ^(NSIndexPath *indexPath) {
          
          __strong typeof(weakSelf) strongSelf = weakSelf;
          
          if (strongSelf) {
              DetailViewController *detailVC = [[DetailViewController alloc] init];

              detailVC.largeImageURL = strongSelf.largeImages[indexPath.row];

              [strongSelf.navigationController pushViewController:detailVC animated:YES];
          }
      };
}

@end
