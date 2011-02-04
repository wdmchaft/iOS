#import "RecipesViewController.h"
#import "RecipesAppDelegate.h"
#import "AddRecipesViewController.h"

@implementation RecipesViewController
@synthesize managedObjectContext;

- (void) dealloc 
{
    [managedObjectContext release], managedObjectContext = nil;
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

- (void) removeIngredient:(NSString*) ingredient forRecipe:(NSString*)recipe
{
    [appDelegate removeIngredient:ingredient forRecipe:recipe];    
}

- (void) addIngredient:(NSString*) ingredient forRecipe:(NSString*)recipe
{
    [appDelegate addIngredient:ingredient forRecipe:recipe];    
}

- (void) displayAddNewIngredientScreen:(NSString*) recipeName
{
    [appDelegate displayAddNewIngredientScreen:recipeName];    
}


- (UITableViewCell*) tableView:(UITableView*)recipeView cellForRowAtIndexPath:(NSIndexPath*)indexPath 
{
    UITableViewCell* cell = [recipeView dequeueReusableCellWithIdentifier:@"recipeCell"];
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

- (void) tableView:(UITableView*)recipeView didSelectRowAtIndexPath:(NSIndexPath*)indexPath 
{
    [appDelegate recipeClicked:[[recipeView cellForRowAtIndexPath:indexPath] textLabel].text];
}

- (void) viewDidLoad 
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd                                                                                             target:self action: @selector(edit:)] autorelease];
}
                                               
                                               
@end
