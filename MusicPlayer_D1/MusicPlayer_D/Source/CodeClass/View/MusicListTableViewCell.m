//
//  MusicListTableViewCell.m
//  MusicPlayer_D
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MusicListTableViewCell.h"

@implementation MusicListTableViewCell

-(UIImageView *)backImageV
{
    if (_backImageV ==nil) {
        _backImageV =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth , 100)];
        _backImageV.backgroundColor =[UIColor yellowColor];
        
        [self.contentView addSubview:_backImageV];
    }
    
    return _backImageV;
}


-(UIImageView *)headImageV
{
    if (_headImageV ==nil) {
        _headImageV =[[UIImageView alloc]initWithFrame:CGRectMake(5,5 , 80 , 90)];
       // _headImageV.backgroundColor =[UIColor blueColor];
        [self.backImageV addSubview:_headImageV];
    }
    
    
    return _headImageV;
}


-(UILabel *)songNameLabel
{
    if (_songNameLabel ==nil) {
        _songNameLabel =[[UILabel alloc]initWithFrame:CGRectMake( 100  , 5, kScreenWidth-100, 30)];
       // _songNameLabel.backgroundColor=[UIColor yellowColor];
        [self.backImageV addSubview:_songNameLabel];
    }
    
    return _songNameLabel;
    
}

-(UILabel *)AuthorLabel
{
    if (_AuthorLabel ==nil) {
        _AuthorLabel =[[UILabel alloc]initWithFrame:CGRectMake(100, 60, kScreenWidth -100, 30)];
       // _AuthorLabel.backgroundColor=[UIColor yellowColor];
        [self.backImageV addSubview:_AuthorLabel];
    }
    
    return _AuthorLabel;
}

-(void)setModel:(MusicInfoModel *)model
{
    self.songNameLabel.text =model.name;
    self.AuthorLabel.text =model.singer;
   [self.headImageV sd_setImageWithURL:[NSURL URLWithString:model.picUrl]];}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
