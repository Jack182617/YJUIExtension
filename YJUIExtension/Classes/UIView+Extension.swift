//
//  UIView+Extension.swift
//  YuChat
//
//  Created by 张川 on 2022/6/29.
//

import Foundation
open class BlockTap: UITapGestureRecognizer {
    private var tapAction: ((UITapGestureRecognizer) -> Void)?

    override public init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }

    public convenience init(
        tapCount: Int = 1,
        fingerCount: Int = 1,
        action: ((UITapGestureRecognizer) -> Void)?
    ) {
        self.init()
        numberOfTapsRequired = tapCount

        #if os(iOS)
            numberOfTouchesRequired = fingerCount
        #endif

        tapAction = action
        addTarget(self, action: #selector(BlockTap.didTap(_:)))
    }

    @objc open func didTap(_ tap: UITapGestureRecognizer) {
        tapAction? (tap)
    }
}

open class BlockPan: UIPanGestureRecognizer {
    private var panAction: ((UIPanGestureRecognizer) -> Void)?

    override public init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }

    public convenience init(action: ((UIPanGestureRecognizer) -> Void)?) {
        self.init()
        panAction = action
        addTarget(self, action: #selector(BlockPan.didPan(_:)))
    }

    @objc open func didPan(_ pan: UIPanGestureRecognizer) {
        panAction? (pan)
    }
}

extension UIView {
    func rounded(cornerRadius: CGFloat) {
        rounded(cornerRadius: cornerRadius, boardWidth: 0, boardColor: .clear)
    }

    func board(boardWidth: CGFloat, boardColor: UIColor) {
        rounded(cornerRadius: 0, boardWidth: boardWidth, boardColor: boardColor)
    }

    func rounded(cornerRadius: CGFloat, boardWidth: CGFloat, boardColor: UIColor) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = boardWidth
        layer.borderColor = boardColor.cgColor
        layer.masksToBounds = true
    }

    func rounded(cornerRadius: CGFloat, rectCorner: UIRectCorner) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: rectCorner, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }

    func shadow(shadowColor: UIColor, opacity: Float, radius: CGFloat, offset: CGSize) {
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
    }

    func addTapGesture(tapNumber: Int = 1, action: ((UITapGestureRecognizer) -> Void)?) {
        let tap = BlockTap(tapCount: tapNumber, fingerCount: 1, action: action)
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }

    func addPanGesture(action: ((UIPanGestureRecognizer) -> Void)?) {
        let pan = BlockPan(action: action)
        addGestureRecognizer(pan)
        isUserInteractionEnabled = true
    }
}

extension UIView {
    /// 类名为字符串标识
    class var markID: String {
        let name: AnyClass = object_getClass(self)!
        return NSStringFromClass(name)
    }

    /// 设置部分圆角(绝对布局)
    /// - Parameters:
    ///   - corners: UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
    ///   - radii: 需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
    func addRoundedCorners(corners: UIRectCorner, radii: CGSize) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: radii)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = bounds
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }

    /// 设置部分圆角(相对布局)
    /// - Parameters:
    ///   - corners: UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
    ///   - radii: 需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
    ///   - rect: 需要设置的圆角view的rect
    func addRoundedCorners(corners: UIRectCorner, radii: CGSize, rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: radii)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }
}
