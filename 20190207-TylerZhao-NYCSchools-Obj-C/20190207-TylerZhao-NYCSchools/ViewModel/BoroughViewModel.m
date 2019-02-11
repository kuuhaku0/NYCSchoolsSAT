//
//  BoroughViewModel.m
//  20190207-TylerZhao-NYCSchools
//
//  Created by Tyler Zhao on 2/10/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

#import "BoroughViewModel.h"

@implementation BoroughModel

- (instancetype)initWithBoro:(NSString *)boroInitial
                    boroName:(NSString *)name {
    self = [super init];
    if (self) {
        _boroName = name;
        _initial = boroInitial;
    }
    return self;
}
@end

@implementation BoroughViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _rawModel = [NSArray arrayWithObjects:
                     [[BoroughModel alloc]initWithBoro:@"M" boroName:@"Manhattan"],
                     [[BoroughModel alloc]initWithBoro:@"Q" boroName:@"Queens"],
                     [[BoroughModel alloc]initWithBoro:@"K" boroName:@"Brooklyn"],
                     [[BoroughModel alloc]initWithBoro:@"X" boroName:@"Bronx"],
                     [[BoroughModel alloc]initWithBoro:@"R" boroName:@"Staten Island"], nil];
    }

    return self;
}

- (NSInteger)numberOfBoro {
    return self.rawModel.count;
}

- (BoroughModel *)boroForCell:(NSUInteger)index {
    return [self.rawModel objectAtIndex:index];
}

@end
