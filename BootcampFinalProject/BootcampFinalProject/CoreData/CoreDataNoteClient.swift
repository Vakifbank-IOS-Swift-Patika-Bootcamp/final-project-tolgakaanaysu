//
//  CoreDataNoteClient.swift
//  BootcampFinalProject
//
//  Created by Tolga Kağan Aysu on 17.12.2022.
//

import Foundation

final class CoreDataNoteClient {
    //MARK: - Property
    static let shared: CoreDataNoteClient = CoreDataNoteClient()
    private let coredata: CoreDataManager
    
    //MARK: - init
    private init(){
        self.coredata = CoreDataManager(entityName: "Note")
    }
    
    //MARK: - METHODS
    func saveNote(newNote: NewNote, completion: @escaping(Result<CoreDataCustomSuccesMessage,CoreDataCustomError>) -> Void){
        coredata.saveObject() { object in
            object.setValue(newNote.text, forKey: "text")
            object.setValue(newNote.date, forKey: "date")
            object.setValue(newNote.title, forKey: "title")
            object.setValue(newNote.gameName, forKey: "gameName")
            object.setValue(newNote.id, forKey: "id")
        } completion: { result in
            completion(result)
        }
    }
    
    func deleteNote(note: Note, completion: @escaping(Result<CoreDataCustomSuccesMessage,CoreDataCustomError>) -> Void) {
        coredata.deleteObject(model: note) { result in
           completion(result)
        }
    }
    
    func getNote(by id: String) -> Note? {
        coredata.getObject(by: id)
    }
    
    func getAllNote(comletion: @escaping(Result<[Note],CoreDataCustomError>) -> Void){
        coredata.getAllObjects(responseType: Note.self) { result in
            comletion(result)
        }
    }
}
