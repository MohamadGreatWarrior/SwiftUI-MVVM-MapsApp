//
//  MapsAppApp.swift
//  MapsApp
//
//  Created by Mohamad Tayan on 28/12/2024.
//

import SwiftUI

@main
struct MapsAppApp: App {
    @State var viewModel = LocationsViewModel()

    var body: some Scene {
        WindowGroup {
            LocationsView()
        }.environment(viewModel)
    }
}
