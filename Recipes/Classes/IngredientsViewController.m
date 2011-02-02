#import "IngredientsViewController.h"
#import "RecipesViewController.h"

@implementation IngredientsViewController

@synthesize ingredients;

- (void) dealloc 
{
    [ingredients release], ingredients = nil;
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
- (UITableViewCellEditingStyle)tableView:(UITableView*)tableView editingStyleForRowAtIndexPath:(NSIndexPath*) indexPath 
{
    if (indexPath.row < [self.ingredients count]) {
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleNone;
}
- (void) setIngredients:(NSArray*)newIngredients
{
    [ingredients release];
    ingredients = [newIngredients retain];
    [tableView reloadData];
}

-(void)removeIngredient:(NSString*) ingredientName
{
    [recipesController removeIngredient:ingredientName forRecipe:self.title];
}

-(void) tableView:(UITableView*)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete && indexPath.row < [self.ingredients count]) {
        [self removeIngredient:[[tv cellForRowAtIndexPath:indexPath] textLabel].text];
        [tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
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
        cell.hidesAccessoryWhenEditing = NO;
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
