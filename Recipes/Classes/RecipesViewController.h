
@class RecipesAppDelegate;
@class AddRecipesViewController;

@interface RecipesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> 
{
    IBOutlet RecipesAppDelegate* appDelegate;
    IBOutlet AddRecipesViewController* addRecipeController; 
    IBOutlet UITableView* tableView;
}

@property (nonatomic, retain) NSManagedObjectContext* managedObjectContext;

- (void) displayAddNewIngredientScreen:(NSString*)recipeName;
- (void) addNewRecipeNamed:(NSString*)recipeName;

@end

