@class Recipe;

@interface Ingredient : NSManagedObject 
{
}

@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) Recipe* recipe;

@end
