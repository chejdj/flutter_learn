#import <Flutter/Flutter.h>
#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    FlutterMethodChannel* methodChannel = [FlutterMethodChannel
                                              methodChannelWithName:@"nativeCall"
                                              binaryMessenger:controller.binaryMessenger];
    
    [methodChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        NSDictionary* params = (NSDictionary *)call.arguments;
        int value = [[NSString stringWithFormat:@"%@", params[@"count"]] intValue];
        if ([@"increment" isEqualToString:call.method]) {
            int newValue = value +1;
            result(@(newValue));
        }
        if([@"callFlutterMethod" isEqualToString:call.method]){
            [methodChannel invokeMethod:@"getFlutterContent" arguments:nil];
        }
      }];
    
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
