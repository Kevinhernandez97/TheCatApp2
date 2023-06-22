//
//  LoadingView.swift
//  TheCatApp2
//
//  Created by Kevin Hernandez on 22/06/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("😺")
                .font(.system(size: 40))
            ProgressView()
            Text("Getting the cats ...")
                .foregroundColor(.gray)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
