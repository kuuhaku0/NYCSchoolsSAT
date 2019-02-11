//
//  SATScoreDetailViewModel.h
//  20190207-TylerZhao-NYCSchools
//
//  Created by Tyler Zhao on 2/10/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NYCSchoolsAPIService.h"
#import "NYCSchool.h"
#import "SchoolSAT.h"

NS_ASSUME_NONNULL_BEGIN

@interface SchoolDetailModel : NSObject
@property (nonatomic) NYCSchool *schoolGeneralInfo;
@property (nonatomic) SchoolSAT *schoolSATInfo;
@end

@interface SATScoreDetailViewModel : NSObject
@property (nonatomic) SchoolDetailModel *rawModel;

// Label texts
@property (nonatomic) NSString *numberOfTestTakersLabelText;
@property (nonatomic) NSString *schoolNameLabelText;
@property (nonatomic) NSString *mathScoreText;
@property (nonatomic) NSString *readingScoreText;
@property (nonatomic) NSString *writingScoreText;
@property (nonatomic) NSString *totalAverageScoreText;

@property (nonatomic) void (^dataReceived)(void);
@property (nonatomic) void (^failedWithError)(void);

- (instancetype)initWithDetailModel:(SchoolDetailModel*)detailModel;
@end

NS_ASSUME_NONNULL_END
