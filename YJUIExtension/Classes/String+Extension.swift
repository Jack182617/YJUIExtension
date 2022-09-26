//
//  String+Extension.swift
//  YuChat
//
//  Created by yzsy on 2022/6/30.
//

import Foundation
extension String {
    /// 语聊房 文字消息
    func attributedString(default color: UIColor = .FFFD00) -> NSAttributedString {
        if Validate.contains(html: self), let attr = self.htmlString() {
            return attr
        }
        return NSAttributedString(string: self, attributes: [.foregroundColor: color])
    }
    
    var netRoundedImageUrl: URL? {
        var urlString = self
        if urlString.split(separator: "!").count >= 2,
           let replaceText = urlString.split(separator: "!").last
        {
            urlString = urlString.replacingOccurrences(of: "!" + replaceText, with: "")
        }
        if !urlString.contains("!circle170") {
            urlString += "!circle170"
        }
        return URL(string: urlString)
    }
    

    var htmlAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else {
            return nil
        }

        return try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
    }

    var encodBase64: String {
        if let data = data(using: .utf8) {
            return data.base64EncodedString()
        }
        return self
    }

    func htmlString(_ font: UIFont = .systemFont(ofSize: 14), lineSpacing: CGFloat = 5, isTextView: Bool = false) -> NSAttributedString? {
        guard let document = htmlAttributedString else { return nil }

        let attString = NSMutableAttributedString(attributedString: document)
        attString.yy_font = font
        attString.yy_lineSpacing = lineSpacing

        if !isTextView {
            attString.yy_lineBreakMode = .byTruncatingTail
        }
        return attString
    }

    func htmlText(color: String = "#999999", font: UIFont = .systemFont(ofSize: 12)) -> NSAttributedString? {
        let modifiedFont = String(format: "<span style=\"color:\(color)\";font-family: \(font.fontName); font-size: \(font.pointSize)\">%@</span>", self)

        guard let data = modifiedFont.data(using: .unicode, allowLossyConversion: true) else {
            return nil
        }

        guard let htmlAtt = try? NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        else {
            return nil
        }

        let paragraphStye = NSMutableParagraphStyle()
        paragraphStye.lineSpacing = 8
        paragraphStye.alignment = .left
        paragraphStye.lineBreakMode = .byTruncatingTail

        let att: [NSAttributedString.Key: Any] = [.paragraphStyle: paragraphStye]
        htmlAtt.addAttributes(att, range: NSRange(location: 0, length: htmlAtt.length))
        return htmlAtt
    }

//    func htmlText(color hexString: String = "#999999", font: UIFont = .systemFont(ofSize: 12), isOffice: Bool = false) -> NSAttributedString? {
//        if isOffice {
//            let modifi = String(format: "<span style=\"color:\(hexString)\";font-family: \(font.fontName); font-size: \(font.pointSize)\">%@</span>", self)
//            guard let data = modifi.data(using: .unicode) else { return nil }
//            let attr = try? NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
//            return attr
//        }
//        let modifiedFont = String(format: "<span style=\"color:\(hexString)\";font-family: \(font.fontName); font-size: \(font.pointSize)\">%@</span>", self)
//
//        guard let data = modifiedFont.data(using: .unicode, allowLossyConversion: true) else {
//            return nil
//        }
//
//        guard let htmlAtt = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
//        else {
//            return nil
//        }
//
//        let paragraphStye = NSMutableParagraphStyle()
//        paragraphStye.lineSpacing = 6
//        paragraphStye.alignment = .center
//
//        let attString = NSMutableAttributedString(attributedString: htmlAtt)
//
//        let att: [NSAttributedString.Key: Any] = [.paragraphStyle: paragraphStye]
//        attString.addAttributes(att, range: NSRange(location: 0, length: attString.length))
//
//        return attString
//    }

    func sizeWithText(font: UIFont, size: CGSize) -> CGSize {
        let attributes = [NSAttributedString.Key.font: font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin

        let rect = boundingRect(with: size, options: option, attributes: attributes, context: nil)
        return rect.size
    }

    /// 拼装路径
    func appendingPathComponent(_ string: String) -> String {
        return URL(fileURLWithPath: self).appendingPathComponent(string).path
    }

    /// 显示暗文
    func encryption(number: Int) -> String {
        guard number < count else { return self }
        let conversion = (1 ... number).map { _ -> String in
            "*"
        }.joined(separator: "")
        let interval = (count - number) / 2

        let start = index(startIndex, offsetBy: interval)
        let startString = String(self[..<start])
        let end = index(startIndex, offsetBy: interval + number)
        let endString = String(self[end ..< endIndex])
        return startString + conversion + endString
    }

    /// 去除html标签
    func removeHtml() -> String {
        if let regular = try? NSRegularExpression(pattern: "<[^>]*>|\n", options: NSRegularExpression.Options(rawValue: 0)) {
            return regular.stringByReplacingMatches(in: self, options: .reportProgress, range: NSRange(location: 0, length: count), withTemplate: "")
        }
        return self
    }

    func boundingRect(with constrainedSize: CGSize, font: UIFont, lineSpacing: CGFloat? = nil) -> CGSize {
        let attritube = NSMutableAttributedString(string: self)
        let range = NSRange(location: 0, length: attritube.length)
        attritube.addAttributes([NSAttributedString.Key.font: font], range: range)
        if lineSpacing != nil {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing!
            attritube.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        }

        let rect = attritube.boundingRect(with: constrainedSize, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        var size = rect.size

        if let currentLineSpacing = lineSpacing {
            // 文本的高度减去字体高度小于等于行间距，判断为当前只有1行
            let spacing = size.height - font.lineHeight
            if spacing <= currentLineSpacing, spacing > 0 {
                size = CGSize(width: size.width, height: font.lineHeight)
            }
        }

        return size
    }

    func boundingRect(with constrainedSize: CGSize, font: UIFont, lineSpacing: CGFloat? = nil, lines: Int) -> CGSize {
        if lines < 0 {
            return .zero
        }

        let size = boundingRect(with: constrainedSize, font: font, lineSpacing: lineSpacing)
        if lines == 0 {
            return size
        }

        let currentLineSpacing = (lineSpacing == nil) ? (font.lineHeight - font.pointSize) : lineSpacing!
        let maximumHeight = font.lineHeight * CGFloat(lines) + currentLineSpacing * CGFloat(lines - 1)
        if size.height >= maximumHeight {
            return CGSize(width: size.width, height: maximumHeight)
        }

        return size
    }

    func subString(start: Int, length: Int = -1) -> String {
        var len = length
        if len == -1 {
            len = count - start
        }
        let st = index(startIndex, offsetBy: start)
        let en = index(st, offsetBy: len)
        return String(self[st ..< en])
    }
    
    //将原始的url编码为合法的url
    var urlEncoded: String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
                .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
    
    //将编码后的url转换回原始的url
    var urlDecoded: String {
        return self.removingPercentEncoding ?? ""
    }
    
    ///1, 截取规定下标之后的字符串
    func subStringFrom(index: Int) -> String {
        let temporaryString: String = self
        let temporaryIndex = temporaryString.index(temporaryString.startIndex, offsetBy: index)
        return String(temporaryString[temporaryIndex...])
    }
    
    ///2, 截取规定下标之前的字符串
    func subStringTo(index: Int) -> String {
        let temporaryString = self
        if index > count { return String(temporaryString[...endIndex]) }
        let temporaryIndex = temporaryString.index(temporaryString.startIndex, offsetBy: index)
        return String(temporaryString[...temporaryIndex])
    }
    
    /// Range 转 NSRange
    func nsRange(of searchString: String) -> NSRange? {
        return NSString(string: self).range(of: searchString)
    }
    
}
