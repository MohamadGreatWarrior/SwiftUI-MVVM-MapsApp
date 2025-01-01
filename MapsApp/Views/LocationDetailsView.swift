//
//  LocationDetailsView.swift
//  MapsApp
//
//  Created by Mohamad Tayan on 29/12/2024.
//

import SwiftUI
import _MapKit_SwiftUI

struct LocationDetailsView: View {
    let location: LocationModel

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                content: {
                TabView {
                    ForEach(location.imageNames, id: \.self) {
                        Image($0)
                    }
                }
                .frame(height: 500)
                .tabViewStyle(PageTabViewStyle())
                .shadow(radius: 10)

                VStack(
                    alignment: .leading,
                    content: {
                    Text(location.name).font(.largeTitle).fontWeight(.semibold)

                    Text(location.cityName).font(.title2)
                    }).padding(.leading)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )

                Divider()

                Text(location.description)
                    .foregroundColor(.gray)
                    .padding()

                if let url = URL(string: location.link) {
                    Link("Read more on Wikipedia", destination: url)
                        .font(.headline)
                        .tint(.blue)
                        .padding(.leading)
                }

                    Divider()

                    Map(initialPosition: .userLocation(
                        fallback: .camera(
                            MapCamera(centerCoordinate: location.coordinates, distance: 3500)
                        )
                    )
                    ) {
                        Annotation(location.name, coordinate: location.coordinates) {
                            LocationMapAnnotationView(
                                scale: 1
                            )
                        }
                    }.frame(maxWidth: .infinity).aspectRatio(1, contentMode: .fit)
                        .cornerRadius(12)
                        .allowsHitTesting(false)
                        .padding()
            })

        }
        .overlay(alignment: .topLeading) {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .padding()
                    .background(.white)
                    .cornerRadius(12)
                .shadow(radius: 12).padding()
                .foregroundColor(.black)
            })
        }
    }
}

#Preview {
    LocationDetailsView(
        location: LocationsViewModel.fallbackLocation
    )
}
