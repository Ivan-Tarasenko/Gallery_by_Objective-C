//
//  CollectionViewDelegate.m
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 15.10.2023.
//

#import "CollectionViewDelegate.h"

@implementation CollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.cellSelectionBlock) {
        self.cellSelectionBlock(indexPath);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    CGFloat contentHeight = scrollView.contentSize.height;
    CGFloat scrollViewHeight = scrollView.frame.size.height;
    
    if (contentOffsetY > 0 && (contentOffsetY + scrollViewHeight >= contentHeight)) {
        
        if (self.onScrollAction) {
            self.onScrollAction();
        }
        
    }
    
}

@end
