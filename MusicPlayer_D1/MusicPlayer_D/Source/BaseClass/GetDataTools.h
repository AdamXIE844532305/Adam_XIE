//
//  GetDataTools.h
//  MusicPlayer_D
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^PassValue)(NSArray *array);

@interface GetDataTools : NSObject

+(instancetype)shareDetDataTools;

@property(nonatomic ,strong)MusicInfoModel *model;

-(void)getDataWithURL:(NSString *)Url PassValue:(PassValue)passValue;

-(MusicInfoModel *)getModelWithIndex:(NSInteger)index;
@property(nonatomic ,strong)NSMutableArray *dataArray;


@end
