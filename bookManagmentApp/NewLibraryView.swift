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

    @State private var showToast = false
    @State private var toastMessage = "jazda"
    
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
                if showToast {
                     ToastView(message: toastMessage)
                         .transition(.opacity)
                         .onAppear {
                             DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                 withAnimation {
                                     showToast = false
                                 }
                             }
                         }
                        .zIndex(1)
                 }
            }
            .navigationTitle("Dodaj bibliotekę")
        }
        
    }
    
    // don't work
    func saveLibrary() {
        // Save library details to Core Data
        library = Library(context: viewContext)
        library.name = name
        library.address = address
        if let location = selectedLocation?.location {
            library.latitude = location.latitude
            library.longitude = location.longitude
        }
        
        do {
            try viewContext.save()
            toastMessage = "Added library!"
            withAnimation{
                showToast = true
            }
            presentationMode.wrappedValue.dismiss()
        } catch {
            // Handle the Core Data error here
            print("Failed to save library: \(error.localizedDescription)")
            toastMessage = "Cannot add library!"
            withAnimation{
                showToast = true
            }
        }
    }
}

#Preview {
    NewLibraryView()
}
