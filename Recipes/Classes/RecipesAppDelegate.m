#import "RecipesAppDelegate.h"
#import "RecipesViewController.h"
#import "IngredientsViewController.h"

@implementation RecipesAppDelegate

@synthesize window;
@synthesize recipesController;

- (void) dealloc 
{
    [recipesController release];
    [window release];
    [super dealloc];
}

- (NSArray *)ingredientsForRecipe:(NSString *)recipeName 
{
    NSArray *ingredients = nil;
    if ([@"Regular Dim Sum" isEqualToString:recipeName]) {
        ingredients = [NSArray arrayWithObjects:@"Dim Sum", @"Loose Noodles", @"MSG", nil];
    } else if([@"Bangin' Dim Sum" isEqualToString:recipeName]) {
        ingredients = [NSArray arrayWithObjects:@"Dim Sum", @"Mad Flavor", @"Heavy Flow", @"Bangin n00dlz", nil];
    } else if([@"The Illest Dim Sum" isEqualToString:recipeName]) {
        ingredients = [NSArray arrayWithObjects:@"Dim Sum", @"Mad Crazy Flavor", @"The Heaviest Flow", @"The Illest Typof n00dlz", nil];
    }
    return ingredients;
}

- (void)recipeClicked:(NSString *)recipeName 
{
    ingredientsController.ingredients = [self ingredientsForRecipe:recipeName];
    [ingredientsController loadIngredients];
    [navController pushViewController:ingredientsController animated:YES];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{    
    navController.viewControllers = [NSArray arrayWithObject:recipesController];
    // Override point for customization after application launch.

    // Add the view controller's view to the window and display.
    [self.window addSubview:navController.view];
    [self.window makeKeyAndVisible];

    return YES;
}

@end
