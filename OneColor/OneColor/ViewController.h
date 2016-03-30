//
//  ViewController.h
//  OneColor
//
//  Created by HEWEIPING on 16/1/22.
//  Copyright © 2016年 HEWEIPING. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImage *image;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView_loadImage;

@property (weak, nonatomic) IBOutlet UISlider *slider_grading;

@property (weak, nonatomic) IBOutlet UILabel *grading_tip;

@end

