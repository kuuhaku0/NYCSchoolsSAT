//
//  SchoolsViewController.h
//  20190207-TylerZhao-NYCSchools
//
//  Created by Tyler Zhao on 2/10/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SchoolsViewModel.h"
#import "SATScoreDetailsViewController.h"
#import "SATScoreDetailViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SchoolsViewController : UITableViewController
@property (nonatomic) SchoolsViewModel *viewModel;
@end

NS_ASSUME_NONNULL_END
