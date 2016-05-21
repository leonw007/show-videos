//
//  VideoCell.h
//  show-videos-objc
//
//  Created by Chen Wang on 5/20/16.
//  Copyright © 2016 Chen Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
// import statement brings everything in, which takes more space.
// @class just let us be able to define this class here.
@class Video;

@interface VideoCell : UITableViewCell
-(void)updateUI: (nonnull Video*) video;

@end
