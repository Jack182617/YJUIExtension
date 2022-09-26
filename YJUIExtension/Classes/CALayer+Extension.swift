//
//  CAlayer.swift
//  YuChat
//
//  Created by 张川 on 2022/6/30.
//

import Foundation

extension CALayer {
    /// 渐变色
    @discardableResult
    func gradientColors(_ colors: [Any]? = UIColor.themePurple, width: CGFloat, height: CGFloat, locations: [NSNumber] = [0, 1], startPoint: CGPoint = PointDirection.h.start, endPoint: CGPoint = PointDirection.h.end, cornerRadius: CGFloat = 0) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        layer.colors = colors
        layer.locations = locations
        layer.startPoint = startPoint
        layer.endPoint = endPoint
        layer.cornerRadius = cornerRadius
        insertSublayer(layer, at: 0)
        return layer
    }
}
enum PointDirection {
    static let h = (start: CGPoint(x: 0, y: 0.5), end: CGPoint(x: 1, y: 0.5))
    static let v = (start: CGPoint(x: 0.5, y: 0), end: CGPoint(x: 0.5, y: 1))
}
