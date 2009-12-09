//
//  NSString+PyStr.m
//  InScopeLib
//
//  Created by David Keegan on 10/13/09.
//  Copyright 2009 InScopeApps{+}. All rights reserved.
//

#import "NSString+PyStr.h"

@implementation NSString(PyStr)

BOOL blankString(NSString *string){
    return ([string length] == 0);
}

- (NSString *)stringByRepeatingString:(NSString*)string withCount:(NSInteger)count{
    NSString *stringResult = @"";
    for(NSUInteger i=0; i<count; i++){
        stringResult = [stringResult stringByAppendingString:string];
    }
    return stringResult;
}

#pragma mark -

- (NSString *)center:(NSInteger)width{
    return [self center:width fillchar:@" "];
}

- (NSString *)center:(NSInteger)width fillchar:(NSString*)fillchar{
    //the python command only accepts single characters
    if([fillchar length] > 1){
        return nil;
    }
    NSInteger fillCharCount = width-[self length];
    if(fillCharCount < 1){
        return self;
    }
    
    CGFloat halfFillCharCount = fillCharCount*0.5f;
    
    NSInteger frontCount = floor(halfFillCharCount);
    NSInteger backCount = floor(halfFillCharCount);
    BOOL evenWidth = (width % 2 == 0);
    BOOL evenString = ([self length] % 2 == 0);
    if(evenWidth && !evenString){
        backCount++;
    }
    else if(!evenWidth && evenString){
        frontCount++;
    }
    
    NSString *frontString = [self stringByRepeatingString:fillchar withCount:frontCount];
    NSString *backString = [self stringByRepeatingString:fillchar withCount:backCount];
    
    return [NSString stringWithFormat:@"%@%@%@", frontString, self, backString];
}

- (BOOL)endswith:(NSString *)endswith{
    if([self isEqualToString:endswith]){
        return YES;
    }
    if(blankString(self)){
        return NO;
    }
    if(blankString(endswith)){
        return YES;
    }
    NSArray *splitArray = [self componentsSeparatedByString:endswith];
    NSInteger lastIndex = [splitArray count]-1;
    if(lastIndex < 0){
        return NO;
    }
    return [[splitArray objectAtIndex:lastIndex] isEqualToString:@""];
}

- (BOOL)startswith:(NSString *)startswith{
    if([self isEqualToString:startswith]){
        return YES;
    }
    if(blankString(self)){
        return NO;
    }
    if(blankString(startswith)){
        return YES;
    }
    NSArray *splitArray = [self componentsSeparatedByString:startswith];
    return [[splitArray objectAtIndex:0] isEqualToString:@""];
}

- (NSString *)capitalize{
    if(!blankString(self)){
        NSString *firstLetterCapitalized = [[self substringToIndex:1] upper];
        return [[self lower] stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:firstLetterCapitalized];
    }
    return self;
}

- (NSString *)title{
    NSMutableArray *titleArray = [[NSMutableArray alloc] init];
    for(NSString *part in [self split:@" "]){
        [titleArray addObject:[part capitalize]];
    }
    NSString *returnString = [@" " join:titleArray];
    [titleArray release];
    
    return returnString;
}

- (BOOL)istitle{
    if(blankString(self)){
        return NO;
    }
    return ([self isEqualToString:[self title]]);
}

- (NSString *)upper{
    return [self uppercaseString];
}

- (BOOL)isupper{
    if(blankString(self)){
        return NO;
    }
    return [self isEqualToString:[self upper]];
}

- (NSString *)lower{
    return [self lowercaseString];
}

- (BOOL)islower{
    if(blankString(self)){
        return NO;
    }
    return ([self isEqualToString:[self lower]]);
}

- (NSString *)join:(NSArray *)joinArray{
    return [joinArray componentsJoinedByString:self];
}

- (NSString *)replace:(NSString *)searchString with:(NSString *)repalceString{
    //TODO: support count
    if(blankString(searchString)){
        NSString *replacedString = @"";
        for(NSUInteger i=0; i<[self length]; i++){
            replacedString = [replacedString stringByAppendingFormat:@"%@%@", repalceString, [self substringWithRange:NSMakeRange(i, 1)]];
        }
        return [replacedString stringByAppendingString:repalceString];
    }
    
    return [self stringByReplacingOccurrencesOfString:searchString withString:repalceString];
}

- (NSArray *)splitlines{
    //TODO: support keepends
    //TODO: this method does not fully match up with the python logic
    NSString *newlineOnly = [self replace:@"\r\n" with:@"\r"];
    newlineOnly = [newlineOnly replace:@"\r" with:@"\n"];
    return [[newlineOnly rstrip:[NSCharacterSet newlineCharacterSet]] split:@"\n"];
}

- (NSArray *)split:(NSString *)splitString{
    //TODO: support maxsplit
    return [self componentsSeparatedByString:splitString];
}

- (NSString *)strip{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)lstrip{
    return [self lstrip:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)rstrip{
    return [self rstrip:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)lstrip:(id)chars{
    return self;
}

- (NSString *)rstrip:(id)chars{
    //chars can be a string or a character set
    
    if(blankString(self)){
        return self;
    }
    
    NSUInteger substringIndex = [self length];
    if([chars isKindOfClass:[NSString class]]){
        if(blankString(chars)){
            return self;
        }
        
        NSUInteger charLength = [chars length];
        for(substringIndex; substringIndex>0; substringIndex-=charLength){
            NSInteger subStringStart = substringIndex-charLength;
            if((subStringStart <= 0) || ![chars isEqualToString:[self substringWithRange:NSMakeRange(subStringStart, charLength)]]){
                break;
            }
        }
        return [self substringToIndex:substringIndex];
    }
    else if([chars isKindOfClass:[NSCharacterSet class]]){
        for(substringIndex; substringIndex>0; substringIndex--){
            NSInteger subStringStart = substringIndex-1;
            if(![chars characterIsMember:[self characterAtIndex:subStringStart]]){
                break;
            }
        }
        return [self substringToIndex:substringIndex];
    }
    
    return self;
}

@end
