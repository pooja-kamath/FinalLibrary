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

@property (retain, nonatomic) IBOutlet UISwitch *issueSwitch;
@end

@implementation SBDetailViewController

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
    
    
//    UIColor *background = [[[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"stack-of-books.jpg"]]autorelease];
//    self.view.backgroundColor = background;
    
    //get the book object that has to be displayed
    SBBook *book=[_sharedManager getBookDetail];
    
    //set the label values to the value that has to be displayed
    _titleLabel.text=book.title;
    _bookIdLabel.text=book.bookId;
    _authorLabel.text=book.author;
    _issueSwitch.on=book.issued;
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)okButton:(id)sender {
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
