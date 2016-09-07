# AKNSString+phoneFormatter.objc

## Installation

Add this line to your application's Podfile:

```ruby
pod 'AKNSString+phoneFormatter.obj'
```

And then execute:

    $ pod install

## Usage
```
-(NSString*)setFullPhoneFormat:(NSString*)phone;
```

```
NSString *phoneNumber = @"71111111111";
phoneNumber = [phoneNumber setFullPhoneFormat:phoneNumber];
```

Result:
```
+7 (111) 111-11-11
```

## Contributing

## License
