//
//  SBFirstView.m
//  library management
//
//  Created by Pooja Kamath on 15/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBFirstView.h"
#import "SBBookManager.h"
#import "SBEntryFormViewController.h"
#import "SBDetailViewController.h"
#import "SBTableViewCell.h"
@interface SBFirstView ()

@property (strong, nonatomic) IBOutlet UITableView *table;

@end

@implementation SBFirstView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        //initialize shared manager
         _sharedBookManager = [SBBookManager sharedManager];
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //create a bar button
    UIBarButtonItem* infoButton = [[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)]autorelease];
    self.navigationItem.rightBarButtonItem = infoButton;
   
  
    //get the array of book titles to display
    _booklist=[_sharedBookManager getCellText];
   
       
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    //deque reuseable cells
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    SBTableViewCell *cell = [table dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        
        cell = [[[SBTableViewCell alloc]initWithTitle:[_booklist objectAtIndex:indexPath.row]]autorelease] ;
        
    }
    
    //assign self as the delegate of the cell
    cell.delegate=self;
    return cell;
    
}
-(void)add
{
    //push the entry form view to add books
    SBEntryFormViewController *form=[[SBEntryFormViewController alloc]initWithNibName:@"SBEntryFormViewController" bundle:nil];
    [self.navigationController pushViewController:form animated:YES];
    [form release];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return  count of books added 
    return [_booklist count];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}


- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    //get the data to be displayed
    
    _booklist=[_sharedBookManager getCellText];
    
    //reload the table view after a new book is added
    [self.table reloadData];
    
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
    //method to set the value of indexpath in the controller
    [_sharedBookManager setIndex:indexPath.row];
    
    //push the detail view
    SBDetailViewController *detailView=[[SBDetailViewController alloc]initWithNibName:@"SBDetailViewController" bundle:nil];
    [self.navigationController pushViewController:detailView animated:YES];
    [detailView release];
    
    
}
-(void)issue:(UIButton*)sender
{
    NSIndexPath *indexValue;
    
    //get the index value based on position of the button in the table
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.table];
    indexValue = [self.table indexPathForRowAtPoint:buttonPosition];
    
    //set the  index value
   [_sharedBookManager setIndex:indexValue.row];
    
    
    
    //call the method to issue book
    [_sharedBookManager bookIssued];
    
    //display alert that book has been issued
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book is issued" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    [alert release];
    
}

-(void)returns:(UIButton*)sender
{
    
    NSIndexPath *indexValue;
    
    //get the index value based on the position of the button in the table
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.table];
    indexValue = [self.table indexPathForRowAtPoint:buttonPosition];
    
    //set the index value
    [_sharedBookManager setIndex:indexValue.row];
    
    //call the method to return book
    [_sharedBookManager bookReturned];
    
    //display alert that book has been returned
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book has been returned" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    [alert release];
   
    
}



- (void)dealloc {
   
    
    [_booklist release];
    _booklist=nil;
   
       [super dealloc];
}
@end
