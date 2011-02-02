#import "RecipesViewController.h"
#import "RecipesAppDelegate.h"
#import "AddRecipesViewController.h"

@implementation RecipesViewController

- (void) dealloc 
{
    [super dealloc];
}

- (IBAction) edit:(id)sender
{
    [self presentModalViewController:addRecipeController animated:YES];
}

- (void) addNewRecipeNamed:(NSString*) recipeName
{
    [appDelegate addNewRecipeNamed:recipeName];
    [tableView reloadData];
}


- (UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath 
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"recipeCell"];
    if (nil == cell){
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"recipeCell"] autorelease];
    }
    cell.textLabel.text = [appDelegate.recipes objectAtIndex:indexPath.row];             
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger) tableView:(UITableView*)tv numberOfRowsInSection:(NSInteger)section 
{
    return [appDelegate.recipes count];   
}

- (void) tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath 
{
    [appDelegate recipeClicked:[[tableView cellForRowAtIndexPath:indexPath] textLabel].text];
}

- (void) viewDidLoad 
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd                                                                                             target:self action: @selector(edit:)] autorelease];
}
                                               
                                               
@end
