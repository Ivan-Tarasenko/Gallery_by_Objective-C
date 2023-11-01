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
    
    [self initializingObjects];
    [self setupView];
    [self setupImageView];
    [self setupActivityIndicator];
    [self setupButtonsInNavBar];
    [self setImage];
    
    
}

- (void)initializingObjects {
    self.largeImage = [[UIImageView alloc] init];
    
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleLarge];
    
    self.save = [[UIBarButtonItem alloc] initWithTitle:  @"Save" style: UIBarButtonItemStylePlain target: self action:@selector(tapSave)];
    
    UIImage *shareButtonImage = [UIImage systemImageNamed:@"square.and.arrow.up"];
    self.shared = [[UIBarButtonItem alloc] initWithImage: shareButtonImage  style: UIBarButtonItemStylePlain target:self action:@selector(tapShared)];
}

- (void)setupView {
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)setupImageView {
    self.largeImage.frame = self.view.bounds;
    [self.view addSubview:self.largeImage];
    
    self.largeImage.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)setupActivityIndicator {
    self.activityIndicator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    [self.view addSubview:self.activityIndicator];
}

- (void)setupButtonsInNavBar {
    self.navigationItem.rightBarButtonItems = @[self.shared, self.save];
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

- (void)stopActivityIndicator {
    [self.activityIndicator stopAnimating];
    [self.activityIndicator removeFromSuperview];
}

// MARK: actions of navigation panel buttons
- (void)tapSave {
    UIImage *largeImage = self.largeImage.image;
    
    if (largeImage) {
        [self saveImageToGallery: largeImage];
    }
    
}

- (void)tapShared {
    [self sharedPhoto];
    NSLog(@"share");
}

// MARK: Save photo
- (void)saveImageToGallery:(UIImage *)image {
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error != nil) {
        // Обработка ошибки сохранения
        NSLog(@"Ошибка при сохранении изображения: %@", [error localizedDescription]);
    } else {
        // Успешное сохранение
        NSLog(@"Изображение успешно сохранено в галерею");
    }
}

// MARK: Share photo
- (void)sharedPhoto {
    UIImage *largeImage = self.largeImage.image;
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[largeImage] applicationActivities:nil];
    
    [self presentViewController:activityViewController animated:YES completion:nil];
}

@end
