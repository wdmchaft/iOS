
@interface IngredientsViewController : UIViewController 
{
    NSArray* ingredients;
    IBOutlet UITableView* tableView;
}

@property (nonatomic, retain) NSArray* ingredients;



@end
