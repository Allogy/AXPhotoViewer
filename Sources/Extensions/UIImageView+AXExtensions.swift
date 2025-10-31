//
//  UIImageView+AXExtensions.swift
//  AXPhotoViewer
//
//  Created by Alex Hill on 3/10/18.
//

import UIKit

extension UIImageView {
    
    /// Copy a UIImageView's with its base attributes
    ///
    /// - Returns: A copy of the UIImageView
    /// - Note: Does not conform to NSCopying (may conflict with another definition)
    @objc func ax_copy() -> UIImageView {
        let imageView = type(of: self).init()
        imageView.image = self.image
        imageView.highlightedImage = self.highlightedImage
        imageView.animationImages = self.animationImages
        imageView.highlightedAnimationImages = self.highlightedAnimationImages
        imageView.animationDuration = self.animationDuration
        imageView.animationRepeatCount = self.animationRepeatCount
        imageView.isHighlighted = self.isHighlighted
        imageView.tintColor = self.tintColor
        imageView.transform = self.transform
        imageView.frame = self.frame
        imageView.layer.cornerRadius = self.layer.cornerRadius
        imageView.layer.masksToBounds = self.layer.masksToBounds
        imageView.contentMode = self.contentMode
        return imageView
    }
}