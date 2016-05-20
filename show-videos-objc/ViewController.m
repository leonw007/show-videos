//
//  ViewController.m
//  show-videos-objc
//
//  Created by Chen Wang on 5/17/16.
//  Copyright © 2016 Chen Wang. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[HTTPService instance] getCourses:^(NSDictionary * _Nullable dataDict, NSString * _Nullable errMessage) {
        if (dataDict){
            NSLog(@"Dictionary: %@", dataDict.debugDescription);
        } else if (errMessage) {
            //display alert to the user.
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
