//
//  EntryListTableViewController.m
//  Journal-C
//
//  Created by Bradley GIlmore on 5/1/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "EntryController.h"
#import "EntryDetailViewController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [EntryController sharedInstance].entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    EntryController *entryController = [EntryController sharedInstance];
    Entry *entry = entryController.entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
        [[EntryController sharedInstance] removeEntry:entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"viewEntrySegue"]) {
        
        NSIndexPath *indexpath = [self.tableView indexPathForSelectedRow];
        Entry *entry = [EntryController sharedInstance].entries[indexpath.row];
        EntryDetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.entry = entry;
    }
}


@end
