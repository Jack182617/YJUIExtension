//
//  UIApplication+Extension.swift
//  YuChat
//
//  Created by 张川 on 2022/6/29.
//

import Foundation

extension UIApplication {
    var windowInScenes: UIWindow? { return windows.first { $0.isKeyWindow } }
}
