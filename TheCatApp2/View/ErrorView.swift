//
//  ErrorView.swift
//  TheCatApp2
//
//  Created by Kevin Hernandez on 22/06/23.
//

import SwiftUI

struct ErrorView: View {
    @StateObject var breedFetcher: BreedFetcher
    
    var body: some View {
        VStack {
            
            Text("😿")
                .font(.system(size: 80))
            
            Text(breedFetcher.errorMessage ?? "")
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedFetcher: BreedFetcher())
    }
}
