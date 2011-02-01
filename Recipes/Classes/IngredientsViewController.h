//
//  IngredientsViewController.h
//  Recipes
//
//  Created by Michael Matranga on 2/1/11.
//  Copyright 2011 DmgCtrl. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IngredientsViewController : UIViewController {
    NSArray *ingredients;
    IBOutlet UITableView *tableView;
}

@property (nonatomic, retain) NSArray *ingredients;

- (void)loadIngredients;

@end
