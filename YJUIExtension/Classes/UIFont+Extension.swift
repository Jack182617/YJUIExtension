//
//  UIFont+Extension.swift
//  YuChat
//
//  Created by 张川 on 2022/6/29.
//

import Foundation
import UIKit

extension UIFont {
    class func font(_ size: CGFloat) -> UIFont { .systemFont(ofSize: size) }
    class func regular(_ size: CGFloat) -> UIFont { .systemFont(ofSize: size, weight: .regular) }
    class func medium(_ size: CGFloat) -> UIFont { .systemFont(ofSize: size, weight: .medium) }
    class func semibold(_ size: CGFloat) -> UIFont { .systemFont(ofSize: size, weight: .semibold) }
    class func pfMedium(_ size: CGFloat) -> UIFont {
        UIFont(name: "PingFangSC-Medium", size: size) ?? .font(size)
    }

    class func pfRegular(_ size: CGFloat) -> UIFont {
        UIFont(name: "PingFangSC-Regular", size: size) ?? .font(size)
    }
    
    class func pfLight(_ size: CGFloat) -> UIFont {
        UIFont(name: "PingFangSC-Light", size: size) ?? .font(size)
    }
    
    class func pfSemibold(_ size: CGFloat) -> UIFont {
        UIFont(name: "PingFangSC-Semibold", size: size) ?? .font(size)
    }

}
