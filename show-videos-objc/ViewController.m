//
//  ViewController.m
//  show-videos-objc
//
//  Created by Chen Wang on 5/17/16.
//  Copyright © 2016 Chen Wang. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "Video.h"
#import "VideoCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *videoList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.videoList = [[NSArray alloc] init];
    
    [[HTTPService instance] getCourses:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
        if (dataArray){
            NSMutableArray* arr = [[NSMutableArray alloc] init];
            // assign every filed in the dict to a new object, then add this object to video list array
            for (NSDictionary* dict in dataArray) {
                Video* video = [[Video alloc]init];
                video.videoTitle = [dict objectForKey:@"title"];
                video.videoCourseName = [dict objectForKey:@"courseName"];
                video.videoIframe = [dict objectForKey:@"iframe"];
                video.videoThumbnailUrl = [dict objectForKey:@"thumbnail"];

                [arr addObject:video];
            }
            // assign a NSMutableArray to NSArray
            self.videoList = arr;
            [self updateTableData];
            
        } else if (errMessage) {
            //display alert to the user.
        }
    }];
}

-(void) updateTableData {
    // grab the main thread and update the data
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //This function sets what data you want to show in a specific new cell
    VideoCell* cell = (VideoCell *) [tableView dequeueReusableCellWithIdentifier:@"main"];
    if (!cell) {
        cell = [[VideoCell alloc] init];
    }
    Video* video = [self.videoList objectAtIndex:indexPath.row];
    [cell updateUI:video];
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoList.count;
}



@end
