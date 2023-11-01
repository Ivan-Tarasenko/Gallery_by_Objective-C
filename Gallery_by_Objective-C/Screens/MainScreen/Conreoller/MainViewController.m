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
    
    self.page = 1;
    self.topic = @"natur";
    
    [self initializingObjects];
    [self setupDelegates];
    [self setupCollectionView];
    [self setupSearchBar];
    [self setupRefreshControl];
    
    [self fetchData];
    
    [self transitionOnDetailView];
    
    [self dataReloading];
    
    [self setupActivityIndicator];
    [self.activityIndicator startAnimating];
    
    self.title = @"Gallery";
    
}

- (void)initializingObjects {
    self.dataSource = [[CollectionViewDataSource alloc] init];
    self.delegate = [[CollectionViewDelegate alloc] init];
    self.layout = [[CollectionViewFlowLayout alloc] init];
    self.collectionView = [[CollectionView alloc] init];
    self.viewModel = [[MainViewModel alloc] init];
    self.searchController = [[UISearchController alloc] init];
    self.refresh = [[UIRefreshControl alloc] init];
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleLarge];
    
    self.largeImages = [NSMutableArray array];
    self.isLoadData = NO;
}

- (void)fetchData {
    [self.viewModel loadDataWithPage:self.page andTopic:self.topic completion:^(NSArray<NSArray *> * _Nonnull images, NSError * _Nonnull error) {
        
        if (images) {
            [self.dataSource.webImagesURL addObjectsFromArray: images[0]];
            [self.largeImages addObjectsFromArray: images[1]];
            
            [self.collectionView reloadData];
            [self stopActivityIndicator];
            self.isLoadData = YES;
        } else {
            [self showAlert];
            NSLog(@"Ошибка при загрузке данных: %@", error.localizedDescription);
        }
    }];
}

- (void)transitionOnDetailView {
    __weak typeof(self) weakSelf = self;
    
    self.delegate.cellSelectionBlock = ^(NSIndexPath *indexPath) {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        if (strongSelf) {
            if (strongSelf.largeImages.count != 0) {
                DetailViewController *detailVC = [[DetailViewController alloc] init];
                detailVC.largeImageURL = strongSelf.largeImages[indexPath.row];
                [strongSelf.navigationController pushViewController:detailVC animated:YES];
            }
        }
    };
}

- (void)dataReloading {
    __weak typeof(self) weakSelf = self;

    self.delegate.onScrollAction = ^() {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf) {
            strongSelf.page += 1;
            [strongSelf fetchData];
            [strongSelf.collectionView reloadData];
        }
    };
}

- (void)stopActivityIndicator {
    [self.activityIndicator stopAnimating];
    [self.activityIndicator removeFromSuperview];
}


// Setup methods
- (void)setupDelegates {
    self.collectionView.delegate = self.delegate;
    self.collectionView.dataSource = self.dataSource;
}

- (void)setupCollectionView {
    self.collectionView.frame = self.view.bounds;
    [self.view addSubview: _collectionView];
}

- (void)setupActivityIndicator {
    self.activityIndicator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2.4);
    [self.collectionView addSubview:self.activityIndicator];
}

- (void)setupRefreshControl {
    [self.refresh addTarget:self action:@selector(refreshCollection) forControlEvents:UIControlEventValueChanged];
    [self.collectionView addSubview:self.refresh];
}

- (void)setupSearchBar {
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.placeholder = @"Search...";
    self.navigationItem.searchController = self.searchController;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (![searchController.searchBar.text isEqual: @""]) {
        self.topic = searchController.searchBar.text;
        [self updateData];
    }
}

- (void)updateData {
    [self.dataSource.webImagesURL removeAllObjects];
    [self.largeImages removeAllObjects];
    [self fetchData];
    [self.collectionView reloadData];
    
}

// Refresh action
- (void)refreshCollection {
    [self updateData];
    
    if (self.isLoadData) {
        [self.refresh endRefreshing];
    }
}

// Alert
- (void)showAlert {
    NSString *title = @"Внимание";
    NSString *message = @"Произошла ошибка загрузки данных. Пожалуйтса, проверьте подключение к интернету";
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: title message: message preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
