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
    
    UIImage *image_tmp = self.page2ImageView.image;
    UIImageToMat(image_tmp, cvImage);
    
    if(!cvImage.empty())
    {
        cv::Mat gray;
        // 将图像转换为灰度显示
        cv::cvtColor(cvImage,gray,CV_RGB2GRAY);
        // 应用高斯滤波器去除小的边缘
        cv::GaussianBlur(gray, gray, cv::Size(5,5), 1.2,1.2);
        // 计算与画布边缘
        cv::Mat edges;
        cv::Canny(gray, edges, 0, 50);
        // 使用白色填充
        cvImage.setTo(cv::Scalar::all(225));
        // 修改边缘颜色
        cvImage.setTo(cv::Scalar(0,128,255,255),edges);
        // 将Mat转换为Xcode的UIImageView显示
        self.page2ImageView.image = MatToUIImage(cvImage);
    }
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
   //这个地方应该设计弹窗出来选择分享还是保存到本地相册，或者加一个选项同时都做
}

- (IBAction)reselectBtnAction:(id)sender
{
    //类似第一个页面选择图片
}

//触屏触发事件函数，屏幕坐标可以在这里获取
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];

}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];

}

@end
