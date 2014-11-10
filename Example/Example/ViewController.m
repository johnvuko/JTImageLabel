//
//  ViewController.m
//  Example
//
//  Created by Jonathan Tribouharet.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.label1.imageView.image = [UIImage imageNamed:@"location"];
    self.label1.textLabel.text = @"Alignment Left";
    self.label1.textLabel.textAlignment = NSTextAlignmentLeft;
//    self.label1.space = 10.; // Add a space between the imageView and the textLabel
    
    self.label2.imageView.image = [UIImage imageNamed:@"location"];
    self.label2.textLabel.text = @"Alignment Right";
    self.label2.textLabel.textAlignment = NSTextAlignmentRight;
    
    self.label3.imageView.image = [UIImage imageNamed:@"location"];
    self.label3.textLabel.text = @"Alignment Left with a multiline text. Alignment Left with a multiline text.";
    self.label3.textLabel.textAlignment = NSTextAlignmentLeft;
    self.label3.textLabel.numberOfLines = 0;
    
    self.label4.imageView.image = [UIImage imageNamed:@"location"];
    self.label4.textLabel.text = @"Alignment Right with a multiline text. Alignment Right with a multiline text.";
    self.label4.textLabel.textAlignment = NSTextAlignmentRight;
    self.label4.textLabel.numberOfLines = 0;
    
    self.label5.imageView.image = [UIImage imageNamed:@"location"];
    self.label5.textLabel.text = @"Alignment Center";
    self.label5.textLabel.textAlignment = NSTextAlignmentCenter;
    
    self.label6.imageView.image = [UIImage imageNamed:@"location"];
    self.label6.textLabel.text = @"Alignment Center with a multiline text!!!";
    self.label6.textLabel.textAlignment = NSTextAlignmentCenter;
    self.label6.textLabel.numberOfLines = 0;
}

@end
