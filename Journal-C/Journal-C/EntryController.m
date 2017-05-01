//
//  EntryController.m
//  Journal-C
//
//  Created by Bradley GIlmore on 5/1/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import "EntryController.h"

@interface EntryController()

@property (nonatomic, strong) NSMutableArray *internalEntries;

@end

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
    });
    return sharedInstance;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        _internalEntries = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addEntry:(Entry *)entry
{
    [self.internalEntries addObject:entry];
}

- (void)removeEntry:(Entry *)entry
{
    [self.internalEntries removeObject:entry];
}

#pragma mark - Properties

- (NSArray *)entries { return self.internalEntries; }

@end
