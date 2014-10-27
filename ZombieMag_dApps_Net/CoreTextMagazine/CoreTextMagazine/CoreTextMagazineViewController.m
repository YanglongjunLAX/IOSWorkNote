#import "CoreTextMagazineViewController.h"
#import "CTView.h"
#import "MarkupParser.h"

@implementation CoreTextMagazineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"zombies" ofType:@"txt"];
    NSString* text = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    MarkupParser* p = [[[MarkupParser alloc] init] autorelease];
    NSAttributedString* attString = [p attrStringFromMarkup: text];
    [(CTView *)[self view] setAttString:attString withImages: p.images];
    [(CTView *)[self view] buildFrames];
}

@end