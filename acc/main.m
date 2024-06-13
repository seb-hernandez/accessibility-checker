//#import <Foundation/Foundation.h>
//#import <AppKit/AppKit.h>
//
//BOOL checkAccessibilityPermissions(void) {
////    NSDictionary *options = @{(__bridge id)kAXTrustedCheckOptionPrompt: @NO};
////    return AXIsProcessTrustedWithOptions((__bridge CFDictionaryRef)options);
//    return AXIsProcessTrusted();
//}
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // Replace with your application's bundle identifier
//        NSString *bundleIdentifier = @"com.test.acc";
//
//        BOOL accessibilityEnabled = NO;
//
//        // Loop to check accessibility permissions every 5 seconds
//        while (!accessibilityEnabled) {
//            accessibilityEnabled = checkAccessibilityPermissions();
//
//            if (accessibilityEnabled) {
//                NSLog(@"Accessibility permissions granted for %@", bundleIdentifier);
//            } else {
//                NSLog(@"Waiting for accessibility permissions for %@", bundleIdentifier);
//                sleep(1); // Wait for 5 seconds before checking again
//            }
//        }
//    }
//    return 0;
//}

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Replace with your application's bundle identifier
        NSString *bundleIdentifier = @"com.test.acc";

        // Request accessibility permissions
        NSDictionary *options = @{(__bridge id)kAXTrustedCheckOptionPrompt: @YES};
        BOOL accessibilityEnabled = AXIsProcessTrustedWithOptions((__bridge CFDictionaryRef)options);

        if (accessibilityEnabled) {
            NSLog(@"Accessibility permissions granted for %@", bundleIdentifier);
        } else {
            NSLog(@"Failed to grant accessibility permissions for %@", bundleIdentifier);
        }
    }
    return 0;
}

