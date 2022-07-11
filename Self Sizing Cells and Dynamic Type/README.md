![Self Sizing Cells and Dynamic Type](https://user-images.githubusercontent.com/107209053/178227813-def8a4fb-73a5-4c10-b86a-69208574659c.png)

# Using Custom Font & Dynamic Type
```swift
  @IBOutlet weak var nameLabel:UILabel!{
        didSet {
            if let customFont = UIFont(name: "Charter Bold", size: 20) {
                let fontMetrics = UIFontMetrics(forTextStyle: .headline)
                nameLabel.font = fontMetrics.scaledFont(for: customFont)
            }
            nameLabel.adjustsFontForContentSizeCategory = true
        }
    }
    
    
```
