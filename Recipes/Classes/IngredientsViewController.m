#import "IngredientsViewController.h"
#import "RecipesViewController.h"
#import "NewIngredientViewController.h"
#import "Ingredient.h"
#import "Recipe.h"


@interface IngredientsViewController ()
@property (nonatomic, retain) RecipesViewController* recipesController;
@property (nonatomic, retain) NSMutableArray* ingredients;
- (void) removeIngredient:(Ingredient*)ingredient;
- (void) fetchRecords;
@end


@implementation IngredientsViewController

@synthesize ingredients;
@synthesize recipesController;
@synthesize managedObjectContext;
@synthesize recipe;

- (void) dealloc 
{
    [managedObjectContext release], managedObjectContext = nil;
    [ingredients release], ingredients = nil;
    [recipe release], recipe = nil;
    [super dealloc];
}

- (void) setEditing:(BOOL)editing animated:(BOOL)animated
{
    if (self.editing != editing) {
        [super setEditing:editing animated:animated];
        [tableView setEditing:editing animated:animated];
        NSArray* indexPaths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow: self.ingredients.count inSection:0]];
        if (YES == editing) {
            [tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
        } else {
            [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationRight];
        }
    }
}

- (void) tableView:(UITableView*)tv didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.row >= ingredients.count) {
        [recipesController displayAddNewIngredientScreen:self.title];
    }
}

- (void) tableView:(UITableView*) tableView moveRowAtIndexPath:(NSIndexPath*) sourceIndexPath toindexPath:(NSIndexPath*)destinationIndexPath
{
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView*)tableView editingStyleForRowAtIndexPath:(NSIndexPath*) indexPath 
{
    if (indexPath.row < [self.ingredients count]) {
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleNone;
}

- (void) addIngredient:(NSString*)ingredientName
{
    NSInteger rowIndex = ingredients.count;
    
    Ingredient* ingredient = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Ingredient class]) inManagedObjectContext:managedObjectContext];
    ingredient.recipe = recipe;
    ingredient.name = ingredientName;
    NSError* error;
    if (![managedObjectContext save:&error]) {
        //Error Warning??
    }
    [self.ingredients insertObject:ingredient atIndex:rowIndex];

    [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:rowIndex inSection:0]] withRowAnimation:UITableViewRowAnimationRight];
}

- (void) removeIngredient:(Ingredient*)ingredient
{
    NSInteger rowIndex = [ingredients indexOfObject:ingredient];
    [ingredients removeObjectAtIndex:rowIndex];
    [managedObjectContext deleteObject:ingredient];
    NSError* error;
    if (![managedObjectContext save:&error]) {
        //Error Warning??
    }
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:rowIndex inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
}

- (void) tableView:(UITableView*)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete && indexPath.row < [self.ingredients count]) {
        [self removeIngredient:[ingredients objectAtIndex:indexPath.row]];
    }
}

- (UITableViewCell*) tableView:(UITableView*)tv cellForRowAtIndexPath:(NSIndexPath*)indexPath 
{
    UITableViewCell* cell = [tv dequeueReusableCellWithIdentifier:@"ingredientsCell"];
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:nil] autorelease];
    }
    
    if (indexPath.row < self.ingredients.count) {
        Ingredient* ingredient = [self.ingredients objectAtIndex:indexPath.row];
        cell.textLabel.text = ingredient.name;
    } else {
        cell.textLabel.text = @"Add New Ingredient";
        [cell.textLabel setTextColor:[UIColor lightGrayColor]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    return cell;
}

- (NSInteger) tableView:(UITableView*)tv numberOfRowsInSection:(NSInteger)section 
{
    NSInteger count = self.ingredients.count;
    if (self.editing) {
        count++;
    }
    return count;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;   
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self fetchRecords];
}

- (void) fetchRecords 
{
    //Defines which table entity to use
    NSEntityDescription* entity = [NSEntityDescription entityForName:NSStringFromClass([Ingredient class]) inManagedObjectContext:managedObjectContext];
    
    //sets up fetchrequest
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    [request setPredicate:[NSPredicate predicateWithFormat:@"recipe == %@", self.recipe]];
    
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
    [self setIngredients: mutableFetchResults];
    [mutableFetchResults release];
    [request release];
    
    [tableView reloadData];
}

@end
