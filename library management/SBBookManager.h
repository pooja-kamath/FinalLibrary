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
@property (retain) NSMutableArray *bookArray;

-(NSArray *)getCellText;
-(void)addBookwithTitle:(NSString *)title bookId:(NSString*)bid author:(NSString*)author andIssued:(BOOL)issued;
-(void)setIndex:(NSInteger )indexpath;
-(void)bookIssued;
-(void)bookReturned;
-(SBBook *)getBookDetail;
@end
