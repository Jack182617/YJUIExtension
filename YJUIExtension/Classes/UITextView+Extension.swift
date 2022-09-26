//
//  UITextView+Extension.swift
//  YuChat
//
//  Created by Harwyn Tan on 2022/7/22.
//

import Foundation

extension UITextView {
    /// 表情文字混排变成文本
    var plainString: String {
        let plainString = NSMutableString(string: textStorage.string)
        var base = 0

        textStorage.enumerateAttribute(NSAttributedString.Key.attachment, in: NSRange(location: 0, length: textStorage.length), options: []) { value, range, _ in
            if let value = value, value is FaceTextAttachment {
                let attachment = value as! FaceTextAttachment
                let replaceRange = NSMakeRange(range.location + base, range.length)
                plainString.replaceCharacters(in: replaceRange, with: attachment.faceName)
                base += attachment.faceName.count - 1
                PPLog(plainString)
            }
        }

        return plainString as String
    }

    func insertPicture(_ image: UIImage, name: String = "") {
        // 获取textView的所有文本，转成可变的文本
        let mutableStr = NSMutableAttributedString(attributedString: attributedText)

        // 创建图片附件
        let imgAttachment = FaceTextAttachment(data: nil, ofType: nil)
        imgAttachment.image = image
        imgAttachment.faceName = name
        imgAttachment.bounds = CGRect(x: 0, y: -(font!.lineHeight - font!.pointSize) / 2, width: font!.pointSize, height: font!.pointSize)

        var imgAttachmentString: NSAttributedString

        // 设置图片显示方式与文字一样大小
        imgAttachmentString = NSAttributedString(attachment: imgAttachment)

        // 获得目前光标的位置
//        let selectedRange = selectedRange
        // 插入文字
        mutableStr.insert(imgAttachmentString, at: selectedRange.location)
        // 设置可变文本的字体属性
        mutableStr.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 16), range: NSMakeRange(0, mutableStr.length))
        // 再次记住新的光标的位置
        let newSelectedRange = NSMakeRange(selectedRange.location + 1, 0)

        // 重新给文本赋值
        attributedText = mutableStr
        // 恢复光标的位置（上面一句代码执行之后，光标会移到最后面）
        selectedRange = newSelectedRange
        // 移动滚动条（确保光标在可视区域内）
        scrollRangeToVisible(newSelectedRange)

        /// Reset text style
        resetTextStyle()
    }

    func resetTextStyle() {
        let range = NSMakeRange(0, textStorage.length)
        textStorage.removeAttribute(NSAttributedString.Key.font, range: range)
        textStorage.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 16), range: range)
    }
}
