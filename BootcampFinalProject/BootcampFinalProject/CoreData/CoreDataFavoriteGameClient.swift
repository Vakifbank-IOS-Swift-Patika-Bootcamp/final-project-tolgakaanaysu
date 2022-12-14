//
//  CoreDataFavoriteGameClient.swift
//  BootcampFinalProject
//
//  Created by Tolga Kağan Aysu on 14.12.2022.
//

import Foundation

final class CoreDataFavoriGameClient {
    static let shared: CoreDataFavoriGameClient = CoreDataFavoriGameClient()
    private let entityName = "FavoriteGame"
    private let coredata = CoreDataManager.shared
    private init(){}
    
    //MARK: - NEW METHODS
    func saveFavoriteGame(id: String, completion: @escaping(Result<CoreDataCustomSuccesMessage,CoreDataCustomError>) -> Void){
        coredata.saveObject(entityName: self.entityName) { object in
            object.setValue(id, forKey: "id")
            object.setValue(true, forKey: "isFavorite")
        } completion: { result in
            completion(result)
        }
    }
    
    func deleteFavoriGame(id: String, completion: @escaping(Result<CoreDataCustomSuccesMessage,CoreDataCustomError>) -> Void) {
        guard let willDeleteGame = coredata.getObject(id: id, entityName: entityName) as? FavoriteGame else { return }
        coredata.deleteObject(model: willDeleteGame) { result in
           completion(result)
        }
    }
    
    func getFavoriteGame(by id: String) -> FavoriteGame? {
        coredata.getObject(id: id, entityName: entityName)
    }
}
