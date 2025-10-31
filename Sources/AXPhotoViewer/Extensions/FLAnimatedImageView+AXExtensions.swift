//
//  FLAnimatedImageView+AXExtensions.swift
//  AXPhotoViewer
//
//  Created by Alex Hill on 6/11/17.
//  Copyright © 2017 Alex Hill. All rights reserved.
//

import FLAnimatedImage

import Foundation
import UIKit

extension FLAnimatedImageView {
    
    /// Copy a FLAnimatedImageView with its base attributes
    ///
    /// - Returns: A copy of the FLAnimatedImageView
    override func ax_copy() -> UIImageView {
        let imageView = super.ax_copy() as! FLAnimatedImageView
        imageView.animatedImage = self.animatedImage
        imageView.currentFrame = self.currentFrame
        imageView.currentFrameIndex = self.currentFrameIndex
        imageView.runLoopMode = self.runLoopMode
        return imageView
    }
    
    /// Syncs the sender's frames with the `imageView` passed in.
    ///
    /// - Parameter imageView: The `imageView` to inherit from.
    func ax_syncFrames(with imageView: FLAnimatedImageView?) {
        guard let imageView = imageView,
              let selfAnimatedImage = self.animatedImage,
              let otherAnimatedImage = imageView.animatedImage,
              selfAnimatedImage.data == otherAnimatedImage.data else {
            return
        }
        
        self.currentFrameIndex = imageView.currentFrameIndex
        self.currentFrame = imageView.currentFrame
        self.needsDisplayWhenImageBecomesAvailable = true
        self.layer.setNeedsDisplay()
    }
}

// MARK: - Private Extensions for FLAnimatedImageView

private extension FLAnimatedImageView {
    
    /// Unfortunately, FLAnimatedImageView does not allow for setting the current frame index, however, it should work just fine
    /// when the requested frame is already cached.
    /// Internal use only.
    var currentFrameIndex: UInt {
        get {
            return value(forKey: "currentFrameIndex") as? UInt ?? 0
        }
        set {
            setValue(newValue, forKey: "currentFrameIndex")
        }
    }
    
    /// Unfortunately, FLAnimatedImageView does not allow for setting the current frame, however, it should work just fine
    /// when the requested frame is already cached.
    /// Internal use only.
    var currentFrame: UIImage? {
        get {
            return value(forKey: "currentFrame") as? UIImage
        }
        set {
            setValue(newValue, forKey: "currentFrame")
        }
    }
    
    /// When the requested internal frame is not cached, set this property for display ASAP.
    /// Internal use only.
    var needsDisplayWhenImageBecomesAvailable: Bool {
        get {
            return value(forKey: "needsDisplayWhenImageBecomesAvailable") as? Bool ?? false
        }
        set {
            setValue(newValue, forKey: "needsDisplayWhenImageBecomesAvailable")
        }
    }
}
