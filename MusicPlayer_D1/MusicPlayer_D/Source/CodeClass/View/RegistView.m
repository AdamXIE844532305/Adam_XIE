//
//  RegistView.m
//  MusicPlayer_D
//
//  Created by lanou3g on 15/10/11.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "RegistView.h"

@implementation RegistView

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
    //userLabel
    self.userNmaeLabel =[[UILabel alloc]initWithFrame:CGRectMake(20, 50, 100, 50)];
    self.userNmaeLabel.backgroundColor =[UIColor magentaColor];
    self.userNmaeLabel.text=@"用户名";
    self.userNmaeLabel.textAlignment =UITextAlignmentCenter;
    [self addSubview:self.userNmaeLabel];
    
    //userTextfield
    self.userNameTextfield =[[UITextField alloc]initWithFrame:CGRectMake(150, 50, kScreenWidth -200, 50)];
    self.userNameTextfield.placeholder= @"请输入用户名";
    self.userNameTextfield.backgroundColor =[UIColor magentaColor];
    self.userNameTextfield.borderStyle =UITextBorderStyleRoundedRect;
    [self addSubview:self.userNameTextfield];
    
    self.passWordLabel =[[UILabel alloc]initWithFrame:CGRectMake(20, 120, 100, 50)];
    self.passWordLabel.backgroundColor =[UIColor magentaColor];
    self.passWordLabel.text =@"密码";
    self.passWordLabel.textAlignment =UITextAlignmentCenter;
    [self addSubview:self.passWordLabel];
    
    self.passWordTextField =[[UITextField alloc]initWithFrame:CGRectMake(150 , 120, kScreenWidth -200, 50)];
    self.passWordTextField.placeholder =@"请输入密码";
    self.passWordTextField.backgroundColor =[UIColor magentaColor];
    self.passWordTextField.borderStyle =UITextBorderStyleRoundedRect;
    [self addSubview:self.passWordTextField];
    
    self.passWordLabel2 =[[UILabel alloc]initWithFrame:CGRectMake(20, 190, 100, 50)];
    self.passWordLabel2.text =@"确认密码";
    self.passWordLabel2.backgroundColor =[UIColor magentaColor];
    self.passWordLabel2.textAlignment =UITextAlignmentCenter;
    [self addSubview:self.passWordLabel2];
    
    self.passWordTextField2 =[[UITextField alloc]initWithFrame:CGRectMake(150, 190, kScreenWidth -200, 50)];
    self.passWordTextField2.placeholder =@"请再次输入密码";
    self.passWordTextField2.backgroundColor=[UIColor magentaColor];
    self.passWordTextField2.borderStyle =UITextBorderStyleRoundedRect;
    [self addSubview:self.passWordTextField2];
    
    self.emailLabel =[[UILabel alloc]initWithFrame:CGRectMake(20, 250, 100, 50)];
    self.emailLabel.backgroundColor=[UIColor magentaColor];
    self.emailLabel.text=@"邮箱";
    self.emailLabel.textAlignment =UITextAlignmentCenter;
    [self addSubview:self.emailLabel];
    
    
    self.emailTextField =[[UITextField alloc]initWithFrame:CGRectMake(150, 250, kScreenWidth -200, 50)];
    self.emailTextField.placeholder=@"请输入邮箱";
    self.emailTextField.backgroundColor =[UIColor magentaColor];
    self.emailTextField.borderStyle =UITextBorderStyleRoundedRect;
    [self addSubview:self.emailTextField];
    
    self.phoneLabel =[[UILabel alloc]initWithFrame:CGRectMake(20, 320, 100, 50)];
    self.phoneLabel.text =@"电话";
    self.phoneLabel.backgroundColor =[UIColor magentaColor];
    self.phoneLabel.textAlignment =UITextAlignmentCenter;
    [self addSubview:self.phoneLabel];
    
    self.phoneTextField =[[UITextField alloc]initWithFrame:CGRectMake(150, 320, kScreenWidth -200, 50)];
    self.phoneTextField.placeholder =@"电话";
    self.phoneTextField.backgroundColor =[UIColor magentaColor];
    self.phoneTextField.borderStyle =UITextBorderStyleRoundedRect;
    [self addSubview:self.phoneTextField];
    
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
