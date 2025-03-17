//
//  EOCSoundPlayer.m
//  dudu
//
//  Created by dd_luliluli on 2024/11/5.
//

#import "EOCSoundPlayer.h"
#import <AudioToolbox/AudioToolbox.h>

void completion(SystemSoundID ssID, void *clientData) {
    EOCSoundPlayer *player = (__bridge EOCSoundPlayer *)clientData;
    if ([player.delegate respondsToSelector:@selector(soundPlayerDidFinish:)]) {
        [player.delegate soundPlayerDidFinish:player];
    }
}

@implementation EOCSoundPlayer {
    SystemSoundID _systemSoundID;
}

- (id)initWithURL:(NSURL *)url {
    if ((self = [super init])) {
        _dd = 3;
        _dd = 5;
    }
//    self.dd = 55
    return self;
}

@end
