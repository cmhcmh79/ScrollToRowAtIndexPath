//
//  ViewController.h
//  Test2
//
//  Created by cmh on 2015. 10. 29..
//  Copyright (c) 2015년 cmh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+ScrollWithCallback.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    
    UITextField *tf;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)test:(id)sender;

- (IBAction)test2:(id)sender;


@end

