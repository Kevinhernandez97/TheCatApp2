//
//  BreedListView.swift
//  TheCatApp2
//
//  Created by Kevin Hernandez on 22/06/23.
//

import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]
    
    var body: some View {
        ForEach(breeds) { breed in
            VStack {
                Text("Raza: \(breed.name)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.systemIndigo))
                    .padding()
                
           
                    AsyncImage(url: URL(string: "https://cdn2.thecatapi.com/images/\(breed.referenceImageId ?? "").jpg")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .cornerRadius(10)
                            .clipped()
                                
                        
                    } placeholder: {
                        Image(systemName: "photo")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
        
                    
                
                HStack {
                    Text("Pais de origen: \(breed.origin)")
                    
                    Spacer()
                    
                    Text("Intelligence: \(breed.intelligence)")
                }
            }
            .onAppear {
                print("https://cdn2.thecatapi.com/images/\(breed.referenceImageId ?? "").jpg")
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .shadow(radius: 3)
            .padding()
        }
    }
}
//
//struct BreedListView_Previews: PreviewProvider {
//    static var previews: some View {
//        BreedListView(breeds: Breed)
//    }
//}
