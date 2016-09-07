# AKNSString+phoneFormatter

## Installation

Add this line to your application's Podfile:

```ruby
pod 'AKNSString+phoneFormatter'
```

And then execute:

    $ pod install


Import in your project:
```objc
#import "AKNSString+phoneFormatter.h"
```
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

Firstly add target to your textField property:
```objc

[self.myTextField addTarget:self 
                     action:@selector(textFieldDidChange:) 
           forControlEvents:UIControlEventEditingChanged];
```

Then you need to set phone prefix. 
In textField "textFieldShouldBeginEditing" or "textFieldDidBeginEditing" delegate methods call this:
```objc

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    textField.text = [textField.text phonePrefix];
}
```
And then in textField "textFieldDidChange" method:
```objc

-(void)textFieldDidChange :(UITextField *)textField{
    textField.text = [textField.text phoneFormatFromString:textField.text];
}
```
## Contributing

Bug reports and pull requests are welcome on GitHub at [this repository](https://github.com/it-machine/AKNSString-phoneFormatter.objc). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
