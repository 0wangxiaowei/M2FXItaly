//
//  wolfdata.h
//  M2E1
//
//  Created by zjw on 1/14/14.
//  Copyright (c) 2014 yl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@class user;

@interface wolfdata : NSObject
{
    sqlite3 *userdb;
}

- (BOOL) openDB;
- (BOOL) execSql:(NSString *) sql;
- (BOOL) createDB;

- (BOOL) insertData:(user *)userModel;
- (BOOL) updateData:(user *)userModel;
- (BOOL) deleteData:(user *)userModel;
- (BOOL) deleteAllData;

- (user *) selectData:(user *)userModel;
- (NSMutableArray *) selectAllData;

@end
