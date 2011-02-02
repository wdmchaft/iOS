#import "IngredientsViewController.h"

@implementation IngredientsViewController

@synthesize ingredients;

- (void) dealloc 
{
    [ingredients release], ingredients = nil;
    [super dealloc];
}

- (void) loadIngredients 
{
    [tableView reloadData];
}

- (UITableViewCell*) tableView:(UITableView*)tv cellForRowAtIndexPath:(NSIndexPath*)indexPath 
{
    UITableViewCell* cell = [tv dequeueReusableCellWithIdentifier:@"ingredientsCell"];
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:nil] autorelease];
    }
    cell.textLabel.text = [self.ingredients objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger) tableView:(UITableView*)tv numberOfRowsInSection:(NSInteger)section 
{
    return [self.ingredients count];
}

@end
