//
//  WeekSelection_ViewController.h
//  WeekSelection
//
//  Created by 吴志刚 on 2019/3/6.
//  Copyright © 2019 HJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WeekSelectedDelegate <NSObject>

- (void)selectedWeek:(NSMutableArray *)mutableArray;

@end

@interface WeekSelection_ViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *selectedWeekArray; // 选中的星期

@property (nonatomic, weak) id<WeekSelectedDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
