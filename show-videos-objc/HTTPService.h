//
//  HTTPService.h
//  show-videos-objc
//
//  Created by Chen Wang on 5/18/16.
//  Copyright © 2016 Chen Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

// block syntax: onComplete here is the block name, the second () includes the parameters
typedef void (^onComplete)(NSDictionary* __nullable dataDict, NSString* __nullable errMessage);

@interface HTTPService : NSObject

+ (id) instance;
- (void) getCourses: (nullable onComplete)completionHandler;

@end
