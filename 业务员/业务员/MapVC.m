//
//  MapVC.m
//  业务员
//
//  Created by 董 尚先 on 15/4/5.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "MapVC.h"
#import <MapKit/MapKit.h>

@interface MapVC ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.mapType = MKMapTypeStandard;
    
    self.mapView.userTrackingMode = MKUserTrackingModeNone;
    
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
