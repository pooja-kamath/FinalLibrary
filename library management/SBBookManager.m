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

//making the manager singleton
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
    
    //create a book object with the values passed
    SBBook * book =[[SBBook alloc]init];
    book.title=title;
    book.bookId=bid;
    book.author=author;
    book.issued=issued;
    
    //add the book created to the array
    [bookArray addObject:book];
  
    
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
        SBBook *book=[bookArray objectAtIndex:i];
        bookNames=book.title;
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
    //set the issued property of the selected book to yes
    NSLog(@"in issue");
    SBBook *book=[bookArray objectAtIndex:bookIndex];
    
       book.issued=YES;
        
    
  }
-(void)bookReturned
{
     //set the issued property of the selected book to no
    NSLog(@"in return");
    
    SBBook *book=[bookArray objectAtIndex:bookIndex];
    
    book.issued=NO;
    
}
-(SBBook *)getBookDetail
{
    
    
    NSLog(@"indx= %ld",(long)bookIndex);
    
    //get the book object at a particular index
    SBBook *book=[bookArray objectAtIndex:bookIndex];
    
   //return the book
    return book;
    
    
}

- (void)dealloc
{
    
   
    [bookArray release];
    bookArray=nil;
    [super dealloc];
    
    
}
@end
