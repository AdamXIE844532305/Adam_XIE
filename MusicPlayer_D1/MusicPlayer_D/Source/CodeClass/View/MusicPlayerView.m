//
//  MusicPlayerView.m
//  MusicPlayer_D
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MusicPlayerView.h"

@implementation MusicPlayerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setview];
    }
    return self;
}

-(void)p_setview
{
    self.mainScrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 400)];
    self.mainScrollView.contentSize =CGSizeMake(2*kScreenWidth, 400) ;
    self.mainScrollView.backgroundColor =[UIColor magentaColor];
    self.mainScrollView.alwaysBounceHorizontal =YES;
    self.mainScrollView.alwaysBounceVertical =NO;
    self.mainScrollView.pagingEnabled =YES;
    [self addSubview:self.mainScrollView];
    
    self.headImageV =[[UIImageView alloc]initWithFrame:CGRectMake(20, 30, kScreenWidth -50, 350)];
    self.headImageV.image =[UIImage imageNamed:@"backImage"];
    [self.mainScrollView addSubview:self.headImageV];
    
    self.lyricTableView =[[UITableView alloc]initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, 400) style:UITableViewStylePlain];
    self.lyricTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   
    [self.mainScrollView addSubview: self.lyricTableView];
    
    self.curTimeLabel =[[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(self.mainScrollView.frame)+10, 60, 30)];
   // self.curTimeLabel.backgroundColor =[UIColor yellowColor];
    self.curTimeLabel.text =@"Time";
    [self addSubview:self.curTimeLabel];
    
    self.progressSlider =[[UISlider alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.curTimeLabel.frame)+10, CGRectGetMinY(self.curTimeLabel.frame), 200, 30)];
  //  self.progressSlider.backgroundColor =[UIColor yellowColor];
    [self addSubview:self.progressSlider];
    
    
    self.totleTimeLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.progressSlider.frame)+10, CGRectGetMinY(self.progressSlider.frame), 60, 30)];
   // self.totleTimeLabel.backgroundColor =[UIColor yellowColor];
    self.totleTimeLabel.text =@"totle";
    [self addSubview:self.totleTimeLabel];
    
    self.lastButton =[UIButton buttonWithType:UIButtonTypeSystem];
    self.lastButton.frame =CGRectMake(50, kScreenHeight -150, 80, 50);
    //self.lastButton.backgroundColor = [UIColor yellowColor];
    [self.lastButton setImage:[UIImage imageNamed:@"WebView_TabBar_Back_Icon_HL"] forState:UIControlStateNormal];
    [self.lastButton addTarget:self action:@selector(lastButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.lastButton];
    
    self.playPassButton =[UIButton buttonWithType:UIButtonTypeSystem];
    self.playPassButton.frame =CGRectMake(CGRectGetMaxX(self.lastButton.frame)+20, CGRectGetMinY(self.lastButton.frame), 80, 50);
    [self.playPassButton setImage:[UIImage imageNamed:@"VoiceAssistantPlayBtnHL"] forState:UIControlStateNormal];
   // self.playPassButton.backgroundColor =[UIColor yellowColor];
    [self addSubview:self.playPassButton];
    
    self.nextButton =[UIButton buttonWithType:UIButtonTypeSystem];
    self.nextButton.frame =CGRectMake(CGRectGetMaxX(self.playPassButton.frame)+20, CGRectGetMinY(self.playPassButton.frame), 80, 50);
   // self.nextButton.backgroundColor =[UIColor yellowColor];
    [self.nextButton setImage:[UIImage imageNamed:@"WebView_TabBar_Advance_Icon_HL"] forState:UIControlStateNormal];
    [self.nextButton addTarget:self action:@selector(nextButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.nextButton];
    
    
}

-(void)lastButtonAction:(UIButton *)sender
{
    [self.delegate lastSongAction];
}

-(void)nextButtonAction:(UIButton *)sender
{
    [self.delegate nextSongAction];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
