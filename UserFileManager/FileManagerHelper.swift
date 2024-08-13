//
//  FileHelperManager.swift
//  UserFileManager
//
//  Created by Musa Adıtepe on 13.08.2024.
//

import Foundation

class FileManagerHelper{
    
    static let shared = FileManagerHelper()
    var users = [User]()
    // TODO: Get documents path
    func getDocumentPath()->URL{
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = path[0]
        return documentDirectory
    }
    // TODO: Json file path
    func getJsonFilePath()->URL{
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = path[0]
        return documentDirectory.appendingPathComponent("Users.json")
    }
    // TODO: Read from json file
    func readJsonFile(){
        
        if let data = try? Data(contentsOf: getJsonFilePath()){
            
            do{
                users = try JSONDecoder().decode([User].self, from: data)
            }
            catch{
                print("ERROR!!")
            }
            
        }
        else{
            print("no file")
        }
    }
    // TODO: write to json file
    func writeToJsonFile(complete: ()->()){
        do{
            let data = try JSONEncoder().encode(users)
            try data.write(to: getJsonFilePath())
            complete()
         //   navigationController?.popViewController(animated: true)
        }
        catch{
            print("ERROR!!")
        }
    }
}
