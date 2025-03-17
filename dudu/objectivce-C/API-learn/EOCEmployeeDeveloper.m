//
//  EOCEmployeeDeveloper.m
//  dudu
//
//  Created by dd_luliluli on 2024/11/7.
//

#import "EOCEmployeeDeveloper.h"

@implementation EOCEmployeeDeveloper

typedef struct objc_selector *SEL;
typedef struct objc_object *id;

//struct objc_class {
//    Class isa;
//    Class superclass;
//    cache_t cache;
//    calss_data_bits_t bits;
//}

//- (void)doADaysWork {
//    [self ]
//}

- (void)sayHello:(NSObject *)object {
    SEL s = @selector(dd);
    SEL sr = NSSelectorFromString(@"dd");
}


- (void)dd {
    
}

@end
