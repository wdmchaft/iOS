//
//  RecipesViewController.m
//  Recipes
//
//  Created by Michael Matranga on 1/31/11.
//  Copyright 2011 DmgCtrl. All rights reserved.
//

#import "RecipesViewController.h"
#import "RecipesAppDelegate.h"


@implementation RecipesViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recipeCell"];
    if(nil == cell){
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"recipeCell"] autorelease];
    }
                 
    if(indexPath.row == 0){
        cell.textLabel.text = @"Regular Dim Sum";
    } else if(indexPath.row == 1){
        cell.textLabel.text = @"Bangin' Dim Sum";
    } else if(indexPath.row == 2){
        cell.textLabel.text = @"The Illest Dim Sum";
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
    return 3;   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    [appDelegate recipeClicked:[[tableView cellForRowAtIndexPath:indexPath] textLabel].text];
}
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
