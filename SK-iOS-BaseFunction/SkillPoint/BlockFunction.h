//
//  BlockFunction.h
//  SK-iOS-BaseFunction
//
//  Created by SK(QQ: 1323866124) on 16/4/8.
//  Copyright © 2016年 SK. All rights reserved.

/*
 主题：__block修饰符
 参考：
 用途：
 当闭包中使用外部self或其局部变量时，需要对其进行__block修饰符。否则，会产生循环引用。
 
 注意事项：
 1 使用前，判断是否为空指针。空指针会导致崩溃。
 2 self要用__weak修饰
 3 使用后，要置于空，解除引用
 
 
 相关概念：
 何为“循环引用”，有何影响？
 A持有B，B持有A。会导致AB的引用计数永远不为0.造成内存泄露，甚至崩溃。
 
 委托为何用weak？
 
 dealloc何时调用？
 
 
 */


#import <Foundation/Foundation.h>

@interface BlockFunction : NSObject

-(void) test;

@end
