//
//  Data+GIF.swift
//  AXPhotoViewer
//
//  Created by Alex Hill on 6/11/17.
//  Copyright © 2017 Alex Hill. All rights reserved.
//

import Foundation
import ImageIO
import UniformTypeIdentifiers

extension Data {

    func containsGIF() -> Bool {
        let sourceData = self as CFData
        
        let options: [String: Any] = [kCGImageSourceShouldCache as String: false]
        guard let source = CGImageSourceCreateWithData(sourceData, options as CFDictionary?),
            let sourceContainerType = CGImageSourceGetType(source) else {
            return false
        }
        
		guard let utType = UTType(sourceContainerType as String) else {
            return false
        }
        return utType.conforms(to: .gif)
    }
}
