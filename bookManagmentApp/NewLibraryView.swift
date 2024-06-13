//
//  NewLibraryView.swift
//  bookManagmentApp
//
//  Created by student on 04/06/2024.
//

import SwiftUI
import MapKit

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
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedLocation: IdentifiablePlace? = nil
    @State private var library = Library()
    
    @State private var name = ""
    @State private var address = ""
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.237, longitude: 22.554),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    @State private var showAlert = false
    @State private var message = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informacje o bibliotece")) {
                    TextField("Nazwa", text: $name)
                    TextField("Adres", text: $address)
                }

                Section(header: Text("Lokalizacja na mapie")) {
                    Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, annotationItems: selectedLocation != nil ? [selectedLocation!] : []) { location in
                        MapMarker(coordinate: location.location, tint: .red)
                    }
                    .mapControlVisibility(.visible)
                    .frame(width: 400, height: 300)
                    .onTapGesture {
                        let center = region.center
                        selectedLocation = IdentifiablePlace(lat: center.latitude, long: center.longitude)
                    }
                }

                Button(action: {
                    saveLibrary()
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
            .alert(isPresented: $showAlert){
                Alert(
                    title: Text(message)
                )
            }
        }
        
    }
    
    // don't work
    func saveLibrary() {
        if name.count < 5 {
            showAlert = true
            message = "Nazwa biblioteki powinna miec przynajmniej 5 znakow"
            return
        }
        
        if address.count < 5 {
            showAlert = true
            message = "Adres biblioteki powinien miec przynajmniej 5 znakow"
            return
        }
        
        
        // Save library details to Core Data
        library = Library(context: viewContext)
        library.name = name
        library.address = address
        if let location = selectedLocation?.location {
            library.latitude = location.latitude
            library.longitude = location.longitude
        } else {
            showAlert = true
            message = "Podaj lokalizacje biblioteki"
            return
        }
        
        do {
            try viewContext.save()
            presentationMode.wrappedValue.dismiss()
        } catch {
            // Handle the Core Data error here
            print("Failed to save library: \(error.localizedDescription)")
        }
    }
}

#Preview {
    NewLibraryView()
}
