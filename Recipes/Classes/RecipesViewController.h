//
//  RecipesViewController.h
//  Recipes
//
//  Created by Michael Matranga on 1/31/11.
//  Copyright 2011 DmgCtrl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecipesAppDelegate;

@interface RecipesViewController : UIViewController 
    <UITableViewDataSource, UITableViewDelegate> {
        IBOutlet RecipesAppDelegate *appDelegate;

}

@end

