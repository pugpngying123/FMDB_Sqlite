//
//  Student.h
//  SQL
//
//  Created by iOS-Jay on 16/7/28.
//  Copyright © 2016年 iOS-Jay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property(nonatomic,assign)int id;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *sex;
@property(nonatomic,assign)int age;
@end
