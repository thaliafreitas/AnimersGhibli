//
//  DataFileManager.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 16/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

class DataFileManager {
    
    static let fileManager = FileManager.default
    
    static func loadImageFromPath(_ path: String) -> UIImage? {
        
        if let dir = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            let imagePath = URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(path).path
            return UIImage(contentsOfFile: imagePath)
            
        }
        return nil
        
    }
    
    static func getDirectoryPath() -> NSURL {
        let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("yourProjectImages")
        let url = NSURL(string: path)
        return url!
    }
    
    
//    static func getImageFromDocumentDirectory() {
//        for i in 0..< {
//            let imagePath = (self.getDirectoryPath() as NSURL).appendingPathComponent("picked\(i).jpg")
//            let urlString: String = imagePath!.absoluteString
//            if fileManager.fileExists(atPath: urlString) {
//                let image = UIImage(contentsOfFile: urlString)
//                imageArray.append(image!)
//            } else {
//                 print("No Image")/
//            }
//        }
//    }
    
    static func saving(image: UIImage, withName: String) -> String {
        
        let directory = "Images"
        var filePath = ""
        if let documentDirectory = try fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let documentoDiretorio = documentDirectory.appendingPathComponent(directory)
            
            let saida = fileManager.fileExists(atPath: documentoDiretorio.path)
            if !saida {
                do {
                    try fileManager.createDirectory(atPath: documentoDiretorio.path, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    print(error)
                }
            }
        }
        if let data = image.jpegData(compressionQuality: 1){
            if let path = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL{
                do {
                    filePath = "/\(directory)/\(withName).jpeg"
                    try data.write(to: path.appendingPathComponent(filePath)!)
                    print("Succes in Save Photo!")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        return filePath
    }
    
    
    static func configureDirectory() -> String {
        let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("yourProject")
        if !fileManager.fileExists(atPath: path) {
            try! fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
        return path
    }
    


}
