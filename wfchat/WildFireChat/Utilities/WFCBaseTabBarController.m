//
//  WFCBaseTabBarController.m
//  Wildfire Chat
//
//  Created by WF Chat on 2017/10/28.
//  Copyright © 2017年 WildFireChat. All rights reserved.
//

#import "WFCBaseTabBarController.h"
#import <WFChatClient/WFCChatClient.h>
#import <WFChatUIKit/WFChatUIKit.h>
#import "DiscoverViewController.h"
#import "WFCSettingTableViewController.h"
#import "WFCMeTableViewController.h"

#import "RoomViewController.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"

@interface WFCBaseTabBarController () {
    UIViewController *xvc1;
    UIViewController *xvc2;
    UIViewController *xvc3;
    
    UITabBarItem *xbar1;
    UITabBarItem *xbar2;
    UITabBarItem *xbar3;
    
    
}
@property (nonatomic, strong)UINavigationController *firstNav;
@property (nonatomic, strong)UINavigationController *settingNav;
@end

@implementation WFCBaseTabBarController
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage) name:kChangeLanguageNofiName object:nil];
    UIColor *normalColor = COLOR(0x383838);
    UIViewController *vc = [WFCUConversationTableViewController new];
    vc.title = LocalizedString(@"Message");
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    UITabBarItem *item = nav.tabBarItem;
    item.title = LocalizedString(@"Message");
    item.image = [[UIImage imageNamed:@"tabbar_chat"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.selectedImage = [[UIImage imageNamed:@"tabbar_chat_cover"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName : Tools.getThemeColor} forState:UIControlStateSelected];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName : normalColor} forState:UIControlStateNormal];
//    [self addChildViewController:nav];
    
    self.firstNav = nav;
    [nav.navigationItem setHidesBackButton:YES];
//    [self.navigationItem setHidesBackButton:YES];
//    [self.navigationController.navigationBar.backItem setHidesBackButton:YES];
//    [nav.navigationItem.backBarButtonItem setTitle:@""];
//    nav.navigationBar.translucent = NO;
    nav.navigationBar.topItem.title = @"";
    nav.extendedLayoutIncludesOpaqueBars = YES;
    UIViewController *vc2 = [WFCUContactListViewController new];
    vc2.title = LocalizedString(@"Contact");
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    UITabBarItem *item2 = nav2.tabBarItem;
    item2.title = LocalizedString(@"Contact");
    item2.image = [[UIImage imageNamed:@"tabbar_contacts"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.selectedImage = [[UIImage imageNamed:@"tabbar_contacts_cover"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item2 setTitleTextAttributes:@{NSForegroundColorAttributeName : Tools.getThemeColor} forState:UIControlStateSelected];
    [item2 setTitleTextAttributes:@{NSForegroundColorAttributeName : normalColor} forState:UIControlStateNormal];
    
    
    UIViewController *vc3 = [WFCSettingTableViewController new];
    vc3.title = LocalizedString(@"Settings");
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    UITabBarItem *item3 = nav3.tabBarItem;
    item3.title = LocalizedString(@"Settings");
    xvc3 = vc3;
    xbar3 = item3;
    item3.image = [[UIImage imageNamed:@"settingnormal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.selectedImage = [[UIImage imageNamed:@"settingselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [item3 setTitleTextAttributes:@{NSForegroundColorAttributeName : Tools.getThemeColor} forState:UIControlStateSelected];
    [item3 setTitleTextAttributes:@{NSForegroundColorAttributeName : normalColor} forState:UIControlStateNormal];
    [item3 setTitleTextAttributes:@{NSForegroundColorAttributeName : Tools.getThemeColor} forState:UIControlStateSelected];
    [item3 setTitleTextAttributes:@{NSForegroundColorAttributeName : normalColor} forState:UIControlStateNormal];
    
    
    UIViewController *vc4 = [WFCMeTableViewController new];
    vc4.title = LocalizedString(@"Me");
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    [[UINavigationBar appearance] setShadowImage:[UIImage imageNamed:@"bar_bottom_line.png"]];
    UITabBarItem *item4 = nav4.tabBarItem;
    xvc2 = vc4;
    xbar2 = item4;
    item4.title = LocalizedString(@"Me");;
    item4.image = [[UIImage imageNamed:@"gerennormal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item4.selectedImage = [[UIImage imageNamed:@"gerenselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item4 setTitleTextAttributes:@{NSForegroundColorAttributeName : Tools.getThemeColor} forState:UIControlStateSelected];
    
    [item4 setTitleTextAttributes:@{NSForegroundColorAttributeName : normalColor} forState:UIControlStateNormal];
    
    RoomViewController *rvc = [[RoomViewController alloc] init];
    rvc.title = LocalizedString(@"GentingClub");
    UINavigationController *n1 = [[UINavigationController alloc] initWithRootViewController:rvc];
    UITabBarItem *rvcitem = n1.tabBarItem;
    xvc1 = rvc;
    xbar1 = rvcitem;
    rvcitem.title = LocalizedString(@"GentingClub");
    rvcitem.image = [[UIImage imageNamed:@"clubnormal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    rvcitem.selectedImage = [[UIImage imageNamed:@"clubselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [rvcitem setTitleTextAttributes:@{NSForegroundColorAttributeName : Tools.getThemeColor} forState:UIControlStateSelected];
    [rvcitem setTitleTextAttributes:@{NSForegroundColorAttributeName : normalColor} forState:UIControlStateNormal];
    
    [self addChildViewController:n1];
    
    [self addChildViewController:nav4];
    [self addChildViewController:nav3];
    
    self.settingNav = nav4;
    nav4.extendedLayoutIncludesOpaqueBars = YES;
//    [self.tabBar setShadowImage:[UIImage imageNamed:@"navigation_bar_line"]];
//    self.tabBar.layer.borderWidth = 0.5;
//    self.tabBar.layer.borderColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1].CGColor;
    
    [self.tabBar setShadowImage:[UIImage new]];
//    [self.tabBar setBackgroundImage:[UIImage new]];
    [self.tabBar setTintColor:Tools.getThemeColor];
    self.tabBar.opaque = YES;
    [self.tabBar setBackgroundColor:COLOR(0x0E0E0E)];
}

- (void)changeLanguage {
    xvc1.title = LocalizedString(@"GentingClub");
    xbar1.title = LocalizedString(@"GentingClub");
    
    xvc2.title = LocalizedString(@"Me");
    xvc2.title = LocalizedString(@"Me");
    
    xvc3.title = LocalizedString(@"Settings");
    xbar3.title = LocalizedString(@"Settings");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect frame = self.tabBar.frame;
    frame.size.height = [WFCUConversationTableViewController tabBarHeight];
    frame.origin.y = self.view.frame.size.height - frame.size.height;
    self.tabBar.frame = frame;
}

- (void)setNewUser:(BOOL)newUser {
    
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
//    if (@available(iOS 13.0, *)) {
//        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
//            if([[UIApplication sharedApplication].delegate respondsToSelector:@selector(setupNavBar)]) {
//                [[UIApplication sharedApplication].delegate performSelector:@selector(setupNavBar)];
//            }
//            UIView *superView = self.view.superview;
//            [self.view removeFromSuperview];
//            [superView addSubview:self.view];
//        }
//    }
}

@end
