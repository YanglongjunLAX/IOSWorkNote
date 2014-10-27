//
//  AutoLayoutPriorityTests.m
//  UIView+AutoLayout Tests
//
//  Copyright (c) 2014 Tyler Fox
//  https://github.com/smileyborg/UIView-AutoLayout
//

#import "AutoLayoutTestBase.h"

#define DEFINE_WEAK_SELF    __weak __typeof(self) weakSelf = self;

@interface AutoLayoutPriorityTests : AutoLayoutTestBase

@end

@implementation AutoLayoutPriorityTests

- (void)setUp
{
    [super setUp];

}

- (void)tearDown
{

    [super tearDown];
}

/**
 Returns an array of the default priorities to test.
 */
- (NSArray *)defaultPriorities
{
    return @[@(UILayoutPriorityFittingSizeLevel), @(UILayoutPriorityDefaultHigh), @(UILayoutPriorityRequired), @(UILayoutPriorityDefaultLow)];
}

/**
 A helper method that takes a block containing a call to the UIView+AutoLayout API which adds one constraint,
 and calls -[assertConstraint:isAddedWithPriority:] for each of the default priorities.
 */
- (void)assertConstraintIsAddedWithDefaultPriorities:(NSLayoutConstraint *(^)())block
{
    for (NSNumber *layoutPriority in [self defaultPriorities]) {
        [self assertConstraint:block isAddedWithPriority:[layoutPriority floatValue]];
    }
}

/**
 A helper method that takes a block containing one or more calls to the UIView+AutoLayout API which add multiple
 constraints, and calls -[assertConstraints:areAddedWithPriority:] for each of the default priorities.
 */
- (void)assertConstraintsAreAddedWithDefaultPriorities:(NSArray *(^)())block
{
    for (NSNumber *layoutPriority in [self defaultPriorities]) {
        [self assertConstraints:block areAddedWithPriority:[layoutPriority floatValue]];
    }
}

/**
 A helper method that takes a block containing a call to the UIView+AutoLayout API which adds one constraint,
 and verifies that when the +[UIView autoSetPriority:forConstraints:] method is used, this one constraint is
 added with the correct priority specified.
 */
- (void)assertConstraint:(NSLayoutConstraint *(^)())block isAddedWithPriority:(UILayoutPriority)priority
{
    [self assertConstraints:^NSArray *{ return @[block()]; } areAddedWithPriority:priority];
}

/**
 A helper method that takes a block containing one or more calls to the UIView+AutoLayout API which add multiple
 constraints, and verifies that when the +[UIView autoSetPriority:forConstraints:] method is used, these 
 constraints are added with the correct priority specified.
 */
- (void)assertConstraints:(NSArray *(^)())block areAddedWithPriority:(UILayoutPriority)priority
{
    __block NSArray *constraints;
    [UIView autoSetPriority:priority forConstraints:^{
        constraints = block();
    }];
    XCTAssert([constraints count] > 0, @"The array of constraints should not be empty.");
    for (NSLayoutConstraint *constraint in constraints) {
        XCTAssert(constraint.priority == priority, @"The constraint priority should be equal to the one specified for the constraints block.");
    }
}

/**
 Test setting the priority of constraints that center views to their superview.
 */
- (void)testPriorityForCentering
{
    DEFINE_WEAK_SELF
    
    [self assertConstraintsAreAddedWithDefaultPriorities:^NSArray *{
        return [weakSelf.viewA autoCenterInSuperview];
    }];
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewB autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    }];
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewC autoAlignAxisToSuperviewAxis:ALAxisBaseline];
    }];
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewC autoAlignAxisToSuperviewAxis:ALAxisVertical];
    }];
}

/**
 Test setting the priority of constraints that pin edges of views to their superview.
 */
- (void)testPriorityForPinningEdgesToSuperview
{
    DEFINE_WEAK_SELF
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewA autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:15.0];
    }];
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewB autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0.0 relation:NSLayoutRelationGreaterThanOrEqual];
    }];
    
    [self assertConstraintsAreAddedWithDefaultPriorities:^NSArray *{
        return [weakSelf.viewC autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    }];
    
    [self assertConstraintsAreAddedWithDefaultPriorities:^NSArray *{
        return [weakSelf.viewD autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(5.5, -50.0, 42.6, 860.9) excludingEdge:ALEdgeTrailing];
    }];
}

/**
 Test setting the priority of constraints that pin edges of views.
 */
- (void)testPriorityForPinningEdges
{
    DEFINE_WEAK_SELF
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewA autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:weakSelf.viewB];
    }];
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewB autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeft ofView:weakSelf.viewC withOffset:-95.0];
    }];
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewC autoPinEdge:ALEdgeRight toEdge:ALEdgeBottom ofView:weakSelf.viewD withOffset:555.0];
    }];
}

/**
 Test setting the priority of constraints that align axes of views.
 */
- (void)testPriorityForAligningAxes
{
    DEFINE_WEAK_SELF
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewA autoAlignAxis:ALAxisHorizontal toSameAxisOfView:weakSelf.viewB];
    }];
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewC autoAlignAxis:ALAxisVertical toSameAxisOfView:weakSelf.viewD];
    }];
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewB autoAlignAxis:ALAxisBaseline toSameAxisOfView:weakSelf.viewA withOffset:-60.0];
    }];
}

/**
 Test setting the priority of constraints that match dimensions of views.
 */
- (void)testPriorityForMatchingDimensions
{
    DEFINE_WEAK_SELF
    
    [self assertConstraintsAreAddedWithDefaultPriorities:^NSArray *{
        return [weakSelf.viewA autoSetDimensionsToSize:CGSizeMake(90, 180)];
    }];
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewB autoSetDimension:ALDimensionHeight toSize:0.0];
    }];
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewC autoSetDimension:ALDimensionWidth toSize:5.0 relation:NSLayoutRelationLessThanOrEqual];
    }];
}

/**
 Test setting the priority of the content compression resistance and content hugging implicit constraints.
 */
- (void)testPriorityForContentCompressionResistanceAndContentHugging
{
    UILabel *labelA = [UILabel newAutoLayoutView]; // use UILabel since it will have all 4 implicit constraints generated
    labelA.text = @"Some text.";
    
    [UIView autoSetPriority:UILayoutPriorityRequired forConstraints:^{
        [labelA autoSetContentCompressionResistancePriorityForAxis:ALAxisHorizontal];
    }];
    XCTAssert([labelA contentCompressionResistancePriorityForAxis:UILayoutConstraintAxisHorizontal] == UILayoutPriorityRequired, @"The constraint priority should be equal to the one specified for the constraints block.");
    
    [UIView autoSetPriority:UILayoutPriorityFittingSizeLevel + 1 forConstraints:^{
        [labelA autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
    }];
    XCTAssert([labelA contentCompressionResistancePriorityForAxis:UILayoutConstraintAxisVertical] == UILayoutPriorityFittingSizeLevel + 1, @"The constraint priority should be equal to the one specified for the constraints block.");
    
    [UIView autoSetPriority:UILayoutPriorityRequired forConstraints:^{
        [labelA autoSetContentHuggingPriorityForAxis:ALAxisHorizontal];
    }];
    XCTAssert([labelA contentHuggingPriorityForAxis:UILayoutConstraintAxisHorizontal] == UILayoutPriorityRequired, @"The constraint priority should be equal to the one specified for the constraints block.");
    
    [UIView autoSetPriority:UILayoutPriorityDefaultHigh - 1 forConstraints:^{
        [labelA autoSetContentHuggingPriorityForAxis:ALAxisVertical];
    }];
    XCTAssert([labelA contentHuggingPriorityForAxis:UILayoutConstraintAxisVertical] == UILayoutPriorityDefaultHigh - 1, @"The constraint priority should be equal to the one specified for the constraints block.");
}

/**
 Test setting the priority of constraints that constrain any attribute of views.
 */
- (void)testPriorityForConstrainingAnyAttribute
{
    DEFINE_WEAK_SELF
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewA autoConstrainAttribute:ALAxisVertical toAttribute:ALEdgeBottom ofView:weakSelf.viewB];
    }];
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewA autoConstrainAttribute:ALEdgeRight toAttribute:ALAxisHorizontal ofView:weakSelf.viewC withOffset:50.0];
    }];
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewA autoConstrainAttribute:ALDimensionWidth toAttribute:ALDimensionHeight ofView:weakSelf.viewD withOffset:-100.0 relation:NSLayoutRelationLessThanOrEqual];
    }];
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewD autoConstrainAttribute:ALAxisBaseline toAttribute:ALEdgeTrailing ofView:weakSelf.viewA withMultiplier:-6.0];
    }];
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewB autoConstrainAttribute:ALEdgeTop toAttribute:ALEdgeLeading ofView:weakSelf.viewA withMultiplier:0.45 relation:NSLayoutRelationGreaterThanOrEqual];
    }];
}

/**
 Test setting the priority of constraints that pin views to the view controller layout guides.
 */
- (void)testPriorityForPinningToLayoutGuides
{
    DEFINE_WEAK_SELF
    
    UIViewController *viewController = [[UIViewController alloc] initWithNibName:nil bundle:nil];
    [viewController view]; // touch view to load it
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewA autoPinToTopLayoutGuideOfViewController:viewController withInset:50.0];
    }];
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewA autoPinToTopLayoutGuideOfViewController:viewController withInset:0.0];
    }];
    
    [self assertConstraintIsAddedWithDefaultPriorities:^NSLayoutConstraint *{
        return [weakSelf.viewA autoPinToBottomLayoutGuideOfViewController:viewController withInset:-5.0];
    }];
}

/**
 Test setting the priority of constraints that constrain an array of views.
 */
- (void)testPriorityForConstrainingMultipleViews
{
    DEFINE_WEAK_SELF
    
    [self assertConstraintsAreAddedWithDefaultPriorities:^NSArray *{
        return [weakSelf.viewArray autoAlignViewsToEdge:ALEdgeBottom];
    }];
    
    [self assertConstraintsAreAddedWithDefaultPriorities:^NSArray *{
        return [weakSelf.viewArray autoAlignViewsToAxis:ALAxisVertical];
    }];
    
    [self assertConstraintsAreAddedWithDefaultPriorities:^NSArray *{
        return [weakSelf.viewArray autoMatchViewsDimension:ALDimensionWidth];
    }];
    
    [self assertConstraintsAreAddedWithDefaultPriorities:^NSArray *{
        return [weakSelf.viewArray autoSetViewsDimension:ALDimensionHeight toSize:10.0];
    }];
}

/**
 Test setting the priority of constraints that distribute an array of views.
 */
- (void)testPriorityForDistributingMultipleViews
{
    DEFINE_WEAK_SELF
    
    [self assertConstraintsAreAddedWithDefaultPriorities:^NSArray *{
        return [weakSelf.viewArray autoDistributeViewsAlongAxis:ALAxisHorizontal withFixedSize:25.0 alignment:NSLayoutFormatAlignAllBottom];
    }];
    
    [self assertConstraintsAreAddedWithDefaultPriorities:^NSArray *{
        return [weakSelf.viewArray autoDistributeViewsAlongAxis:ALAxisVertical withFixedSize:5.0 insetSpacing:NO alignment:NSLayoutFormatAlignAllRight];
    }];
    
    [self assertConstraintsAreAddedWithDefaultPriorities:^NSArray *{
        return [weakSelf.viewArray autoDistributeViewsAlongAxis:ALAxisVertical withFixedSpacing:0.0 alignment:NSLayoutFormatAlignAllLeading];
    }];
    
    [self assertConstraintsAreAddedWithDefaultPriorities:^NSArray *{
        return [weakSelf.viewArray autoDistributeViewsAlongAxis:ALAxisHorizontal withFixedSpacing:899.5 insetSpacing:NO alignment:NSLayoutFormatAlignAllCenterY];
    }];
}

@end
