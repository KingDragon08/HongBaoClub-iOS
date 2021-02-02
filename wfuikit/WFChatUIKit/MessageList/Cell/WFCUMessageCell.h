//
//  MessageCell.h
//  WFChat UIKit
//
//  Created by WF Chat on 2017/9/1.
//  Copyright © 2017年 WildFireChat. All rights reserved.
// 基类，新建时需要继承

#import <UIKit/UIKit.h>
#import "WFCUMessageCellBase.h"
#import "ZBLocalized.h"

@interface WFCUMessageCell : WFCUMessageCellBase
+ (CGSize)sizeForClientArea:(WFCUMessageModel *)msgModel withViewWidth:(CGFloat)width;
@property (nonatomic, strong)UIImageView *portraitView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UIImageView *bubbleView;
@property (nonatomic, strong)UIView *contentArea;
- (void)setMaskImage:(UIImage *)maskImage;
@end
