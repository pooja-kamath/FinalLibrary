//
//  SBBookManager.h
//  library management
//
//  Created by Pooja Kamath on 15/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBBook.h"
@interface SBBookManager : NSObject

+ (id)sharedManager ;

//no of the books in the array
@property (assign)int count;

//index value of the row that is selected
@property (assign) NSInteger bookIndex;

//array to store the book objects
@property (retain) NSMutableArray *bookArray;

//method to pass the list of books title
-(NSArray *)getCellText;

//method to create a book object and add it to the array
-(void)addBookwithTitle:(NSString *)title bookId:(NSString*)bid author:(NSString*)author andIssued:(BOOL)issued;

//set the index value of the row that is selected
-(void)setIndex:(NSInteger )indexpath;

//method to issue book
-(void)bookIssued;

//method to return the book
-(void)bookReturned;

//method to sent the book details to display in detail view
-(SBBook *)getBookDetail;


@end
