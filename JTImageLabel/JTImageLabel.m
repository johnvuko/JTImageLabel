//
//  JTImageLabel.m
//  JTImageLabel
//
//  Created by Jonathan Tribouharet
//

#import "JTImageLabel.h"

@implementation JTImageLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(!self){
        return nil;
    }
    
    [self commonInit];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(!self){
        return nil;
    }
    
    [self commonInit];
    
    return self;
}

- (void)commonInit
{
    self.space = 0.;
    self.imageScale = 1.0f; //default is 1.0. -- add by DeJohn Dong
    self->_textLabel = [UILabel new];
    self->_imageView = [UIImageView new];
    
    [self addSubview:self.imageView];
    [self addSubview:self.textLabel];
}

- (void)layoutSubviews
{
    // code optimzation --add by DeJohn Dong
    CGFloat imageWidth = 0.0f;
    CGFloat imageHeight = 0.0f;
    if(self.imageView.image.size.height < self.frame.size.height){
        // check the imageView height is less than the frame.size.height.
        imageWidth = self.imageView.image.size.width * _imageScale;
        imageHeight = self.imageView.image.size.height * _imageScale;
    }else{
        // handle the web image is more larger than the self.bounds, get the scale.
        imageWidth = self.imageView.image.size.width * (self.frame.size.height/self.imageView.image.size.height) *_imageScale;
        imageHeight = self.frame.size.height *_imageScale;
    }
    
    CGFloat imageY = (CGRectGetHeight(self.frame) - imageHeight) / 2.;
    
    CGFloat labelMaxWidth = CGRectGetWidth(self.frame) - imageWidth;
    CGFloat labelMaxHeight = CGRectGetHeight(self.frame);
    
    labelMaxWidth -= self.space;
    
    if(self.textLabel.textAlignment == NSTextAlignmentLeft){
        self.imageView.frame = CGRectMake(0, imageY, imageWidth, imageHeight);
        self.textLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + self.space, 0, labelMaxWidth, labelMaxHeight);
    }
    else if(self.textLabel.textAlignment == NSTextAlignmentRight){
        CGSize size = [self.textLabel sizeThatFits:CGSizeMake(labelMaxWidth, labelMaxHeight)];
        CGFloat labelWidth = size.width;
        
        if(labelWidth > labelMaxWidth){
            // Multi line
            
            self.imageView.frame = CGRectMake(0, imageY, imageWidth, imageHeight);
            self.textLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + self.space, 0, labelMaxWidth, labelMaxHeight);
        }
        else{
            CGFloat imageX = CGRectGetWidth(self.frame) - labelWidth - imageWidth;
            self.imageView.frame = CGRectMake(imageX, imageY, imageWidth, imageHeight);
            self.textLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + self.space, 0, labelWidth, labelMaxHeight);
        }
    }
    else if(self.textLabel.textAlignment == NSTextAlignmentCenter){
        CGSize size = [self.textLabel sizeThatFits:CGSizeMake(labelMaxWidth, labelMaxHeight)];
        CGFloat labelWidth = size.width;
        
        if(labelWidth > labelMaxWidth){
            // Multi line
            
            self.imageView.frame = CGRectMake(0, imageY, imageWidth, imageHeight);
            self.textLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + self.space, 0, labelMaxWidth, labelMaxHeight);
        }
        else{
            CGFloat imageX = (CGRectGetWidth(self.frame) - labelWidth - imageWidth) / 2.;
            self.imageView.frame = CGRectMake(imageX, imageY, imageWidth, imageHeight);
            self.textLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + self.space, 0, labelWidth, labelMaxHeight);
        }
    }
    else{
        NSAssert(NO, @"JTImageLabel Alignement not supported");
    }
}

@end
