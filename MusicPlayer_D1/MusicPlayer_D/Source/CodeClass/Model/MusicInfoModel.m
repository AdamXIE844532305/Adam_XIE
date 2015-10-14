//
//  MusicInfoModel.m
//  MusicPlayer_D
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MusicInfoModel.h"

static MusicInfoModel *model =nil;

@implementation MusicInfoModel

+(instancetype)shareMusicInfoModel
{
    if (model ==nil) {
        static dispatch_once_t once_taken;
        dispatch_once(&once_taken, ^{
            model =[[MusicInfoModel alloc]init];
            
        });
    }
    
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ID =value;
    }
    if ([key isEqualToString:@"lyric"]) {
        self.timeLyric =[value componentsSeparatedByString:@"\n"];
    }
    
    
    
}





@end
