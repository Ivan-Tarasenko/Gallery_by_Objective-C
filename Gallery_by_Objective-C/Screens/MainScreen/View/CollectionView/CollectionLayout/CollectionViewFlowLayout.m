//
//  CollectionViewFlowLayout.m
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 15.10.2023.
//

#import "CollectionViewFlowLayout.h"

@implementation CollectionViewFlowLayout

- (instancetype)init {
    self = [super init];
    
    if (self) {
        
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
                CGFloat halfScreenWidth = screenWidth / 2.0;

                self.itemSize = CGSizeMake(halfScreenWidth - 2, halfScreenWidth - 2);
                self.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
                self.minimumInteritemSpacing = 1;
                self.minimumLineSpacing = 1;
    }
    
    return self;
}

@end
