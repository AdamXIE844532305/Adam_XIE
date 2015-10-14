//
//  RegistViewController.m
//  MusicPlayer_D
//
//  Created by lanou3g on 15/10/11.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()<UITextFieldDelegate>

@property(nonatomic ,strong)RegistView *rv;

@end

@implementation RegistViewController

-(void)loadView
{
    self.rv =[[RegistView alloc]init];
    self.rv.backgroundColor =[UIColor whiteColor];
    self.view =self.rv;
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemAction:)];
    
}

-(void)rightBarButtonItemAction:(UIButton *)sender
{
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout =UIRectEdgeNone;
    }
    self.rv.userNameTextfield.delegate =self;
    self.rv.passWordTextField.delegate =self;
    self.rv.passWordTextField2.delegate =self;
    self.rv.emailTextField.delegate =self;
    self.rv.phoneTextField.delegate =self;
    
    
    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
