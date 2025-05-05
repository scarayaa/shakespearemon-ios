//
//  SearchView.swift
//  shakespearemon-ios
//
//  Created by Fabrizio Scarano on 29/04/25.
//

import SwiftUI
import ShakespearemonSDK

struct SearchView: View {
    
    @State var viewModel: SearchViewModel
        
    var body: some View {
        NavigationStack {
            contentView
        }
    }
    
    var contentView: some View {
        ZStack {
            switch viewModel.searchContent {
            case .loading:
                ProgressView()
            case .empty:
                Text("Nothing here...")
            case .detail(let spriteURL, let description):
                PokemonDetailView(imageURL: spriteURL, description: description)
            case .error(let description):
                Text(description)
            }
        }
        .padding()
        .navigationTitle("Shakespearemon")
        .searchable(text: $viewModel.searchText)
    }
}

#Preview {
    SearchView(
        viewModel: SearchViewModel(
            shakespearemonService: ShakespearemonSDK.getNewServiceInstance()
        )
    )
}
