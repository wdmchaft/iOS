#import "RecipesAppDelegate.h"
#import "RecipesViewController.h"
#import "IngredientsViewController.h"

@implementation RecipesAppDelegate

@synthesize window;
@synthesize recipesController;
@synthesize recipes;

- (void) dealloc 
{
    [recipesController release], recipesController = nil;
    [window release], window = nil;
    [navController release], navController = nil;
    [ingredientsController release], ingredientsController = nil;
    [super dealloc];
     
}

- (NSArray*) recipes 
{
    return [data allKeys];
}

- (void) addNewRecipeNamed:(NSString*) recipeName
{
    [data setValue:[NSMutableArray array] forKey:recipeName];
}


- (void) createDefaultData
{
    data = [[NSMutableDictionary dictionary] retain];
    [data setValue:[NSMutableArray arrayWithObjects:@"Dim Sum", @"Loose Noodles", @"MSG", nil] forKey:@"Regular Dim Sum"];
    [data setValue:[NSMutableArray arrayWithObjects:@"Dim Sum", @"Mad Flavor", @"Heavy Flow", @"Bangin n00dlz", nil] forKey:@"Bangin' Dim Sum"];
    [data setValue:[NSMutableArray arrayWithObjects:@"Dim Sum", @"Mad Crazy Flavor", @"The Heaviest Flow", @"The Illest Types of n00dlz", nil] forKey:@"The Illest Dim Sum"];
}

- (NSArray*) ingredientsForRecipe:(NSString*)recipeName 
{
    return [data valueForKey:recipeName];
}

- (void) recipeClicked:(NSString*)recipeName 
{
    ingredientsController.ingredients = [self ingredientsForRecipe:recipeName];
    ingredientsController.title = recipeName;
    [navController pushViewController:ingredientsController animated:YES];
}

- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions 
{    
    navController.viewControllers = [NSArray arrayWithObject:recipesController];
    
    [self.window addSubview:navController.view];
    [self.window makeKeyAndVisible];
    [self createDefaultData];

    return YES;
}

@end
