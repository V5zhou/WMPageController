//
//  WMScrollView.m
//  WMPageController
//
//  Created by lh on 15/11/21.
//  Copyright (c) 2015年 yq. All rights reserved.
//

#import "WMScrollView.h"

/// 这里做了默认的一些手势控制，无法做到顾全所有的手势
/// 若出现手势冲突或者不响应，需要自行对视图的 GestureRecognizerDelegate 进行实现
@implementation WMScrollView

#pragma mark - <UIGestureRecognizerDelegate>

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    // 兼容系统pop手势 / FDFullscreenPopGesture / 如有自定义手势，需自行对 Gesture 做判断
    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UILayoutContainerView")]) {
        if (otherGestureRecognizer.state == UIGestureRecognizerStateBegan && self.contentOffset.x == 0) {
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    //MARK: UITableViewCell 自定义手势需要自行定义
    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UITableViewWrapperView")] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        return YES;
    }
    return NO;
}

@end
