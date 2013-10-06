//
//  TemperatureConverterViewController.m
//  TemperatureConverter
//
//  Created by Kevin Lee on 10/4/13.
//  Copyright (c) 2013 Kevin Lee. All rights reserved.
//

#import "TemperatureConverterViewController.h"

@interface TemperatureConverterViewController ()
- (IBAction)onMainViewTap:(id)sender;
- (IBAction)onConverterSwipe:(id)sender;
- (float) convertToFahrenheit: (float) temperature;
- (float) convertToCelsius: (float) temperature;
@end

@implementation TemperatureConverterViewController

NSString* const TYPE_FAHRENHEIT = @"F";
NSString* const TYPE_CELSIUS = @"C";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self switchToFahrenheitMode];
    self.txtTemperature.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onMainViewTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onConverterSwipe:(id)sender {
    float temperature = [self.txtTemperature.text floatValue];

    if ([self.converterMode isEqualToString:TYPE_FAHRENHEIT]) {
        temperature = [self convertToCelsius:temperature];
        [self switchToCelsiusMode];
    } else {
        // Default to celsius
        temperature = [self convertToFahrenheit:temperature];
        [self switchToFahrenheitMode];
    }
    
self.txtTemperature.text = [NSString stringWithFormat:@"%0.1f",temperature];
}

- (float) convertToFahrenheit: (float) temperature {
    return temperature * 9/5 + 32;
}

- (float) convertToCelsius: (float) temperature {
    return ((temperature - 32) * 5)/9;
}

- (void) switchToFahrenheitMode {
    self.converterMode = TYPE_FAHRENHEIT;
    self.lblTemperatureType.text = @"Fahrenheit";
}

- (void) switchToCelsiusMode {
    self.converterMode = TYPE_CELSIUS;
    self.lblTemperatureType.text = @"Celsius";
}

@end
