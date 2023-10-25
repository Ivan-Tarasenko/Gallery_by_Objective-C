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

- (void)loadDataWithPage:(NSInteger)page andTopic:(NSString *)topic completion:(void (^)(NSArray<NSArray *> *images, NSError *error))completion;
@end

NS_ASSUME_NONNULL_END
