//
//  EOCSoundPlayer.h
//  dudu
//
//  Created by dd_luliluli on 2024/11/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class EOCSoundPlayer;
@protocol EOCSoundPlayerDelegate <NSObject>
- (void)soundPlayerDidFinish: (EOCSoundPlayer*)player;
@end


@interface EOCSoundPlayer : NSObject
@property (nonatomic, weak) id <EOCSoundPlayerDelegate> delegate;
@property (nonatomic, readonly) Float64 dd;
- (id)initWithURL:(NSURL*)url;
- (void)playSound;
@end

NS_ASSUME_NONNULL_END
