//
//  ShakespearemonApp.swift
//  shakespearemon-ios
//
//  Created by Fabrizio Scarano on 29/04/25.
//

import SwiftUI
import ShakespearemonSDK

@main
struct ShakespearemonApp: App {
    
    // Declared and instanced here for ease of use.
    // A dependency container could be use to hold it, and can be tested
    // using the exposed interface `ShakespearemonService`.
    let shakespearemonService = ShakespearemonSDK.getNewServiceInstance()
    
    var body: some Scene {
        WindowGroup {
            SearchView(
                viewModel: SearchViewModel(
                    shakespearemonService: shakespearemonService
                )
            )
        }
    }
}
