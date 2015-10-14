//
//  GetDataTools.m
//  MusicPlayer_D
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "GetDataTools.h"

static GetDataTools *getDataTools =nil;

@implementation GetDataTools

+(instancetype)shareDetDataTools
{
    if (getDataTools ==nil) {
        
        static dispatch_once_t once_taken;
        dispatch_once(&once_taken, ^{
        
            getDataTools =[[GetDataTools alloc]init];
   
        });
    
    } 
    return getDataTools;
    
}

-(void)getDataWithURL:(NSString *)Url PassValue:(PassValue)passValue
{
    dispatch_queue_t global_t =dispatch_get_global_queue(0, 0);
    dispatch_async(global_t, ^{
        
        NSArray *array =[NSArray arrayWithContentsOfURL:[NSURL URLWithString:Url]];
        for (NSDictionary *dic  in array) {
            MusicInfoModel *musicModel =[MusicInfoModel new];
        [musicModel setValuesForKeysWithDictionary:dic];
            [self.dataArray addObject:musicModel];
            
        }
       passValue(self.dataArray);
    });
  
}
-(NSMutableArray *)dataArray
{
    if (_dataArray ==nil) {
        _dataArray =[NSMutableArray array];
    }
    return _dataArray;
}

-(MusicInfoModel *)getModelWithIndex:(NSInteger)index
{
    return self.dataArray[index];
    
}


@end
