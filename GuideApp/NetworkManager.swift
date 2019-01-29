//
//  NetworkManager.swift
//  GuideApp
//
//  Created by Theodore Carrel on 1/27/19.
//  Copyright © 2019 Theodore Carrel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let endpoint = "https://www.guidebook.com/service/v2/upcomingGuides/"

class NetworkManager {
    
    //Fetch data from endpoint and parse into GuideData struct
    static func getGuides(completion: @escaping (GuideData) -> Void) {

        guard let url = URL(string: endpoint) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in

            guard let data = data else { return }

            do {

                let guides = try JSONDecoder().decode(GuideData.self, from: data)
                print(guides.total)
                completion(guides)

            } catch let jsonErr {
                print(jsonErr)
            }

        }.resume()
    }
}

