//
//  ACMData.swift
//  dudu
//
//  Created by luliluli on 2024/5/30.
//

import Foundation

// Generate random data
func generateRandomData() -> [[String: String]] {
    var data = [[String: String]]()
    for _ in 1...50 {
        let name = randomName()
        let phoneNumber = randomPhoneNumber()
        let address = randomAddress()
        data.append(["name": name, "phoneNumber": phoneNumber, "address": address])
    }
    return data
}

// Generate random name
func randomName() -> String {
    let firstNames = ["John", "Jane", "Michael", "Emily", "David", "Sarah"]
    let lastNames = ["Doe", "Smith", "Johnson", "Brown", "Taylor", "Anderson"]
    let firstName = firstNames.randomElement()!
    let lastName = lastNames.randomElement()!
    return "\(firstName) \(lastName)"
}

// Generate random phone number
func randomPhoneNumber() -> String {
    var phoneNumber = "+"
    for _ in 1...10 {
        phoneNumber.append("\(Int.random(in: 0...9))")
    }
    return phoneNumber
}

// Generate random address
func randomAddress() -> String {
    let streetNames = ["Main St", "Broadway", "Elm St", "Oak St", "Maple Ave"]
    let cities = ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix"]
    let countries = ["USA", "Canada", "UK", "Australia", "Germany"]
    let street = streetNames.randomElement()!
    let city = cities.randomElement()!
    let country = countries.randomElement()!
    return "\(Int.random(in: 1...999)) \(street), \(city), \(country)"
}

// Save data to plist file
func saveDataToFile(data: [[String: String]]) {
    let plistURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("acm.plist")
    (data as NSArray).write(to: plistURL, atomically: true)
}



