//
//  MusicListTableViewCell.h
//  MusicPlayer_D
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicInfoModel.h"

@interface MusicListTableViewCell : UITableViewCell

@property(nonatomic ,strong)UIImageView *backImageV;

@property(nonatomic ,strong)UIImageView *headImageV;
@property(nonatomic,strong)UILabel *songNameLabel;
@property(nonatomic ,strong)UILabel *AuthorLabel;

@property(nonatomic ,strong)MusicInfoModel *model;



@end
