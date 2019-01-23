//
//  Utils.h
//  aChallenger
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>
// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
static id NSNullify(id _Nullable x) {
	return (x == nil || x == NSNull.null) ? NSNull.null : x;
}
static id map(id collection, id (^f)(id value)) {
	id result = nil;
	if ([collection isKindOfClass:NSArray.class]) {
		result = [NSMutableArray arrayWithCapacity:[collection count]];
		for (id x in collection) [result addObject:f(x)];
	} else if ([collection isKindOfClass:NSDictionary.class]) {
		result = [NSMutableDictionary dictionaryWithCapacity:[collection count]];
		for (id key in collection) [result setObject:f([collection objectForKey:key]) forKey:key];
	}
	return result;
}

NS_ASSUME_NONNULL_BEGIN

@interface Utils : NSObject

@end

NS_ASSUME_NONNULL_END
