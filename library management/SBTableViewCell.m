//
//  SBTableViewCell.m
//  library management
//
//  Created by Pooja Kamath on 16/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBTableViewCell.h"

@implementation SBTableViewCell
@synthesize booklist;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
                 
       
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithTitle:(NSString*) title
{
    
    self.textLabel.text =title;
    UIColor *clr = [UIColor colorWithRed:0.89f green:0.81f blue:0.87f alpha:1];
    UIButton *issueButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    issueButton.frame = CGRectMake(160.0f, 10.0f, 45.0f, 25.0f);
    issueButton.backgroundColor=clr;
    [issueButton setTitle:@"Issue" forState:UIControlStateNormal];
    
//    //set the button tag with index value
//    issueButton.tag=indexPath.row;
    
    //action of the  issue button
   [issueButton addTarget:self action:@selector(issue:) forControlEvents:UIControlEventTouchUpInside];
    
    //add button to the table view cell
    [self addSubview:issueButton ];
    
    //create a uibutton to return book
    UIButton *returnButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    returnButton.frame = CGRectMake(225.0f, 10.0f, 50.0f, 25.0f);
    returnButton.backgroundColor=clr;
    [returnButton setTitle:@"Return" forState:UIControlStateNormal];
    
//    //set the button tag with index value
//    returnButton.tag=indexPath.row;
//    
    //action of the  issue button
    [returnButton addTarget:self action:@selector(returns:) forControlEvents:UIControlEventTouchUpInside];
    
    //add button to the table view cell
    [self addSubview:returnButton ];
    
    //set background od table and cell
   
    self.backgroundColor=[UIColor clearColor];
    
    //set a accessory button to display details
    self.accessoryType = UITableViewCellAccessoryDetailButton;
    
    //return cell
    return self;

    
}
-(void)issue:(UIButton*)sender
{
    [_delegate issue:sender];
    
    
}
-(void)returns:(UIButton*)sender
{
    
    [_delegate returns:sender];
}


@end
