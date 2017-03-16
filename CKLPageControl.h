//
//  CKLPageControl.h
//  Chocolate
//
//  Created by fairy on 2017/3/16.
//  Copyright © 2017年 fairy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CKLPageControl : UIPageControl
/**
 *  如果直接使用init初始化、可以手动定义以下属性
 *  其中pageSize为空则跟随图片size
 */
@property (nonatomic)   UIImage * currentImage; //高亮图片
@property (nonatomic)   UIImage * defaultImage; //默认图片
@property (nonatomic,assign)   CGSize pageSize; //图标大小


-(instancetype)initWithFrame:(CGRect)frame currentImage:(UIImage *)currentImage andDefaultImage:(UIImage *)defaultImage ;
@end
