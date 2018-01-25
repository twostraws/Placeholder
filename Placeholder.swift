//
// MIT License
//
// Copyright (c) 2018 Paul Hudson
// https://www.github.com/twostraws/Placeholder
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import UIKit

/**
Placeholder is a `UIImageView` subclass that makes it easy to show
 placeholder image data in layouts. By default it renders the size of
 the placeholder, but you can also provide a title.
 */
@IBDesignable class Placeholder: UIImageView {
    /// Title text to render inside the image
    @IBInspectable var title: String = ""

    /// The color of the title text
    @IBInspectable var textColor: UIColor = .white
    
    /// The font size of the title text
    @IBInspectable var textFontSize: CGFloat = 20

    /// Whether to round the edges of the placeholder graphic.
    /// This automatically rounds to the smallest of the width
    /// or height of the view.
    @IBInspectable var rounded: Bool = false

    /// The label used to render title and size text
    private var label: UILabel!
    
    /// Adjustment in font size to make the title font slightly bigger
    private let titleFontSizeAdjustment: CGFloat = 4

    override required init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }

    /** This configures the size label according to the current
     settings. This will get called whenever the image view
     is re-laid out (e.g. after rotation).
    */
    private func configure() {
        if label == nil {
            // make sure we don't render the label outside of ourselves
            clipsToBounds = true

            label = UILabel()
            label.numberOfLines = 0
            label.textAlignment = .center
            addSubview(label)

            // center the label inside the placeholder space
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }

        // apply rounding as needed
        if rounded == true {
            layer.cornerRadius = min(bounds.midX, bounds.midY)
        }

        // put the width and height for this view into a string
        let width = Int(bounds.width)
        let height = Int(bounds.height)
        let size = "\(width)x\(height)"

        // configure attributes of the size text
        let sizeAttrs =  [NSAttributedStringKey.font: UIFont.systemFont(ofSize: textFontSize)]
        let sizeString = NSAttributedString(string: size, attributes: sizeAttrs)

        if title.isEmpty {
            // if we don't have a size render the text immediately
            label.attributedText = sizeString
        } else {
            // if we do have a title, prepare that with some attributes that are slightly
            // bigger than the size
            let titleAttrs = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: textFontSize + titleFontSizeAdjustment)]
            let titleString = NSMutableAttributedString(string: "\(title)\n", attributes: titleAttrs)

            // append the size string and put it inside the label
            titleString.append(sizeString)
            label.attributedText = titleString
        }

        // make sure the label color reflects the latest setting
        label.textColor = textColor
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configure()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
}
