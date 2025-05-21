//
//  Repository.swift
//  GithubDataViewerIOS
//
//  Created by Jose Alberto Rosario Castillo on 16/5/25.
//

struct Repository: Identifiable, Codable {
    let id: Int
    let name: String
    let language: String?
    let owner: Owner
}

struct Owner: Codable {
    let avatar_url: String
}
