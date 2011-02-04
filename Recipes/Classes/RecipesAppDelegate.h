
@class RecipesViewController;
@class IngredientsViewController;
@class AddIngredientViewController;
@class Recipe;

@interface RecipesAppDelegate : NSObject <UIApplicationDelegate>
{
    IBOutlet UIWindow* window;
    IBOutlet RecipesViewController* recipesController;
    IBOutlet UINavigationController* navController;
    IBOutlet IngredientsViewController* ingredientsController; 
    IBOutlet AddIngredientViewController* newIngredientController;
    /**/
    NSManagedObjectModel* managedObjectModel;
    NSManagedObjectContext* managedObjectContext;
    NSPersistentStoreCoordinator* persistentStoreCoordinator;
}

@property (nonatomic, retain) IBOutlet UIWindow* window;
@property (nonatomic, retain) IBOutlet RecipesViewController* recipesController;
@property (nonatomic, retain) IBOutlet IngredientsViewController* ingredientsController;
@property (nonatomic, retain) IBOutlet AddIngredientViewController *newIngredientController;

- (void) recipeClicked:(Recipe*)recipeName;
- (void) displayAddNewIngredientScreen:(NSString*)recipeName;

@property (nonatomic, retain, readonly) NSManagedObjectModel* managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator* persistentStoreCoordinator;
- (NSString*) applicationDocumentsDirectory;

@end

