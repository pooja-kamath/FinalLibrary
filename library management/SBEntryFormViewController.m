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

@property (strong, nonatomic) IBOutlet UITextField *titleText;
@property (strong, nonatomic) IBOutlet UITextField *bookIdText;

@property (strong, nonatomic) IBOutlet UITextField *authorText;
@property (retain, nonatomic) IBOutlet UISwitch *issueSwitch;
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
    
    
    
    UIColor *background = [[[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"stack-of-books.jpg"]]autorelease];
    self.view.backgroundColor = background;
    
    //set the text field delegate to self
    _bookIdText.delegate = self;
    _authorText.delegate=self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)AddButton:(id)sender {
    
             [_sharedManager addBookwithTitle:_titleText.text bookId:_bookIdText.text author:_authorText.text andIssued:_issueSwitch.on];
         UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book has been added" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
         [alert show];
         [alert release];
         
         [self.navigationController popViewControllerAnimated:YES];
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField ==_bookIdText)
    {
         //if the text field is empty then the text should change
        if ([string isEqualToString:@""]) return YES;
        {
            //if the length is less than 4 text should change
            if ((_bookIdText.text).length <4)
           {
               return YES;
            
            }
         //text is greater than four text field should not change
              else
          {
             return NO;
          }
    }
    return YES;
    }
    
    if(textField ==_authorText)
    {
        
        //if the text field is empty then the text should change

        if ([string isEqualToString:@""]) return YES;
            unichar c = [string characterAtIndex:0];
        
        //if numbers are not entered then text should change
            if (![[NSCharacterSet decimalDigitCharacterSet] characterIsMember:c])
            {
                return YES;
            }
            else
            {
                return NO;
            }
        
        
        return YES;
    }
    
      
    
    return YES;
}


- (void)dealloc {
    
    [_titleText release];
    [_bookIdText release];
        [_authorText release];
    [_issueSwitch release];
    [super dealloc];
}

@end
