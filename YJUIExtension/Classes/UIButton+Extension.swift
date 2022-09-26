//
//  UIButton+Extension.swift
//  YuChat
//
//  Created by 张川 on 2022/6/29.
//

import Foundation
import UIKit

extension UIButton {
    convenience init(title: String = "",
                     titleFont: UIFont = .pfRegular(16),
                     titleColor: UIColor? = .clear,
                     image: UIImage? = nil,
                     backgroundImage: UIImage? = nil) {
        self.init(type: .custom)
        titleLabel?.font = titleFont
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        setImage(image, for: .normal)
        setBackgroundImage(backgroundImage, for: .normal)
        setBackgroundImage(backgroundImage, for: .highlighted)
    }
    
    convenience init(image: UIImage) {
        self.init(type: .custom)
        imageForNormal = image
    }
}

extension UIButton {
    func gender(_ gender: Gender = .boy) {
        switch gender {
        case .boy:
            setImage(R.image.icon_gender_boy(), for: .normal)
            backgroundColor = .genderBoy

        case .girl:
            setImage(R.image.icon_gender_girl(), for: .normal)
            backgroundColor = .genderGril

        default:
            setImage(R.image.icon_gender_boy(), for: .normal)
            backgroundColor = nil
        }
    }
}

fileprivate let kLabelVerticalOffsetCompensation: CGFloat = 3.0
extension UIButton {
    func verticalImageAndTitle(withSpace spacing: CGFloat) {
        guard let titleLabel = titleLabel, let font = titleLabel.font else { return }
        let imageSize = imageView?.frame.size
        let textSize: CGSize = NSString(string: titleLabel.text ?? "").size(withAttributes: [NSAttributedString.Key.font: font])
        guard let imageSize = imageSize else {
            return
        }

        let textWidth = ceil(textSize.width)
        let textHeight = ceil(textSize.height)
        
        let frameSize = CGSize(width: textWidth, height: textHeight)
        contentVerticalAlignment = .top
        contentHorizontalAlignment = .left

        let imageTop = (bounds.size.height - imageSize.height - frameSize.height - spacing + kLabelVerticalOffsetCompensation) / 2
        let imageLeft = (bounds.size.width - imageSize.width) * 0.5
        let titleTop = imageTop + imageSize.height + spacing - kLabelVerticalOffsetCompensation
        let titleLeft: CGFloat = frameSize.width > bounds.size.width ? -imageSize.width + 3.5 : (-imageSize.width + imageLeft + (imageSize.width - frameSize.width) / 2)

        imageEdgeInsets = UIEdgeInsets(top: imageTop, left: imageLeft, bottom: 0, right: 0)
        titleEdgeInsets = UIEdgeInsets(top: titleTop, left: titleLeft, bottom: 0, right: 0)
    }

    func verticalImageAndTitle(withSpace spacing: CGFloat, topMargin margin: CGFloat) {
        let imageSize = imageView?.frame.size
        var titleSize = titleLabel?.frame.size
        var textSize: CGSize? = nil
        if let font = titleLabel?.font {
            textSize = titleLabel?.text?.size(withAttributes: [
                NSAttributedString.Key.font: font
            ])
        }
        let frameSize = CGSize(width: ceil(textSize?.width ?? 0), height: ceil(textSize?.height ?? 0))
        if (titleSize?.width ?? 0.0) + 0.5 < frameSize.width {
            titleSize?.width = frameSize.width
        }
        contentVerticalAlignment = .top
        imageEdgeInsets = UIEdgeInsets(top: margin, left: 0, bottom: 0, right: -(titleSize?.width ?? 0.0))
        titleEdgeInsets = UIEdgeInsets(top: margin + (imageSize?.height ?? 0.0) + spacing - kLabelVerticalOffsetCompensation, left: -(imageSize?.width ?? 0.0), bottom: 0, right: 0)
    }
}
