//
//  LienViewController.m
//  Le Pont Chaban Delmas Bordeaux
//
//  Created by Italik Design on 02/05/2015.
//  Copyright (c) 2015 Italik Design. All rights reserved.
//

#import "LienViewController.h"
#import "SWRevealViewController.h"

@interface LienViewController ()

@end

@implementation LienViewController

-(IBAction)paquebots{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.BordeauxPaquebots.com"]];
    
}

-(IBAction)bordeaux{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.bordeaux-metropole.fr/circulation/pont-chaban-delmas-previsions-de-fermetures-a-la-circulation"]];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
