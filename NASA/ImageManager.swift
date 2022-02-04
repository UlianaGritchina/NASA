//
//  ImageManager.swift
//  NASA
//
//  Created by Ульяна Гритчина on 03.02.2022.
//

import UIKit

class ImageMeneger {
    static var shered = ImageMeneger()
  
    private init() {}
    
    func fetchImage(from url: URL, complition: @escaping(Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error  in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            DispatchQueue.main.async {
                complition(data, response)
            }

        }.resume()
        
    }
}
