//
//  MainViewModel.m
//  Gallery_by_Objective-C
//
//  Created by Иван Тарасенко on 20.10.2023.
//

#import "MainViewModel.h"

@implementation MainViewModel

- (void)loadDataWithPage:(NSInteger)page andTopic:(NSString *)topic completion:(void (^)(NSArray<NSArray *> *images, NSError *error))completion {
    
    NSString *keyAPI = @"37778827-6de53276e5604625d8e6df5a6";
    NSString *imageType = @"photo";
    NSString *URLString = @"https://pixabay.com/api/";
    
    NSDictionary *parameters = @{@"key": keyAPI , @"q": topic, @"page": @(page), @"image_type":imageType};
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager GET: URLString parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *hits = [responseObject valueForKey:@"hits"];
        
        NSArray *webformatURLs = [hits valueForKey:@"webformatURL"];
        NSArray *largeFormatURLs = [hits valueForKey:@"largeImageURL"];
        
        NSArray *multiDimensionalArray = @[webformatURLs, largeFormatURLs];
        
        completion(multiDimensionalArray, nil);
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        completion(nil, error);
    }];
}
@end
