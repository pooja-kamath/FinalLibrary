//
//  SBDetailViewController.m
//  library management
//
//  Created by Pooja Kamath on 15/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBDetailViewController.h"
#import "SBBook.h"
#import "SBBookManager.h"

@interface SBDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *bookIdLabel;
@property (strong, nonatomic) IBOutlet UILabel *authorLabel;

- (IBAction)okButton:(id)sender;

@property (strong, nonatomic) IBOutlet UISwitch *issueSwitch;
@end

@implementation SBDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _sharedBookManager = [SBBookManager sharedManager];
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //set the background
    UIColor *background = [[[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"stack-of-books.jpg"]]autorelease];
    self.view.backgroundColor = background;

    UIColor *whiteColor = [UIColor whiteColor];
    
    //get the book object that has to be displayed
    SBBook *book=[_sharedBookManager getBookDetail];
    
    //set the label values to the value that has to be displayed
    _titleLabel.text=book.title;
    _bookIdLabel.text=book.bookId;
    _authorLabel.text=book.author;
    _issueSwitch.on=book.issued;
   
    //disable user interaction of the switch
    _issueSwitch.userInteractionEnabled=NO;
    
    //set the background color
    _titleLabel.backgroundColor=whiteColor;
    _bookIdLabel.backgroundColor=whiteColor;
    _authorLabel.backgroundColor=whiteColor;
    
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)okButton:(id)sender
{
    //pop back the view
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)dealloc {
    
    [_titleLabel release];
    [_bookIdLabel release];
    [_authorLabel release];
    [_issueSwitch release];
    [super dealloc];
}

@end
