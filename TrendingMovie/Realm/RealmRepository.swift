//
//  RealmRepository.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/14/24.
//

import Foundation
import RealmSwift

final class RealmRepository {
    
    static let shared = RealmRepository()
    private let realm = try! Realm()
    
    init() {
        print(realm.configuration.fileURL!)
    }
    
    func readAllFavoriteList() -> [FavoriteModel] {
        return Array(realm.objects(FavoriteModel.self))
    }
    
    func readSpecificFavorite(_ primaryKey: Int) -> Bool {
        if let _ = realm.object(ofType: FavoriteModel.self, forPrimaryKey: primaryKey) {
            return true
        }
        return false
    }
    
    func updateToFavoriteList(_ object: FavoriteModel) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print("ADD Failed")
        }
    }
    
    func deleteFromFavoriteList(_ primaryKey: Int) {
        guard let object = realm.object(ofType: FavoriteModel.self, forPrimaryKey: primaryKey) else {
            return
        }
        
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            print("DELETE Failed")
        }
    }
}
