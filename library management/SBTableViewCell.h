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


//delegate called on clicking issue button
-(void)issue:(UIButton*)sender;

//delegate called on clicking return button
-(void)returns:(UIButton*)sender;

@end
@interface SBTableViewCell : UITableViewCell

@property (assign) id delegate;

- (id)initWithTitle:(NSString*) title;

@end
