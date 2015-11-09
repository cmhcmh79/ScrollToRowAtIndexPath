//
//  UITableView+ScrollWithCallback.h
//  Test2
//
//  Created by cmh on 2015. 11. 9..
//  Copyright (c) 2015년 cmh. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef void (^CompletionBlock)();

@interface UITableView (ScrollWithCallback)

@property (copy, nonatomic, nullable) CompletionBlock completionBlock;

@property( nonatomic, nullable) NSString *testString;


-(void)scrollToRowAtIndexPath:(NSIndexPath * __nullable )indexPath
             atScrollPosition:(UITableViewScrollPosition)scrollPosition
                     animated:(BOOL)animated
                   completion:CompletionBlock;

@end
