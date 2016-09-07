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
    
## Contributing

## License
