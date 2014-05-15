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
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;

@property (retain, nonatomic) IBOutlet UILabel *bookIdLabel;
@property (retain, nonatomic) IBOutlet UILabel *authorLabel;

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
    
    SBBook *book=[_sharedManager getBookDetail];
    _titleLabel.text=book.title;
    _bookIdLabel.text=book.bookId;
    _authorLabel.text=book.author;
  
    if(book.issued==YES)
    {
        NSLog(@"%d",book.issued);
        _issueSwitch.on=YES;
    }
    
 else
    {
        NSLog(@"%d",book.issued);
        _issueSwitch.on=NO;
    }

   
    
}
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    //initData
    
    
    
    [self.view reloadInputViews];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_titleLabel release];
    [_bookIdLabel release];
    [_authorLabel release];
    
    [_issueSwitch release];
    [super dealloc];
}
- (IBAction)okButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
