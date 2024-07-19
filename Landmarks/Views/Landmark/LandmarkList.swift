//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Wenbo Jie on 1/4/24.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly = false
    
    var filteredLandmarks: [Landmark] {
        if showFavoriteOnly {
            return modelData.landmarks.filter(\.isFavorite)
        }
        return modelData.landmarks
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle("Favorites only", isOn: $showFavoriteOnly)
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
            Text("Select a Landmark")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
