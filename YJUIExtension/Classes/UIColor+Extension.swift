//
//  UIColor+Extension.swift
//  YuChat
//
//  Created by 张川 on 2022/6/29.
//

import Foundation
import SwiftUI

extension UIColor {
    /// #C1C1C1
    static let C1 = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    /// #999999
    static let H9 = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    /// #666666
    static let H6 = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
    /// #333333
    static let H3 = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    /// #F1F1F1
    static let F1 = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
    /// #F6F6F6
    static let F6 = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
    /// #E1E1E1
    static let E1 = #colorLiteral(red: 0.8823529412, green: 0.8823529412, blue: 0.8823529412, alpha: 1)
    /// #F25541
    static let RedF25541 = #colorLiteral(red: 0.9490196078, green: 0.3333333333, blue: 0.2549019608, alpha: 1)
    /// #27D0CC
    static let Green27D0CC = #colorLiteral(red: 0.1529411765, green: 0.8156862745, blue: 0.8, alpha: 1)
    /// #9450F0
    static let Purple9450F0 = #colorLiteral(red: 0.5803921569, green: 0.3137254902, blue: 0.9411764706, alpha: 1)
    /// 性别 男 蓝色
    static let genderBoy = #colorLiteral(red: 0.4470588235, green: 0.6588235294, blue: 1, alpha: 1)
    /// 性别 女 粉色
    static let genderGril = #colorLiteral(red: 1, green: 0.4470588235, blue: 0.7254901961, alpha: 1)
    /// #FA6876
    static let FA6876 = #colorLiteral(red: 0.9803921569, green: 0.4078431373, blue: 0.462745098, alpha: 1)
    /// #F4DFF6
    static let F4DFF6 = #colorLiteral(red: 0.9568627451, green: 0.8745098039, blue: 0.9647058824, alpha: 1)
    /// #FCA5FF
    static let FCA5FF = #colorLiteral(red: 0.9882352941, green: 0.6470588235, blue: 1, alpha: 1)
    /// #C26AFF
    static let C26AFF = #colorLiteral(red: 0.7607843137, green: 0.4156862745, blue: 1, alpha: 1)
    /// #E450F0
    static let E450F0 = #colorLiteral(red: 0.8941176471, green: 0.3137254902, blue: 0.9411764706, alpha: 1)
    /// #DC50F0
    static let DC50F0 = #colorLiteral(red: 0.862745098, green: 0.3137254902, blue: 0.9411764706, alpha: 1)
    /// #9450F0
    static let H9450F0 = #colorLiteral(red: 0.5803921569, green: 0.3137254902, blue: 0.9411764706, alpha: 1)
    /// #6B1FAF
    static let H6B1FAF = #colorLiteral(red: 0.4196078431, green: 0.1215686275, blue: 0.6862745098, alpha: 1)
    /// #F2E8FF
    static let F2E8FF = #colorLiteral(red: 0.9490196078, green: 0.9098039216, blue: 1, alpha: 1)
    /// #F7D729
    static let F7D729 = #colorLiteral(red: 0.968627451, green: 0.8431372549, blue: 0.1607843137, alpha: 1)
    /// #FFFD00
    static let FFFD00 = #colorLiteral(red: 1, green: 0.9921568627, blue: 0, alpha: 1)
    /// #F6DE89
    static let F6DE89 = #colorLiteral(red: 0.9647058824, green: 0.8705882353, blue: 0.537254902, alpha: 1)
    /// #FFB600
    static let FFB600 = #colorLiteral(red: 1, green: 0.7137254902, blue: 0, alpha: 1)
    /// #FF9737
    static let FF9737 = #colorLiteral(red: 1, green: 0.5921568627, blue: 0.2156862745, alpha: 1)
    /// #FF6C00
    static let FF6C00 = #colorLiteral(red: 1, green: 0.4235294118, blue: 0, alpha: 1)
    /// #F9C8B4
    static let F9C8B4 = #colorLiteral(red: 0.9764705882, green: 0.7843137255, blue: 0.7058823529, alpha: 1)
    /// #5B5879
    static let H5B5879 = #colorLiteral(red: 0.3568627451, green: 0.3450980392, blue: 0.4745098039, alpha: 1)
    /// #C7DEFF
    static let C7DEFF = #colorLiteral(red: 0.7803921569, green: 0.8705882353, blue: 1, alpha: 1)
    
    static let themePurple = [#colorLiteral(red: 0.5803921569, green: 0.3137254902, blue: 0.9411764706, alpha: 1).cgColor, #colorLiteral(red: 0.8941176471, green: 0.3137254902, blue: 0.9411764706, alpha: 1).cgColor]

    static let themeOrange = [#colorLiteral(red: 1, green: 0.7294117647, blue: 0, alpha: 1).cgColor, #colorLiteral(red: 1, green: 0.4235294118, blue: 0, alpha: 1).cgColor]

    /// 视图默认底色 #F7F8F9
    static let HF7F8F9 = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9764705882, alpha: 1)

    static let redPacket = [#colorLiteral(red: 1, green: 0.5215686275, blue: 0.2705882353, alpha: 1).cgColor, #colorLiteral(red: 0.968627451, green: 0.1803921569, blue: 0.3607843137, alpha: 1).cgColor]

    /// 随机颜色
    class var random: UIColor {
        let r = CGFloat(arc4random() % 255) / 255.0
        let g = CGFloat(arc4random() % 255) / 255.0
        let b = CGFloat(arc4random() % 255) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }

    /// eg.0xFFFFFF
    class func hex(_ value: Int) -> UIColor {
        let r = CGFloat((value & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((value & 0xFF00) >> 8) / 255.0
        let b = CGFloat(value & 0xFF) / 255.0

        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }

    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        var hexString = hexString.hasPrefix("#") ? String(hexString.dropFirst()) : hexString
        guard hexString.count == 3 || hexString.count == 6 else {
            self.init(white: 1, alpha: 0)
            return
        }

        if hexString.count == 3 {
            for (index, char) in hexString.enumerated() {
                hexString.insert(char, at: hexString.index(hexString.startIndex, offsetBy: index * 2))
            }
        }

        guard let intCode = Int(hexString, radix: 16) else {
            self.init(white: 1, alpha: 0)
            return
        }
        self.init(hex: intCode, alpha: alpha)
    }

    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(redValue: CGFloat((hex >> 16) & 0xFF),
                  greenValue: CGFloat((hex >> 8) & 0xFF),
                  blueValue: CGFloat((hex) & 0xFF), alpha: alpha)
    }

    convenience init(redValue: CGFloat, greenValue: CGFloat, blueValue: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: redValue / 255.0, green: greenValue / 255.0, blue: blueValue / 255.0, alpha: alpha)
    }

    /// hexString to UIColor, default is black color
    /// support FFF, FFFF, FFFFFF, FFFFFFFF
    /// - Parameters:
    ///   - hex: hex string
    ///   - ahex: is AHEX or HEXA, e.g. AHEX: #FFF7D729, HEXA: #F7D729FF
    public convenience init(hex: String, ahex: Bool = true) {
        let hexString = hex.replacingOccurrences(of: "#", with: "")
        let hex = hexString.trimmingCharacters(in: NSCharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        var r: UInt64 = 0
        var g: UInt64 = 0
        var b: UInt64 = 0
        var a: UInt64 = 0
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b, a) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17, 255)
        // iCSS specification in the form of #F0FA
        case 4: // ARGB (24-bit)
            if ahex {
                (a, r, g, b) = ((int >> 12) * 17, (int >> 8 & 0xF) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            } else {
                (r, g, b, a) = ((int >> 12) * 17, (int >> 8 & 0xF) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            }
        case 6: // RGB (24-bit)
            (r, g, b, a) = (int >> 16, int >> 8 & 0xFF, int & 0xFF, 255)
        case 8: // ARGB (32-bit)
            if ahex {
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            } else {
                (r, g, b, a) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            }
        default:
            print("String is not a valid hex colour string: \(hexString)")
        }
        self.init(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: CGFloat(a) / 255
        )
    }

    class func dy_color(light: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), dark: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) -> UIColor {
        UIColor(dynamicProvider: { traitCollection in
            if traitCollection.userInterfaceStyle == .dark {
                return dark
            } else {
                return light
            }
        })
    }
}
