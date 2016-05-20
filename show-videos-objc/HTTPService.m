//
//  HTTPService.m
//  show-videos-objc
//
//  Created by Chen Wang on 5/18/16.
//  Copyright © 2016 Chen Wang. All rights reserved.
//

#import "HTTPService.h"
#define URL_BASE "http://localhost:6069"
#define URL_COURSES "/courses"

@implementation HTTPService

// this is a singleton
// instance is a static function
+ (id) instance {
    // this sharedInstance will not be created every time, because it is static
    // it only will be created once, once it is created, it exists in the memeory.
    static HTTPService *sharedInstance = nil;
    
    @synchronized (self) {
        if (sharedInstance == nil){
            sharedInstance = [[self alloc] init];
        }
    }
    return sharedInstance;
}

- (void) getCourses: (nullable onComplete)completionHandler {
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s", URL_BASE, URL_COURSES]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if  (data != nil) {
            NSError* err;
            NSArray* json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                completionHandler(json, nil);
            } else {
                completionHandler(nil, @"Data is corrupt. Please try again.");
            }
        } else {
            NSLog(@"no data: %@", error.debugDescription );
            completionHandler(nil, @"Problem connecting to the server ");
        }

    }] resume];
}


@end
