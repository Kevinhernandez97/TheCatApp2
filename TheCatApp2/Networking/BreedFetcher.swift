//
//  BreedFetcher.swift
//  TheCatApp2
//
//  Created by Kevin Hernandez on 22/06/23.
//

import Foundation

class BreedFetcher: ObservableObject {
    @Published var breeds = [Breed]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        fetchAllBreeds()
    }
    
    func fetchAllBreeds() {
        isLoading = true
        
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else {
            errorMessage = APIError.badURL.localizedDescription
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("bda53789-d59e-46ed-9bc4-2936630fde39", forHTTPHeaderField: "x-api-key")
        
        URLSession.shared.dataTask(with: url) { [self]  data, response, error in
            
            DispatchQueue.main.async {
                self.isLoading = false
            }
            let decoder = JSONDecoder()
            if let data = data {
                
                do {
                    let breeds = try decoder.decode([Breed].self, from: data)
                    DispatchQueue.main.async {
                        self.breeds = breeds
                    }
                } catch {
                    print("DEBUG: ERROR DECODING DATA FROM ERROR: \(error.localizedDescription)")
                }
                
            }
        }.resume()
    }
    
    static func errorState() -> BreedFetcher {
        let fetcher = BreedFetcher()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
}
