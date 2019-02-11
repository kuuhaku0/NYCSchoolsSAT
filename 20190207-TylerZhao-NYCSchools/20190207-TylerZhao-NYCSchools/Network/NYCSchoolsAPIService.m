//
//  NYCSchoolsAPIService.m
//  20190207-TylerZhao-NYCSchools
//
//  Created by Tyler Zhao on 2/10/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

#import "NYCSchoolsAPIService.h"

@implementation NYCSchoolsAPIService

+ (NYCSchoolsAPIService *)singleton {
    static NYCSchoolsAPIService *shared = nil;

    if(shared == nil) {
        shared = [[NYCSchoolsAPIService alloc] init];
    }
    return shared;
}

- (void)getSchoolForBoro:(NSString *)boroInitials completionHandler:(nonnull void (^)(NSMutableArray<NYCSchool *> * _Nullable data, NSError * _Nullable error))completionHandler {
    NSString *urlString = [NSString stringWithFormat:@"https://data.cityofnewyork.us/resource/97mf-9njv.json?boro=%@", boroInitials];
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *err;
        NSArray *schoolsJSON = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
        dispatch_async(dispatch_get_main_queue(), ^{
            if(err) {
                NSLog(@"JSON Decoding Error: %@", err);
                completionHandler(nil, err);
            } else {
                NSMutableArray<NYCSchool *> *schoolsData = NSMutableArray.new;
                for(NSDictionary *schoolsDict in schoolsJSON) {
                    NSString *schoolName = schoolsDict[@"school_name"];
                    NSString *dbn = schoolsDict[@"dbn"];
                    NSString *city = schoolsDict[@"city"];
                    NSString *boro = schoolsDict[@"boro"];
                    
                    NYCSchool *schoolData = NYCSchool.new;
                    schoolData.schoolName = schoolName;
                    schoolData.dbn = dbn;
                    schoolData.city = city;
                    schoolData.boro = boro;
                    
                    [schoolsData addObject:schoolData];
                }
                // sort the array alphabetically by school name
                [schoolsData sortUsingComparator:^(NYCSchool *firstObject, NYCSchool *secondObject) {
                    return [firstObject.schoolName caseInsensitiveCompare:secondObject.schoolName];
                }];
                completionHandler(schoolsData, nil);
            }
        });
    }] resume];
}

- (void)getSATInfoForSchool:(NSString *)schoolDBN completionHandler:(void (^)(SchoolSAT * _Nullable, NSError * _Nullable))completionHandler {
    NSString *urlString = [NSString stringWithFormat:@"https://data.cityofnewyork.us/resource/734v-jeq5.json?dbn=%@", schoolDBN];
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *err;
        NSArray *schoolSATJSON = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
        dispatch_async(dispatch_get_main_queue(), ^{
            if(err) {
                NSLog(@"JSON Decoding Error: %@", err);
                completionHandler(nil, err);
            } else {
                SchoolSAT *schoolSATData = SchoolSAT.new;
                for(NSDictionary *schoolSAT in schoolSATJSON) {
                    NSString *dbn = schoolSAT[@"dbn"];
                    NSString *readingScore = schoolSAT[@"sat_critical_reading_avg_score"];
                    NSString *mathScore = schoolSAT[@"sat_math_avg_score"];
                    NSString *writingScore = schoolSAT[@"sat_writing_avg_score"];
                    
                    schoolSATData.dbn = dbn;
                    schoolSATData.averageMathScore = mathScore;
                    schoolSATData.averageReadingScore = readingScore;
                    schoolSATData.averageWritingScore = writingScore;
                }
                completionHandler(schoolSATData, nil);
            }
        });
    }] resume];
}

@end
