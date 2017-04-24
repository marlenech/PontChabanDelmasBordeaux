//
//  ProposViewController.h
//  Le Pont Chaban Delmas Bordeaux
//
//  Created by Italik Design on 03/05/2015.
//  Copyright (c) 2015 Italik Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProposViewController : UIViewController

-(IBAction)link;
-(IBAction)noter;
-(IBAction)mail;
-(IBAction)paquebots;
-(IBAction)bordeaux;
-(IBAction)twitter;
-(IBAction)data;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
