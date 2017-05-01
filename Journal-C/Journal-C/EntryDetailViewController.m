//
//  EntryDetailViewController.m
//  Journal-C
//
//  Created by Bradley GIlmore on 5/1/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "EntryController.h"

@interface EntryDetailViewController () <UITextFieldDelegate>

#pragma mark - IBOutlets

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;



@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)updateViews
{
    if (!self.entry) return;
    
    self.titleTextField.text = self.entry.title;
    self.bodyTextView.text = self.entry.bodyText;
}


#pragma mark - IBActions

- (IBAction)clearButtonTapped:(id)sender {
    self.bodyTextView.text = @"";
    self.titleTextField.text = @"";
}

- (IBAction)saveButtonTapped:(id)sender {
    if (self.entry) {
        self.entry.title = self.titleTextField.text;
        self.entry.bodyText = self.bodyTextView.text;
        self.entry.timestamp = [NSDate date];
    } else {
        Entry *entry = [[Entry alloc] initWithTitle:self.titleTextField.text bodyText:self.bodyTextView.text timestamp:[NSDate date]];
        
        [[EntryController sharedInstance] addEntry:entry];
        self.entry = entry;
    }
    [self.navigationController popViewControllerAnimated:true];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITextFieldDelegate Method

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
