//
//  NSString+TestForPalindrome.m
//  Palindrominator
//
//  Created by Scott Gardner on 7/1/14.
//  Copyright (c) 2014 Optimac, Inc. All rights reserved.
//

#import "NSString+TestForPalindrome.h"

@implementation NSString (TestForPalindrome)

- (NSArray *)getArrayOfPalindromes
{
  NSUInteger stringLength = [self length];
  NSUInteger palindromeStringLength = stringLength;
  NSString *palindromeCandidate;
  NSMutableSet *palindromes = [NSMutableSet new];
  
  if (stringLength > 2) {
    for (NSUInteger i = 0; i < stringLength - palindromeStringLength + 1 && palindromeStringLength > 2; i++, palindromeStringLength--) {
      palindromeCandidate = [self substringWithRange:NSMakeRange(i, palindromeStringLength)];
      
      if ([palindromeCandidate isPalindrome]) {
        [palindromes addObject:palindromeCandidate];
      } else {
        for (NSUInteger substringLength = palindromeStringLength - 1; substringLength > 2; substringLength--) {
          palindromeCandidate = [self substringWithRange:NSMakeRange(i, substringLength)];
          
          if ([palindromeCandidate length] > 2 && [palindromeCandidate isPalindrome]) {
            [palindromes addObject:palindromeCandidate];
          }
        }
      }
    }
  }
  
  return [[palindromes allObjects] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

- (BOOL)isPalindrome
{
  NSMutableString *reversedString = [NSMutableString new];
  NSUInteger length = [self length];
  
  while (length) {
    length--;
    NSRange substringRange = NSMakeRange(length, 1);
    [reversedString appendString:[self substringWithRange:substringRange]];
  }
  
  return [self isEqualToString:reversedString];
}

@end
