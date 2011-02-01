//
//  RecipesAppDelegate.h
//  Recipes
//
//  Created by Michael Matranga on 1/31/11.
//  Copyright 2011 DmgCtrl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecipesViewController;
@class IngredientsViewController;

@interface RecipesAppDelegate : NSObject <UIApplicationDelegate> {
    IBOutlet UIWindow *window;
    IBOutlet RecipesViewController *recipesController;
    IBOutlet UINavigationController *navController;
    IBOutlet IngredientsViewController *ingredientsController; 
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RecipesViewController *recipesController;

- (void)recipeClicked:(NSString *)recipeName;

@end

