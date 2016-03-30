//
//  ViewController.m
//  OneColor
//
//  Created by HEWEIPING on 16/1/22.
//  Copyright © 2016年 HEWEIPING. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //初始化粒度滑动条最大最小值
    self.slider_grading.maximumValue = 100;
    self.slider_grading.minimumValue = 0;
    self.slider_grading.value = 0;
    
    //初始化粒度值提示信息
    self.grading_tip.text = [NSString stringWithFormat:@"色彩保留等级： %d", (int)self.slider_grading.value];
}


//添加图片按钮：Button_addImage
- (IBAction)addImage:(id)sender
{
    //创建上拉列表alertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    
    //创建列表子项：取消，监听事件nil
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    //创建列表子项：从相册选择，监听事件为打开相册
    UIAlertAction *selectFromImageLibraryAction = [UIAlertAction actionWithTitle:@"从机册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
        {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.delegate = self;
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
    }];
    
    //创建列表子项：拍照，监听事件为打开相机
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePicker.delegate = self;
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:selectFromImageLibraryAction];
    [alertController addAction:photoAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

//当选择一张图片后进入这里, 实现代理imagePickerController
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (image == nil) {
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    self.imageView_loadImage.image = image;
    
    
//    //创建第二个viewcontroller
//    page2ViewController *page2VC = [[page2ViewController alloc] initWithNibName:@"page2ViewController" bundle:[NSBundle mainBundle]];
//    
//    //把点击的图片传给下一页
//    page2VC.page2Image = image;
//    
    [self dismissViewControllerAnimated:YES completion:nil];
//
//    //跳转界面
//    [self presentViewController:page2VC animated:YES completion:nil];
}

//取消按钮响应
- (IBAction)restore:(id)sender {
    
}

//后退按钮响应
- (IBAction)undo:(id)sender {
    
}

//确定按钮响应
- (IBAction)confirm:(id)sender {
    
}

//重选按钮响应
/* 重选按钮直接共用 Button_addImage 响应函数 */

//增加粒度
- (IBAction)add_grading:(id)sender {
    if (self.slider_grading.value < self.slider_grading.maximumValue) 
    {
        NSLog(@"Adddd");
        self.slider_grading.value ++;
    }
    
    self.grading_tip.text = [NSString stringWithFormat:@"色彩保留等级： %d", (int)self.slider_grading.value];
}

//减小粒度
- (IBAction)sub_grading:(id)sender {
    if (self.slider_grading.value > self.slider_grading.minimumValue)
    {
        self.slider_grading.value --;
    }
    
    self.grading_tip.text = [NSString stringWithFormat:@"色彩保留等级： %d", (int)self.slider_grading.value];
}
- (IBAction)adjust_grading:(id)sender {
    self.grading_tip.text = [NSString stringWithFormat:@"色彩保留等级： %d", (int)self.slider_grading.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
