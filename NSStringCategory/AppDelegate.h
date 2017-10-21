//
//  AppDelegate.h
//  NSStringCategory
//
//  Created by 马金丽 on 17/10/21.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

