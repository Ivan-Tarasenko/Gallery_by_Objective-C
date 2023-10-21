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
    [self setupImageView];
    [self setImage];
    
//    NSLog(@"%@", _largeImageURL);

}

- (void)initializingObjects {
    self.largeImage = [[UIImageView alloc] init];
}

- (void)setupImageView {
    self.largeImage.frame = self.view.bounds;
    [self.view addSubview:self.largeImage];
}

- (void)setImage {
    NSURL *url = [NSURL URLWithString:self.largeImageURL];
    
    if (url) {
        [self.largeImage sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder"]];
    }
}



@end
