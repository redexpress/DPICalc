//
//  ViewController.m
//  DPICalc
//
//  Created by Gavin Yang on 13-9-5.
//  Copyright (c) 2013年 Gavin Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *resolutionWidths;
@property (strong, nonatomic) NSArray *resolutionHeights;

@end

typedef enum {
    edge1Tag,
    edge2Tag
} ControlTag;

@implementation ViewController{
    int selectedTag;
}

- (NSArray *)resolutionWidths{
    if (!_resolutionWidths) {
        _resolutionWidths = @[@"480", @"720", @"1080"];
    }
    return _resolutionWidths;
}

- (NSArray *)resolutionHeights{
    if (!_resolutionHeights) {
        _resolutionHeights = @[@"800", @"854", @"1280", @"1920"];
    }
    return _resolutionHeights;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupView];
}

- (void)awakeFromNib{
    [self setupView];
}

- (void)setupView{
    self.edge1Text.delegate = self;
    self.edge1Text.tag = edge1Tag;
    self.edge2Text.delegate = self;
    self.edge2Text.tag = edge2Tag;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)calc:(id)sender {
    int edge1 = [self.edge1Text.text intValue];
    int edge2 = [self.edge2Text.text intValue];
    double size = [self.sizeText.text doubleValue];
    double dpi = sqrt(edge1*edge1 + edge2*edge2) / size;
    self.dpiInfoLabel.text = [NSString stringWithFormat:@"%lf", dpi];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textField.tag is %d", textField.tag);
    selectedTag = textField.tag;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - picker datasource and delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.resolutionWidths.count;
    } else {
        return self.resolutionHeights.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return self.resolutionWidths[row];
    } else {
        return self.resolutionHeights[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        self.edge1Text.text = self.resolutionWidths[row];
    } else {
        self.edge2Text.text = self.resolutionWidths[row];
    }
}

@end
