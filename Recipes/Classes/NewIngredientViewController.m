#import "NewIngredientViewController.h"
#import "IngredientsViewController.h"

@implementation NewIngredientViewController

@synthesize recipeName;
@synthesize ingredientsController;

- (void)dealloc 
{
    [textFieldCell dealloc], textFieldCell = nil;
    [super dealloc];
}

- (void) setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    if (NO == editing) {
        [(UINavigationController*)self.parentViewController popViewControllerAnimated:YES];
    }
}

- (void) viewDidLoad
{
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) textFieldDidEndEditing:(UITextField*)tf 
{
    if (tf.text.length > 0) {
        [ingredientsController addIngredient:tf.text];
    }
    [self setEditing:NO animated:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField*)tf
{
    [textField resignFirstResponder];
    return YES;
}

- (UITableViewCell*) tableView:(UITableView*) tableView cellForRowAtIndexPath: (NSIndexPath*)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCell"];
    if (nil == cell) {
        cell = textFieldCell;
    }
    return cell;
}

- (NSInteger) tableView:(UITableView*)tv numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

@end
