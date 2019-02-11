//
//  BoroughViewModel.h
//  20190207-TylerZhao-NYCSchools
//
//  Created by Tyler Zhao on 2/10/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BoroughModel : NSObject
@property (nonatomic, readonly, copy) NSString *initial;
@property (nonatomic, readonly, copy) NSString *boroName;
@end

@interface BoroughViewModel : NSObject
@property (nonatomic) NSArray *rawModel;

- (NSInteger) numberOfBoro;
- (BoroughModel* _Nullable) boroForCell:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
