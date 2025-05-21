//
//  ProfileView.swift
//  GithubDataViewerIOS
//
//  Created by Jose Alberto Rosario Castillo on 16/5/25.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            if let url = viewModel.profileImageURL {
                profileImage(from: url)
            }

            Text(viewModel.username)
                .font(.title)
                .padding()

            List(viewModel.repositories) { repo in
                VStack(alignment: .leading) {
                    Text(repo.name)
                        .font(.headline)
                    Text(repo.language ?? "Language Unknown")
                        .font(.subheadline)
                }
            }
        }
        .padding()
    }

    private func profileImage(from url: URL) -> some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 100, height: 100)
        .clipShape(Circle())
    }
}
