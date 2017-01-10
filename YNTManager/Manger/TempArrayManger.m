//
//  TempArrayManger.m
//  GridClass
//
//  Created by forr on 15/6/7.
//  Copyright (c) 2015年 forr. All rights reserved.
//

#import "TempArrayManger.h"

@implementation TempArrayManger
+(TempArrayManger*)sharedInstance
{
    static TempArrayManger *manger = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        
        if (manger == nil) {
            
            manger = [[TempArrayManger alloc]init];
        }
    });
    
 
    return  manger;
}
- (id)init
{
    if (self = [super init]) {
        
        self.tempArray = [[NSMutableArray alloc]init];
        self.knowledgeArray = [[NSMutableArray alloc]init];
        self.testArray = [[NSMutableArray alloc]init];
        self.downloadArray = [[NSMutableArray alloc] init];
        self.recordArray = [[NSMutableArray alloc] init];
        self.dic = [[NSMutableDictionary alloc]init];
        self.practiceDic = [[NSMutableDictionary alloc]init];

        self.types = [[NSString alloc]init];
        self.types = @"100";
        self.modelArray = [[NSMutableArray alloc] init];
        self.tapIndex = [[NSNumber alloc] init];
        self.searchArray = [[NSMutableArray alloc] init];
        self.dictHaveArray = [[NSMutableDictionary alloc]init];
    }
    
    return self;
}
- (void)cleanTestArrayAndDic
{
    [self.dic removeAllObjects];
    [self.practiceDic removeAllObjects];
    [self.recordArray removeAllObjects];
    [self.dictHaveArray removeAllObjects];

}
@end
