//
//  L360HAC.h
//  Pods
//
//  Created by Nathan Fair on 3/18/16.
//
//

#import <Foundation/Foundation.h>
#import "hac.h"

@interface HACLocation : NSObject
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSNumber * precision;
@property (nonatomic, retain) NSString * label;
@end

@interface L360HAC : NSObject

+ (NSArray<NSArray<HACLocation*>*>*)wardsMethodWithLocations:(NSArray<HACLocation*>*)locations;



@end
