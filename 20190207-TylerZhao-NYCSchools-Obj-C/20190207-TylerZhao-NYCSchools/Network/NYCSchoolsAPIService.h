//
//  NYCSchoolsAPIService.h
//  20190207-TylerZhao-NYCSchools
//
//  Created by Tyler Zhao on 2/10/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NYCSchool.h"
#import "SchoolSat.h"

NS_ASSUME_NONNULL_BEGIN

@interface NYCSchoolsAPIService : NSObject

+ (NYCSchoolsAPIService *)singleton;

- (void) getSchoolForBoro:(NSString *)boroInitial completionHandler:(void (^)(NSMutableArray<NYCSchool *>* _Nullable data, NSError* _Nullable error))completionHandler;
- (void) getSATInfoForSchool:(NSString *)schoolDBN completionHandler:(nonnull void (^)(SchoolSAT * _Nullable data, NSError * _Nullable error))completionHandler;
@end

NS_ASSUME_NONNULL_END
