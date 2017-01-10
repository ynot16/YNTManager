//
//  JudgeTypeManger.h
//  GridClass
//
//  Created by forr on 15/5/27.
//  Copyright (c) 2015年 forr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JudgeTypeManger : NSObject

+(NSString*)type:(NSString*)str;
+(NSString*)pacticeType:(NSString*)str;
+(NSString*) transformUrl:(NSString*)str;
- (UIImage*)placeholderImageURL:(NSURL *)imgUrl;
+ (UIColor *)getColor:(NSString *) hexColor;
+ (NSString *)upperCase:(NSString *) str;
+ (NSString*)modelMake:(id)model;
+(void)sendRequest:(NSMutableDictionary*)dic and:(NSString*)url;
//判断字符为空
+ (NSString*)isBlankString:(NSString *)string ;

+ (NSString*)intervalSinceNow: (NSDate*)theDate startDate:(NSDate*)start;
@end
