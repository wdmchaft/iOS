
@class RecipesAppDelegate;
@class AddRecipesViewController;

@interface RecipesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> 
{
    IBOutlet RecipesAppDelegate* appDelegate;
    IBOutlet AddRecipesViewController* addRecipeController; 
    IBOutlet UITableView* tableView;
}

- (IBAction) edit:(id)sender;

- (void) addNewRecipeNamed:(NSString*) recipeName;
- (void) displayAddNewIngredientScreen:(NSString*) recipeName;

@property (nonatomic, retain) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain) NSMutableArray* recipes;

- (void) fetchRecords;

@end

