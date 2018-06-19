//
//  ViewController.swift
//  GPUImageLookupFilter
//
//  Created by Thanh Nguyen on 6/19/18.
//  Copyright © 2018 Thanh Nguyen. All rights reserved.
//

import UIKit
import GPUImage

class ViewController: UIViewController {
    @IBOutlet weak var originImageView: UIImageView!
    @IBOutlet weak var filteredImageView: UIImageView!
    @IBOutlet weak var filterNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let originImage = UIImage(named: "pic2")
        originImageView.image = originImage

        var lookupImageNames = ["lookup_amatorka", "lookup_fgfacolor", "lookup_lofi", "lookup_mayfair", "lookup_miss_etikate", "lookup_nashville", "lookup_nguocnang", "lookup_soft_elegance_1", "lookup_soft_elegance_2"]
        let randomIndex = Int(arc4random_uniform(UInt32(lookupImageNames.count)))
        let lookupImageName = lookupImageNames[randomIndex]

        guard let lookupImage = UIImage(named: lookupImageName) else { return }
        guard let lookupFilter = LookupFilter(withLookupImage: lookupImage) else { return }

        let filteredImage = lookupFilter.image(byFilteringImage: originImage)
        filteredImageView.image = filteredImage
        filterNameLabel.text = lookupImageName
    }
}

