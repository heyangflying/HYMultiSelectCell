//
//  HYTableViewCell.h
//  HYTestDemo
//
//  Created by heyang on 15/9/29.
//  Copyright © 2015年 com.scxingdun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYTableViewCell : UITableViewCell

/** 可选中按钮*/
@property (weak, nonatomic) IBOutlet UIButton *selectedButton;

/** 背景图*/
@property (weak, nonatomic) IBOutlet UIImageView *selectedImageView

;
/** 文字*/
@property (weak, nonatomic) IBOutlet UILabel *text;

/** 可选中状态*/
@property (copy, nonatomic) NSString *iscan;

/** 回调*/
@property (copy, nonatomic) void     (^HYChoiceCallback)(BOOL isSelected,  NSInteger buyCount);

/** 接收数据源*/
@property (copy,nonatomic) NSString *string;

@end
