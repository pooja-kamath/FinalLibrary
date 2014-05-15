//
//  SBBookManager.m
//  library management
//
//  Created by Pooja Kamath on 15/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBBookManager.h"
#import "SBBook.h"

@implementation SBBookManager

@synthesize count;
@synthesize bookIndex;
@synthesize bookArray;

+ (id)sharedManager {
    static SBBookManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedMyManager = [[self alloc] init];
        
        
    });
    return sharedMyManager;
}
- (id)init
{
    self = [super init];
    if (self) {
        bookArray=[[NSMutableArray alloc]init];

    }
    return self;
}

-(void)addBookwithTitle:(NSString *)title bookId:(NSString*)bid author:(NSString*)author andIssued:(BOOL)issued
{
    
    
    //increment book count each time a book is added
    count++;
    
    NSLog(@"delegate is called");
    
    //create a book object with the values passed
    SBBook * book =[[SBBook alloc]init];
    book.title=title;
    book.bookId=bid;
    book.author=author;
    book.issued=issued;
    
    //add the book created to the array
    [bookArray addObject:book];
    NSLog(@"%@",title);
    [book release];
    
    
}

-(NSArray *)getCellText
{
    //create a array to store the names of the book object
    NSMutableArray  *bookList=[[[NSMutableArray alloc]init]autorelease];
    
    //extract name of each book object and store it in the array
    for(int i=0;i<count;i++)
    {
        
        NSString *bookNames=@"";
        SBBook *book1=[bookArray objectAtIndex:i];
        bookNames=book1.title;
        [bookList addObject:bookNames];
        
    }
    
    //return the array of book names
    return bookList;

    
}
-(void)setIndex:(NSInteger )indexpath
{
    //get the index value of the selected row
   bookIndex=indexpath;
}

-(void)bookIssued
{
    
    NSLog(@"in issue");
    SBBook *b=[bookArray objectAtIndex:bookIndex];
    b.issued=YES;
    
    
    
}
-(void)bookReturned
{
    
    NSLog(@"in return");
    
    SBBook *b=[bookArray objectAtIndex:bookIndex];
    b.issued=NO;
    
}
-(SBBook *)getBookDetail
{
    NSLog(@"indx= %ld",(long)bookIndex);
    
    //get the book object at a particular index
    SBBook *book=[bookArray objectAtIndex:bookIndex];
    
   
    return book;
    
    
}

- (void)dealloc
{
  
    [bookArray release];
    [super dealloc];
}
@end
