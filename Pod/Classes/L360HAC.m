//
//  L360HAC.m
//  Pods
//
//  Created by Nathan Fair on 3/18/16.
//
//

#import "L360HAC.h"

@implementation  HACLocation

@end
@implementation L360HAC

+ (NSArray<NSArray<HACLocation*>*>*)wardsMethodWithLocations:(NSArray<HACLocation*>*)locations {
   
    item_t * items = calloc(locations.count , sizeof(item_t));
    
    for (int i = 0; i < locations.count; i++) {
        item_t *t = &(items[i]);
        t->coord.x = [[locations objectAtIndex:i].latitude doubleValue];
        t->coord.y = [[locations objectAtIndex:i].longitude doubleValue];
        t->precision = [[locations objectAtIndex:i].precision doubleValue];
        t->label = [[locations objectAtIndex:i].label cStringUsingEncoding:NSUTF8StringEncoding];
    }
    cluster_t * cluster = agglomerate((int)locations.count, items);
    print_cluster(cluster);
    return nil;
}

+(NSNumber*) errorSumOfSquaresFromGroup:(NSArray<HACLocation*>*)group1 andGroup:(NSArray<HACLocation*>*)group2{
    return @0;
}

@end
