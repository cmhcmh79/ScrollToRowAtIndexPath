//
//  ViewController.m
//  Test2
//
//  Created by cmh on 2015. 10. 29..
//  Copyright (c) 2015년 cmh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell;
    
    
    if (indexPath.row == 9) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"testCell2"];
        
        tf = (UITextField*)[cell.contentView viewWithTag:1];
        
    }else{
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"testCell"];
        
    }
    
    return cell;
    
}



- (IBAction)test:(id)sender {
    
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:9 inSection:0];

    [self.tableView scrollToRowAtIndexPath:nextIndexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES completion:^{
        NSLog(@"scrollViewDidEndScrollingAnimation Category");
        [tf becomeFirstResponder];
    }];
    
}


- (IBAction)test2:(id)sender {
    
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:9 inSection:0];

    [self.tableView scrollToRowAtIndexPath:nextIndexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

#pragma ScrollView Delegate

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
    NSLog(@"scrollViewDidEndScrollingAnimation Original");
    
}





@end
