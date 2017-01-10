//
//  TempArrayManger.h
//  GridClass
//
//  Created by forr on 15/6/7.
//  Copyright (c) 2015年 forr. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TempArrayManger;
@protocol tempMangerDelegate <NSObject>

@optional
//进度条
- (void)progress:(float)length;
-(void)reloadTable;
@end

@interface TempArrayManger : NSObject

//保存 缓存  数组
+(TempArrayManger*)sharedInstance;

@property (strong , nonatomic) NSMutableArray *tempArray;
@property (strong , nonatomic) NSMutableArray *testArray;//测试随机数据数组
@property (nonatomic ,strong) NSMutableArray *downloadArray;//正在下载数据 数组
@property (nonatomic ,strong) NSMutableArray *recordArray;//考试记录 数组
@property (strong , nonatomic) NSMutableDictionary *dic;
@property (strong , nonatomic) NSString *types;//是专题还是讨论
@property (strong , nonatomic) NSString *examID;//考试试题id
@property (strong , nonatomic) NSMutableArray *knowledgeArray;// 试题知识点
@property (weak,nonatomic) id <tempMangerDelegate>delegate;
@property (nonatomic , strong) NSMutableArray *modelArray;
@property (nonatomic,strong) NSNumber *tapIndex;
@property (nonatomic , strong) NSMutableArray *searchArray;//缓存历史搜索数组
@property (strong , nonatomic) NSMutableDictionary *practiceDic;//练习题数组
@property (strong , nonatomic) NSMutableDictionary *dictHaveArray;//做过的各个模式试题数组

//清楚缓存
- (void)cleanTestArrayAndDic;
@end
