//
//  SchoolsViewModel.m
//  20190207-TylerZhao-NYCSchools
//
//  Created by Tyler Zhao on 2/10/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

#import "SchoolsViewModel.h"

@interface SchoolsViewModel ()
@end

@implementation SchoolsViewModel

- (instancetype)initWithBoroInitial:(NSString *)initial {
    self = [super init];
    if (self) {
        [NYCSchoolsAPIService.singleton getSchoolForBoro:initial completionHandler:^(NSMutableArray<NYCSchool *> * _Nullable data, NSError * _Nullable error) {
            if(error) {
                self.getDataFailed();
                return;
            }
            self.rawModel = data;
            self.dataReceived();
        }];
    }
    return self;
}

- (NYCSchool *)schoolForRowAt:(NSUInteger)row {
    return [self.rawModel objectAtIndex:row];
}

- (NSInteger)numberOfSchools {
    return self.rawModel.count;
}

@end
