//
//  SBEntryFormViewController.m
//  library management
//
//  Created by Pooja Kamath on 15/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBEntryFormViewController.h"
#import "SBBookManager.h"


@interface SBEntryFormViewController ()

@property (retain, nonatomic) IBOutlet UITextField *titleText;
@property (retain, nonatomic) IBOutlet UITextField *bookIdText;

@property (retain, nonatomic) IBOutlet UITextField *authorText;

@property (retain, nonatomic) IBOutlet UITextField *issuedText;
- (IBAction)AddButton:(id)sender;

@end

@implementation SBEntryFormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _sharedManager = [SBBookManager sharedManager];
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    [_titleText release];
    [_bookIdText release];
    [_issuedText release];
    [_authorText release];
    [super dealloc];
}
- (IBAction)AddButton:(id)sender {
    
    
     if([_issuedText.text isEqual:@"yes"]||[_issuedText.text isEqual:@"YES"])
     {
    
         [_sharedManager addBookwithTitle:_titleText.text bookId:_bookIdText.text author:_authorText.text andIssued:YES];
         UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book has been added" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
         [alert show];
         [alert release];
         
         [self.navigationController popViewControllerAnimated:YES];
     }
    else if([_issuedText.text isEqual:@"no"]||[_issuedText.text isEqual:@"NO"])
    {
        [_sharedManager addBookwithTitle:_titleText.text bookId:_bookIdText.text author:_authorText.text andIssued:NO];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book has been added" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        [alert release];
        
        [self.navigationController popViewControllerAnimated:YES];

    }
    
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"enter YES or NO" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        [alert release];
        
    }

    
}

@end
