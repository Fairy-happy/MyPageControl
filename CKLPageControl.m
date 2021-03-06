//
//  CKLPageControl.m
//  Chocolate
//
//  Created by fairy on 2017/3/16.
//  Copyright © 2017年 fairy. All rights reserved.
//

#import "CKLPageControl.h"
@interface CKLPageControl(private)  // 声明一个私有方法, 该方法不允许对象直接使用
@property (nonatomic) CGSize size;
@end
@implementation CKLPageControl

-(instancetype)initWithFrame:(CGRect)frame currentImage:(UIImage *)currentImage andDefaultImage:(UIImage *)defaultImage {
    
    self = [super initWithFrame:frame];
    
    self.currentImage = currentImage;
    self.defaultImage = defaultImage;
    return self;
}

-(instancetype) init {
    self = [super init];
    return self;
}

-(void) setUpDots

{
    
    if (self.currentImage && self.defaultImage) {
        self.size = self.currentImage.size;
    }else {
        self.size = CGSizeMake(7, 7);
    }
    
    if (self.pageSize.height && self.pageSize.width) {
        self.size =self.pageSize;
    }
    
    for (int i=0; i<[self.subviews count]; i++) {
        
        UIView* dot = [self.subviews objectAtIndex:i];
        
        [dot setFrame:CGRectMake(dot.frame.origin.x, dot.frame.origin.y, self.size.width, self.size.width)];
        if ([dot.subviews count] == 0) {
            UIImageView * view = [[UIImageView alloc]initWithFrame:dot.bounds];
            [dot addSubview:view];
        };
        UIImageView * view = dot.subviews[0];
        
        if (i==self.currentPage) {
            if (self.currentImage) {
                view.image=self.currentImage;
                dot.backgroundColor = [UIColor clearColor];
            }else {
                view.image = nil;
                dot.backgroundColor = self.currentPageIndicatorTintColor;
            }
        }else if (self.defaultImage) {
            view.image=self.defaultImage;
            dot.backgroundColor = [UIColor clearColor];
        }else {
            view.image = nil;
            dot.backgroundColor = self.pageIndicatorTintColor;
        }
    }
}


-(void) setCurrentPage:(NSInteger)page

{
    
    [super setCurrentPage:page];
    
    [self setUpDots];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
