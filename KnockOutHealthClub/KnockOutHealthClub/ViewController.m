//
//  ViewController.m
//  KnockOutHealthClub
//
//  Created by Noais on 4/30/13.
//  Copyright (c) 2013 David Ferreira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){

    IBOutlet UITableView *tblView;
    
}



@end

@implementation ViewController

@synthesize classData;
@synthesize placesData;

- (void)viewDidLoad
{
    [super viewDidLoad];
	if (!classData) {
        classData = [[NSMutableArray alloc] initWithObjects:@"Comets", @"Asteroids", @"Moons", nil];
    }
    if (!placesData) {
        placesData = [[NSMutableArray alloc] initWithObjects:@"16", @"6", @"1", nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection: (NSInteger)section
{
    return [classData count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Class Name";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [classData objectAtIndex:[indexPath row]];
    
    if([[placesData objectAtIndex:[indexPath row]] intValue] < 5) cell.detailTextLabel.textColor = [UIColor redColor];
    else if([[placesData objectAtIndex:[indexPath row]] intValue] < 10) cell.detailTextLabel.textColor = [UIColor yellowColor];
    else if([[placesData objectAtIndex:[indexPath row]] intValue] > 15) cell.detailTextLabel.textColor = [UIColor greenColor];
    
    cell.detailTextLabel.text = [placesData objectAtIndex:[indexPath row]];
    
    return cell;
}


@end
