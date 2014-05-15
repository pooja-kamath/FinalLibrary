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
@interface SBFirstView ()

@property (retain, nonatomic) IBOutlet UITableView *table;

@end

@implementation SBFirstView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         _sharedManger = [SBBookManager sharedManager];
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    UIBarButtonItem* infoButton = [[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)]autorelease];
    self.navigationItem.rightBarButtonItem = infoButton;
    self.navigationItem.hidesBackButton = YES;

    
    _booklist=[_sharedManger getCellText];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //set the background
    UIColor *background = [[[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"stack-of-books.jpg"]]autorelease];
    
    //deque reuseable cells
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier]autorelease] ;
    }
    
    //set the cell text label with  book names stored in booklist
    cell.textLabel.text =[_booklist objectAtIndex:indexPath.row];
    
    UIColor *clr = [UIColor colorWithRed:0.89f green:0.81f blue:0.87f alpha:1];
    UIButton *issueButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    issueButton.frame = CGRectMake(160.0f, 10.0f, 45.0f, 25.0f);
    issueButton.backgroundColor=clr;
    [issueButton setTitle:@"Issue" forState:UIControlStateNormal];
    
    //set the button tag with index value
    issueButton.tag=indexPath.row;
    
    //action of the  issue button
    [issueButton addTarget:self action:@selector(issue:) forControlEvents:UIControlEventTouchUpInside];
    
    //add button to the table view cell
    [cell addSubview:issueButton ];
    
    //create a uibutton to return book
    UIButton *returnButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    returnButton.frame = CGRectMake(225.0f, 10.0f, 50.0f, 25.0f);
    returnButton.backgroundColor=clr;
    [returnButton setTitle:@"Return" forState:UIControlStateNormal];
    
    //set the button tag with index value
    returnButton.tag=indexPath.row;
    
    //action of the  issue button
   [returnButton addTarget:self action:@selector(returns:) forControlEvents:UIControlEventTouchUpInside];
    
    //add button to the table view cell
    [cell addSubview:returnButton ];
    
    //set background od table and cell
    table.backgroundColor = background;
    cell.backgroundColor=[UIColor clearColor];
    
    //set a accessory button to display details
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    //return cell
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
    
    //initData
    
    _booklist=[_sharedManger getCellText];
    
    [self.table reloadData];
    
}
-(void)issue:(UIButton*)sender
{
    
    
    [_sharedManger setIndex:sender.tag];

    
    //call the delegate to issue book
    [_sharedManger bookIssued];
    
    //display alert that book has been issued
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book has been issued" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    [alert release];
}
-(void)returns:(UIButton*)sender
{
    
    [_sharedManger setIndex:sender.tag];
    
    //call the delegate to return book
    [_sharedManger bookReturned];
    
    //display alert that book has been returned
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book has been returned" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    [alert release];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     [_sharedManger setIndex:indexPath.row];
}

- (void)dealloc {
   
    [_table release];
    [super dealloc];
}
@end
