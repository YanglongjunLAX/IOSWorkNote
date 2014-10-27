//
//  FlipsideViewController.h
//  WhereAmI
//
//  Created by tony on 11-8-29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h> 
#import <MapKit/MapKit.h>
#import "MapLocation.h"

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController<MKMapViewDelegate,MKReverseGeocoderDelegate> {
	id <FlipsideViewControllerDelegate> delegate;
	CLLocation *lastLocation;
	IBOutlet MKMapView   *mapView;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
@property (nonatomic, retain) CLLocation *lastLocation;
@property (nonatomic, retain)  MKMapView *mapView;

- (IBAction)done:(id)sender;
- (IBAction)search:(id)sender;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

