@class RecipesViewController;
@class Recipe;
@class Ingredient;

@interface IngredientsViewController : UIViewController 
{
    IBOutlet UITableView* tableView;
    IBOutlet RecipesViewController* recipesController;
}

@property (nonatomic, retain) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain) Recipe* recipe;

- (void) addIngredient:(NSString*)ingredientName;

@end
