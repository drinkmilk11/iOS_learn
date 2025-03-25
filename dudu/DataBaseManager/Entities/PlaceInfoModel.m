//
//  PlaceInfoModel.m
//  dudu
//
//  Created by dd_luliluli on 2025/3/25.
//

#import "PlaceInfoModel.h"



@implementation PlaceInfoModel

- (nonnull instancetype)initWithPlaceId:(int64_t)placeId
                                  topic:(NSString *_Nullable)topic
                               bgImgUrl:(NSString *_Nullable)bgImgUrl
                                   name:(NSString *_Nullable)name {
    if (self = [super init]) {
        _placeId = placeId;
        _bgImgUrl = bgImgUrl;
        _name = name;
    }
    return self;
}

@end
