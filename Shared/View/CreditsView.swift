//
//  CreditsView.swift
//  Africa (iOS)
//
//  Created by Brando Lugo on 6/7/21.
//

import SwiftUI

struct CreditsView: View {
    //MARK: - PROPS
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
                Copyright @ Brando
                All rights reserved
                Better Apps ♡ Less Code
                """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }//:VSTACK
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
