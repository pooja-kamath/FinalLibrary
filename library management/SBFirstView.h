//
//  SBFirstView.h
//  library management
//
//  Created by Pooja Kamath on 15/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBBookManager.h"
#import "SBTableViewCell.h"
@interface SBFirstView : UIViewController <UITableViewDataSource ,UITableViewDelegate,cellDelegate>

// list to store the titles of the book
@property (retain) NSArray *booklist;

//shared manager instance
@property (assign) SBBookManager *sharedBookManager;


@end
