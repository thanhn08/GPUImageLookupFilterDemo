//
//  NguocNangFilter.swift
//  GPUImageLookupFilter
//
//  Created by Thanh Nguyen on 6/19/18.
//  Copyright © 2018 Thanh Nguyen. All rights reserved.
//

import UIKit
import GPUImage

class LookupFilter: GPUImageFilterGroup {
    var lookupImageSource: GPUImagePicture!
    var lookupFilter = GPUImageLookupFilter()

    init?(withLookupImage lookupImage: UIImage) {
        super.init()
        guard let lookupImageSource = GPUImagePicture(image: lookupImage) else { return nil }
        self.lookupImageSource = lookupImageSource
        self.addFilter(lookupFilter)

        lookupImageSource.addTarget(lookupFilter, atTextureLocation: 1)
        lookupFilter.useNextFrameForImageCapture()
        lookupImageSource.processImage()
        lookupImageSource.forceProcessing(at: lookupImageSource.outputImageSize())

        self.initialFilters = [lookupFilter]
        self.terminalFilter = lookupFilter
    }
}
