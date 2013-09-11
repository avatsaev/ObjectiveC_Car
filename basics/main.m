//
//  main.m
//  basics
//
//  Created by A. Vatsaev  on 01/09/2012.
//  Copyright (c) 2012 A. Vatsaev . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[])
{

    Car* voiture = [[Car alloc] init];

    NSLog(@"Refuelling tank...");
    [voiture fullTank];
 
    NSLog(@"Traveling 100 km...");
    [voiture travel:100];
    [voiture showTires];

    NSLog(@"Traveling 101 km...");
    [voiture travel:101];
    [voiture showTires];
    NSLog(@"Traveling 100 km...");
    [voiture travel:100];
    [voiture showTires];
    NSLog(@"Traveling 100 km...");
    [voiture travel:100];
    [voiture showTires];
    
    NSLog(@"Traveling 100 km...");
    [voiture travel:100];

    [voiture pitStop];
    
    NSLog(@"Traveling 100 km...");
    [voiture travel:100];
    [voiture showTires];
    
    
    //init and read in dictos
    
    //direct init                                                       [KEY]       [VALUE]
    NSDictionary * dict1 = [NSDictionary dictionaryWithObjectsAndKeys:  @"USA",     @"Washington",
                                                                        @"RUSSIA",  @"Moscow",
                                                                        @"FRANCE",  @"Paris",
                                                                        nil]; // nil is the end point

    int rer=12;
    
    int * rerPoint=&rer;
    NSLog(@"rer egale %d", *rerPoint);
    
    
    NSEnumerator * enum1 = [dict1 keyEnumerator];
    id key;
    
    while (key=[enum1 nextObject]) {
        NSLog(@"%@ is capital of %@", key,[dict1 objectForKey:key]);
    }
    
    return 0;
}


