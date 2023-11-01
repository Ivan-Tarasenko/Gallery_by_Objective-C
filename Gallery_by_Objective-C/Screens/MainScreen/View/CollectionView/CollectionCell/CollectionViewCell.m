//
//  CollectionViewCell.m
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 15.10.2023.
//

#import "CollectionViewCell.h"
#import <SDWebImage/SDWebImage.h>

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addedSubview];
        [self makeConstrains];
        [self setContentView];
    }
    
    return self;
}

- (void)addedSubview {
    self.imageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.imageView];
}

- (void)makeConstrains {
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.imageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
        [self.imageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor],
        [self.imageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor],
        [self.imageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor]
    ]];
}

- (void)setContentView {
    self.contentView.layer.borderWidth = 1;
}

- (void)setImage:(NSString *) urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    
    if (url) {
        [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder"]];
    }
}


@end
