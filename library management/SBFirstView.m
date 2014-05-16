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
         _sharedManger = [SBBookManager sharedManager];
        

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
    
    
    //create a bar button
    UIBarButtonItem* infoButton = [[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)]autorelease];
    self.navigationItem.rightBarButtonItem = infoButton;
    self.navigationItem.hidesBackButton = YES;

    //get the list of book titles to display
    _booklist=[_sharedManger getCellText];
    


    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    indexPath=indexPath;
    //deque reuseable cells
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    SBTableViewCell *cell = [table dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[SBTableViewCell alloc]initWithTitle:[_booklist objectAtIndex:indexPath.row]] ;
    }
    
    cell.delegate=self;
//    [cell getCellWithIndexPath:indexPath];
//    //cell.textLabel.text=[_booklist objectAtIndex:indexPath.row];
   
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
    return [_booklist count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    //get the data to be displayed
    
    _booklist=[_sharedManger getCellText];
    
    //reload the table view after a new book is added
    [self.table reloadData];
    
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
    //delegate to set the value of indexpath in the controller
    [_sharedManger setIndex:indexPath.row];
    
    //push the detail view
    SBDetailViewController *detailView=[[SBDetailViewController alloc]initWithNibName:@"SBDetailViewController" bundle:nil];
    [self.navigationController pushViewController:detailView animated:YES];
    [detailView release];
    
    
}
-(void)issue:(UIButton*)sender
{
    //set the  index value
    [_sharedManger setIndex:_indexPath.row];
    
    
    //call the delegate to issue book
    [_sharedManger bookIssued];
    
    //display alert that book has been issued
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book has been issued" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    [alert release];
}
-(void)returns:(UIButton*)sender
{
    //set the index value
    [_sharedManger setIndex:_indexPath.row];
    
    //call the delegate to return book
    [_sharedManger bookReturned];
    
    //display alert that book has been returned
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book has been returned" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    [alert release];
}

- (void)dealloc {
   
    [_table release];
    [super dealloc];
}
@end
