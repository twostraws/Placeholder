# Placeholder

When you’re busy prototyping an app, it’s helpful to be able to see at a glance what images still need to be filled and what size they are. Placeholder does exactly that: it’s a `UIImageView` subclass that automatically renders its size along with any title you want.

![Placeholder overlays an image’s size and title so you can see exactly what’s missing.](https://www.hackingwithswift.com/files/placeholder/screenshot.png)

To install, just drag Placeholder.swift into your Xcode project, then make change the class of any placeholder images to be `Placeholder` rather than `UIImageView`. When the final artwork arrives, all you need to do is change the class back to `UIImageView` and you’re back to normal – easy!

**Note:** Xcode 9.2 and earlier overlay the words “UIImageView” on all `UIImageView` subclasses, but this only occurs at design time. This bug is fixed in Xcode 9.3.


## Options

There are three properties for `Placeholder` images that you might want to customize, all of which are exposed to Interface Builder:

- `title` lets you add an optional string to be placed above the size, e.g. “User avatar”.
- `textColor` lets you adjust the text color used to render the title and size. Defaults to `.white`.
- `rounded` rounds the corners of the image view using the minimum of the width and height. This creates lozenges in rectangular views and circles in square views.


## License

MIT License.

Copyright (c) 2018 Paul Hudson

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
