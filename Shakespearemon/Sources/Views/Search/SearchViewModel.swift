//
//  SearchViewModel.swift
//  shakespearemon-ios
//
//  Created by Fabrizio Scarano on 02/05/25.
//

import SwiftUI
import ShakespearemonSDK

@MainActor
@Observable
final class SearchViewModel {
    
    private let shakespearemonService: ShakespearemonService
    
    private let fetchDebouncer = Debouncer(duration: .seconds(1.0))
    
    var searchText = "" {
        didSet {
            handleSearchTextChange(searchText)
        }
    }
    
    var searchContent: SearchContent = .empty
    
    init(shakespearemonService: ShakespearemonService) {
        self.shakespearemonService = shakespearemonService
    }
    
    private func handleSearchTextChange(_ text: String) {
        guard !text.isEmpty else {
            fetchDebouncer.cancel()
            searchContent = .empty
            return
        }
        
        searchContent = .loading
        
        fetchDebouncer.debounce { [weak self] in
            await self?.fetchContent(for: text)
        }
    }
    
    private func fetchContent(for name: String) async {
        async let spriteUrl = shakespearemonService.getPokemonSpriteURL(ofPokemon: name)
        async let description = shakespearemonService.getShakespeareanDescription(ofPokemon: name)
        
        do {
            searchContent = try await .detail(spriteURL: spriteUrl, description: description)
        } catch let error as ShakespearemonError {
            searchContent = .error(description: error.errorDescription ?? error.localizedDescription)
        } catch {
            searchContent = .error(description: error.localizedDescription)
        }
    }
}

extension SearchViewModel {
    
    enum SearchContent: Equatable {
        case loading
        case empty
        case detail(spriteURL: URL, description: String)
        case error(description: String)
    }
}
