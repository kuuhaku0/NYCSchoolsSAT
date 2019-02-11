//
//  SchoolsViewModel.h
//  20190207-TylerZhao-NYCSchools
//
//  Created by Tyler Zhao on 2/10/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NYCSchool.h"
#import "NYCSchoolsAPIService.h"

NS_ASSUME_NONNULL_BEGIN

@interface SchoolsViewModel : NSObject

@property (nonatomic) NSMutableArray<NYCSchool *> *rawModel;
@property (nonatomic, readonly) NSString *schoolName;
@property (nonatomic) void (^dataReceived)(void);
@property (nonatomic) void (^getDataFailed)(void);

- (instancetype) initWithBoroInitial:(NSString *)initial;
- (NYCSchool* _Nullable) schoolForRowAt:(NSUInteger)row;
- (NSInteger) numberOfSchools;

@end

NS_ASSUME_NONNULL_END
