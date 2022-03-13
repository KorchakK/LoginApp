//
//  Person.swift
//  LoginApp
//
//  Created by Konstantin Korchak on 12.03.2022.
//

import Foundation

struct User {
    let username: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            username: "Konstantin",
            password: "hello",
            person: Person(
                name: "Konstantin",
                surname: "Korchak",
                age: 33,
                country: "Russia",
                city: "Saint-Petersburg",
                gender: .male,
                hobby: ["tennis", "hockey", "travel", "movies", "cars and bikes", "airplanes"],
                work: "Former b2b manager",
                status: .married,
                education: "SPbPU"
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let age: Int
    let country: String
    let city: String
    let gender: Gender
    let hobby: [String]
    let work: String
    let status: Status
    let education: String
}

enum Gender: String {
    case male = "Man"
    case female = "Woman"
}

enum Status: String {
    case single = "Single"
    case married = "Married"
}
