//
//  ContentView.swift
//  TheCatApp2
//
//  Created by Kevin Hernandez on 22/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var breedFetcher = BreedFetcher()
    var body: some View {
    
        if breedFetcher.isLoading {
            LoadingView()
        } else if breedFetcher.errorMessage != nil {
            ErrorView(breedFetcher: breedFetcher)
        } else {
            NavigationView {
                ScrollView {
                    BreedListView(breeds: breedFetcher.breeds)
                        .navigationTitle("App Cats  😼")
                   
                }
            }
        }
    
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
