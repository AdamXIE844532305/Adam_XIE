//
//  MusicPlayerTools.m
//  MusicPlayer_D
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MusicPlayerTools.h"

static MusicPlayerTools *mpt =nil;

@interface MusicPlayerTools ()
@property(nonatomic ,strong)NSTimer *timer;
@end

@implementation MusicPlayerTools

+(instancetype)shareMusicPlayerTools
{
    if (mpt ==nil) {
        static dispatch_once_t once_taken;
        dispatch_once(&once_taken, ^{
            mpt =[[MusicPlayerTools alloc]init];
            
        });
    }
    
    return mpt;
    
}

-(instancetype)init
{
    if (self =[super init]) {
        _player =[[AVPlayer alloc]init];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(endOfPlay:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    
    
    return self;
    
}

-(void)endOfPlay:(NSNotification *)sender
{
    [self musicPauss];
    [self.delegate  endOfPlayAction];
    
}

-(void)musicPrePlay
{
    if (self.player.currentItem) {
        [self.player.currentItem removeObserver:self forKeyPath:@"status"];
    }

    AVPlayerItem *item =[[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:self.model.mp3Url]];
    
    [item addObserver:self forKeyPath:@"status" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
    
    
    [self.player replaceCurrentItemWithPlayerItem:item];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]) {
        switch ([[change valueForKey:@"new" ]integerValue]) {
            case AVPlayerItemStatusUnknown:
                NSLog(@"不知道什么错误");
                break;
                case AVPlayerItemStatusReadyToPlay:
                [self musicPlay];
                break;
                case AVPlayerItemStatusFailed:
                NSLog(@"准备失败");
                break;
            default:
                break;
        }
    }
  
    
}
//播放
-(void)musicPlay
{
    if (self.timer !=nil) {
        return;
    }
    self.timer =[NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
    
    [self.player play];
}

-(void)timeAction:(NSTimer *)sender
{
   [self.delegate getCurTime:[self valueToString:[self getCurTime]] Totle:[self valueToString:[self getTotleTime]] progress:[self getProgress]];
 
    
}

-(NSInteger)getCurTime
{
    if (self.player.currentItem) {
        return self.player.currentTime.value / self.player.currentTime.timescale;
    }
    
    return 0;
}

-(NSInteger)getTotleTime
{
    CMTime totleTime =[self.player.currentItem duration];
    if (totleTime.timescale ==0 ) {
        return 1;
    }else{
        return totleTime.value /totleTime.timescale;
        
        
    }
    
    
    
}

-(CGFloat)getProgress
{
    
    return (CGFloat)[self getCurTime] /(CGFloat)[self getTotleTime];
    
    
}

-(NSString *)valueToString:(NSInteger)Value
{
    return [NSString stringWithFormat:@"%0.2ld:%0.2ld",Value /60,Value %60];
    
    
    
    
}

//暂停
-(void)musicPauss
{
    [self.timer invalidate];
    self.timer =nil;
    [self.player pause ];
    
    
}

//跳转
-(void)seekToTimeWithValue:(CGFloat)value
{
    [self musicPauss];
    [self.player seekToTime:CMTimeMake(value*[self getTotleTime], 1) completionHandler:^(BOOL finished) {
        if (finished ==YES) {
            [self musicPlay];
        }
        
    }];
    
    
    
}


-(NSMutableArray *)getMusicLyricArray
{
    NSMutableArray *array =[NSMutableArray array];
   
    for (NSString *str in self.model.timeLyric) {
        if (str.length ==0) {
            continue;
        }
        
       // MusicInfoModel *model =[[MusicInfoModel alloc]init];
        NSString *tem =[[NSString alloc]init];
        if ([[str substringToIndex:1] isEqualToString:@"[" ]) {
            tem =[str substringFromIndex:[str rangeOfString:@"]"].location +1];
        }else{
            tem =str;
        }
        
        [array addObject:tem];
        
    }
    
    return array;
}

-(NSInteger)getIndexWithCurrTime
{
    NSInteger index =0;
    NSString *curTime =[self valueToString:[self getCurTime]];
    for (NSString *str in self.model.timeLyric) {
        if (str.length ==0) {
            continue;
        }
        if ([[str substringToIndex:1] isEqualToString:@"["]) {
            NSRange range =[str rangeOfString:@"["];
            if ([curTime isEqualToString:[str substringWithRange:NSMakeRange(range.location+1, 5)]]) {
                
                return index;
               
            }
             index ++;
        }else{
            index ++;
        }
    }
    return -1;
}





@end
