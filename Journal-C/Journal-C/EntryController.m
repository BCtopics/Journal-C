//
//  EntryController.m
//  Journal-C
//
//  Created by Bradley GIlmore on 5/1/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import "EntryController.h"

static NSString * const kEntries = @"entries";

@interface EntryController()

@property (nonatomic, strong) NSMutableArray *internalEntries;

@end

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
        [sharedInstance loadFromPersistentStorage];
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
    [self saveToPersistentStorage];
}

- (void)removeEntry:(Entry *)entry
{
    [self.internalEntries removeObject:entry];
    [self saveToPersistentStorage];
}


- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:kEntries];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:kEntries];
    for (NSDictionary *dictionary in entryDictionaries) {
        Entry *entry = [[Entry alloc] initWithDictionary:dictionary];
        [self addEntry:entry];
    }
}

#pragma mark - Properties

- (NSArray *)entries { return self.internalEntries; }

@end
