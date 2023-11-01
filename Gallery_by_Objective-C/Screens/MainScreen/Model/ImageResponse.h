//
//  ImageResponse.h
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 20.10.2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageResponse : NSObject

@property (strong, nonatomic) NSString *webFormat;
@property (strong, nonatomic) NSString *largeFormat;

@end

NS_ASSUME_NONNULL_END
