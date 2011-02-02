@class RecipesViewController;

@interface IngredientsViewController : UIViewController 
{
    NSArray* ingredients;
    IBOutlet UITableView* tableView;
    IBOutlet RecipesViewController* recipesController;
}

@property (nonatomic, retain) NSArray* ingredients;
@property (nonatomic, retain) RecipesViewController* recipesController;


@end
