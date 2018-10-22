//
//  TJUserPortraitViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/10/9.
//  Copyright © 2018年 TJ. All rights reserved.
// 用户头像 （上传和预览）

#import "TJUserPortraitViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface TJUserPortraitViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic,weak) UIImageView *potraitImagV;

@end

@implementation TJUserPortraitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"个人头像";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"更多"] style:UIBarButtonItemStyleDone target:self action:@selector(rigthBtnClicked:)];
    
    
    
    __weak typeof(self) weakSelf = self;
    UIImageView *potraitImagV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user"]];
    potraitImagV.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:potraitImagV];
    self.potraitImagV = potraitImagV;
    [self.potraitImagV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.width.equalTo(weakSelf.view);
        make.height.equalTo(potraitImagV.width);
    }];
    
}

- (void)rigthBtnClicked:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"拍摄" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
        
        UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
        pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        pickerController.delegate = self;
        [self presentViewController:pickerController animated:YES completion:nil];
        
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
        pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        pickerController.delegate = self;
        [self presentViewController:pickerController animated:YES completion:nil];
        
    }];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action];
    [alert addAction:action1];
    [alert addAction:actionCancel];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    self.potraitImagV.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
