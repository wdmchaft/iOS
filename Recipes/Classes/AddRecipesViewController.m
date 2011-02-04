
#import "AddRecipesViewController.h"
#import "RecipesViewController.h"

@implementation AddRecipesViewController

- (void) dealloc 
{
    [super dealloc];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    textField.text = nil;
}

- (IBAction) save:(id)sender
{
    [recipesController addNewRecipeNamed:textField.text];
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction) cancel:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void) textFieldDidEndEditing:(UITextField*)tf
{
    [self dismissModalViewControllerAnimated:YES];        
}

- (BOOL) textFieldShouldReturn:(UITextField*)tf
{
    [textField resignFirstResponder];
    [recipesController addNewRecipeNamed:textField.text];
    return YES;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCell"];
    if (nil == cell) {
        cell = textFieldCell;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

@end
