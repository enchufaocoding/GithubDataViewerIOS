//
//  HomeViewModel.swift
//  GithubDataViewerIOS
//
//  Created by Jose Alberto Rosario Castillo on 19/5/25.
//

import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var showProfile = false
    @Published var showErrorAlert = false
    @Published var errorMessage = ""
    @Published var userRepos: [Repository] = []
    @Published var profileImageURL: String?

    func fetchGitHubUserInRepo() {
        InterfaceNetwork.getRepository(for: username) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let repos):
                    if repos.isEmpty {
                        self.errorMessage = NetworkError.internetConnectionError.description
                        self.showErrorAlert = true
                    } else {
                        self.userRepos = repos
                        self.profileImageURL = repos.first?.owner.avatar_url
                        self.showProfile = true
                    }
                case .failure:
                    self.errorMessage = NetworkError.internetConnectionError.description
                    self.showErrorAlert = true
                }
            }
        }
    }
    
    func clearInput() {
        username = ""
    }
}
