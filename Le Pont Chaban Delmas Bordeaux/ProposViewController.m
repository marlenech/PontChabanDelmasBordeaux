//
//  ProposViewController.m
//  Le Pont Chaban Delmas Bordeaux
//
//  Created by Italik Design on 03/05/2015.
//  Copyright (c) 2015 Italik Design. All rights reserved.
//

#import "ProposViewController.h"
#import "SWRevealViewController.h"

@interface ProposViewController ()

@end

@implementation ProposViewController

-(IBAction)link{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/ItalikDesign"]];
     
}
-(IBAction)noter{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/fr/app/le-pont-chaban-delmas-bordeaux/id663031214?mt=8"]];
    
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
