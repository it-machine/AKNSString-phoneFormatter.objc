# AKNSString+phoneFormatter.objc

## Installation

Add this line to your application's Podfile:

```ruby
pod 'AKNSString+phoneFormatter.obj'
```

And then execute:

    $ pod install

## Usage

<li>Set phone format to full number

```objc       
-(NSString*)setFullPhoneFormat:(NSString*)phone;
```

```objc
NSString *phoneNumber = @"71111111111";
phoneNumber = [phoneNumber setFullPhoneFormat:phoneNumber];
```

Result:
```
+7 (111) 111-11-11
```

<li>Reset phone format to full number

```objc
-(NSString*)resetFullPhoneFormat:(NSString*)phone;
```

```objc
NSString *phoneNumber = @"+7 (111) 111-11-11";
phoneNumber = [phoneNumber resetFullPhoneFormat:phoneNumber];
```

Result:
```
71111111111
```
<li>Enter a phone from kyeboard

Firstly you need to set phone prefix. 
In textField "textFieldShouldBeginEditing" or "textFieldDidBeginEditing" delegate methods call this:
```objc

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    textField.text = [textField.text phonePrefix];
}
```
And then in in textField "textFieldDidChange" delegate method:
```objc

-(void)textFieldDidChange :(UITextField *)textField{
    textField.text = [textField.text phoneFormatFromString:textField.text];
}
```
## Contributing

## License
