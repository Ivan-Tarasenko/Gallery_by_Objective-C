//
//  DetailViewController.m
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 20.10.2023.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleLarge];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self initializingObjects];
    [self setupImageView];
    [self setImage];
    [self setupActivityIndicator];
    
}

- (void)initializingObjects {
    self.largeImage = [[UIImageView alloc] init];
}

- (void)setupImageView {
    self.largeImage.frame = self.view.bounds;
    [self.view addSubview:self.largeImage];
    
    self.largeImage.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)setImage {
    NSURL *url = [NSURL URLWithString:self.largeImageURL];
    
    if (url) {
        [self checkCachImage];
        [self.activityIndicator startAnimating];
        [self.largeImage sd_setImageWithURL:url
                           placeholderImage:[UIImage imageNamed:@"placeholder"]
                                  completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            [self stopActivityIndicator];
        }
        ];
    }
}

- (void)checkCachImage {
    UIImage *cachedImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:self.largeImageURL];
    
    if (cachedImage) {
        [self stopActivityIndicator];
    }
}

- (void)setupActivityIndicator {
    self.activityIndicator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    [self.view addSubview:self.activityIndicator];
}

- (void)stopActivityIndicator {
    [self.activityIndicator stopAnimating];
    [self.activityIndicator removeFromSuperview];
}

@end
