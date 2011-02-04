#import "RecipesAppDelegate.h"
#import "RecipesViewController.h"
#import "IngredientsViewController.h"
#import "AddIngredientViewController.h"
#import "Recipe.h"

@implementation RecipesAppDelegate

@synthesize window;
@synthesize recipesController;
@synthesize ingredientsController;
@synthesize newIngredientController;

- (void) dealloc 
{
    [managedObjectContext release], managedObjectContext = nil;
    [managedObjectModel release], managedObjectModel = nil;
    [persistentStoreCoordinator release], persistentStoreCoordinator = nil;
    /**/
    [recipesController release], recipesController = nil;
    [window release], window = nil;
    [navController release], navController = nil;
    [ingredientsController release], ingredientsController = nil;
    [super dealloc];
}

- (void) recipeClicked:(Recipe*)recipe 
{
    ingredientsController.managedObjectContext = self.managedObjectContext;
    ingredientsController.recipe = recipe;
    ingredientsController.title = recipe.name;
    [navController pushViewController:ingredientsController animated:YES];
}

- (void) displayAddNewIngredientScreen:(NSString*)recipeName
{
    newIngredientController.recipeName = recipeName;
    [navController pushViewController:newIngredientController animated:YES];
}

- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions 
{    
    recipesController.managedObjectContext = self.managedObjectContext;
    navController.viewControllers = [NSArray arrayWithObject:recipesController];
    
    [self.window addSubview:navController.view];
    [self.window makeKeyAndVisible];

    return YES;
}

#pragma mark -
#pragma mark Core Data

- (NSManagedObjectContext *) managedObjectContext 
{
	
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
	
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    return managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel 
{
	
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];    
    return managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator 
{
	
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
	
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"Recipes.sqlite"]];
	
	NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
    }    
	
    return persistentStoreCoordinator;
}

- (NSString *)applicationDocumentsDirectory 
{
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

@end
