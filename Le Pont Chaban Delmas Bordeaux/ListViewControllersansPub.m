//
//  ListViewControllersansPub.m
//  Le Pont Chaban Delmas Bordeaux
//
//  Created by Italik Design on 23/04/2017.
//  Copyright © 2017 Italik Design. All rights reserved.
//

#import "ListViewControllersansPub.h"
#import "Parser.h"
#import "SWRevealViewController.h"
#import <OneSignal/OneSignal.h>
#import <iAd/iAd.h>


#import "TableViewCell.h"


@import GoogleMobileAds;

@interface ListViewControllersansPub ()

@property (nonatomic, strong) NSArray *objects;
@property (nonatomic, strong) NSCache *imageCache;


@end

@implementation ListViewControllersansPub

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    self.title = @"Le Pont J. Chaban Delmas";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    
    
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    
    self.imageCache = [[NSCache alloc] init];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [self parse];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.bannerView.superview bringSubviewToFront:self.bannerView];
            
        });
    });
}



- (void)parse
{
    NSURL *url = [NSURL URLWithString:@"http://trouvetou.cluster014.ovh.net/pontchabantest.xml"];
    Parser *parser = [[Parser alloc] initWithContentsOfURL:url];
    parser.rowElementName = @"item";
    parser.elementNames = @[@"title", @"description", @"heure", @"passage", @"link", @"pubDate"];
    [parser parse];
    
    self.objects = parser.items;
    
    
}


- (NSArray *)imagesFromString:(NSString *)string
{
    NSMutableArray *imageUrls = [NSMutableArray array];
    
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(<img\\s[\\s\\S]*?src\\s*?=\\s*?['\"](.*?)['\"][\\s\\S]*?>)+?"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    [regex enumerateMatchesInString:string
                            options:0
                              range:NSMakeRange(0, [string length])
                         usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                             
                             NSString *imgUrlString = [string substringWithRange:[result rangeAtIndex:2]];
                             [imageUrls addObject:[NSURL URLWithString:imgUrlString]];
                         }];
    
    return imageUrls;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_objects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSDictionary *object = _objects[indexPath.row];
    cell.cellTitle.text = object[@"title"];
    cell.cellSubtitle.text = object[@"description"];
    cell.cellHeure.text = object[@"heure"];
    cell.cellPassage.text = object[@"passage"];
    
    UIView* shadowView = [cell viewWithTag:99];
    shadowView.backgroundColor=[UIColor whiteColor];
    [shadowView.layer setCornerRadius:5.0f];
    [shadowView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [shadowView.layer setBorderWidth:0.2f];
    [shadowView.layer setShadowColor:[UIColor colorWithRed:225.0/255.0 green:228.0/255.0 blue:228.0/255.0 alpha:1.0].CGColor];
    
    [shadowView.layer setShadowOpacity:1.0];
    [shadowView.layer setShadowRadius:5.0];
    [shadowView.layer setShadowOffset:CGSizeMake(5.0f, 5.0f)];
    
    shadowView.layer.rasterizationScale = [[UIScreen mainScreen] scale]; // to define retina or not
    
    
    cell.cellImageView.image = nil;
    [self tableView:tableView updateImageForCell:cell indexPath:indexPath];
    
    return cell;
    
    
    
    
    
    
}

// It's probably better to use a `UIImageView` category, such as provided by `SDWebImage` or
// `AFNetworking`, which does all of this, but I was reluctant to add third party libraries
// to this project which is focusing on XML Parsing.

- (void)tableView:(UITableView *)tableView updateImageForCell:(TableViewCell *)cell indexPath:(NSIndexPath *)indexPath
{
    NSDictionary *object = _objects[indexPath.row];
    
    NSArray *imageUrls = [self imagesFromString:object[@"description"]];
    
    if ([imageUrls count] > 0)
    {
        NSURL *url = imageUrls[0];
        UIImage *image = [self.imageCache objectForKey:[url absoluteString]];
        if (image)
        {
            cell.cellImageView.image = image;
        }
        else
        {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSData *data = [NSData dataWithContentsOfURL:imageUrls[0]];
                UIImage *image = [UIImage imageWithData:data];
                if (!image) return;
                
                [self.imageCache setObject:image forKey:[url absoluteString]];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    TableViewCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];
                    if (updateCell)
                    {
                        updateCell.cellImageView.image = image;
                        
                    }
                });
            });
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
