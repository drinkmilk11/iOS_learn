//
//  PlaceInfoModel.h
//  dudu
//
//  Created by dd_luliluli on 2025/3/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(int32_t, ConversationType) {
    ConversationTypePeer = 1,
    ConversationTypeGroup = 2,
};


@interface PlaceInfoModel : NSObject

@property (nonatomic, assign) int64_t placeId;
@property (nonatomic, copy, nullable) NSString *topic;

@property (nonatomic, copy, nullable) NSString *bgImgUrl;

@property (nonatomic, copy) NSString *name;


- (nonnull instancetype)initWithPlaceId:(int64_t)placeId
                                  topic:(NSString *_Nullable)topic
                               bgImgUrl:(NSString *_Nullable)bgImgUrl
                                   name:(NSString *_Nullable)name;

@end

NS_ASSUME_NONNULL_END
