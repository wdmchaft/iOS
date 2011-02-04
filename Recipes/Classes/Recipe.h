
@class Ingredient;

@interface Recipe : NSManagedObject 
{
}

@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSSet* ingredients;

@end

@interface Recipe (CoreDataGeneratedAccessors)
- (void) addIngredientsObject:(Ingredient*)value;
- (void) removeIngredientsObject:(Ingredient*)value;
- (void) addIngredients:(NSSet*)value;
- (void) removeIngredients:(NSSet*)value;
@end
