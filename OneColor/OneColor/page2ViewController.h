//
//  page2ViewController.h
//  OneColor
//
//  Created by HEWEIPING on 16/1/30.
//  Copyright © 2016年 HEWEIPING. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <opencv2/opencv.hpp>
#import <opencv2/highgui/ios.h>


@interface page2ViewController : UIViewController
{
    cv::Mat cvImage;
}
@property (weak, nonatomic) UIImage *page2Image;

@property (weak, nonatomic) IBOutlet UIImageView *page2ImageView;

@end
