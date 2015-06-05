//
//  DataModel.m
//  Kiana
//
//  Created by Ji wonnam on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PackModel.h"
#import "AppDelegate.h"
#import "DataModel.h"
#import "CSVParser.h"
#import "CHCSVParser.h"
//#import "Emoji.h"

@implementation DataModel

@synthesize dbHandler, packsArray;

NSString *emoji[300] = {@"\U0001f604",
    @"\U0001f603",
    @"\U0001f600",
    @"\U0001f60a",
    @"\U0000263a",
    @"\U0001f609",
    @"\U0001f60d",
    @"\U0001f618",
    @"\U0001f61a",
    @"\U0001f617",
    @"\U0001f619",
    @"\U0001f61c",
    @"\U0001f61d",
    @"\U0001f61b",
    @"\U0001f633",
    @"\U0001f601",
    @"\U0001f614",
    @"\U0001f60c",
    @"\U0001f612",
    @"\U0001f61e",
    @"\U0001f623",
    @"\U0001f622",
    @"\U0001f602",
    @"\U0001f62d",
    @"\U0001f62a",
    @"\U0001f625",
    @"\U0001f630",
    @"\U0001f605",
    @"\U0001f613",
    @"\U0001f629",
    @"\U0001f62b",
    @"\U0001f628",
    @"\U0001f631",
    @"\U0001f620",
    @"\U0001f621",
    @"\U0001f624",
    @"\U0001f616",
    @"\U0001f606",
    @"\U0001f60b",
    @"\U0001f637",
    @"\U0001f60e",
    @"\U0001f634",
    @"\U0001f635",
    @"\U0001f632",
    @"\U0001f61f",
    @"\U0001f626",
    @"\U0001f627",
    @"\U0001f608",
    @"\U0001f47f",
    @"\U0001f62e",
    @"\U0001f62c",
    @"\U0001f610",
    @"\U0001f615",
    @"\U0001f62f",
    @"\U0001f636",
    @"\U0001f607",
    @"\U0001f60f",
    @"\U0001f611",
    @"\U0001f472",
    @"\U0001f473",
    @"\U0001f46e",
    @"\U0001f477",
    @"\U0001f482",
    @"\U0001f476",
    @"\U0001f466",
    @"\U0001f467",
    @"\U0001f468",
    @"\U0001f469",
    @"\U0001f474",
    @"\U0001f475",
    @"\U0001f471",
    @"\U0001f47c",
    @"\U0001f478",
    @"\U0001f63a",
    @"\U0001f638",
    @"\U0001f63b",
    @"\U0001f63d",
    @"\U0001f63c",
    @"\U0001f640",
    @"\U0001f63f",
    @"\U0001f639",
    @"\U0001f63e",
    @"\U0001f479",
    @"\U0001f47a",
    @"\U0001f648",
    @"\U0001f649",
    @"\U0001f64a",
    @"\U0001f480",
    @"\U0001f47d",
    @"\U0001f4a9",
    @"\U0001f525",
    @"\U00002728",
    @"\U0001f31f",
    @"\U0001f4ab",
    @"\U0001f4a5",
    @"\U0001f4a2",
    @"\U0001f4a6",
    @"\U0001f4a7",
    @"\U0001f4a4",
    @"\U0001f4a8",
    @"\U0001f442",
    @"\U0001f440",
    @"\U0001f443",
    @"\U0001f445",
    @"\U0001f444",
    @"\U0001f44d",
    @"\U0001f44e",
    @"\U0001f44c",
    @"\U0001f44a",
    @"\U0000270a",
    @"\U0000270c",
    @"\U0001f44b",
    @"\U0000270b",
    @"\U0001f450",
    @"\U0001f446",
    @"\U0001f447",
    @"\U0001f449",
    @"\U0001f448",
    @"\U0001f64c",
    @"\U0001f64f",
    @"\U0000261d",
    @"\U0001f44f",
    @"\U0001f4aa",
    @"\U0001f6b6",
    @"\U0001f3c3",
    @"\U0001f483",
    @"\U0001f46b",
    @"\U0001f46a",
    @"\U0001f46c",
    @"\U0001f46d",
    @"\U0001f48f",
    @"\U0001f491",
    @"\U0001f46f",
    @"\U0001f646",
    @"\U0001f645",
    @"\U0001f481",
    @"\U0001f64b",
    @"\U0001f486",
    @"\U0001f487",
    @"\U0001f485",
    @"\U0001f470",
    @"\U0001f64e",
    @"\U0001f64d",
    @"\U0001f647",
    @"\U0001f3a9",
    @"\U0001f451",
    @"\U0001f452",
    @"\U0001f45f",
    @"\U0001f45e",
    @"\U0001f461",
    @"\U0001f460",
    @"\U0001f462",
    @"\U0001f455",
    @"\U0001f454",
    @"\U0001f45a",
    @"\U0001f457",
    @"\U0001f3bd",
    @"\U0001f456",
    @"\U0001f458",
    @"\U0001f459",
    @"\U0001f4bc",
    @"\U0001f45c",
    @"\U0001f45d",
    @"\U0001f45b",
    @"\U0001f453",
    @"\U0001f380",
    @"\U0001f302",
    @"\U0001f484",
    @"\U0001f49b",
    @"\U0001f499",
    @"\U0001f49c",
    @"\U0001f49a",
    @"\U00002764",
    @"\U0001f494",
    @"\U0001f497",
    @"\U0001f493",
    @"\U0001f495",
    @"\U0001f496",
    @"\U0001f49e",
    @"\U0001f498",
    @"\U0001f48c",
    @"\U0001f48b",
    @"\U0001f48d",
    @"\U0001f48e",
    @"\U0001f464",
    @"\U0001f465",
    @"\U0001f4ac",
    @"\U0001f463",
    @"\U0001f4ad",
    @"\U0001f436",
    @"\U0001f43a",
    @"\U0001f431",
    @"\U0001f42d",
    @"\U0001f439",
    @"\U0001f430",
    @"\U0001f438",
    @"\U0001f42f",
    @"\U0001f428",
    @"\U0001f43b",
    @"\U0001f437",
    @"\U0001f43d",
    @"\U0001f42e",
    @"\U0001f417",
    @"\U0001f435",
    @"\U0001f412",
    @"\U0001f434",
    @"\U0001f411",
    @"\U0001f418",
    @"\U0001f43c",
    @"\U0001f427",
    @"\U0001f426",
    @"\U0001f424",
    @"\U0001f425",
    @"\U0001f423",
    @"\U0001f414",
    @"\U0001f40d",
    @"\U0001f422",
    @"\U0001f41b",
    @"\U0001f41d",
    @"\U0001f41c",
    @"\U0001f41e",
    @"\U0001f40c",
    @"\U0001f419",
    @"\U0001f41a",
    @"\U0001f420",
    @"\U0001f41f",
    @"\U0001f42c",
    @"\U0001f433",
    @"\U0001f40b",
    @"\U0001f404",
    @"\U0001f40f",
    @"\U0001f400",
    @"\U0001f403",
    @"\U0001f405",
    @"\U0001f407",
    @"\U0001f409",
    @"\U0001f40e",
    @"\U0001f410",
    @"\U0001f413",
    @"\U0001f415",
    @"\U0001f416",
    @"\U0001f401",
    @"\U0001f402",
    @"\U0001f432",
    @"\U0001f421",
    @"\U0001f40a",
    @"\U0001f42b",
    @"\U0001f42a",
    @"\U0001f406",
    @"\U0001f408",
    @"\U0001f429",
    @"\U0001f43e",
    @"\U0001f490",
    @"\U0001f338",
    @"\U0001f337",
    @"\U0001f340",
    @"\U0001f339",
    @"\U0001f33b",
    @"\U0001f33a",
    @"\U0001f341",
    @"\U0001f343",
    @"\U0001f342",
    @"\U0001f33f",
    @"\U0001f33e",
    @"\U0001f344",
    @"\U0001f335",
    @"\U0001f334",
    @"\U0001f332",
    @"\U0001f333",
    @"\U0001f330",
    @"\U0001f331",
    @"\U0001f33c",
    @"\U0001f310",
    @"\U0001f31e",
    @"\U0001f31d",
    @"\U0001f31a",
    @"\U0001f311",
    @"\U0001f312",
    @"\U0001f313",
    @"\U0001f314",
    @"\U0001f315",
    @"\U0001f316",
    @"\U0001f317",
    @"\U0001f318",
    @"\U0001f31c",
    @"\U0001f31b",
    @"\U0001f319",
    @"\U0001f30d",
    @"\U0001f30e",
    @"\U0001f30f",
    @"\U0001f30b",
    @"\U0001f30c",
    @"\U0001f320",
    @"\U00002b50",
    @"\U00002600",
    @"\U000026c5",
    @"\U00002601",
    @"\U000026a1",
    @"\U00002614",
    @"\U00002744"};

+ (BOOL)createTable:(sqlite3 *)dbHandler {
    
//    ------ TABLE_PACK ---------
	NSString* strQuery =
    [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@(%@ VARCHAR(%d) NOT NULL       , %@ VARCHAR(%d) NOT NULL)",
						  TABLE_CONTACTS,
						  FIELD_NAME, 256,
                          FIELD_TEXT, 512
                          ];
	if (sqlite3_exec(dbHandler, [strQuery UTF8String], NULL, NULL, NULL) != SQLITE_OK)
		return NO;

	return YES;
}

-(id)initWithDBHandler:(sqlite3*)_dbHandler {
	self = [super init];
	
	if (self) {
		self.dbHandler = _dbHandler;
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"checked"];
        if (![[NSUserDefaults standardUserDefaults] boolForKey:@"checked"]) {
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"checked"];
            NSString *file = [[NSBundle mainBundle]
                              pathForResource:@"potsticker" ofType:@"csv"];
            
//            CSVParser* parser = [[CSVParser alloc] init];
//            NSMutableArray* m_arrayData = [parser parseCSV:file];
            //
//            for (int i = 0; i < [m_arrayData count]; i++) {
//                NSArray* contact = (NSArray*)[m_arrayData objectAtIndex:i];
//                NSString *txt = [contact objectAtIndex:0];
////                NSLog(@"%d:::%d", [txt ], @"\U000f1603".length);
//                if ([txt isEqualToString:@""]) {
//                    continue;
//                }
//                txt = [txt stringByReplacingOccurrencesOfString:@"'" withString:@"\'"];
//
//                NSString *strQuery = [NSString stringWithFormat:@"INSERT INTO %@ VALUES('%@', '%@')",   TABLE_CONTACTS,
//                                      @"",
//                                      txt];
//
//                if (sqlite3_exec(dbHandler, [strQuery UTF8String], NULL, NULL, NULL) != SQLITE_OK)
//                    return Nil;
//            }
            for (int i = 0; i < 300; i++) {
//                NSArray* contact = (NSArray*)[m_arrayData objectAtIndex:i];
                NSString *txt = emoji[i];
                //                NSLog(@"%d:::%d", [txt ], @"\U000f1603".length);
                if ([txt isEqualToString:@""]) {
                    continue;
                }
                txt = [txt stringByReplacingOccurrencesOfString:@"'" withString:@"\'"];
                
                NSString *strQuery = [NSString stringWithFormat:@"INSERT INTO %@ VALUES('%@', '%@')",   TABLE_CONTACTS,
                                      @"",
                                      txt];
                
                if (sqlite3_exec(dbHandler, [strQuery UTF8String], NULL, NULL, NULL) != SQLITE_OK)
                    return Nil;
            }
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"checked"];
        }
        ///////////////
        
		NSString *strQuery = [NSString stringWithFormat:@"SELECT * FROM %@ ORDER BY %@ DESC", TABLE_CONTACTS, FIELD_NAME];
        
		sqlite3_stmt* stmt;
		
		if (sqlite3_prepare_v2(dbHandler, [strQuery UTF8String], -1, &stmt, NULL) == SQLITE_OK) {
			//int userId;
            packsArray = [[NSMutableArray alloc] init];
			while(sqlite3_step(stmt) == SQLITE_ROW) {
                PackModel * contact = [[PackModel alloc] init];
                
                char *name = (char*)sqlite3_column_text(stmt, 0);
				char *text = (char*)sqlite3_column_text(stmt, 1);
                
				if (name != nil)
					contact.packName = [NSString stringWithUTF8String:name];
				
				if (text != nil)
					contact.packText = [NSString stringWithUTF8String:text];
				
                [packsArray addObject:contact];
			}
            
        }
    }
    	return self;
}

- (BOOL)updateDB:(NSMutableArray*) _packsArray {
    NSString *strQuery = [NSString stringWithFormat:@"DELETE FROM %@", TABLE_CONTACTS];
    
    if (sqlite3_exec(dbHandler, [strQuery UTF8String], NULL, NULL, NULL) != SQLITE_OK)
        return NO;
    
    for (int i = 0; i < [_packsArray count]; i++) {
        PackModel* contact = (PackModel*)[_packsArray objectAtIndex:i];
        
        strQuery = [NSString stringWithFormat:@"INSERT INTO %@ VALUES('%@', '%@')",   TABLE_CONTACTS,
                    contact.packName,
                    contact.packText];
        
        if (sqlite3_exec(dbHandler, [strQuery UTF8String], NULL, NULL, NULL) != SQLITE_OK)
            return NO;
    }
    packsArray = _packsArray;
    
    return YES;
}

- (BOOL)addPack:(NSMutableArray*) _packsArray {
    NSString *strQuery;
    
    for (int i = 0; i < [_packsArray count]; i++) {
        PackModel* contact = (PackModel*)[_packsArray objectAtIndex:i];
        
        strQuery = [NSString stringWithFormat:@"INSERT INTO %@ VALUES('%@', '%@')",   TABLE_CONTACTS,
                    contact.packName,
                    contact.packText];
        
        if (sqlite3_exec(dbHandler, [strQuery UTF8String], NULL, NULL, NULL) != SQLITE_OK)
            return NO;
    }
    
    return YES;
}

@end
