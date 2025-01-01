//
//  LocationPreviewView.swift
//  MapsApp
//
//  Created by Mohamad Tayan on 28/12/2024.
//

import SwiftUI
import MapKit

struct LocationPreviewView: View {
    let location: LocationModel
    let onLearnMore: () -> Void
    let onNext: () -> Void

    var body: some View {

// Implementation using ZStack

//        ZStack(
//            alignment: .bottom, content: {
//            RoundedRectangle(cornerRadius: 12).fill(.ultraThinMaterial).frame(
//                width: 350,
//                height: 140
//            ).shadow(radius: 10)
//
//            HStack(
//                alignment: .bottom,
//                spacing: 50,
//                content: {
//                VStack(alignment: .leading,
//                       content: {
//                    if let image = location.imageNames.first {
//                        Image(image)
//                            .resizable()
//                            .cornerRadius(10)
//                            .frame(width: 100, height: 100)
//                            .padding(6)
//                            .background(.white)
//                            .cornerRadius(10)
//                            .shadow(radius: 2)
//                        Color.clear.frame(width: 1,height: 8)
//                    }
//
//                    Text(location.name)
//                        .font(.title2)
//                        .fontWeight(.bold)
//
//                    Text(location.cityName).fontWeight(.semibold)
//                })
//
//                VStack(
//                    spacing: 12,
//                    content: {
//                    Button(
//                        action: onNext,
//                        label: {
//                            Text("Next")
//                                .font(.subheadline)
//                                .fontWeight(.bold)
//                                .padding(.horizontal, 7)
//                                .padding(.vertical, 4)
//                                .frame(maxWidth: 120)
//                        })
//                    .buttonStyle(
//                        BorderedProminentButtonStyle()
//                    )
//
//                    Button(
//                        action: onLearnMore,
//                        label: {
//                            Text("Learn more")
//                                .font(.subheadline)
//                                .padding(.horizontal, 7)
//                                .padding(.vertical, 4)
//                                .frame(maxWidth: 120)
//                    }).buttonStyle(BorderedButtonStyle())
//                })
//                }).padding(.bottom)
//        })

        HStack(
            alignment: .bottom,
            spacing: 50,
            content: {
            VStack(alignment: .leading,
                   content: {
                if let image = location.imageNames.first {
                    Image(image)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 100, height: 100)
                        .padding(6)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                    Color.clear.frame(width: 1,height: 8)
                }

                Text(location.name)
                    .font(.title2)
                    .fontWeight(.bold)

                Text(location.cityName).fontWeight(.semibold)
            })

            VStack(
                spacing: 12,
                content: {
                Button(
                    action: onNext,
                    label: {
                        Text("Next")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.horizontal, 7)
                            .padding(.vertical, 4)
                            .frame(maxWidth: 120)
                    })
                .buttonStyle(
                    BorderedProminentButtonStyle()
                )

                Button(
                    action: onLearnMore,
                    label: {
                        Text("Learn more")
                            .font(.subheadline)
                            .padding(.horizontal, 7)
                            .padding(.vertical, 4)
                            .frame(maxWidth: 120)
                }).buttonStyle(BorderedButtonStyle())
            })
        })
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
                .offset(y: 60)
        )
        .cornerRadius(12)
        .onTapGesture(perform: onLearnMore)
        .shadow(radius: 10)
    }
}

#Preview {
    LocationPreviewView(
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
            link: "https://en.wikipedia.org/wiki/Colosseum"),
        onLearnMore: {},
        onNext: {}
    )
}
