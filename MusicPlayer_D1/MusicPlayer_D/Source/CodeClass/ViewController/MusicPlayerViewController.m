//
//  MusicPlayerViewController.m
//  MusicPlayer_D
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MusicPlayerViewController.h"

static MusicPlayerViewController *musicPlayerVC =nil;

@interface MusicPlayerViewController ()<UITableViewDataSource,UITableViewDelegate,MusicPlayerToolsDelegate,MusicPlayerViewDelegate>
@property(nonatomic ,strong)MusicPlayerView *musicPlayerV;
@property(nonatomic ,strong)MusicPlayerTools *mp;
@property(nonatomic ,strong)NSArray *lyricArray;

@end

@implementation MusicPlayerViewController

+(instancetype)shareMusciPlayerViewController
{
    if (musicPlayerVC ==nil) {
        static dispatch_once_t once_taken;
        dispatch_once(&once_taken, ^{
            musicPlayerVC =[[MusicPlayerViewController alloc]init];
            
            
        });
    }
    
    
    return  musicPlayerVC;
}

-(void)loadView
{
    self.musicPlayerV =[[MusicPlayerView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view =self.musicPlayerV;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout =UIRectEdgeNone ;
    }
    
    self.musicPlayerV.headImageV.layer.cornerRadius =(kScreenWidth -50)/2;
    self.musicPlayerV.headImageV.layer.masksToBounds =YES;
    
    
    self.musicPlayerV.backgroundColor =[UIColor magentaColor];
    self.musicPlayerV.lyricTableView.delegate =self;
    self.musicPlayerV.lyricTableView.dataSource =self;
    self.mp =[MusicPlayerTools shareMusicPlayerTools];
    self.mp.delegate =self;
    self.musicPlayerV.delegate =self;
    [self.musicPlayerV.playPassButton addTarget:self action:@selector(playPassButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.musicPlayerV.progressSlider addTarget:self action:@selector(progressSliderAction:) forControlEvents:UIControlEventValueChanged];
    
    
    [self.mp.player addObserver:self forKeyPath:@"rate" options:(NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew) context:nil];
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"rate"]) {
        if ([[change valueForKey:@"new"]integerValue]==0) {
            [self.musicPlayerV.playPassButton setImage:[UIImage imageNamed:@"VoiceAssistantStopBtnHL"] forState:UIControlStateNormal];
        }else{
            
            [self.musicPlayerV.playPassButton setImage:[UIImage imageNamed:@"VoiceAssistantPlayBtnHL"] forState:UIControlStateNormal];
            
            
        }
    }
   
}

-(void)viewWillAppear:(BOOL)animated
{
    [self p_play];
    
}

-(void)p_play
{
    if ([self.mp.model isEqual:[[GetDataTools shareDetDataTools] getModelWithIndex:self.index]]) {
        return;
    }
    
    self.mp.model =[[GetDataTools shareDetDataTools] getModelWithIndex:self.index];
    
    [self.mp musicPrePlay ];
    
    [self.musicPlayerV.headImageV sd_setImageWithURL:[NSURL URLWithString:self.mp.model.picUrl]];
    
    self.lyricArray =[self.mp getMusicLyricArray];
    [self.musicPlayerV.lyricTableView  reloadData];
    
}

//播放


-(void)getCurTime:(NSString *)curTime Totle:(NSString *)totleTime progress:(CGFloat)progress
{
    self.musicPlayerV.curTimeLabel.text =curTime;
    self.musicPlayerV.totleTimeLabel.text=totleTime;
    self.musicPlayerV.progressSlider.value =progress;
    
    NSInteger index =[self.mp getIndexWithCurrTime];
    if (index ==-1) {
        return;
    }
    
    NSIndexPath *temIndexPath =[NSIndexPath indexPathForRow:index inSection:0];
    [self.musicPlayerV.lyricTableView selectRowAtIndexPath:temIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle ];
    
    
    
    
}

-(void)playPassButtonAction:(UIButton *)sender
{
    if (self.mp.player.rate ==0) {
        [self.mp musicPlay];
    }else{
        
        [self.mp musicPauss];
        
    }
    
    
}
//上一首
-(void)lastSongAction
{
    if (self.index >0) {
        self.index --;
    }else{
        
        self.index =[GetDataTools shareDetDataTools].dataArray.count-1;
        
    }
    
    [self p_play];
}

-(void)nextSongAction
{
    if (self.index ==[GetDataTools shareDetDataTools].dataArray.count -1) {
        self.index =0;
    }else{
        
        self.index ++;
        
    }
    
    [self p_play];
    
}
//跳转
-(void)progressSliderAction:(UISlider *)sender
{
    
    [self.mp seekToTimeWithValue:sender.value];
}

-(void)endOfPlayAction
{
    [self nextSongAction];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lyricArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell ==nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text =self.lyricArray[indexPath.row];
    cell.textLabel.textAlignment =NSTextAlignmentCenter;
    cell.backgroundColor =[UIColor magentaColor];
    cell.selectedTextColor =[UIColor redColor];
    UIView *view =[[UIView alloc]init];
    view.backgroundColor =[UIColor colorWithWhite:0 alpha:0];
    cell.selectedBackgroundView =view;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
