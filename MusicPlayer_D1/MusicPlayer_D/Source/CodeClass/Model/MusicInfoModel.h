//
//  MusicInfoModel.h
//  MusicPlayer_D
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicInfoModel : NSObject
+(instancetype)shareMusicInfoModel;

@property(nonatomic ,strong)NSString *lyricTieme;
@property(nonatomic ,strong)NSString *lyricStr;


@property(nonatomic ,strong)NSString *mp3Url;
@property(nonatomic ,strong)NSString  *ID;
@property(nonatomic ,strong)NSString *name;
@property(nonatomic,strong)NSString *picUrl;
@property(nonatomic,strong)NSString *blurPicUrl;
@property(nonatomic ,strong)NSString *album;
@property(nonatomic ,strong)NSString *singer;
@property(nonatomic ,strong)NSString *duration;
@property(nonatomic ,strong)NSString  *artists_name;
@property(nonatomic ,strong)NSArray *timeLyric;



@end
