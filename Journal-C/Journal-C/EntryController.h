//
//  EntryController.h
//  Journal-C
//
//  Created by Bradley GIlmore on 5/1/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject


- (void)addEntry:(Entry *)entry;
- (void)removeEntry:(Entry *)entry;

+ (EntryController *)sharedInstance;
- (instancetype)init;

- (void)saveToPersistentStorage;

@property (nonatomic, strong, readonly) NSArray *entries;

@end
