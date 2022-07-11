
![work](https://user-images.githubusercontent.com/107209053/177266518-3bfca5a0-c05f-4634-951c-c3f9b10a4fc5.png)
 ![gifFont](https://user-images.githubusercontent.com/107209053/177267020-9e90e44d-6cad-4297-8da0-1d9be84be11a.gif)

```swift
 @IBOutlet weak var nameLabel:UILabel!{
        didSet {
            if let customFont = UIFont(name: "NameFont", size: 20) {
                let fontMetrics = UIFontMetrics(forTextStyle: .headline)
                nameLabel.font = fontMetrics.scaledFont(for: customFont)
            }
            nameLabel.adjustsFontForContentSizeCategory = true
        }
    }
```
