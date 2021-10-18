# PowerplayToastKit

[![Version](https://img.shields.io/cocoapods/v/PowerplayToastKit.svg?style=flat)](https://cocoapods.org/pods/PowerplayToastKit)
[![License](https://img.shields.io/cocoapods/l/PowerplayToastKit.svg?style=flat)](https://cocoapods.org/pods/PowerplayToastKit)
[![Platform](https://img.shields.io/cocoapods/p/PowerplayToastKit.svg?style=flat)](https://cocoapods.org/pods/PowerplayToastKit)

## Toasts Type

Success.   

<img width="339" alt="Screenshot 2021-10-17 at 9 22 30 AM" src="https://user-images.githubusercontent.com/25058734/137700669-77a64939-d6bc-480d-93f6-c6973d0b6997.png">


Warning 

<img width="333" alt="Screenshot 2021-10-17 at 9 22 38 AM" src="https://user-images.githubusercontent.com/25058734/137701125-b11456ec-dbe9-4381-bdcd-651c9b33843b.png">


Error

<img width="332" alt="Screenshot 2021-10-17 at 9 22 44 AM" src="https://user-images.githubusercontent.com/25058734/137701189-7d31b2f2-30b3-4c3c-918b-cd85f0d1dadd.png">


Info

<img width="326" alt="Screenshot 2021-10-17 at 9 35 08 AM" src="https://user-images.githubusercontent.com/25058734/137701390-dd567573-2ad2-4b98-884e-a4e9ae66dc9d.png">


Custom View (Dialog)

<img width="406" alt="Screenshot 2021-10-17 at 9 23 10 AM" src="https://user-images.githubusercontent.com/25058734/137701485-2d5744da-8330-4d52-a9d0-c2e00fc215dd.png">


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 11+


## Installation

PowerplayToastKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PowerplayToastKit'
```

## Usage

### Quick Start

```swift

// success Toast at top
let heading = "Success"
let message = "This method was a success"
PowerplayToastKit
    .shared
    .showToast(of: .success(title: heading, message: message), at: .top)
    

// warning toast at bottom
let heading = "Warning"
let message = "Dont do that again or you're done !!"
PowerplayToastKit
    .shared
    .showToast(of: .warning(title: heading, message: message), at: .bottom)
    

// error toast at center with a time interval of 5 seconds
let heading = "Error"
let message = "This method could not be completed, unknown error occured !!"
PowerplayToastKit
    .shared
    .showToast(of: .error(title: heading, message: message), at: .center, for: 5)  
    

// info toast at custom position
let heading = "Info"
let message = "🕺🕺We are hiring at Powerplay🕺🕺 Check our carrer page!"
PowerplayToastKit
    .shared
    .showToast(of: .info(title: heading, message: message), at: .custom(callback: { toastView in
        toastView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(200)
        }
    }))     

```


## But wait, there's more!
---------
```swift
// You can show custom views in place of Toast (eg. dialog, bottomsheet, loading indicators, etc..)

// we pass .greatestFiniteMagnitude as TimeInterval which will make the Dialog appear for infinte time

// see example to see DialogView class
let dialogView = DialogView()
dialogView.translatesAutoresizingMaskIntoConstraints = false
dialogView.isUserInteractionEnabled = true
PowerplayToastKit
    .shared
    .showToast(withCustomView: dialogView, at: .bottom, for: .greatestFiniteMagnitude)
    
    
    
    
// You can Provide a ToastBuilder to change theme and modify the Toast View
    
let themeBuilder = ToastThemeBuilder()
    .set(backgroundColor: UIColor.systemRed.withAlphaComponent(0.78))
    .set(titleTextColor: .black)
    .set(messageTextColor: .black)
    .set(toastCornerRadius: 6)
        
let toastBuilder = ToastBuilder()
    .set(theme: themeBuilder)
    .set(type: ToastType.info(title: "Info", message: "Here's a Toast with a custom builder"))
    .set(position: .top)
        
PowerplayToastKit.shared.showToast(withBuilder: toastBuilder)
    
```



## Communication

- If you'd like to **ask a general question** or **need help**, reach out on [LinkedIn](https://www.linkedin.com/in/mithilesh-parmar-97395712b/). 
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.


## Author & Maintainer
[Mithlesh Parmar](https://github.com/mithilesh-parmar) ([linkedin](https://www.linkedin.com/in/mithilesh-parmar-97395712b/))



### Show some ❤️ and star the repo to support the project
### [Medium Article](https://medium.com/@mithileshparmar1/creating-your-own-toast-library-from-scratch-d3f1ec51d023) for this library


## License

>PowerplayToastKit is available under the MIT license. See the LICENSE file for more info.
>
>Copyright (c) 2021 Mithilesh Parmar <mithileshparmar1@gmail.com>
>
>Permission is hereby granted, free of charge, to any person obtaining a copy
>of this software and associated documentation files (the "Software"), to deal
>in the Software without restriction, including without limitation the rights
>to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>copies of the Software, and to permit persons to whom the Software is
>furnished to do so, subject to the following conditions:
>
>The above copyright notice and this permission notice shall be included in
>all copies or substantial portions of the Software.
>
>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>THE SOFTWARE.
