//
//  Utils.swift
//  git-trendsTests
//
//  Created by Norman, ThankaVijay on 28/09/20.
//

import Foundation

class Utils {
    static func readJSONFromFile<T: Decodable>(fileName: String, type: T.Type) -> T? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            }
            catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
