//
//  MusicPlayerView.h
//  MusicPlayer_D
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MusicPlayerViewDelegate <NSObject>

-(void)lastSongAction;
-(void)nextSongAction;
@end

@interface MusicPlayerView : UIView

@property(nonatomic ,strong)UIScrollView *mainScrollView;
@property(nonatomic ,strong)UIImageView *headImageV;
@property(nonatomic ,strong)UILabel *curTimeLabel;
@property(nonatomic ,strong)UILabel *totleTimeLabel;
@property(nonatomic ,strong)UISlider *progressSlider;

@property(nonatomic ,strong)UIButton *lastButton;
@property(nonatomic ,strong)UIButton *playPassButton;
@property(nonatomic ,strong)UIButton *nextButton;

@property(nonatomic ,strong)UITableView *lyricTableView;

@property(nonatomic ,strong)id<MusicPlayerViewDelegate>delegate;

@end
