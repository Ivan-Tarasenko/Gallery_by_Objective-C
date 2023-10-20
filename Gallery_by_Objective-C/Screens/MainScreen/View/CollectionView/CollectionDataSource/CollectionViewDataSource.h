//
//  CollectionViewDataSource.h
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 15.10.2023.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewDataSource : NSObject
<UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *images;

@end

NS_ASSUME_NONNULL_END
