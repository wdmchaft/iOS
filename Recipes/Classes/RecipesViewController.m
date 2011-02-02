#import "RecipesViewController.h"
#import "RecipesAppDelegate.h"


@implementation RecipesViewController

- (void) dealloc 
{
    [super dealloc];
}

- (UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath 
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"recipeCell"];
    if (nil == cell){
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"recipeCell"] autorelease];
    }
                 
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Regular Dim Sum";
    } else if(indexPath.row == 1) {
        cell.textLabel.text = @"Bangin' Dim Sum";
    } else if(indexPath.row == 2) {
        cell.textLabel.text = @"The Illest Dim Sum";
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger) tableView:(UITableView*)tv numberOfRowsInSection:(NSInteger)section 
{
    return 3;   
}

- (void) tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath 
{
    [appDelegate recipeClicked:[[tableView cellForRowAtIndexPath:indexPath] textLabel].text];
}

@end
