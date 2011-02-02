
@class RecipesViewController;
@class IngredientsViewController;

@interface RecipesAppDelegate : NSObject <UIApplicationDelegate>
{
    NSMutableDictionary* data;
    IBOutlet UIWindow* window;
    IBOutlet RecipesViewController* recipesController;
    IBOutlet UINavigationController* navController;
    IBOutlet IngredientsViewController* ingredientsController; 
}

@property (nonatomic, retain) IBOutlet UIWindow* window;
@property (nonatomic, retain) IBOutlet RecipesViewController* recipesController;

@property (readonly) NSArray* recipes;

- (void)recipeClicked:(NSString *)recipeName;
- (void) addNewRecipeNamed:(NSString*) recipeName;

@end

