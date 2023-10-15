//
//  CollectionViewCell.m
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 15.10.2023.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupLabel];
    }
    
    return self;
}

- (void)setupLabel {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    [self.contentView addSubview: _titleLabel];
}

@end
