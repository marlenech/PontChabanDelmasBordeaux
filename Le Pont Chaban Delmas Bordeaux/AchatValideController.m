//
//  AchatValideController.m
//  PontsBordeaux
//
//  Created by Italik Design on 12/04/2017.
//  Copyright © 2017 italikdesign. All rights reserved.
//

#import "AchatValideController.h"
#import "SWRevealViewController.h"

@interface AchatValideController ()

@end

@implementation AchatValideController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.title = @"Suppression Publicité";
    
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
