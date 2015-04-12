//
//  ManagerWorkingVC.m
//  业务员
//
//  Created by 董 尚先 on 15/4/5.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "ManagerWorkingVC.h"
#import "AppDelegate.h"
#import "WorkPeople.h"
#import "WorkerCell.h"

@interface ManagerWorkingVC ()<NSFetchedResultsControllerDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *idTxt;
@property (weak, nonatomic) IBOutlet UITextField *pwdTxt;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property(nonatomic,strong) AppDelegate *appDelegate;

@property(nonatomic,strong)NSFetchedResultsController *fetchedResultController;

@end

@implementation ManagerWorkingVC

- (AppDelegate *)appDelegate
{
    if (_appDelegate == nil) {
        _appDelegate = [UIApplication sharedApplication].delegate;
    }
    return _appDelegate;
}

- (NSFetchedResultsController *)fetchedResultController
{
    if (_fetchedResultController == nil) {
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"WorkPeople"];
        
        NSSortDescriptor *sortds = [NSSortDescriptor sortDescriptorWithKey:@"workId" ascending:YES];
        
        request.sortDescriptors = @[sortds];
        
        _fetchedResultController = [[NSFetchedResultsController alloc]initWithFetchRequest:request managedObjectContext:self.appDelegate.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
        
        _fetchedResultController.delegate = self;
    }
    return _fetchedResultController;
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    NSLog(@"改变");
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.fetchedResultController performFetch:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)InsertWorker:(id)sender {
    [self insertObjectWithId:self.idTxt.text andPwd:self.pwdTxt.text];
    self.idTxt.text = nil;
    self.pwdTxt.text = nil;
}

- (void)insertObjectWithId:(NSString *)Id andPwd:(NSString *)pwd
{
    WorkPeople *workPeople = [NSEntityDescription insertNewObjectForEntityForName:@"WorkPeople" inManagedObjectContext:self.appDelegate.managedObjectContext];
    
    workPeople.workId = Id;
    workPeople.password = pwd;
    
    [self.appDelegate saveContext];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return self.fetchedResultController.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WorkPeople *people = self.fetchedResultController.fetchedObjects[indexPath.row];
    
    WorkerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[WorkerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.people = people;
    return cell;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
