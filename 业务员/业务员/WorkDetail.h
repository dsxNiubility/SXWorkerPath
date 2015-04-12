//
//  WorkDetail.h
//  业务员
//
//  Created by 董 尚先 on 15/4/5.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WorkPeople;

@interface WorkDetail : NSManagedObject

@property (nonatomic, retain) NSNumber * workDate;
@property (nonatomic, retain) NSNumber * workSourceTime;
@property (nonatomic, retain) NSNumber * workEndTime;
@property (nonatomic, retain) WorkPeople *thePeople;

@end
