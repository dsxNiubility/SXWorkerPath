//
//  ManagerLoginVC.m
//  业务员
//
//  Created by 董 尚先 on 15/4/5.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "ManagerLoginVC.h"

@interface ManagerLoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *managerAccountlbl;
@property (weak, nonatomic) IBOutlet UITextField *managerPwdlbl;

@end

@implementation ManagerLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)managerLogin:(id)sender {
    if ([self.managerAccountlbl.text  isEqual: @"admin"] && [self.managerPwdlbl.text  isEqual: @"admin"] ) {
        [self performSegueWithIdentifier:@"ManagerLogin" sender:nil];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
