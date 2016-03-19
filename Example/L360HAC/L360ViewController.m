//
//  L360ViewController.m
//  L360HAC
//
//  Created by Nathan Fair on 03/18/2016.
//  Copyright (c) 2016 Nathan Fair. All rights reserved.
//

#import "L360ViewController.h"
#import <L360HAC/L360HAC.h>

@interface L360ViewController ()

@end

@implementation L360ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"locations" ofType:@"json"];
    NSError *deserializingError;
    NSURL *localFileURL = [NSURL fileURLWithPath:filePath];
    NSData *contentOfLocalFile = [NSData dataWithContentsOfURL:localFileURL];
    NSArray<NSDictionary*>* objects = [NSJSONSerialization JSONObjectWithData:contentOfLocalFile
                                                options:0
                                                  error:&deserializingError];
    
    
    NSMutableArray<HACLocation*> * __block locations = [NSMutableArray arrayWithCapacity:objects.count];
    [objects enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HACLocation * location;
        location = [[HACLocation alloc] init];

        location.latitude = @([(NSString*)[obj objectForKey:@"latitude"] floatValue]);
        location.longitude = @([(NSString*)[obj objectForKey:@"longitude"] floatValue]);
        location.precision = @([(NSString*)[obj objectForKey:@"accuracy"] floatValue]);
        NSString * label = [NSString stringWithFormat:@"label for count %lu", idx];
        location.label = label;
        [locations addObject:location];
    }];

    [L360HAC wardsMethodWithLocations:locations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
