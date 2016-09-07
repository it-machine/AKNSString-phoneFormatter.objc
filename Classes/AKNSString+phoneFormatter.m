//
//  AKNSString+phoneFormatter.m
//  doytra
//
//  Created by Artem Konarev on 04.09.16.
//  Copyright © 2016 Сергей Романков. All rights reserved.
//

#import "AKNSString+phoneFormatter.h"
#import <objc/runtime.h>

static char PREFIX_KEY;
static char LEFT_BRACKET;
static char RIGHT_BRACKET;
static char FIRST_DASH;
static char SECOND_DASH;

static NSString *prefixStr = @"+7";

@implementation NSString (phoneFormatter)


#pragma mark - setProperties

//setPrefix
-(BOOL)prefix{
    return (BOOL)objc_getAssociatedObject(self, &PREFIX_KEY);
}

-(void)setPrefix:(BOOL)prefix{
    NSNumber *numberPrefix = [NSNumber numberWithBool: prefix];
    objc_setAssociatedObject(self, &PREFIX_KEY, numberPrefix, OBJC_ASSOCIATION_ASSIGN);
}

//setLeftBracket
-(BOOL)leftBracket{
    return (BOOL)objc_getAssociatedObject(self, &LEFT_BRACKET);
}

-(void)setLeftBracket:(BOOL)leftBracket{
    NSNumber *numberLeftBracket = [NSNumber numberWithBool: leftBracket];
    objc_setAssociatedObject(self, &LEFT_BRACKET, numberLeftBracket, OBJC_ASSOCIATION_ASSIGN);
}

//setRightBracket
-(BOOL)rightBracket{
    return (BOOL)objc_getAssociatedObject(self, &RIGHT_BRACKET);
}

-(void)setRightBracket:(BOOL)rightBracket{
    NSNumber *numberRightBracket = [NSNumber numberWithBool: rightBracket];
    objc_setAssociatedObject(self, &RIGHT_BRACKET, numberRightBracket, OBJC_ASSOCIATION_ASSIGN);
}

//setFirstDash
-(BOOL)firstDash{
    return (BOOL)objc_getAssociatedObject(self, &FIRST_DASH);
}

-(void)setFirstDash:(BOOL)firstDash{
    NSNumber *numberFirstDash = [NSNumber numberWithBool: firstDash];
    objc_setAssociatedObject(self, &FIRST_DASH, numberFirstDash, OBJC_ASSOCIATION_ASSIGN);
}

//setSecondDash
-(BOOL)secondDash{
    return (BOOL)objc_getAssociatedObject(self, &SECOND_DASH);
}

-(void)setSecondDash:(BOOL)secondDash{
    NSNumber *numberSecondDash = [NSNumber numberWithBool: secondDash];
    objc_setAssociatedObject(self, &SECOND_DASH, numberSecondDash, OBJC_ASSOCIATION_ASSIGN);
}



#pragma mark - public

#pragma mark - fullPhoneFormat

-(NSString*)setFullPhoneFormat:(NSString*)phone{
    NSMutableString *phoneStr = [NSMutableString stringWithString:phone];
    [phoneStr insertString:@"+" atIndex:0];
    [phoneStr insertString:@" (" atIndex:2];
    [phoneStr insertString:@") " atIndex:7];
    [phoneStr insertString:@"-" atIndex:12];
    [phoneStr insertString:@"-" atIndex:15];
    
    return phoneStr;
}

-(NSString*)resetFullPhoneFormat:(NSString*)phone{
    phone = [phone stringByReplacingOccurrencesOfString:@" " withString:@""];
    phone = [phone stringByReplacingOccurrencesOfString:@")" withString:@""];
    phone = [phone stringByReplacingOccurrencesOfString:@"(" withString:@""];
    phone = [phone stringByReplacingOccurrencesOfString:@"-" withString:@""];
    phone = [phone stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    return phone;
}


#pragma mark - phoneFromString

-(NSString*)phonePrefix{
    self.prefix = YES;
    return prefixStr;
}

-(NSString*)phoneFormatFromString:(NSString*)phoneNumStr{
    NSMutableString *phoneStr = [NSMutableString stringWithString:phoneNumStr];
    
    //set phone format (not removed)
    if (phoneNumStr.length < 3 && self.prefix){
        phoneStr = [NSMutableString stringWithString:prefixStr];
        return phoneStr;
    }
    
    if (![self isNumberFromStr:phoneNumStr]) {
        phoneStr = [NSMutableString stringWithString:[phoneNumStr substringToIndex: phoneNumStr.length-1]];
        return phoneStr;
    }
    
    phoneStr = (NSMutableString*)[self bracketConfigFrom:phoneNumStr andMutableString:phoneStr];
    phoneStr = (NSMutableString*)[self dashConfigFrom:phoneNumStr andMutableString:phoneStr];
    
    if (phoneNumStr.length > 18)
        phoneStr = [NSMutableString stringWithString:[phoneNumStr substringToIndex: 18]];
    
    [self resetPhoneFormatFromStr:phoneNumStr];
    
    return phoneStr;
}

#pragma mark- private
//check number or not
-(BOOL)isNumberFromStr:(NSString*)str{
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle: NSNumberFormatterDecimalStyle];
    NSNumber *number = [formatter numberFromString:[str substringFromIndex:str.length-1]];
    if (number != nil) {
        return YES;
    } else {
        return NO;
    }
}

//brackets config
-(NSString*)bracketConfigFrom:(NSString*)string andMutableString:(NSMutableString*)mutString{
    if (string.length == 3 && !self.leftBracket){
        [mutString insertString:@" (" atIndex:2];
        self.leftBracket = YES;
    }
    if (string.length == 4 && !self.leftBracket){
        [mutString insertString:@"(" atIndex:3];
        self.leftBracket = YES;
    }
    if (string.length == 8 && !self.rightBracket){
        [mutString insertString:@") " atIndex:7];
        self.rightBracket = YES;
    }
    if (string.length == 9 && !self.rightBracket){
        [mutString insertString:@" " atIndex:8];
        self.rightBracket = YES;
    }
    
    return mutString;
}
//dashs config
-(NSString*)dashConfigFrom:(NSString*)string andMutableString:(NSMutableString*)mutString{
    if (string.length == 13 && !self.firstDash){
        [mutString insertString:@"-" atIndex:12];
        self.firstDash = YES;
    }
    if (string.length == 16 && !self.secondDash){
        [mutString insertString:@"-" atIndex:15];
        self.secondDash = YES;
    }
    
    return mutString;
}

//reset the dash and brackets after removal of characters
-(void)resetPhoneFormatFromStr:(NSString*)str{
    if (str.length == 16 && self.secondDash) {
        self.secondDash = NO;
    }
    if (str.length == 13 && self.firstDash) {
        self.firstDash = NO;
    }
    if ((str.length == 9 || str.length == 8) && self.rightBracket) {
        self.rightBracket = NO;
    }
    if ((str.length == 4 || str.length == 3) && self.leftBracket) {
        self.leftBracket = NO;
    }
}

@end