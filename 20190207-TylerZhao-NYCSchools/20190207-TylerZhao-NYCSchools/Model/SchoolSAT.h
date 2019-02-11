//
//  SchoolSAT.h
//  20190207-TylerZhao-NYCSchools
//
//  Created by Tyler Zhao on 2/10/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SchoolSAT : NSObject
@property (nonatomic) NSString *dbn;
@property (nonatomic) NSString *numberOfTestTakers;
@property (nonatomic) NSString *averageReadingScore;
@property (nonatomic) NSString *averageMathScore;
@property (nonatomic) NSString *averageWritingScore;
@end

NS_ASSUME_NONNULL_END
