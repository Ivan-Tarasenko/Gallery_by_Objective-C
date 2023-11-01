//
//  SceneDelegate.h
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 15.10.2023.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic) UIWindow * window;
@property (strong, nonatomic) MainViewController *mainViewController;

@end

