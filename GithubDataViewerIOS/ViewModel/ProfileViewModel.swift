//
//  ProfileViewModel.swift
//  GithubDataViewerIOS
//
//  Created by Jose Alberto Rosario Castillo on 19/5/25.
//


import Foundation

class ProfileViewModel: ObservableObject {
    let username: String
    let profileImageURL: URL?
    let repositories: [Repository]

    init(username: String, profileImageURL: String?, repositories: [Repository]) {
        self.username = username
        self.profileImageURL = URL(string: profileImageURL ?? "")
        self.repositories = repositories
    }
}
