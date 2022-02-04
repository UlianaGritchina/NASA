//
//  ImageView.swift
//  NASA
//
//  Created by Ульяна Гритчина on 04.02.2022.
//

import UIKit

class MyImageView: UIImageView {
    
    func fetchImage(from url: String) {
        guard let url = URL(string: url) else {
            image = UIImage(named: "defolt")
            return
        }
        
        if let cachedIamge = getCachedImage(from: url) {
            image = cachedIamge
            return
        }
        
        MyImageMeneger.shered.fetchImage(from: url) { data, response in
            self.image = UIImage(data: data)
            
            guard let url = response.url else { return }
            
            let cachedRespons = CachedURLResponse(response: response, data: data)
            let reqest = URLRequest(url: url)
            
            URLCache.shared.storeCachedResponse(cachedRespons, for: reqest)
        }
    }
    
    private func getCachedImage(from url: URL) -> UIImage? {
        
        let request = URLRequest(url: url)
        if let cachedRespons = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: cachedRespons.data)
        }
        
        return nil
    }
}



