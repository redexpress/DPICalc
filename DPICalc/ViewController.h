//
//  ViewController.h
//  DPICalc
//
//  Created by Gavin Yang on 13-9-5.
//  Copyright (c) 2013年 Gavin Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *edge1Text;

@property (weak, nonatomic) IBOutlet UITextField *edge2Text;
@property (weak, nonatomic) IBOutlet UITextField *sizeText;
@property (weak, nonatomic) IBOutlet UILabel *dpiInfoLabel;

- (IBAction)calc:(id)sender;

@end