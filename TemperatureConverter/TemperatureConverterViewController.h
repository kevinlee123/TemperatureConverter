//
//  TemperatureConverterViewController.h
//  TemperatureConverter
//
//  Created by Kevin Lee on 10/4/13.
//  Copyright (c) 2013 Kevin Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureConverterViewController : UIViewController
@property(nonatomic, assign) NSString* converterMode;
@property (weak, nonatomic) IBOutlet UITextField *txtTemperature;
@property (weak, nonatomic) IBOutlet UILabel *lblTemperatureType;
@end
