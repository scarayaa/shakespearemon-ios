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
