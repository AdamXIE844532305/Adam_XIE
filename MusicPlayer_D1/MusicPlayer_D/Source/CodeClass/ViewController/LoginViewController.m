//
//  LoginViewController.m
//  MusicPlayer_D
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property(nonatomic ,strong)LoginView *loginV;

@end

@implementation LoginViewController

-(void)loadView
{
    self.loginV =[[LoginView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.loginV.backgroundColor =[UIColor magentaColor];
    self.view =self.loginV;
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout =UIRectEdgeNone ;
    }
     self.navigationItem.title =@"呢想";
    self.loginV.userNameTextField.delegate =self;
    self.loginV.passWordtextField.delegate =self;
    
    [self.loginV.loginButton addTarget:self action:@selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.loginV.registButton addTarget:self action:@selector(registButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)loginButtonAction:(UIButton *)sender
{
        
    MusicListTableViewController *musicListTVC =[[MusicListTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:musicListTVC animated:YES];
}

-(void)registButtonAction:(UIButton *)sender
{
    RegistViewController *registVC =[[RegistViewController alloc]init];
    
    [self.navigationController pushViewController:registVC animated:YES];
    
    
    
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
