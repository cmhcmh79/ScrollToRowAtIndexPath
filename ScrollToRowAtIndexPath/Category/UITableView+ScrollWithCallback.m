//
//  UITableView+ScrollWithCallback.m
//  Test2
//
//  Created by cmh on 2015. 11. 9..
//  Copyright (c) 2015년 cmh. All rights reserved.
//

#import "UITableView+ScrollWithCallback.h"
#import <objc/runtime.h>


static const void *UITableViewOrginDelegateKey      = &UITableViewOrginDelegateKey;
static const void *UITableViewScrollDelegateKey     = &UITableViewScrollDelegateKey;
static const void *UICategoryVTestKey               = &UICategoryVTestKey;


@implementation UITableView (ScrollWithCallback)

-(void)scrollToRowAtIndexPath:(NSIndexPath * __nullable )indexPath
             atScrollPosition:(UITableViewScrollPosition)scrollPosition
                     animated:(BOOL)animated
                   completion:CompletionBlock
{
    
    if (self.delegate != (id<UITableViewDataSource, UITableViewDelegate>)self) {
        
        objc_setAssociatedObject(self, UITableViewOrginDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UITableViewDataSource, UITableViewDelegate>)self;
        
    }

    self.completionBlock = CompletionBlock;
    
    self.testString = @"1111";

    [self scrollToRowAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];

}


//스크롤 get set 처리 함수
- (CompletionBlock)completionBlock {
    return objc_getAssociatedObject(self, UITableViewScrollDelegateKey);
}

- (void)setCompletionBlock:(CompletionBlock)completionBlock {
    objc_setAssociatedObject(self, UITableViewScrollDelegateKey, completionBlock, OBJC_ASSOCIATION_COPY);
}



- (NSString*)testString {
    return objc_getAssociatedObject(self, UICategoryVTestKey);
}

- (void)setTestString:(NSString * __nullable)testString {
    objc_setAssociatedObject(self, UICategoryVTestKey, testString, OBJC_ASSOCIATION_COPY);
}



#pragma ScrollView Delegate

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSLog(@"%@", self.testString);

    if (self.completionBlock) {
        self.completionBlock();
    }

    id originalDelegate = objc_getAssociatedObject(self, UITableViewOrginDelegateKey);
    if (originalDelegate && [originalDelegate respondsToSelector:@selector(scrollViewDidEndScrollingAnimation:)]) {
        [originalDelegate scrollViewDidEndScrollingAnimation:scrollView];
    }

}








@end
