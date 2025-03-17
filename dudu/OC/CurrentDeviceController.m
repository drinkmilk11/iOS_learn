//
//  CurrentDeviceController.m
//  dudu
//
//  Created by dd_luliluli on 2025/2/10.
//

#import "CurrentDeviceController.h"

@implementation CurrentDeviceController

- (NSString *)deviceName
{
    if(!_deviceName) {
        _deviceName = [[UIDevice currentDevice] name];
    }
    return _deviceName;
}

- (NSString *)deviceModel {
    if (!_deviceModel) {
        _deviceModel = [[UIDevice currentDevice] model];
    }
    return _deviceModel;
}

- (void)updateDeviceInfo {
    self.deviceName = [[UIDevice currentDevice] name];
    self.deviceModel = [[UIDevice currentDevice] model];
//    [UIDevice currentDevice].batteryLevel
    // Additional logic for updating UI or sending notifications, etc.
    [self refreshUI];
}

- (void)refreshUI {
    // Implement UI update logic here, like refreshing labels or views
    NSLog(@"Device Name: %@", self.deviceName);
    NSLog(@"Device Model: %@", self.deviceModel);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Custom initialization or setup
    [self updateDeviceInfo];
}

@end
