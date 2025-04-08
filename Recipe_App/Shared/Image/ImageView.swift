//
//  ImageView.swift
//  Recipe_App
//
//  Created by jade  on 4/7/25.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }
    var body: some View {
        if let image = imageLoader.image{
            image
                .resizable()
            
        }
    }
}

#Preview {
    ImageView(url: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400")
}
