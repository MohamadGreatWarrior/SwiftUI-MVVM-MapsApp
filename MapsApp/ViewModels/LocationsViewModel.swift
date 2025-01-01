//
//  LocationsViewModel.swift
//  MapsApp
//
//  Created by Mohamad Tayan on 28/12/2024.
//

import Foundation
import MapKit
import _MapKit_SwiftUI
import SwiftUI

@Observable class LocationsViewModel {
    @ObservationIgnored var locations: [LocationModel] = LocationsDataService.locations

    var cameraPosition: MapCameraPosition = .userLocation(
        fallback: .camera(
            MapCamera(centerCoordinate: LocationsViewModel.fallbackLocation.coordinates,
                      distance: 35000)
        )
    )

    var location: LocationModel?

    var locationsListIsExpanded = false

    var sheetLocation: LocationModel?

    init() {
        let location = LocationsDataService.locations.first ?? LocationsViewModel.fallbackLocation
        selectLocation(location)
    }

    private func selectLocation(_ location: LocationModel) {
        self.cameraPosition = .userLocation(
            fallback: .camera(
                MapCamera(centerCoordinate: location.coordinates, distance: 35000)
            )
        )
        self.location = location
    }

    func onAnnotationTapped(_ location: LocationModel) {
        withAnimation(.easeInOut) {
            cameraPosition = .userLocation(
                fallback: .camera(
                    MapCamera(centerCoordinate: location.coordinates, distance: 35000)
                )
            )
            self.location = location
        }
    }

    func expandLocationsList() {
        withAnimation(Animation.easeInOut(duration: 0.200)) {
            locationsListIsExpanded.toggle()
        }
    }

    func onLocationTapped(_ location: LocationModel) {
        withAnimation {
            selectLocation(location)
            locationsListIsExpanded.toggle()
        }
    }

    func setSheetLocation(_ location: LocationModel) {
        sheetLocation = location
    }

    func onNextLocationPressed() {
        guard let currentIndex = locations.firstIndex(where: {$0 == location}) else {
            return
        }

        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            if let first = locations.first {
                withAnimation {
                    selectLocation(first)
                }
            }
            return
        }

        withAnimation {
            selectLocation(locations[nextIndex])
        }
    }
}

extension LocationsViewModel {
    static let fallbackLocation: LocationModel = LocationModel(
        name: "Colosseum",
        cityName: "Rome",
        coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
        description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
        imageNames: [
            "rome-colosseum-1",
            "rome-colosseum-2",
            "rome-colosseum-3",
        ],
        link: "https://en.wikipedia.org/wiki/Colosseum")
}
