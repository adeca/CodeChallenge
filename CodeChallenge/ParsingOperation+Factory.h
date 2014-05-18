//
//  ParsingOperation+Factory.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 19/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import "ParsingOperation.h"

@interface ParsingOperation (Factory)

+ (instancetype)categoryParsingOperation;
+ (instancetype)exerciseParsingOperation;
+ (instancetype)foodParsingOperation;

@end
