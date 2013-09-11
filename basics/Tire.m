//
//  Tire.m
//  basics
//
//  Created by A. Vatsaev  on 02/09/2012.
//  Copyright (c) 2012 A. Vatsaev . All rights reserved.
//

#include <stdio.h>
#include "Tire.h"

@implementation Tire

//constructor
- (id)init{
    if(self=[super init]){
        pressure=25;
        condition=100;
        conditionState=@"New";

        return self;
    }
    return nil;
}


-(void)showState{
    NSLog(@"\nPressure: %d\nCondition: %@ (%d)\n",pressure,conditionState,condition);
}


-(void) setCondition:(int)newCondition{
    
    if(newCondition<0){
        newCondition=0;
    }else if(newCondition>100){
        newCondition=100;
    }
    
    if(newCondition==100){
        conditionState=@"New";
    
    }else if(newCondition>=75 && newCondition<100){
        conditionState=@"Good";
   
    }else if(newCondition>=50 && newCondition<75){
        conditionState=@"Mediocre";
    
    }else if(newCondition>=10 && newCondition<50){
        conditionState=@"Bad";
      
    }else if(newCondition<10){
        conditionState=@"Dead";
   
    }else{
        conditionState=@"No tires";
        
    }

    condition=newCondition;

}

-(void) setPressure:(int)newPressure{
    
    //respect the extremums
    if(newPressure<0){
        newPressure=0;
    }else if(newPressure>25){
        newPressure=25;
    }
    
    pressure=newPressure;
}

//makes your tires new again
-(void) renew{
    [self setCondition:100];
    [self setPressure:25];
}


-(int) getCondition{
    return condition;
}

-(int) getPressure{
    return pressure;
}

-(NSObject*) getConditionState{
    return conditionState;
}


@end





