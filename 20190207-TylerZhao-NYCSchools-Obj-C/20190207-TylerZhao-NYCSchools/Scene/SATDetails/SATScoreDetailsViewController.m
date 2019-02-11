//
//  SATScoreDetailsViewController.m
//  20190207-TylerZhao-NYCSchools
//
//  Created by Tyler Zhao on 2/10/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

#import "SATScoreDetailsViewController.h"

@interface SATScoreDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *schoolNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *readingScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *mathScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *writingScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalAverageScoreLabel;

@end

@implementation SATScoreDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
}

- (void)bindViewModel {
    __weak typeof(self) weakSelf = self;
    [self.viewModel setDataReceived:^{
        weakSelf.schoolNameLabel.text = weakSelf.viewModel.schoolNameLabelText;
        weakSelf.readingScoreLabel.text = weakSelf.viewModel.readingScoreText;
        weakSelf.mathScoreLabel.text = weakSelf.viewModel.mathScoreText;
        weakSelf.totalAverageScoreLabel.text = weakSelf.viewModel.totalAverageScoreText;
        weakSelf.writingScoreLabel.text = weakSelf.viewModel.writingScoreText;
    }];
    
    [self.viewModel setFailedWithError:^{
        // Display UI to notify user of error
        // Error handling
    }];
}

@end
