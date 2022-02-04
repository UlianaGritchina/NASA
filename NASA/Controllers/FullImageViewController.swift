//
//  FullImageViewController.swift
//  NASA
//
//  Created by Ульяна Гритчина on 04.02.2022.
//

import UIKit

class FullImageViewController: UIViewController {

    @IBOutlet var fullImage: MyImageView!
    
    var imageURL: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullImage.fetchImage(from: imageURL)
    }
}
