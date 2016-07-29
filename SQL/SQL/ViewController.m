//
//  ViewController.m
//  SQL
//
//  Created by iOS-Jay on 16/7/28.
//  Copyright © 2016年 iOS-Jay. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"
@interface ViewController ()

{
    FMDatabase *dataBase;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ [ UIApplication sharedApplication] setIdleTimerDisabled:YES ] ;
//    1、获取数据库对象
    NSString *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    path=[path stringByAppendingPathComponent:@"BlackPhoneNumber.sqlite"];
    
    dataBase=[FMDatabase databaseWithPath:path];
//    　2、打开数据库，如果不存在则创建并且打开
    
    BOOL open=[dataBase open];
    if(open){
        NSLog(@"数据库打开成功");
    }

//    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS PERSONINFO (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, address TEXT)";

    NSString * create1=@"create table if not exists t_phonenumber(id integer primary key  AUTOINCREMENT ,phone varchar,description varchar)";
   
    BOOL c1= [dataBase executeUpdate:create1];
    if(c1){
        NSLog(@"创建表成功");
    }
    
    
    
//    //增
////
//     NSString * insertSql=@"insert into t_test(id,phone,description) values(?,?,?)";
//
//    if ([dataBase executeUpdate:insertSql,@(1),@"02083496491",@"骚扰电话"]) {
//        NSLog(@"新增数据");
//    }
//    if ([dataBase executeUpdate:insertSql,@(2),@"李四"]) {
//        NSLog(@"新增数据");
//    }
//    if ([dataBase executeUpdate:insertSql,@(3),@"王武"]) {
//        NSLog(@"新增数据");
//    }
// 
//    
    //删
    int idNum = 1;
    if ([dataBase executeUpdate:@"delete from t_phonenumber where id = ?;",@(idNum)]) {
        NSLog(@"delete success");
    }
    
//
//    //改
//    NSString*old=@"王武";
//    NSString*new=@"王五";
//    if ([dataBase executeUpdate:@"update t_user set name = ? where name = ?",new,old]) {
//        NSLog(@"更改数据");
//    }
//
//
//
//    
//    
//     查
//    NSString * sql=@" select * from t_phonenumber ";
//    FMResultSet *result=[dataBase executeQuery:sql];
//    while(result.next){
//        int ids=[result intForColumn:@"id"];
//        NSString * n=[result stringForColumn:@"phone"];
//        NSString * m=[result stringForColumn:@"description"];
//      
////        int ids=[result intForColumnIndex:0];
////        NSString * name=[result stringForColumnIndex:1];
//        NSLog(@"%d,%@,%@",ids,n,m);
//    }
////

//
    
    
    
//    
//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"kuaidialblack" ofType:@"plist"];
//    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
//    NSArray *arr_phoneNumber = [data allKeys];
//    NSArray *arr_description = [data allValues];
//    
//    
//    NSString * insertSql=@"insert into t_phonenumber(id,phone,description) values(?,?,?)";

//    增
//
//    for (int  j=0; j<arr_phoneNumber.count; j++) {
////       if( [dataBase executeUpdate:insertSql,@(j),[keys objectAtIndex:j]])
////       {
////          NSLog(@"%d-%@",j,[keys objectAtIndex:j]);
////       }
//        if ([dataBase executeUpdate:insertSql,@(j),[arr_phoneNumber objectAtIndex:j],[arr_description objectAtIndex:j]]) {
//                 NSLog(@"%d-%@-%@",j,[arr_phoneNumber objectAtIndex:j],[arr_description objectAtIndex:j]);
//            
//                }
//        
//    }
    
//    //改
//    for (int  j=0; j<arr_phoneNumber.count; j++) {
//
//    if ([dataBase executeUpdate:@"update t_phonenumber set description = ? where description = ?",[arr_description objectAtIndex:j],[arr_phoneNumber objectAtIndex:j]]) {
//        NSLog(@"更改数据%d",j);
//    }
//    }
//
  


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
