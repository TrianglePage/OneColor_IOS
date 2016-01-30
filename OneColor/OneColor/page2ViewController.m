//
//  page2ViewController.m
//  OneColor
//
//  Created by HEWEIPING on 16/1/30.
//  Copyright © 2016年 HEWEIPING. All rights reserved.
//

#import "page2ViewController.h"

@interface page2ViewController ()

@end

@implementation page2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //添加页面背影图片
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"page3.png"]];
    
    //把第一页面传过来的图片放到imageview显示
    self.page2ImageView.image = self.page2Image;
    
    
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

- (IBAction)restoreBtnAction:(id)sender
{
    self.page2ImageView.image = self.page2Image;
}

- (IBAction)saveBtnAction:(id)sender
{
    
}

- (IBAction)reselectBtnAction:(id)sender
{
    
}



@end
