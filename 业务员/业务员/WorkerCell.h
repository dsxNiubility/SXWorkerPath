//
//  WorkerCell.h
//  业务员
//
//  Created by 董 尚先 on 15/4/5.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkPeople.h"

@interface WorkerCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *workerIdLbl;
@property(nonatomic,strong) WorkPeople *people;

@end
