//
//  Tire.h
//  basics
//
//  Created by A. Vatsaev  on 02/09/2012.
//  Copyright (c) 2012 A. Vatsaev . All rights reserved.
//

#ifndef basics_Tire_h
#define basics_Tire_h

@interface Tire : NSObject{
    int pressure;
    int condition;
    NSString *conditionState;
}

-(id) init;
-(void) showState;
-(void) setPressure:(int)newPressure;
-(void) setCondition:(int)newCondition;
-(void) renew;
-(int) getCondition;
-(int) getPressure;
-(NSObject*) getConditionState;

@end

#endif
