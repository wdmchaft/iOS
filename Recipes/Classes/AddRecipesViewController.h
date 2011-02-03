#import <UIKit/UIKit.h>

@class RecipesViewController;

@interface AddRecipesViewController : UIViewController <UITableViewDataSource> 
{
    IBOutlet UITextField* textField;
    IBOutlet UITableViewCell* textFieldCell;
    IBOutlet RecipesViewController* recipesController;
}

- (IBAction) save:(id)sender;
- (IBAction) cancel:(id)sender;

@end
