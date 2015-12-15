//
//  wolfdata.m
//  M2E1
//
//  Created by zjw on 1/14/14.
//  Copyright (c) 2014 yl. All rights reserved.
//

#import "wolfdata.h"
#import "user.h"



#define kDBNAME         @"WolfGuardDB"
#define kTABLENAME      @"userlist"
#define kUSERID         @"id"
#define kUSERNAME       @"username"
#define kPASSWORD       @"password"
#define kPHONENUM       @"phonenum"

@implementation wolfdata

-(id)initWithDemo
{
    self = [super init];
    if(![self createDB]) return nil;
    
    user *userTest = [[user alloc]initWithUserName:@"wolfGuard" passWord:@"1234" phoneNum:@"0000"];
    
    [self insertData:userTest];
    
    return self;
}
-(id)init
{
    self = [super init];
    if(![self createDB]) return nil;
    if (self) {
        
    }
    return self;
}



-(BOOL) openDB
{
    //获取数据库路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *database_path = [documents stringByAppendingPathComponent:kDBNAME];
    
    //如果数据库存在，则用sqlite3_open直接打开（不要担心，如果数据库不存在sqlite3_open会自动创建）
    //打开数据库，这里的[path UTF8String]是将NSString转换为C字符串，因为SQLite3是采用可移植的C(而不是
    //Objective-C)编写的，它不知道什么是NSString.
    if (sqlite3_open([database_path UTF8String], &userdb) == SQLITE_OK) {
        return YES;
    }else{
        //        NSLog(@"数据库打开失败");
        sqlite3_close(userdb);
        return NO;
    }
}


//命令通用
-(BOOL)execSql:(NSString *)sql
{
    //    NSLog(@"%@",sql);
    if (![self openDB]) return NO;
    char *err;
    if (sqlite3_exec(userdb, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK)
    {
        //        NSLog(@"数据库操作数据失败:%s",err);
        sqlite3_free(err);// 释放错误信息资源
        sqlite3_close(userdb);
        return NO;
    }
    sqlite3_free(err);// 释放错误信息资源
    sqlite3_close(userdb);
    return YES;
}

//创建表
- (BOOL)createDB
{
    //sql 语句
    NSString *sqlCreateTable =  [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT)",kTABLENAME,kUSERID,kUSERNAME,kPASSWORD,kPHONENUM];
    return [self execSql:sqlCreateTable];
}

#pragma mark - operate

//插入一个用户
-(BOOL)insertData:(user *)userModel
{
    NSString *insertSql= [NSString stringWithFormat:
                          @"INSERT INTO %@ (%@,%@,%@) VALUES ('%@','%@','%@')",
                          kTABLENAME,kUSERNAME, kPASSWORD, kPHONENUM,  userModel.userName, userModel.passWord, userModel.phoneNum];
    
    
    return [self execSql:insertSql];
}

//更新用户数据(通过userId)
-(BOOL)updateData:(user *)userModel
{
    NSString *updateSql = [NSString stringWithFormat:
                           @"UPDATE %@ SET %@='%@' ,%@='%@' ,%@='%@' WHERE (%@='%d')",
                           kTABLENAME, kUSERNAME,userModel.userName,  kPASSWORD,userModel.passWord,kPHONENUM,userModel.phoneNum,  kUSERID,userModel.userId];
    
    
    return [self execSql:updateSql];
}

//删除一个用户(通过userId)
-(BOOL)deleteData:(user *)userModel
{
    NSString *sdeleteSql = [NSString stringWithFormat:
                            @"delete from %@ where %@='%d'",
                            kTABLENAME, kUSERID, userModel.userId];
    return [self execSql:sdeleteSql];
}

//删除全部
- (BOOL) deleteAllData
{
    NSString *sdeleteallSql = [NSString stringWithFormat:@"DELETE FROM %@",kTABLENAME];
    return [self execSql:sdeleteallSql];
}

//获取一个用户
- (user *) selectData:(user *)userModel;
{
    
    if (![self openDB]) return nil;
    
    NSString *sqlQuery = [NSString stringWithFormat:
                          @"SELECT * FROM %@ where %@ = '%d'",kTABLENAME,kUSERID,userModel.userId];
    sqlite3_stmt * statement;
    user *us;
    if (sqlite3_prepare_v2(userdb, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
        
        //查询结果集中一条一条的遍历所有的记录，这里的数字对应的是列值,注意这里的列值
        while (sqlite3_step(statement) == SQLITE_ROW) {
            //一个用户
            us = [[user alloc]initWithUserName:
                  [[NSString alloc ]initWithUTF8String:(char*)sqlite3_column_text(statement, 1)]
                                      passWord:[[NSString alloc]initWithUTF8String:(char*)sqlite3_column_text(statement, 2)]
                                      phoneNum:[[NSString alloc]initWithUTF8String:(char*)sqlite3_column_text(statement, 3)]];
            us.userId = sqlite3_column_int(statement, 0);
        }
    }else{
        //        NSLog(@"select error:%@",sqlQuery);
        sqlite3_finalize(statement);
        sqlite3_close(userdb);
        return nil;
    }
    sqlite3_finalize(statement);
    sqlite3_close(userdb);
    return us;
}

//获取所有用户
-(NSMutableArray *) selectAllData
{
    
    if (![self openDB]) return nil;
    
    NSString *sqlQuery = [NSString stringWithFormat:
                          @"SELECT * FROM %@",kTABLENAME];
    sqlite3_stmt * statement;
    
    NSMutableArray *all = [[NSMutableArray alloc]init];
    
    if (sqlite3_prepare_v2(userdb, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
        
        //查询结果集中一条一条的遍历所有的记录，这里的数字对应的是列值,注意这里的列值
        while (sqlite3_step(statement) == SQLITE_ROW) {
            //一个用户
            user *us = [[user alloc]initWithUserName:
                        [[NSString alloc]initWithUTF8String:(char*)sqlite3_column_text(statement, 1)]
                                            passWord:[[NSString alloc]initWithUTF8String:(char*)sqlite3_column_text(statement, 2)]
                                            phoneNum:[[NSString alloc]initWithUTF8String:(char*)sqlite3_column_text(statement, 3)]];
            
            us.userId = sqlite3_column_int(statement, 0);
            [all addObject:us];//添加到全部
            us = nil;
        }
    }else{
        //        NSLog(@"select error:%@",sqlQuery);
        sqlite3_finalize(statement);
        sqlite3_close(userdb);
        return nil;
    }
    sqlite3_finalize(statement);
    sqlite3_close(userdb);
    return all;
}

@end
