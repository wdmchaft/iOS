#import "IngredientsViewController.h"

@implementation IngredientsViewController

@synthesize ingredients;

- (void) dealloc 
{
    [ingredients release], ingredients = nil;
    [super dealloc];
}

- (void) setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [tableView setEditing:editing animated:animated];
    [tableView reloadData];
}

- (void) setIngredients:(NSArray*)newIngredients
{
    [ingredients release];
    ingredients = [newIngredients retain];
    [tableView reloadData];
}

- (UITableViewCell*) tableView:(UITableView*)tv cellForRowAtIndexPath:(NSIndexPath*)indexPath 
{
    UITableViewCell* cell = [tv dequeueReusableCellWithIdentifier:@"ingredientsCell"];
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:nil] autorelease];
    }
    if(indexPath.row < self.ingredients.count) {
        cell.textLabel.text = [self.ingredients objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = @"Add New Ingredient";
        [cell.textLabel setTextColor:[UIColor lightGrayColor]];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

        return cell;
}

- (NSInteger) tableView:(UITableView*)tv numberOfRowsInSection:(NSInteger)section 
{
    NSInteger count = self.ingredients.count;
    if(self.editing) {
        count++;
    }
        
    return count;
}

-(void) viewDidLoad
{
    self.navigationItem.rightBarButtonItem = self.editButtonItem;    
}

@end
