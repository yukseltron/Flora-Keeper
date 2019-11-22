//
//  Weather.swift
//  Flora
//
//  Created by Hamid Yuksel on 2019-11-21.
//  Copyright © 2019 Hamid Yuksel. All rights reserved.
//

import Foundation
import SwiftUI

struct Weather {
    @EnvironmentObject var userData: UserData
    
    private func apiRequest() {
        
        let lat = userData.profile.coordinates.latitude
        let lon = userData.profile.coordinates.longitude
        let url = URL(string: "https://api.darksky.net/forecast/b0f71ae88b95c861a8a5e05ebef81cb0/"+lat+","+lon)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                }
            }
        }
        task.resume()
    }
    
    func requestTest() -> String {
        apiRequest()
        return "je"
    }
    
}
