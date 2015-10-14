//
//  LoginView.m
//  MusicPlayer_D
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView
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
    
    self.backImageV =[[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.backImageV.image =[UIImage imageNamed:@"backImage1"];
    [self addSubview:self.backImageV];
    
    self.backgroundColor =[UIColor whiteColor];
    self.userNameLabel =[[UILabel alloc]initWithFrame:CGRectMake(30, 200, 80, 50)];
    self.userNameLabel.text =@"用户";
    self.userNameLabel.textAlignment = NSTextAlignmentCenter;
    self.userNameLabel.font =[UIFont systemFontOfSize:25];
    //self.userNameLabel.backgroundColor =[UIColor blueColor];
    [self addSubview:self.userNameLabel];

    self.userNameTextField =[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.userNameLabel.frame)+20, CGRectGetMinY(self.userNameLabel.frame), 200, 50)];
    
    self.userNameTextField.placeholder =@"请输入用户名";
     self.userNameTextField.borderStyle =UITextBorderStyleRoundedRect;
    

    
    self.userNameTextField.backgroundColor=[UIColor yellowColor];
    [self addSubview:self.userNameTextField];
       self.passWordLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.userNameLabel.frame), CGRectGetMaxY(self.userNameLabel.frame) +30, CGRectGetWidth(self.userNameLabel.frame), CGRectGetHeight(self.userNameLabel.frame))];
    self.passWordLabel.text =@"密码";
    self.passWordLabel.font =[UIFont systemFontOfSize:25];
    self.passWordLabel.textAlignment =NSTextAlignmentCenter;
    [self addSubview:self.passWordLabel];
    
    self.passWordtextField =[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.userNameTextField.frame), CGRectGetMinY(self.passWordLabel.frame), CGRectGetWidth(self.userNameTextField.frame), CGRectGetHeight(self.userNameTextField.frame))];
    self.passWordtextField.placeholder =@"请输入密码";
    self.passWordtextField.secureTextEntry=YES;
    self.passWordtextField.borderStyle =UITextBorderStyleRoundedRect;
    self.passWordtextField.backgroundColor =[UIColor yellowColor];
     [self addSubview:self.passWordtextField];
    
    
    
    self.loginButton =[UIButton buttonWithType:UIButtonTypeSystem];
    self.loginButton.frame =CGRectMake(30,kScreenHeight -CGRectGetMaxY(self.passWordtextField.frame) +100 , 100, 50) ;
    [self.loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    //self.loginButton.backgroundColor =[UIColor blueColor];
    [self  addSubview:self.loginButton];
    
    self.registButton =[UIButton buttonWithType:UIButtonTypeSystem];
    self.registButton.frame =CGRectMake(CGRectGetMaxX(self.loginButton.frame)+100, CGRectGetMinY(self.loginButton.frame) , 100, 50);
    [self.registButton setTitle:@"注册" forState:UIControlStateNormal];
   // self.registButton.backgroundColor=[UIColor blueColor];
    [self addSubview:self.registButton];
    
    
    
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
