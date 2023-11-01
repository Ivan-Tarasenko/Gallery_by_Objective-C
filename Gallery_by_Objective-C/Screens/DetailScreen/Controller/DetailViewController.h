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

@property (strong, nonatomic) UIBarButtonItem * save;
@property (strong, nonatomic) UIBarButtonItem * shared;
@property (strong, nonatomic) UIActivityIndicatorView * activityIndicator;
@property (strong, nonatomic) UIImageView * largeImage;
@property (strong, nonatomic) NSString * largeImageURL;

- (void)initializingObjects;
- (void)setupView;
- (void)setupImageView;
- (void)setImage;
- (void)setupActivityIndicator;
- (void)stopActivityIndicator;
- (void)checkCachImage;
- (void)tapSave;
- (void)tapShared;
- (void)sharedPhoto;

@end

NS_ASSUME_NONNULL_END
