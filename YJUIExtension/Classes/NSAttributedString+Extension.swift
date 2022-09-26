//
//  NSAttributedString+Extension.swift
//  YuChat
//
//  Created by Harwyn Tan on 2022/7/28.
//

import CoreGraphics

extension NSAttributedString {
    /*
     /// 表情图文 -> 普通文本
     func plainString() -> String {
         let plainString = NSMutableString(string: string)
         var base = 0

         enumerateAttribute(NSAttributedString.Key.font, in: NSRange(location: 0, length: length), options: []) { value, range, _ in
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
     */

    /// 表情消息
    func faceText(_ font: UIFont = .regular(16), lineSpaing: CGFloat = 8) -> NSAttributedString {
        /// 替换连续空格为一个
        let text = g_regexPattern(pattern: "\\s{2,}", string: string)
        if text.isEmpty {
            return NSMutableAttributedString(string: "")
        }
        /// 1、创建一个可变的属性字符串
        let attributeString = NSMutableAttributedString(string: text, attributes: [.font: font])
        attributeString.yy_lineSpacing = lineSpaing
        return attributeString
    }
}
