//
//  EOCEmployee.h
//  dudu
//
//  Created by dd_luliluli on 2024/11/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, EOCEmployeeType) {
    EOCEmployeeTypeDeveloper,
    EOCEmployeeTypeDesigner,
    EOCEmployeeTypeFinance,
};


@interface EOCEmployee : NSObject
@property (copy) NSString *name;
@property NSUInteger salary;

+ (EOCEmployee *)employeeWithType: (EOCEmployeeType)type;

- (void)doADaysWork;

@end

NS_ASSUME_NONNULL_END
