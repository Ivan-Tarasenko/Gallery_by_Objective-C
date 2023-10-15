//
//  CollectionView.h
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 15.10.2023.
//

#import <UIKit/UIKit.h>
#import "CollectionViewFlowLayout.h"
#import "CollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CollectionView : UICollectionView

@property (strong, nonatomic) CollectionViewFlowLayout * layout;

@end

NS_ASSUME_NONNULL_END
