//
//  SBEntryFormViewController.h
//  library management
//
//  Created by Pooja Kamath on 15/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBBookManager.h"
@interface SBEntryFormViewController : UIViewController
@property (assign) SBBookManager *sharedManager;
@end