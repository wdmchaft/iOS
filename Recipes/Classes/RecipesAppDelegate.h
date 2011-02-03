
@class RecipesViewController;
@class IngredientsViewController;
@class NewIngredientViewController;

@interface RecipesAppDelegate : NSObject <UIApplicationDelegate>
{
    NSMutableDictionary* data;
    IBOutlet UIWindow* window;
    IBOutlet RecipesViewController* recipesController;
    IBOutlet UINavigationController* navController;
    IBOutlet IngredientsViewController* ingredientsController; 
    IBOutlet NewIngredientViewController* newIngredientController;
}

@property (nonatomic, retain) IBOutlet UIWindow* window;
@property (nonatomic, retain) IBOutlet RecipesViewController* recipesController;
@property (nonatomic, retain) IBOutlet IngredientsViewController* ingredientsController;
@property (nonatomic, retain) IBOutlet NewIngredientViewController *newIngredientController;

@property (readonly) NSArray* recipes;

- (void) recipeClicked:(NSString*)recipeName;
- (void) addNewRecipeNamed:(NSString*)recipeName;
- (void) removeIngredient:(NSString*)ingredient forRecipe:(NSString*)recipe;
- (void) addIngredient:(NSString*)ingredient forRecipe:(NSString*)recipe;
- (void) displayAddNewIngredientScreen:(NSString*)recipeName;

@end

