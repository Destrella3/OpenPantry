//
//  Data Persistence Manager.swift
//  OpenPantry
//
//  Created by Diego Estrella III on 2/7/19.
//  Copyright © 2019 Diego Estrella III. All rights reserved.
//

import Foundation

final class DataPersistenceManager {
    private init() {}
        static func documentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
        static func filenameToDocuments(filename: String) -> URL {
        return documentsDirectory().appendingPathComponent(filename)
    }
}
