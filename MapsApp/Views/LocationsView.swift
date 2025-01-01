//
//  LocationsView.swift
//  MapsApp
//
//  Created by Mohamad Tayan on 28/12/2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @Environment(LocationsViewModel.self) private var viewModel

    var body: some View {
        ZStack {
            mapLayer

            VStack(content: {
                header

                Spacer()

                if let location = viewModel.location {
                    LocationPreviewView(location: location) {
                        viewModel.setSheetLocation(location)
                    } onNext: {
                        viewModel.onNextLocationPressed()
                    }

                }
            }).padding(.horizontal, 15)
        }.sheet(item: Bindable(viewModel).sheetLocation) {
            LocationDetailsView(location: $0)
        }
    }
}

#Preview {
    LocationsView().environment(LocationsViewModel())
}


extension LocationsView {
    var mapLayer: some View {
        Map(position: Bindable(viewModel).cameraPosition) {
            ForEach(viewModel.locations) { location in
                Annotation(location.name, coordinate: location.coordinates) {
                    LocationMapAnnotationView(
                        scale: viewModel.location == location ? 1 : 0.7
                    ).onTapGesture {
                        viewModel.onAnnotationTapped(location)
                    }
                }
            }
        }.ignoresSafeArea()
    }

    var header: some View {
        Group {
            if let location = viewModel.location {
                VStack(spacing: 0) {
                    HStack {
                        Spacer()
                        Text(location.name)
                            .font(.headline)
                            .fontWeight(.bold)
                            .onTapGesture(
                                perform: viewModel.expandLocationsList
                        )
                        Spacer()
                    }.overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.title3)
                            .rotationEffect(Angle(degrees: viewModel.locationsListIsExpanded ? 180 : 0))
                            .padding(.leading, 2)

                    }

                    Color.clear.frame(
                        height: viewModel.locationsListIsExpanded ? 10 : 0
                    )

                    ScrollView {
                        ForEach(viewModel.locations) { location in
                            LocationTileView(location: location, action: viewModel.onLocationTapped)
                            Divider()
                        }
                    }.frame(height:
                                viewModel.locationsListIsExpanded ?
                            350 : 0)
                }.padding(15)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThickMaterial)
                    .cornerRadius(10)
            } else {
                Rectangle().fill(.clear)
            }
        }
    }
}
