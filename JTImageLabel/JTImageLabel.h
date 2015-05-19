//
//  JTImageLabel.h
//  JTImageLabel
//
//  Created by Jonathan Tribouharet
//

#import <UIKit/UIKit.h>

@interface JTImageLabel : UIView

@property (strong, nonatomic, readonly) UILabel *textLabel;
@property (strong, nonatomic, readonly) UIImageView *imageView;

@property (assign, nonatomic) CGFloat space;

@property (assign, nonatomic) CGFloat imageScale; //set the image scale,fixed the issue when you use the web image. -- add by DeJohn Dong

@end
