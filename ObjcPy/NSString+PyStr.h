//
//  NSString+ISPyStr.h
//  InScopeLib
//
//  Created by David Keegan on 10/13/09.
//  Copyright 2009 InScopeApps{+}. All rights reserved.
//
//  Inspired by http://code.google.com/p/pystring/

#import <Foundation/Foundation.h>

@interface NSString(ISPyStr)

//TODO: count(should this be implemented, count is used for arrays and length for strings in objc)
//TODO: decode
//TODO: encode
//TODO: expandtabs
//TODO: find
//TODO: index
//TODO: isalnum
//TODO: isalpha
//TODO: isdigit
//TODO: isspace
//TODO: ljust
//TODO: lstrip
//TODO: partition
//TODO: rfind
//TODO: rindex
//TODO: rjust
//TODO: rpartition
//TODO: rsplit
//TODO: rstrip
//TODO: swapcase
//TODO: translate
//TODO: zfill
//TODO: in (this is not a string method but is useful)

- (NSString *)center:(NSInteger)width;
- (NSString *)center:(NSInteger)width fillchar:(NSString*)fillchar;
- (BOOL)endswith:(NSString *)endswith;
- (BOOL)startswith:(NSString *)startswith;
- (NSString *)capitalize;
- (NSString *)title;
- (BOOL)istitle;
- (NSString *)upper;
- (BOOL)isupper;
- (NSString *)lower;
- (BOOL)islower;
- (NSString *)join:(NSArray *)joinArray;
- (NSString *)replace:(NSString *)searchString with:(NSString *)repalceString;
- (NSArray *)splitlines;
- (NSArray *)split:(NSString *)splitString;
- (NSString *)strip;

@end
