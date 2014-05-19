//
//  SBEntryFormViewController.h
//  library management
//
//  Created by Pooja Kamath on 15/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBBookManager.h"

//conforms to textfied delegate
@interface SBEntryFormViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate>

//shared manager instance
@property (assign) SBBookManager *sharedBookManager;

@end