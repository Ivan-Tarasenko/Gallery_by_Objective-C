//
//  CollectionViewCell.h
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 15.10.2023.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView * imageView;

- (void)addedSubview;
- (void)makeConstrains;
- (void)setContentView;
- (void)setImage:(NSString *) url;

@end

NS_ASSUME_NONNULL_END
