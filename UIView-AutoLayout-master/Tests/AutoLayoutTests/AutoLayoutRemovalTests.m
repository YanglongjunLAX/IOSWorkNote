//
//  AutoLayoutRemovalTests.m
//  UIView+AutoLayout Tests
//
//  Copyright (c) 2014 Tyler Fox
//  https://github.com/smileyborg/UIView-AutoLayout
//

#import "AutoLayoutTestBase.h"

@interface AutoLayoutRemovalTests : AutoLayoutTestBase

@end

@implementation AutoLayoutRemovalTests

- (void)setUp
{
    [super setUp];

}

- (void)tearDown
{

    [super tearDown];
}

/**
 Test the +[removeConstraint:] method on UIView.
 Test the case where we're removing a constraint that was added to the closest common superview of the two views it
 constrains.
 */
- (void)testRemoveConstraint
{
    [self.viewA autoCenterInSuperview];
    
    NSUInteger constraintsCount = [self.viewA.superview.constraints count];
    XCTAssert(constraintsCount > 0, @"viewA's superview should have constraints added to it.");
    
    [UIView autoRemoveConstraint:self.viewA.superview.constraints[0]];
    NSUInteger newConstraintsCount = [self.viewA.superview.constraints count];
    XCTAssert(constraintsCount - newConstraintsCount == 1, @"viewA's superview should have one less constraint on it.");
    
    [self.viewB removeFromSuperview];
    [self.viewA addSubview:self.viewB];
    
    [self.viewB autoCenterInSuperview];
}

/**
 Test the +[removeConstraint:] method on UIView.
 Test the case where we're removing a constraint that only applies to one view.
 */
- (void)testRemoveConstraintFromSingleView
{
    NSLayoutConstraint *constraint = [self.viewA autoSetDimension:ALDimensionWidth toSize:10.0];
    
    NSUInteger constraintsCount = [self.viewA.constraints count];
    XCTAssert(constraintsCount > 0, @"viewA should have a constraint added to it.");
    
    [UIView autoRemoveConstraint:constraint];
    NSUInteger newConstraintsCount = [self.viewA.constraints count];
    XCTAssert(constraintsCount - newConstraintsCount == 1, @"viewA should have one less constraint on it.");
}

/**
 Test the +[removeConstraint:] method on UIView.
 Test the case where we're removing a constraint that was added to a view that is not the closest common superview of
 the two views it constrains.
 */
- (void)testRemoveConstraintFromNotImmediateSuperview
{
    [self.viewC removeFromSuperview];
    [self.viewB removeFromSuperview];
    [self.viewA addSubview:self.viewB];
    [self.viewB addSubview:self.viewC];
    
    NSLayoutConstraint *constraint = [self.viewC autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.viewB removeConstraint:constraint];
    [self.containerView addConstraint:constraint];
    
    NSUInteger constraintsCount = [self.containerView.constraints count];
    XCTAssert(constraintsCount > 0, @"containerView should have a constraint added to it.");
    
    [UIView autoRemoveConstraint:constraint];
    NSUInteger newConstraintsCount = [self.containerView.constraints count];
    XCTAssert(constraintsCount - newConstraintsCount == 1, @"containerView should have one less constraint on it.");
}

/**
 Test the +[removeConstraints:] method on UIView.
 */
- (void)testRemoveConstraints
{
    NSArray *constraints = [@[self.viewA, self.viewB, self.viewC, self.viewD] autoDistributeViewsAlongAxis:ALAxisHorizontal withFixedSize:10.0 alignment:NSLayoutFormatAlignAllCenterY];
    
    NSUInteger constraintsCount = [self.containerView.constraints count];
    XCTAssert(constraintsCount > 0, @"containerView should have constraints added to it.");
    
    [UIView autoRemoveConstraints:constraints];
    NSUInteger newConstraintsCount = [self.containerView.constraints count];
    XCTAssert(newConstraintsCount == 0, @"containerView should have no constraints on it.");
}

/**
 Test the -[autoRemove] method on NSLayoutConstraint.
 */
- (void)testRemove
{
    NSLayoutConstraint *constraint = [self.containerView autoSetDimension:ALDimensionHeight toSize:0.0];
    
    NSUInteger constraintsCount = [self.containerView.constraints count];
    XCTAssert(constraintsCount > 0, @"containerView should have a constraint added to it.");
    
    [constraint autoRemove];
    NSUInteger newConstraintsCount = [self.containerView.constraints count];
    XCTAssert(constraintsCount - newConstraintsCount == 1, @"containerView should have one less constraint on it.");
}

@end
