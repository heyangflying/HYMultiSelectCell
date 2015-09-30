//
//  HYTableViewCell.m
//  HYTestDemo
//
//  Created by heyang on 15/9/29.
//  Copyright © 2015年 com.scxingdun. All rights reserved.
//

#import "HYTableViewCell.h"

@implementation HYTableViewCell

- (void)awakeFromNib {
    
    
    
}
-(void)setString:(NSString *)string
{
    
    _text.text = string;
}
- (void)setIscan:(NSString *)iscan
{
    _iscan = iscan;
    
    
    if([iscan boolValue]){
        _selectedButton.userInteractionEnabled = YES;
        _selectedButton.backgroundColor        = [UIColor clearColor];
    }else{
        
        /** 不可选中的cell改变颜色*/
        _selectedButton.userInteractionEnabled = NO;
        _selectedButton.backgroundColor        = [UIColor colorWithWhite:1 alpha:0.6];
    }
    
    
}
- (IBAction)selectedButtonAction:(UIButton *)sender {

    sender.tag = !sender.tag;
    
    if(sender.tag == 1){
        /** 回调*/
        if(_HYChoiceCallback){
            _HYChoiceCallback(YES,1);
        }
         _selectedImageView.image = [UIImage imageNamed:@"choose_order_1"];
    }else{
        if(_HYChoiceCallback){
            _HYChoiceCallback(NO,1);
        }
         _selectedImageView.image = [UIImage imageNamed:@"choose_order_0"];
    }    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
