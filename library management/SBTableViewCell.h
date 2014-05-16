//
//  SBTableViewCell.h
//  library management
//
//  Created by Pooja Kamath on 16/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBBookManager.h"
@protocol cellDelegate

-(void)issue:(UIButton*)sender;
-(void)returns:(UIButton*)sender;

@end
@interface SBTableViewCell : UITableViewCell
@property (assign )SBBookManager *sharedManager;
@property(retain) NSArray *booklist;

@property (assign) id delegate;
- (id)initWithTitle:(NSString*) title;
@end
