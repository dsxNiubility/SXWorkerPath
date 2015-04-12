//
//  WorkPeople.h
//  业务员
//
//  Created by 董 尚先 on 15/4/5.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WorkDetail;

@interface WorkPeople : NSManagedObject

@property (nonatomic, retain) NSString * workId;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) WorkDetail *theDetails;

@end
