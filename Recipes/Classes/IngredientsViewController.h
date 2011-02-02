
@interface IngredientsViewController : UIViewController 
{
    NSArray* ingredients;
    IBOutlet UITableView* tableView;
}

@property (nonatomic, retain) NSArray* ingredients;

- (void) loadIngredients;

@end
