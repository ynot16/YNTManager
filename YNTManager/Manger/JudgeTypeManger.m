//
//  JudgeTypeManger.m
//  GridClass
//
//  Created by forr on 15/5/27.
//  Copyright (c) 2015年 forr. All rights reserved.
//

#import "JudgeTypeManger.h"

@implementation JudgeTypeManger

//判断类型
+(NSString*)type:(NSString*)str
{
    NSString *type;
    
    switch (str.intValue) {
        case 0:
            
        {
            type = @"视频课程";
        }
            break;
            
        case 1:
            
        {
             type = @"URL课程";
        }
            break;
            
        case 2:
            
        {
             type = @"图文课程";
        }
            break;
            
        case 3:
            
        {
             type = @"微课";
        }
            break;
            
        case 4:
            
        {
             type = @"word课程";
        }
            break;
        case 5:{
            type = @"ppt课程";
        }
        default:
            break;
    }
    
    return type;
}
//判断是不是为空
+ (NSString*)isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return @" ";
    }
    if ([string isEqualToString:@"<null>"]) {
        return @" ";
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return @" ";
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return @" ";
    }
    return string;
}

//
+(NSString*) transformUrl:(NSString*)str
{
    NSString *url = [NSString stringWithFormat:@"%@",str];
    if (str.length == 0 || [str isEqualToString:@"<null>"]) {
        return url ;
    }
    NSString *string = @"{";
    NSRange range = [url rangeOfString:string];
    
    if (range.location != NSNotFound) {
        
        url = [url stringByReplacingOccurrencesOfString:@"\\" withString:@"/"];
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    }

    return url;
}
+ (NSString*)intervalSinceNow: (NSDate*)theDate startDate:(NSDate*)start
{
    NSString *value = nil;
    NSTimeInterval time = [theDate timeIntervalSinceDate:start];

    value = [NSString stringWithFormat:@"%zd",time /60];
    NSLog(@"value====%@",value);
    return value;
}
+(NSString*)pacticeType:(NSString*)str
{
    NSString *type = str;
    
    switch (str.integerValue) {
        case 1:
        {
            type = @"单选题";
        }
            break;
        case 2:
        {
             type = @"多选题";
        }
            break;
        case 3:
        {
             type = @"填空题";
        }
            break;
        case 4:
        {
             type = @"判断题";
        }
            break;
        case 5:
        {
             type = @"问答题";
        }
            break;
        case 6:
        {
            type = @"打分题";
        }
            break;

            
        default:
            break;
    }
    
    return type;
}
+ (NSString *)upperCase:(NSString *) str
{
    if (str.length !=0) {
        
        str = [str uppercaseString];
    }
    return str;
}
+ (NSString*)modelMake:(id)model
{
    NSString *str;
    if ( [model isKindOfClass:[MainModel class]] ) {
        
        MainModel *main = (MainModel*)model;
        str = main.name;
    }
    else{
        
        str = (NSString*)model;
    }

    return str;
}
- (UIImage*)placeholderImageURL:(NSURL *)imgUrl
{
    UIImageView *bgImage = [[UIImageView alloc]init];
    
    NSString *imgUrlstr = [imgUrl absoluteString];
    NSString *fileName = [imgUrlstr lastPathComponent];
    NSString *filePath = [self getImageFilePath];
    fileName = [filePath stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:filePath])
    {
        [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    if ([fileManager fileExistsAtPath:fileName])
    {
        
       bgImage.image = [UIImage imageWithContentsOfFile:fileName];
    }
    else
    {
        
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(queue, ^
                       {
                           NSData *data = [[NSData alloc]initWithContentsOfURL:imgUrl];
                           [data writeToFile:fileName atomically:YES];
                           dispatch_async(dispatch_get_main_queue(), ^
                                          {
                                              bgImage.image = [UIImage imageWithData:data];
                                              
                                              //                NSLog(@"_imageViewHeight = %lf",_imageView.image.size.height);
                                          });
                           
                       });
    }
    
    return bgImage.image ;
}

-(NSString *)getImageFilePath
{
    NSLog(@"path = %@",[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"img"]);
    return [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"img"];
}

+ (UIColor *)getColor:(NSString *) hexColor
{
    unsigned int redInt_, greenInt_, blueInt_;
    NSRange rangeNSRange_;
    rangeNSRange_.length = 2;  // 范围长度为2
    
    // 取红色的值
    rangeNSRange_.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&redInt_];
    
    // 取绿色的值
    rangeNSRange_.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&greenInt_];
    
    // 取蓝色的值
    rangeNSRange_.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&blueInt_];
    
    return [UIColor colorWithRed:(float)(redInt_/255.0f)
                           green:(float)(greenInt_/255.0f)
                            blue:(float)(blueInt_/255.0f) alpha:1.0f];
}

+(void)sendRequest:(NSMutableDictionary*)dic and:(NSString*)url
{
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    manger.responseSerializer.acceptableContentTypes = [manger.responseSerializer.acceptableContentTypes setByAddingObject: @"text/html"];
    manger.responseSerializer.acceptableContentTypes = [manger.responseSerializer.acceptableContentTypes setByAddingObject: @"text/plain"];
    [manger GET:WebBaseUrl(url) parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}


@end
