//inside CTColumnView.h

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface CTColumnView : UIView {
    id ctFrame;
    NSMutableArray* images;
}

@property (retain, nonatomic) NSMutableArray* images;

-(void)setCTFrame:(id)f;

@end
