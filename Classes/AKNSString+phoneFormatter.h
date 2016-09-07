//
//  NSString+phoneFormatter.h
//  doytra
//
//  Created by Artem Konarev on 04.09.16.
//  Copyright © 2016 Сергей Романков. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (phoneFormatter)

/*
 This method is used to set the format of telephone number.
 For example:
 Phone entry: 71111111111
 Phone: +7 (111) 111-11-11
 */
-(NSString*)setFullPhoneFormat:(NSString*)phone;

/*
 This method is used to reset the format of telephone number.
 For example:
 Phone entry: +7 (111) 111-11-11
 Phone: 71111111111
 */
-(NSString*)resetFullPhoneFormat:(NSString*)phone;




//Methods to install format phone number while typing on keyboard

//Set prefix format (+7).
//Call this in textField "textFieldShouldBeginEditing" or "textFieldDidBeginEditing" delegate methods.
-(NSString*)phonePrefix;

//Set phone format.
//Call this in textField "textFieldDidChange" delegate method.
-(NSString*)phoneFormatFromString:(NSString*)phoneNumStr;

@end
