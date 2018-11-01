//
//  TJOrderDetailedViewController.m
//  ShareAunt
//
//  Created by 周鑫 on 2018/9/26.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJOrderDetailedViewController.h"
#import "TJOrderArriveView.h"

#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface TJOrderDetailedViewController ()
@property (nonatomic,weak) TJOrderArriveView *arriveView;
@end

@implementation TJOrderDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}


- (void)setupUI {
    
    self.title = @"订单详情";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    
    [AMapServices sharedServices].enableHTTPS = YES;
    MAMapView *mapView = [[MAMapView alloc]initWithFrame:self.view.frame];
    mapView.zoomLevel = 17;
    mapView.delegate = self;
    [self.view addSubview:mapView];
   
    mapView.showsUserLocation = YES;
    mapView.userTrackingMode = MAUserTrackingModeFollow;
    
//    MAUserLocationRepresentation *r = [[MAUserLocationRepresentation alloc] init];
//    [mapView updateUserLocationRepresentation:r];
    
    
    
    
    
//    TJOrderArriveView *arriveView = [[TJOrderArriveView alloc]init];
//    [self.view addSubview:arriveView];
//    self.arriveView = arriveView;
//    [self.arriveView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(weakSelf.view);
//        make.left.right.equalTo(weakSelf.view);
//        make.height.equalTo(arriveView.width).multipliedBy(SCALE_H(375, 349));
//    }];
    
    
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(39.989631, 116.481018);
    pointAnnotation.title = @"方恒国际";
    pointAnnotation.subtitle = @"阜通东大街6号";
    
    [mapView addAnnotation:pointAnnotation];
    
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
        annotationView.pinColor = MAPinAnnotationColorPurple;
        return annotationView;
    }
    return nil;
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
