#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "GoogleMaps"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GMSServices provideAPIKey:@"AIzaSyCsXkNTVzgC5NrSyaBU3njhhPePL8ufgyc"];
    [GeneratedPluginRegistrant registerWithRegistry:self];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
  }

@end
