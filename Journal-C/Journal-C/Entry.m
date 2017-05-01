//
//  Entry.m
//  Journal-C
//
//  Created by Bradley GIlmore on 5/1/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import "Entry.h"

static NSString * const kTitle = @"title";
static NSString * const kBodyText = @"bodytext";
static NSString * const kTimeStamp = @"timestamp";

@implementation Entry

- (instancetype)initWithTitle:(NSString *)title bodyText:(NSString *)bodyText timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self) {
        _title = title;
        _bodyText = bodyText;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    //Still need to check and make sure none are missing.
    NSString *title = dictionary[kTitle];
    NSString *bodyText = dictionary[kBodyText];
    NSDate *timestamp = dictionary[kTimeStamp];
    return [self initWithTitle:title bodyText:bodyText timestamp:timestamp];
}

-(NSDictionary *)dictionaryRepresentation
{
    return @{
             kTitle : self.title,
             kBodyText : self.bodyText,
             kTimeStamp : self.timestamp
             };
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[Entry class]]) { return NO; }
    // Shortcut to comparing all properties one by one. We let NSDictionary do it for us
    return [[self dictionaryRepresentation] isEqualToDictionary:[(Entry *)object dictionaryRepresentation]];
}

@end
