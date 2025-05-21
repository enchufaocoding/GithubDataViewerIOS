//
//  HomeView.swift
//  GithubDataViewerIOS
//
//  Created by Jose Alberto Rosario Castillo on 16/5/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Search") {
                    viewModel.fetchGitHubUserInRepo()
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationDestination(isPresented: $viewModel.showProfile) {
                ProfileView(
                    viewModel: ProfileViewModel(
                        username: viewModel.username,
                        profileImageURL: viewModel.profileImageURL,
                        repositories: viewModel.userRepos
                    )
                )
            }
            .alert(isPresented: $viewModel.showErrorAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage),
                    dismissButton: .default(Text("OK"), action: {
                        viewModel.clearInput()
                    })
                )
            }

        }
    }
}
