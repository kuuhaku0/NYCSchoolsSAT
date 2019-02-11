//
//  SATScoreDetailViewModel.m
//  20190207-TylerZhao-NYCSchools
//
//  Created by Tyler Zhao on 2/10/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

#import "SATScoreDetailViewModel.h"

@implementation SchoolDetailModel
@end

@implementation SATScoreDetailViewModel

-(instancetype)initWithDetailModel:(SchoolDetailModel*)detailModel {
    self = [super init];
    if(self) {
        self.rawModel = detailModel;
        self.schoolNameLabelText = detailModel.schoolGeneralInfo.schoolName;
        [NYCSchoolsAPIService.singleton getSATInfoForSchool:detailModel.schoolGeneralInfo.dbn completionHandler:^(SchoolSAT * _Nullable data, NSError * _Nullable error) {
            if (error) {
                self.failedWithError();
                return;
            }
            self.rawModel.schoolSATInfo = data;
            self.mathScoreText = data.averageMathScore;
            self.readingScoreText = data.averageReadingScore;
            self.writingScoreText = data.averageWritingScore;
            
            NSInteger totalAverage = [data.averageWritingScore integerValue] + [data.averageReadingScore integerValue] + [data.averageMathScore integerValue];
            self.totalAverageScoreText = [NSString stringWithFormat: @"%ld", (long)totalAverage];
            self.dataReceived();
        }];
    }
    return self;
}

@end
