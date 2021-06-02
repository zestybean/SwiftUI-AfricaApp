//
//  InsetGalleryView.swift
//  Africa (iOS)
//
//  Created by Brando Lugo on 6/2/21.
//

import SwiftUI

struct InsetGalleryView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 15, content: {
                ForEach(animal.gallery, id: \.self){ photo in
                    Image(photo)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }//:LOOP
            })//:HSTACK
        }//:SCROLL
    }
}

//MARK: - BODY
struct InsetGalleryView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
