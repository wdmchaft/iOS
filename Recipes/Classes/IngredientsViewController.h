@class RecipesViewController;
@class Recipe;
@class Ingredient;

@interface IngredientsViewController : UIViewController 
{
    IBOutlet UITableView* tableView;
    IBOutlet RecipesViewController* recipesController;
}

@property (nonatomic, retain) RecipesViewController* recipesController;

- (void) addIngredient:(NSString*)ingredientName;
- (void) removeIngredient:(Ingredient*)ingredient;

@property (nonatomic, retain) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain) NSMutableArray* ingredients;
@property (nonatomic, retain) Recipe* recipe;

- (void) fetchRecords;

@end
