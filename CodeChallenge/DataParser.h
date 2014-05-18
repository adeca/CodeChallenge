//
//  DataParser.h
//  CodeChallenge
//
//  Created by Agustín de Cabrera on 18/05/2014.
//  Copyright (c) 2014 Agustín de Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataParser : NSObject

- (void)parseWithCompletion:(void(^)(BOOL success))completion;

@end
