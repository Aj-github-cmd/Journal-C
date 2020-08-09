//
//  EntryDetailViewController.m
//  Journal-C
//
//  Created by Caleb Hicks on 12/1/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "DMNEntryDetailViewController.h"
#import "DMNEntryController.h"

@interface DMNEntryDetailViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *titleTextField;
@property (nonatomic, weak) IBOutlet UITextView *textTextView;

@end

@implementation DMNEntryDetailViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	[self updateViews];
}

- (void)updateViews
{
	if (!self.entry) return;
	
	self.titleTextField.text = self.entry.title;
	self.textTextView.text = self.entry.text;
}

#pragma mark - Actions

- (IBAction)saveButtonTapped:(id)sender
{
	if (self.entry) {
        [[DMNEntryController sharedController] updateEntry:self.entry title:self.titleTextField.text text:self.textTextView.text];
	} else {
        [[DMNEntryController sharedController] addEntryWithTitle:self.titleTextField.text text:self.textTextView.text];
	}
	[self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clearButtonTapped:(id)sender
{
	self.titleTextField.text = @"";
	self.textTextView.text = @"";
}

#pragma mark - UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

#pragma mark - Properties

- (void)setEntry:(DMNEntry *)entry
{
	if (entry != _entry) {
		_entry = entry;
		[self updateViews];
	}
}

@end
