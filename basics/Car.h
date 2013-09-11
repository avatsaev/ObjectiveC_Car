//
//  Car.h
//  basics
//
//  Created by A. Vatsaev  on 01/09/2012.
//  Copyright (c) 2012 A. Vatsaev . All rights reserved.
//

#ifndef basics_Car_h
#define basics_Car_h

@interface Car: NSObject
{
    int kilometres;
    int essence;
    id couleur;
    NSArray* tires;
    
    
    
}
- (id) init;

-(void) fullTank;

-(int) getTank;
-(void) setTank:(int) liters;
-(void) addTank:(int) liters;
-(void) substractTank:(int) liters;
-(void) showTank;
-(void) showTires;
-(void) travel:(int)kilometers;
-(void) pitStop;
@end


#endif
