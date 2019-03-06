//
//  ViewController.m
//  WeekSelection
//
//  Created by 吴志刚 on 2019/3/6.
//  Copyright © 2019 HJ. All rights reserved.
//

#import "ViewController.h"
#import "WeekSelection_ViewController.h"

#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ( [UIScreen mainScreen].bounds.size.height)

@interface ViewController () <WeekSelectedDelegate>
{
    UILabel *weekLab;
    NSMutableArray *weekContentArray;
    NSMutableArray *selectArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"WeekSelection";
    
    self.view.backgroundColor = UIColor.lightGrayColor;
    
    weekLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, WIDTH, 44)];
    weekLab.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:weekLab];
    
    UIButton *pushbut = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH / 2 - 30, 200, 60, 35)];
    [pushbut.layer setCornerRadius:5];
    pushbut.layer.masksToBounds = YES;
    pushbut.backgroundColor = UIColor.redColor;
    [pushbut setTitle:@"跳转" forState:UIControlStateNormal];
    [pushbut addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushbut];
}

- (void)push {
    WeekSelection_ViewController *week = [[WeekSelection_ViewController alloc] init];
    week.delegate = self;
    if (selectArray.count > 0) {
        week.selectedWeekArray = selectArray;
    }
    [self.navigationController pushViewController:week animated:true];
}

- (void)selectedWeek:(NSMutableArray *)mutableArray {
    weekContentArray = [NSMutableArray array];
    selectArray = [NSMutableArray array];
    selectArray = mutableArray;
    for (int i = 0; i < 7; i++) {
        if ([mutableArray containsObject:[NSString stringWithFormat:@"%d",i]]) {
            if (i == 0) {
                [weekContentArray addObject:@"周日"];
            } else if (i == 1) {
                [weekContentArray addObject:@"周一"];
            } else if (i == 2) {
                [weekContentArray addObject:@"周二"];
            } else if (i == 3) {
                [weekContentArray addObject:@"周三"];
            } else if (i == 4) {
                [weekContentArray addObject:@"周四"];
            } else if (i == 5) {
                [weekContentArray addObject:@"周五"];
            } else if (i == 6) {
                [weekContentArray addObject:@"周六"];
            }
        }
    }
    
    if (weekContentArray.count == 7) {
        weekLab.text = @"每天";
    } else {
        weekLab.text = [weekContentArray componentsJoinedByString:@","];
    }
}


@end
