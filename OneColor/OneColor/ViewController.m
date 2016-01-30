//
//  ViewController.m
//  OneColor
//
//  Created by HEWEIPING on 16/1/22.
//  Copyright © 2016年 HEWEIPING. All rights reserved.
//

#import "ViewController.h"
#import "page2ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

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
-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info{
    image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (image == nil) {
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    
    //创建第二个viewcontroller
    page2ViewController *page2VC = [[page2ViewController alloc] initWithNibName:@"page2ViewController" bundle:[NSBundle mainBundle]];
    
    //把点击的图片传给下一页
    page2VC.page2Image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //跳转界面
    [self presentViewController:page2VC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
