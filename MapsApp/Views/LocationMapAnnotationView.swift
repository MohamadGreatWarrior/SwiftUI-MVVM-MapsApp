//
//  LocationMapAnnotationView.swift
//  MapsApp
//
//  Created by Mohamad Tayan on 28/12/2024.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    let accentColor = Color("AccentColor")

    let scale: Double

    var body: some View {
        VStack(content: {
            Image(systemName: "map.circle.fill")
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .clipShape(Circle())

            Image(systemName: "triangle.fill")
                .resizable()
                .rotationEffect(Angle(degrees: 180))
                .frame(width: 15, height: 12)
                .offset(y: -10)
                .foregroundColor(accentColor)
        })
        .scaleEffect(scale)
        .shadow(radius: 10)
        .animation(.easeInOut, value: scale)
    }
}

#Preview {
    LocationMapAnnotationView(scale: 0.7)
}
