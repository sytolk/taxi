//
//  FDKeyChain.m
//  Taxi
//
//  Created by Irakli Vashakidze on 2/22/14.
//  Copyright (c) 2014 99S. All rights reserved.
//

#import "FDNullOrEmpty.h"


#pragma mark Class Interface

@interface FDKeychain : NSObject


#pragma mark - Static Methods

+ (NSData *)rawDataForKey: (NSString *)key
               forService: (NSString *)service
            inAccessGroup: (NSString *)accessGroup;
+ (NSData *)rawDataForKey: (NSString *)key
               forService: (NSString *)service;

+ (id)itemForKey: (NSString *)key
      forService: (NSString *)service
   inAccessGroup: (NSString *)accessGroup;

+ (id)itemForKey: (NSString *)key
      forService: (NSString *)service;

+ (void)saveItem: (id<NSCoding>)item
          forKey: (NSString *)key
      forService: (NSString *)service
   inAccessGroup: (NSString *)accessGroup;

+ (void)saveItem: (id<NSCoding>)item
          forKey: (NSString *)key
      forService: (NSString *)service;

+ (void)deleteItemForKey: (NSString *)key
              forService: (NSString *)service
           inAccessGroup: (NSString *)accessGroup;
+ (void)deleteItemForKey: (NSString *)key 
              forService: (NSString *)service;


@end
