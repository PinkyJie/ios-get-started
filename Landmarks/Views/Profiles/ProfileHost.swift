//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Wenbo Jie on 19/4/24.
//

import SwiftUI

struct ProfileHost: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.editMode) private var editMode

    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if (editMode?.wrappedValue == .active) {
                    Button("Cancel") {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if (editMode?.wrappedValue == .inactive) {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
