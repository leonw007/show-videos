//
//  Video.h
//  show-videos-objc
//
//  Created by Chen Wang on 5/20/16.
//  Copyright © 2016 Chen Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject

@property(nonatomic, strong) NSString *videoTitle;
@property(nonatomic, strong) NSString *videoCourseName;
@property(nonatomic, strong) NSString *videoIframe;
@property(nonatomic, strong) NSString *videoThumbnailUrl;


@end
