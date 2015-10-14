//
//  MusicPlayerTools.h
//  MusicPlayer_D
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@protocol MusicPlayerToolsDelegate <NSObject>

-(void)getCurTime:(NSString *)curTime Totle:(NSString *)totleTime progress:(CGFloat)progress;
-(void)endOfPlayAction;

@end

@interface MusicPlayerTools : NSObject

+(instancetype)shareMusicPlayerTools;
@property(nonatomic ,strong)id<MusicPlayerToolsDelegate>delegate;
//播放器
@property(nonatomic ,strong)AVPlayer *player;
@property(nonatomic ,strong)MusicInfoModel *model;

//播放
-(void)musicPlay;
//暂停
-(void)musicPauss;
//准备播放
-(void)musicPrePlay;

//跳转
-(void)seekToTimeWithValue:(CGFloat)value;

-(NSMutableArray *)getMusicLyricArray;

-(NSInteger)getIndexWithCurrTime;



@end




















