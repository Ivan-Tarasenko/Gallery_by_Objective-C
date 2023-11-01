//
//  CollectionViewDataSource.m
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 15.10.2023.
//

#import "CollectionViewDataSource.h"

@implementation CollectionViewDataSource

- (instancetype)init {
    self = [super init];
    if (self) {
        self.webImagesURL = [NSMutableArray array];
    }
    return self;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.webImagesURL.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    
    NSString *imageURL = self.webImagesURL[indexPath.row];
    
    [cell setImage: imageURL];
    
    return cell;
}

@end
