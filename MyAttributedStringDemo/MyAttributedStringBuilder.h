//
//  JMBAttributedStringBuilder.h
//  MyAttributedStringDemo
//
//  Created by oybq on 15/6/18.
//  qq:156355113
//  e-mail:obq0387_cn@sina.com
//  Copyright (c) 2015年 youngsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MyAttributedStringBuilder;

/**属性字符串区域***/
@interface MyAttributedStringRange : NSObject


-(MyAttributedStringRange*)setFont:(UIFont*)font;              //字体
-(MyAttributedStringRange*)setTextColor:(UIColor*)color;       //文字颜色
-(MyAttributedStringRange*)setBackgroundColor:(UIColor*)color; //背景色
-(MyAttributedStringRange*)setParagraphStyle:(NSParagraphStyle*)paragraphStyle;  //段落样式
-(MyAttributedStringRange*)setLigature:(BOOL)ligature;  //连体字符，好像没有什么作用
-(MyAttributedStringRange*)setKern:(CGFloat)kern; //字间距
-(MyAttributedStringRange*)setLineSpacing:(CGFloat)lineSpacing;   //行间距
-(MyAttributedStringRange*)setStrikethroughStyle:(int)strikethroughStyle;  //删除线
-(MyAttributedStringRange*)setStrikethroughColor:(UIColor*)StrikethroughColor NS_AVAILABLE_IOS(7_0);  //删除线颜色
-(MyAttributedStringRange*)setUnderlineStyle:(NSUnderlineStyle)underlineStyle; //下划线
-(MyAttributedStringRange*)setUnderlineColor:(UIColor*)underlineColor NS_AVAILABLE_IOS(7_0);  //下划线颜色
-(MyAttributedStringRange*)setShadow:(NSShadow*)shadow;                          //阴影
-(MyAttributedStringRange*)setTextEffect:(NSString*)textEffect NS_AVAILABLE_IOS(7_0);
-(MyAttributedStringRange*)setAttachment:(NSTextAttachment*)attachment NS_AVAILABLE_IOS(7_0); //将区域中的特殊字符: NSAttachmentCharacter,替换为attachement中指定的图片,这个来实现图片混排。
-(MyAttributedStringRange*)setLink:(NSURL*)url NS_AVAILABLE_IOS(7_0);   //设置区域内的文字点击后打开的链接
-(MyAttributedStringRange*)setBaselineOffset:(CGFloat)baselineOffset NS_AVAILABLE_IOS(7_0);  //设置基线的偏移量，正值为往上，负值为往下，可以用于控制UILabel的居顶或者居低显示
-(MyAttributedStringRange*)setObliqueness:(CGFloat)obliqueness NS_AVAILABLE_IOS(7_0);   //设置倾斜度
-(MyAttributedStringRange*)setExpansion:(CGFloat)expansion NS_AVAILABLE_IOS(7_0);  //压缩文字，正值为伸，负值为缩

-(MyAttributedStringRange*)setStrokeColor:(UIColor*)strokeColor;  //中空文字的颜色
-(MyAttributedStringRange*)setStrokeWidth:(CGFloat)strokeWidth;   //中空的线宽度


//可以设置多个属性
-(MyAttributedStringRange*)setAttributes:(NSDictionary*)dict;

//得到构建器
-(MyAttributedStringBuilder*)builder;

@end


/*属性字符串构建器*/
@interface MyAttributedStringBuilder : NSObject

+(MyAttributedStringBuilder*)builderWith:(NSString*)string;


-(id)initWithString:(NSString*)string;

-(MyAttributedStringRange*)range:(NSRange)range;  //指定区域,如果没有属性串或者字符串为nil则返回nil,下面方法一样。
-(MyAttributedStringRange*)allRange;      //全部字符
-(MyAttributedStringRange*)lastRange;     //最后一个字符
-(MyAttributedStringRange*)lastNRange:(NSInteger)length;  //最后N个字符
-(MyAttributedStringRange*)firstRange;    //第一个字符
-(MyAttributedStringRange*)firstNRange:(NSInteger)length;  //前面N个字符
-(MyAttributedStringRange*)characterSet:(NSCharacterSet*)characterSet;             //用于选择特殊的字符
-(MyAttributedStringRange*)includeString:(NSString*)includeString all:(BOOL)all;   //用于选择特殊的字符串
-(MyAttributedStringRange*)regularExpression:(NSString*)regularExpression all:(BOOL)all;   //正则表达式


//段落处理,以\n结尾为一段，如果没有段落则返回nil
-(MyAttributedStringRange*)firstParagraph;
-(MyAttributedStringRange*)nextParagraph;


//插入，如果为0则是头部，如果为-1则是尾部
-(void)insert:(NSInteger)pos attrstring:(NSAttributedString*)attrstring;
-(void)insert:(NSInteger)pos attrBuilder:(MyAttributedStringBuilder*)attrBuilder;

-(NSAttributedString*)commit;


@end
