//
//  ViewController.m
//  Palindrominator
//
//  Created by Scott Gardner on 7/1/14.
//  Copyright (c) 2014 Optimac, Inc. All rights reserved.
//

#import "ViewController.h"
#import "NSString+TestForPalindrome.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textInput;
@property (weak, nonatomic) IBOutlet UIButton *processButton;
@property (weak, nonatomic) IBOutlet UITextView *palindromesTextView;
@end

@implementation ViewController

#pragma mark - IBActions

- (IBAction)textFieldDidChange:(UITextField *)textField
{
  if ([textField.text length] > 2) {
    self.processButton.enabled = YES;
  } else {
    self.processButton.enabled = NO;
  }
}

- (IBAction)processButtonTapped:(id)sender
{
  self.processButton.enabled = NO;
  NSArray *palindromes = [self.textInput.text getArrayOfPalindromes];
  
  if ([palindromes count]) {
    NSString *palindromesString = [palindromes componentsJoinedByString:@"\n"];
    self.palindromesTextView.text = palindromesString;
  } else {
    self.palindromesTextView.text = @"NO PALINDROMES FOUND";
  }
  
  self.textInput.text = nil;
}

- (IBAction)hideKeyboard:(id)sender
{
  [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
