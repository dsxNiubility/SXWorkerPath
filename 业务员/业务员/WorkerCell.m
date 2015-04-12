//
//  WorkerCell.m
//  业务员
//
//  Created by 董 尚先 on 15/4/5.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "WorkerCell.h"
#import "AppDelegate.h"

@interface WorkerCell ()
@property(nonatomic,strong) AppDelegate *appDelegate;

@end

@implementation WorkerCell

- (AppDelegate *)appDelegate
{
    if (_appDelegate == nil) {
        _appDelegate = [UIApplication sharedApplication].delegate;
    }
    return _appDelegate;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)alert:(id)sender {
}
- (IBAction)delete:(id)sender {
    [self removeObjectsWithWorkId:self.people.workId];
}
- (IBAction)query:(id)sender {
}

- (void)setPeople:(WorkPeople *)people
{
    self.workerIdLbl.text = people.workId;
}

- (void)removeObjectsWithWorkId:(NSString *)workId
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"WorkPeople"];
    
    request.predicate= [NSPredicate predicateWithFormat:workId];
    
    NSArray *result = [self.appDelegate.managedObjectContext executeFetchRequest:request error:nil];
    
    for (WorkPeople *people in result) {
//        NSLog(@"%@,%@",people.workId,self.workerIdLbl.text);
        if ([people.workId isEqualToString: self.workerIdLbl.text]) {
        
            
            [self.appDelegate.managedObjectContext deleteObject:people];
        }
    }
    
    if ([self.appDelegate.managedObjectContext save:nil]) {
        
        NSLog(@"删除成功");
        
    } else {
        
        NSLog(@"删除失败");
        
    }
}
@end
