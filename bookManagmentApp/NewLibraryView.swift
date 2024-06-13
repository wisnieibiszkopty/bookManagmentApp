//
//  NewLibraryView.swift
//  bookManagmentApp
//
//  Created by student on 04/06/2024.
//

import SwiftUI

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
                latitude: lat,
                longitude: long)
    }
}

struct NewLibraryView: View {
    @ObservedObject var viewModel: NewLibraryViewModel = NewLibraryViewModel() // Model widoku
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.237, longitude: 22.554),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informacje o bibliotece")) {
                    TextField("Nazwa", text: $viewModel.name)
                    TextField("Adres", text: $viewModel.address)
                    TextField("Opis", text: $viewModel.description)
                    TextField("Godziny otwarcia", text: $viewModel.openingHours)
                }

                Section(header: Text("Lokalizacja na mapie")) {
                    Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, annotationItems: viewModel.selectedLocation != nil ? [viewModel.selectedLocation!] : []) { location in
                        MapMarker(coordinate: location.location, tint: .red)
                    }
                            .mapControlVisibility(.visible)
                            .frame(width: 400, height: 300)
                            .onTapGesture {
                                let center = region.center
                                viewModel.selectedLocation = IdentifiablePlace(lat: center.latitude, long: center.longitude)
                            }
                }

                Button(action: {
                    viewModel.saveLibrary()
                }) {
                    Text("Zapisz")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                }
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
            }
                    .navigationTitle("Dodaj bibliotekę")
        }
    }
}

#Preview {
    NewLibraryView()
}
