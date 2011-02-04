#import "RecipesViewController.h"
#import "RecipesAppDelegate.h"
#import "AddRecipesViewController.h"
#import "Recipe.h"


@implementation RecipesViewController
@synthesize managedObjectContext;
@synthesize recipes;

- (void) dealloc 
{
    [managedObjectContext release], managedObjectContext = nil;
    [recipes release], recipes = nil;
    [super dealloc];
}

- (IBAction) edit:(id)sender
{
    [self presentModalViewController:addRecipeController animated:YES];
}

- (void) addNewRecipeNamed:(NSString*) recipeName
{
    Recipe* recipe = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Recipe class]) inManagedObjectContext:managedObjectContext];
    recipe.name = recipeName;
    
    NSError* error;
    
    if (![managedObjectContext save:&error]) {
        //Error Warning??
    }
    
    [self.recipes insertObject:recipe atIndex:0];
    
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
    Recipe* recipe = [self.recipes objectAtIndex:indexPath.row];
    cell.textLabel.text = recipe.name;             
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger) tableView:(UITableView*)tv numberOfRowsInSection:(NSInteger)section 
{
    return [self.recipes count];   
}

- (void) tableView:(UITableView*)recipeView didSelectRowAtIndexPath:(NSIndexPath*)indexPath 
{
    [appDelegate recipeClicked:[[recipeView cellForRowAtIndexPath:indexPath] textLabel].text];
}

- (void) viewDidLoad 
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd                                                                                          target:self action: @selector(edit:)] autorelease];
    [self fetchRecords];
}

- (void) fetchRecords 
{
    //Defines which table entity to use
    NSEntityDescription* entity = [NSEntityDescription entityForName:NSStringFromClass([Recipe class]) inManagedObjectContext:managedObjectContext];
    
    //sets up fetchrequest
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    //Defines how records are sorted
    NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    NSArray* sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    [sortDescriptor release];
    
    //Fetch Records and handle errors
    NSError* error;
    NSMutableArray* mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    
    if (!mutableFetchResults) {
        //Handle Error
    }
    
    //Save Data to an Array
    [self setRecipes: mutableFetchResults];
    [mutableFetchResults release];
    [request release];
}

                                               
@end
