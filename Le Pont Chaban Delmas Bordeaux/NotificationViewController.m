//
//  NotificationViewController.m
//  Le Pont Chaban Delmas Bordeaux
//
//  Created by Italik Design on 03/05/2015.
//  Copyright (c) 2015 Italik Design. All rights reserved.
//

#import "NotificationViewController.h"
#import "SWRevealViewController.h"
#import <OneSignal/OneSignal.h>

@import GoogleMobileAds;

@interface NotificationViewController ()


@end

@implementation NotificationViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"Les Notifications";
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    //Switch 06h30 à 09h30
    
    if ([standardDefaults objectForKey:@"switchKey"] == nil){
        self.premier.on = [standardDefaults boolForKey:@"switchKey"];
        self.premier.on = true;
        [OneSignal sendTag:@"0630a0930" value:@"0630a0930"];
        [OneSignal deleteTag:@"aucun" ];
        self.switchText.text=@"Vous recevez les notifications des levées situées entre 06h30 et 09h30, ainsi que toutes les modifications de dernière minute en temps réel.";}
    
    
    else if ([standardDefaults boolForKey:@"switchKey"]) {
        self.premier.on = [standardDefaults boolForKey:@"switchKey"];
        self.switchText.text=@"Vous recevez les notifications des levées situées entre 06h30 et 09h30, ainsi que toutes les modifications de dernière minute en temps réel.";}
    
    else {
        
        self.premier.on = false;
        [OneSignal deleteTag:@"0630a0930" ];
        self.switchText.text=@"Vous ne recevez pas les notifications des levées situées entre 06h30 et 09h30.";
        
    }
    
    
    
    //Switch 09h30 à 16h30
    
    
    
    if ([standardDefaults objectForKey:@"switchKey2"] == nil){
        self.deuxieme.on = [standardDefaults boolForKey:@"switchKey2"];
        self.deuxieme.on = true;
        [OneSignal sendTag:@"0930a1630" value:@"0930a1630"];
        [OneSignal deleteTag:@"aucun" ];
        self.switchText2.text=@"Vous recevez les notifications des levées situées entre 09h30 et 16h30, ainsi que toutes les modifications de dernière minute en temps réel.";}
    
    
    else if ([standardDefaults boolForKey:@"switchKey2"]) {
        self.deuxieme.on = [standardDefaults boolForKey:@"switchKey2"];
        self.switchText2.text=@"Vous recevez les notifications des levées situées entre 09h30 et 16h30, ainsi que toutes les modifications de dernière minute en temps réel.";}
    else {
        
        self.deuxieme.on = false;
        [OneSignal deleteTag:@"0930a1630" ];
        self.switchText2.text=@"Vous ne recevez pas les notifications des levées situées entre 09h30 et 16h30.";
        
    }
    
    //Switch 16h30 à 19h30
    
    
    if ([standardDefaults objectForKey:@"switchKey3"] == nil){
        self.troisieme.on = [standardDefaults boolForKey:@"switchKey3"];
        self.troisieme.on = true;
        [OneSignal sendTag:@"1630a1930" value:@"1630a1930"];
        [OneSignal deleteTag:@"aucun" ];
        self.switchText3.text=@"Vous recevez les notifications des levées situées entre 16h30 et 19h30, ainsi que toutes les modifications de dernière minute en temps réel.";}
    
    
    else if ([standardDefaults boolForKey:@"switchKey3"]) {
        self.troisieme.on = [standardDefaults boolForKey:@"switchKey3"];
        self.switchText3.text=@"Vous recevez les notifications des levées situées entre 16h30 et 19h30, ainsi que toutes les modifications de dernière minute en temps réel.";}
    
    else {
        
        self.troisieme.on = false;
        [OneSignal deleteTag:@"1630a1930" ];
        self.switchText3.text=@"Vous ne recevez pas les notifications des levées situées entre 16h30 et 19h30.";
        
    }
    
    //Switch 19h30 à 06h30
    
    
    if ([standardDefaults objectForKey:@"switchKey4"] == nil){
        self.quatrieme.on = [standardDefaults boolForKey:@"switchKey4"];
        self.quatrieme.on = true;
        [OneSignal sendTag:@"1930a0630" value:@"1930a0630"];
        [OneSignal deleteTag:@"aucun" ];
        self.switchText4.text=@"Vous recevez les notifications des levées situées entre 19h30 et 06h30, ainsi que toutes les modifications de dernière minute en temps réel.";}
    
    
    else if ([standardDefaults boolForKey:@"switchKey4"]) {
        self.quatrieme.on = [standardDefaults boolForKey:@"switchKey4"];
        self.switchText4.text=@"Vous recevez les notifications des levées situées entre 19h30 et 06h30, ainsi que toutes les modifications de dernière minute en temps réel.";}
    
    else {
        
        self.quatrieme.on = false;
        [OneSignal deleteTag:@"1930a0630" ];
        self.switchText4.text=@"Vous ne recevez pas les notifications des levées situées entre 19h30 et 06h30.";
        
    }
    
    //Switch week-end + jours fériés
    
    
    if ([standardDefaults objectForKey:@"switchKey5"] == nil){
        self.cinquieme.on = [standardDefaults boolForKey:@"switchKey5"];
        self.cinquieme.on = true;
        [OneSignal sendTag:@"weekend" value:@"weekend"];
        [OneSignal deleteTag:@"aucun" ];
        self.switchText5.text=@"Vous recevez les notifications des levées des week-ends et jours fériés, ainsi que toutes les modifications de dernière minute en temps réel.";}
    
    
    else if ([standardDefaults boolForKey:@"switchKey5"]) {
        self.cinquieme.on = [standardDefaults boolForKey:@"switchKey5"];
        self.switchText5.text=@"Vous recevez les notifications des levées des week-ends et jours fériés, ainsi que toutes les modifications de dernière minute en temps réel.";}
    else {
        
        self.cinquieme.on = false;
        [OneSignal deleteTag:@"weekend" ];
        self.switchText5.text=@"Vous ne recevez pas les notifications des levées des week-ends et jours fériés.";
        
    }
    
    
    
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

//de 06h30 à 09h30

- (IBAction)saveSwitch:(UISwitch *)sender {
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([self.premier isOn]) {
        [standardDefaults setBool:YES forKey:@"switchKey"];
        [OneSignal sendTag:@"0630a0930" value:@"0630a0930"];
        [OneSignal deleteTag:@"aucun" ];
        self.switchText.text=@"Vous recevez les notifications des levées situées entre 06h30 et 09h30, ainsi que toutes les modifications de dernière minute en temps réel.";
        
        
        
    } else {
        
        [standardDefaults setBool:NO forKey:@"switchKey"];
        [OneSignal deleteTag:@"0630a0930" ];
        [OneSignal sendTag:@"aucun" value:@"aucun"];
        self.switchText.text=@"Vous ne recevez pas les notifications des levées situées entre 06h30 et 09h30.";
        
    }
    
    [standardDefaults synchronize];
    
}


//09h30 à 16h30

- (IBAction)saveSwitch2:(UISwitch *)sender {
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([self.deuxieme isOn]) {
        [standardDefaults setBool:YES forKey:@"switchKey2"];
        [OneSignal sendTag:@"0930a1630" value:@"0930a1630"];
        [OneSignal deleteTag:@"aucun" ];
        self.switchText2.text=@"Vous recevez les notifications des levées situées entre 09h30 et 16h30, ainsi que toutes les modifications de dernière minute en temps réel.";
        
        
        
    } else {
        
        [standardDefaults setBool:NO forKey:@"switchKey2"];
        [OneSignal deleteTag:@"0930a1630" ];
        [OneSignal sendTag:@"aucun" value:@"aucun"];
        self.switchText2.text=@"Vous ne recevez pas les notifications des levées situées entre 09h30 et 16h30.";
        
    }
    
    
    [standardDefaults synchronize];
    
}

//16h30 à 19h30

- (IBAction)saveSwitch3:(UISwitch *)sender {
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([self.troisieme isOn]) {
        [standardDefaults setBool:YES forKey:@"switchKey3"];
        [OneSignal sendTag:@"1630a1930" value:@"1630a1930"];
        [OneSignal deleteTag:@"aucun" ];
        self.switchText3.text=@"Vous recevez les notifications des levées situées entre 16h30 et 19h30, ainsi que toutes les modifications de dernière minute en temps réel.";
        
        
        
    } else {
        
        [standardDefaults setBool:NO forKey:@"switchKey3"];
        [OneSignal deleteTag:@"1630a1930" ];
        [OneSignal sendTag:@"aucun" value:@"aucun"];
        self.switchText3.text=@"Vous ne recevez pas les notifications des levées situées entre 16h30 et 19h30.";
        
    }
    
    
    [standardDefaults synchronize];
    
}

//19h30 à 06h30

- (IBAction)saveSwitch4:(UISwitch *)sender {
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([self.quatrieme isOn]) {
        [standardDefaults setBool:YES forKey:@"switchKey4"];
        [OneSignal sendTag:@"1930a0630" value:@"1930a0630"];
        [OneSignal deleteTag:@"aucun" ];
        self.switchText4.text=@"Vous recevez les notifications des levées situées entre 19h30 et 06h30, ainsi que toutes les modifications de dernière minute en temps réel.";
        
        
        
    } else {
        
        [standardDefaults setBool:NO forKey:@"switchKey4"];
        [OneSignal deleteTag:@"1930a0630" ];
        [OneSignal sendTag:@"aucun" value:@"aucun"];
        self.switchText4.text=@"Vous ne recevez pas les notifications des levées situées entre 19h30 et 06h30.";
        
    }
    
    
    [standardDefaults synchronize];
    
}

//weekend et jours fériés

- (IBAction)saveSwitch5:(UISwitch *)sender {
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([self.cinquieme isOn]) {
        [standardDefaults setBool:YES forKey:@"switchKey5"];
        [OneSignal sendTag:@"weekend" value:@"weekend"];
        [OneSignal deleteTag:@"aucun" ];
        self.switchText5.text=@"Vous recevez les notifications des levées des week-ends et jours fériés, ainsi que toutes les modifications de dernière minute en temps réel.";
        
        
        
    } else {
        
        [standardDefaults setBool:NO forKey:@"switchKey5"];
        [OneSignal deleteTag:@"weekend" ];
        [OneSignal sendTag:@"aucun" value:@"aucun"];
        self.switchText5.text=@"Vous ne recevez pas les notifications des levées des week-ends et jours fériés.";
        
    }
    
    
    [standardDefaults synchronize];
    
}




- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.y > 60) {
        [scrollView setContentOffset:CGPointMake(0, 60)];
    }
}


@end
