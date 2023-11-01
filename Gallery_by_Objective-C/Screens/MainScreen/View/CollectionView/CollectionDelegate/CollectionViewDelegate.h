//
//  CollectionViewDelegate.h
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 15.10.2023.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewDelegate : NSObject
<UICollectionViewDelegate>

@property (copy, nonatomic) void (^cellSelectionBlock)(NSIndexPath *indexPath);
@property (copy, nonatomic) void (^onScrollAction)(void);

@end

NS_ASSUME_NONNULL_END
