//
//  MainViewModel.h
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 20.10.2023.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewModel : NSObject

@property (strong, nonatomic) NSString *keyAPI;
@property (strong, nonatomic) NSString *topic;
@property (strong, nonatomic) NSString *page;
@property (strong, nonatomic) NSString *imageType;

@property (strong, nonatomic) NSMutableArray *images;

- (void)loadData:(void (^)())completion;
@end

NS_ASSUME_NONNULL_END
