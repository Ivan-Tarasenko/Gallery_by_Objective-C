//
//  CollectionView.m
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 15.10.2023.
//

#import "CollectionView.h"

@implementation CollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    self.layout = [[CollectionViewFlowLayout alloc] init];
    
    self = [super initWithFrame:frame collectionViewLayout:self.layout];
    
    if (self) {
        [self registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CustomCell"];
    }
    
    return self;
}

@end
