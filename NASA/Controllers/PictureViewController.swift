//
//  PictureViewController.swift
//  NASA
//
//  Created by Ульяна Гритчина on 27.01.2022.
//

import UIKit

class PictureViewController: UIViewController {
    
    @IBOutlet var indicator: UIActivityIndicatorView!
    @IBOutlet var pictureImage: MyImageView!
    
    @IBOutlet var infoView: UIView!
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var infoLable: UILabel!
    
    private var astronomyPicture: AstronomyPicture?
    private var shown = false
    private var imageURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoView.layer.opacity = 0
        pictureImage.layer.opacity = 0
        
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        
        fetchData(from: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let fullPictureVC = segue.destination as? FullImageViewController else {return}
        fullPictureVC.imageURL = imageURL
    }
    
    @IBAction func showInfo(_ sender: UIBarButtonItem) {
        shown.toggle()
        infoView.show(shown: shown, start: 0, end: 0.8)
        infoView.layer.opacity = shown ? 0.8 : 0
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { result in
            switch result {
                
            case .success(let astronomyPicture):
                self.imageURL = astronomyPicture.url ?? ""
                self.indicator.stopAnimating()
                self.pictureImage.fetchImage(from: self.imageURL)
                self.title = astronomyPicture.date
                self.titleLable.text = astronomyPicture.title
                self.infoLable.text = astronomyPicture.explanation
                self.pictureImage.show(start: 0, end: 1)
                self.pictureImage.layer.opacity = 1
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

