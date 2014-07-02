//
//  PalindrominatorTests.m
//  PalindrominatorTests
//
//  Created by Scott Gardner on 7/1/14.
//  Copyright (c) 2014 Optimac, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+TestForPalindrome.h"

@interface PalindrominatorTests : XCTestCase

@end

@implementation PalindrominatorTests

- (void)setUp
{
  [super setUp];
  // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  [super tearDown];
}

- (void)testEnteringStringWithNoPalindromesReturnsEmptyArray
{
  NSString *string = @"123456789";
  NSArray *palindromes = [string getArrayOfPalindromes];
  XCTAssert([palindromes count] == 0, @"Expected empty array.");
}

- (void)testEnteringStringWithPalindromesReturnsPalindromes
{
  NSString *string = @"amanaplanacanalpanama";
  NSArray *palindromes = [string getArrayOfPalindromes];
  XCTAssert([palindromes count] == 12, @"Expected array of 12 palindromes.");
}

@end
