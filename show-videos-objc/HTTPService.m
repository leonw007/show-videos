//
//  HTTPService.m
//  show-videos-objc
//
//  Created by Chen Wang on 5/18/16.
//  Copyright © 2016 Chen Wang. All rights reserved.
//

#import "HTTPService.h"

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


@end
