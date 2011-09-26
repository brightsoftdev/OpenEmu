//
//  AttributedTextFieldCell.m
//  OEPreferencesMockup
//
//  Created by Christoph Leimbrock on 30.05.11.
//  Copyright 2011 none. All rights reserved.
//

#import "AttributedTextFieldCell.h"


@implementation AttributedTextFieldCell
@synthesize textAttributes;
- (id)init{
    self = [super init];
    if (self) {
		[self setupAttributes];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
		[self setupAttributes];
    }    
    return self;
}
-(id)initImageCell:(NSImage *)image{
	self = [super initImageCell:image];
    if (self) {
		[self setupAttributes];
    }    
    return self;
}
- (id)initTextCell:(NSString *)aString{
	self = [super initTextCell:aString];
    if (self) {
		[self setupAttributes];
    }    
    return self;
}

- (void)dealloc{
	self.textAttributes = nil;
    [super dealloc];
}

- (void)setStringValue:(NSString *)aString{
	[super setAttributedStringValue:[[[NSAttributedString alloc] initWithString:aString attributes:self.textAttributes] autorelease]];
}

- (void)setupAttributes{
	NSAttributedString* stringVal = [self attributedStringValue];
	
	@try {
		NSMutableDictionary* attributes = [NSMutableDictionary dictionaryWithDictionary:[stringVal attributesAtIndex:0 effectiveRange:NULL]];
		
		for(NSString* aKey in [self.textAttributes allKeys]){
			[attributes setValue:[self.textAttributes valueForKey:aKey] forKey:aKey];
		}
		self.textAttributes = attributes;
		
		[self setStringValue:[self stringValue]];
		
	}
	@catch (NSException *exception) {
	}	
}
@end