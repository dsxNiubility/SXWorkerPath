//
//  WokerLoginVC.m
//  业务员
//
//  Created by 董 尚先 on 15/4/5.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "WokerLoginVC.h"
#import "AppDelegate.h"
#import "WorkPeople.h"

@interface WokerLoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *workerIdTxt;
@property (weak, nonatomic) IBOutlet UITextField *workPwdTxt;
@property (weak, nonatomic) IBOutlet UISwitch *remenber;

@property(nonatomic,strong) AppDelegate *appDelegate;
@end

@implementation WokerLoginVC


- (AppDelegate *)appDelegate
{
    if (_appDelegate == nil) {
        _appDelegate = [UIApplication sharedApplication].delegate;
    }
    return _appDelegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)LoginClick:(id)sender {
    
    [self LoginWithId:self.workerIdTxt.text];
    
}

- (void)LoginWithId:(NSString *)Id
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"WorkPeople"];
    
    request.predicate= [NSPredicate predicateWithFormat:@"workId = %@",Id];
    
    NSArray *result = [self.appDelegate.managedObjectContext executeFetchRequest:request error:nil];
    
    for (WorkPeople *people in result) {
        //        NSLog(@"%@,%@",people.workId,self.workerIdLbl.text);
        if ([people.password isEqualToString: self.workPwdTxt.text]) {
            
            [self performSegueWithIdentifier:@"WorkerLogin" sender:nil];
        }else{
            NSLog(@"用户名或密码错误");
        }
    }
}
- (IBAction)restartClick:(id)sender {
    self.workerIdTxt.text = nil;
    self.workPwdTxt.text = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.workerIdTxt.text = nil;
    self.workPwdTxt.text = nil;
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
