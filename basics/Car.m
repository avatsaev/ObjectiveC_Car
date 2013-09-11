//
//  Car.m
//  basics
//
//  Created by A. Vatsaev  on 01/09/2012.
//  Copyright (c) 2012 A. Vatsaev . All rights reserved.
//

#include <stdio.h>


#import "Car.h"
#import "Tire.h"


@implementation Car


- (id) init
{
    self = [super init];
    if (self) {
        kilometres =0;
        essence=30;
        couleur=@"red";
        tires=[NSArray arrayWithObjects:[[Tire alloc] init],
                                        [[Tire alloc] init],
                                        [[Tire alloc] init],
                                        [[Tire alloc] init],
                                        nil];
        
        [self showTank];
        [self showTires];
        return self;
    }
    else
        return nil;
}

//returns fuel in liters
-(int) getTank{
    return essence;
}

//makes the tank full again
- (void) fullTank{
    essence=100;
   [self showTank];
}


//sets fueld liter to a specific amout of liters
-(void) setTank:(int) liters{
    
    
    if (liters>100) liters=100; //we can't have more than 100 liters in the tank
    else if (liters<0) liters = 0; //and we can't have negative values
    
    essence=liters;
    
   [self showTank];
}


//add specific amount of liter to the tank
-(void) addTank:(int) liters{
    essence+=liters;
    
    // we have to respect tank's extremums 
    if (essence>100) essence=100;
    else if (essence<0) essence = 0;
    
    
    [self showTank];
}

-(void) substractTank:(int) liters{
    essence-=liters;
    
    // we have to respect tank's extremums 
    if (essence>100) essence=100;
    else if (essence<0) essence = 0;
    
    [self showTank];
}

-(void) showTank{
    NSLog(@"\nTank is at %d litters\nRoad so far: %dkm",essence,kilometres);
    
}

-(void) showTires{ //show the state of 4 tires
    for(int i=0;i<4;i++){
        id tire=[tires objectAtIndex:i];
        NSLog(@"-Tire N%d: \n",i+1);
        [tire showState];
    }
}


-(void) travel:(int)kilometers{ //traveling uses the tires and empties the tank
    
    for(int i=0;i<4;i++){// for all 4 tires
        id tire=[tires objectAtIndex:i];
        
        //if condition of the car is critical (empty tank or bad tires)
        if ([tire getCondition]<10 || [tire getPressure]<5 || essence<=0) { 
            if (essence<=0) {
                NSLog(@"\nWARINIG: There is no more fuel in the tank."); //show waring for the fuel
            }
            if ([tire getCondition]<10 || [tire getPressure]<5){
                NSLog(@"\nWARINIG: Tire N%d is no longer usable! \nPressure: %d\nCondition:%@",i+1,[tire getPressure],[tire getConditionState]); //show which tire is dead
            }
            return;
        }
        
        //degrade tire conditions and lose pressure
        [tire setCondition:[tire getCondition]-kilometers/4]; 
        [tire setPressure:[tire getPressure]-kilometers/16];
        
        
    }
    
    //count traveled kilometers
    kilometres+=kilometers;
    
    //use fuel
    [self substractTank:kilometers/4];
    
}


//make the car shiny and new
-(void) pitStop{
    NSLog(@"\n----------ENTER Pit Stop-----------\n");
    for(int i=0;i<4;i++){
        id tire=[tires objectAtIndex:i];
        NSLog(@"\nPitStop: Changing tire %d",i+1);
        [tire renew];
    }
    
    NSLog(@"\nPitStop: fulling tank to 100 litters");
    [self setTank:100];
    NSLog(@"\n----------EXIT Pit Stop-----------\n");
}



@end



