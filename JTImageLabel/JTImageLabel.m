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
    self->_textLabel = [UILabel new];
    self->_imageView = [UIImageView new];
    
    [self addSubview:self.imageView];
    [self addSubview:self.textLabel];
}

- (void)layoutSubviews
{
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
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
        NSAssert(NO, @"Alignement not supported");
    }
}

@end
