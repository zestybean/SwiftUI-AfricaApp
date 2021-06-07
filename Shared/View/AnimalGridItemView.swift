//
//  AnimalGridItemView.swift
//  Africa (iOS)
//
//  Created by Brando Lugo on 6/7/21.
//

import SwiftUI

struct AnimalGridItemView: View {
    //MARK: - PROPS
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

//MARK: - PREV
struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
