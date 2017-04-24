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

#define URLEMail @"mailto:italikdesignbordeaux@gmail.com?subject=title&body=content"

-(IBAction)mail{
    NSString *url = [URLEMail stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
    [[UIApplication sharedApplication]  openURL: [NSURL URLWithString: url]];
    
    
}


-(IBAction)link{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/marlenech/PontChabanDelmas/blob/master/licence"]];
    
}
-(IBAction)noter{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/fr/app/le-pont-chaban-delmas-bordeaux/id663031214?mt=8"]];
    
}

-(IBAction)paquebots{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.BordeauxPaquebots.com"]];
    
}

-(IBAction)bordeaux{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://sedeplacer.bordeaux-metropole.fr/Toutes-les-infos-circulation/Pont-Chaban-Delmas-Fermetures"]];
    
}
-(IBAction)twitter{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/SebD333"]];
    
}
-(IBAction)data{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://data.bordeaux-metropole.fr"]];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.title = @"A Propos";
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.y > 60) {
        [scrollView setContentOffset:CGPointMake(0, 60)];
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
