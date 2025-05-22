#import "../FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h"

%hook UINavigationController

- (void)viewDidLoad {
    %orig;
    self.interactivePopGestureRecognizer.enabled = YES;
    self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

%end
