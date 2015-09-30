//
//  HYSecondTVC.m
//  HYTestDemo
//
//  Created by heyang on 15/9/29.
//  Copyright © 2015年 com.scxingdun. All rights reserved.
//

#import "HYSecondTVC.h"
#import "HYTableViewCell.h"

@interface HYSecondTVC ()
@property (nonatomic,strong) NSMutableArray *dataSourceArray;
@property (nonatomic,strong) NSMutableArray *canSelectedArray;
@property (nonatomic,strong) NSMutableArray *recordSelectedArray;



@property (nonatomic) __block NSInteger price;
@end

@implementation HYSecondTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    /** 数据源*/
    _dataSourceArray = [NSMutableArray array];
    
    /** 可以选中数组*/
    _canSelectedArray = [NSMutableArray array];
    
    /** 记录当前选中cell*/
    _recordSelectedArray = [NSMutableArray array];
    

    /** 数据源*/
    for (int  i = 0; i < 10; i++) {
        
        [_dataSourceArray addObject:[NSString stringWithFormat:@"测试数据%d",i + 1]];
        
    }
    
    
   /** 所有cell可选中(数量一定要与数据源大小一致)*/
    for (int  i = 0; i < _dataSourceArray.count; i++) {
        
        [_canSelectedArray addObject:@YES];
     
        
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
   
    [super didReceiveMemoryWarning];
   
}

#pragma mark - Table view data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _dataSourceArray.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    
    /** 防止重用显示问题给每个cell设置唯一标识*/
    
    NSString *identifier = [NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row];
    
    /** 注册cell*/
    [self.tableView registerNib:[UINib nibWithNibName:@"HYTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
    
    /** 取cell*/
    HYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    /** cell可选中状态(初始值全为可选中状态)*/
    cell.iscan = [_canSelectedArray[indexPath.section]stringValue];
    
    /** 数据源*/
    cell.string = _dataSourceArray [indexPath.section];
    
    
    /** 回调*/
    cell.HYChoiceCallback = ^(BOOL isSelected, NSInteger buyCount){
      
        /** 判断cell的选中状态,如果是选中状态则叠加,反之递减*/
        
        if(isSelected){
            
           _price += buyCount;
            
            /** 将选中过的cell放入单独数组记录下来*/
            [_recordSelectedArray addObject:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
            
        }else{
            
             _price -= buyCount;
            
            /** 从记录选中cell数组中移除*/
            [_recordSelectedArray removeObject:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
        }
        
       
        

            /** 设置界限*/
        
            if(_price > 5){
        
        
            /** 将选中的cell置为不可选中状态*/
            
            [_recordSelectedArray enumerateObjectsUsingBlock:^(NSIndexPath *indexPath2, NSUInteger idx, BOOL * _Nonnull stop) {
              
                [_canSelectedArray replaceObjectAtIndex:indexPath2.section withObject:@NO];
    
            }];
    
            
            /** 反转所有cell可选中状态*/
            
            [_canSelectedArray enumerateObjectsUsingBlock:^(NSNumber *selectedStatus, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if([selectedStatus boolValue]){
                    [_canSelectedArray replaceObjectAtIndex:idx withObject:@NO];
                }else{
                    [_canSelectedArray replaceObjectAtIndex:idx withObject:@YES];
                }
                
            }];
        }
        /** 如果小于则全部可选中*/
        else{
            
            [_canSelectedArray removeAllObjects];
            
            for (int  i = 0; i < _dataSourceArray.count; i++) {
                
                [_canSelectedArray addObject:@YES];
            }
        }
       
        /** 刷新*/
        
        [self.tableView reloadData];
        
    };
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 0.5;
    }else
    {
        return 0;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

@end
