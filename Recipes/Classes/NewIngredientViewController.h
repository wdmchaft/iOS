#import <UIKit/UIKit.h>

@class IngredientsViewController;

@interface NewIngredientViewController : UIViewController 
{
    NSString* recipeName;
    IBOutlet UITextField* textField;
    IBOutlet UITableViewCell* textFieldCell;
    IBOutlet IngredientsViewController* ingredientsController;
}

@property (nonatomic, retain) IngredientsViewController* ingredientsController;
@property (nonatomic, retain) NSString* recipeName;

@end
