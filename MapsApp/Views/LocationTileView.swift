//
//  LocationTileView.swift
//  MapsApp
//
//  Created by Mohamad Tayan on 29/12/2024.
//

import SwiftUI
import MapKit

struct LocationTileView: View {

    let location: LocationModel
    let action: (LocationModel) -> Void

    var body: some View {
        HStack(spacing: 15) {
            if let image = location.imageNames.first {
                Image(image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(6).shadow(radius: 4)
            }

            VStack(
                alignment: .leading,
                content: {
                    Text(location.name).font(.headline).fontWeight(.bold)
                Text(location.cityName)
            })

            Spacer()
        }.padding(6)
            .onTapGesture {
                action(location)
            }
    }
}

#Preview {
    LocationTileView(
        location: LocationModel(
            name: "Colosseum",
            cityName: "Rome",
            coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
            description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
            imageNames: [
                "rome-colosseum-1",
                "rome-colosseum-2",
                "rome-colosseum-3",
            ],
            link: "https://en.wikipedia.org/wiki/Colosseum"), action: {location in }
    )
}
