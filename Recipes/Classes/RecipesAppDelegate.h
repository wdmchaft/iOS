
@class RecipesViewController;
@class IngredientsViewController;
@class NewIngredientViewController;
@class Recipe;

@interface RecipesAppDelegate : NSObject <UIApplicationDelegate>
{
    NSMutableDictionary* data;
    IBOutlet UIWindow* window;
    IBOutlet RecipesViewController* recipesController;
    IBOutlet UINavigationController* navController;
    IBOutlet IngredientsViewController* ingredientsController; 
    IBOutlet NewIngredientViewController* newIngredientController;
    /**/
    NSManagedObjectModel* managedObjectModel;
    NSManagedObjectContext* managedObjectContext;
    NSPersistentStoreCoordinator* persistentStoreCoordinator;
}

@property (nonatomic, retain) IBOutlet UIWindow* window;
@property (nonatomic, retain) IBOutlet RecipesViewController* recipesController;
@property (nonatomic, retain) IBOutlet IngredientsViewController* ingredientsController;
@property (nonatomic, retain) IBOutlet NewIngredientViewController *newIngredientController;

@property (readonly) NSArray* recipes;

- (void) recipeClicked:(Recipe*)recipeName;
- (void) displayAddNewIngredientScreen:(NSString*)recipeName;

@property (nonatomic, retain, readonly) NSManagedObjectModel* managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator* persistentStoreCoordinator;
- (NSString*) applicationDocumentsDirectory;

@end

