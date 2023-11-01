//
//  DetailViewController.h
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 20.10.2023.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/SDWebImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (strong, nonatomic) UIActivityIndicatorView * activityIndicator;
@property (strong, nonatomic) UIImageView *largeImage;
@property (strong, nonatomic) NSString *largeImageURL;

- (void)initializingObjects;
- (void)setupImageView;
- (void)setImage;
- (void)setupActivityIndicator;
- (void)stopActivityIndicator;
- (void)checkCachImage;

@end

NS_ASSUME_NONNULL_END
