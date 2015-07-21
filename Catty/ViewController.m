#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueBar;
@property (weak, nonatomic) IBOutlet UIView *purpleBar;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self scheduleBlue];
    [self schedulePurple];
}

#pragma mark - private

- (void)scheduleBlue {
    [self performSelector:@selector(executeBlue) withObject:nil afterDelay:5.0];
}

- (void)schedulePurple {
    [self performSelector:@selector(executePurple) withObject:nil afterDelay:1.0];
}

- (void)executeBlue {
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.blueBar.hidden = !self.blueBar.hidden;
                     }
                     completion:^(BOOL finished) {
                         [self scheduleBlue];
                     }];
}

- (void)executePurple {
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.purpleBar.hidden = !self.purpleBar.hidden;
                     }
                     completion:^(BOOL finished) {
                         [self schedulePurple];
                     }];
}

@end
