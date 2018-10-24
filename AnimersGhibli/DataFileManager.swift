//
//  DataFileManager.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 16/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

class DataFileManager: NSObject {
    
    var documentoDiretorio : URL?
    
    func criarDiretorio() {
        //diretorio da pasta documents
        if let caminho = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            //append um novo path com a pasta a ser criada
            documentoDiretorio = caminho.appendingPathComponent("Fotos Studio Ghibli")
            
            //verifico se a pasta existe, se não existir, ela é criada
            let saida = FileManager.default.fileExists(atPath: documentoDiretorio!.path)
            if !saida {
                do {
                    try FileManager.default.createDirectory(atPath: documentoDiretorio!.path, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    print(error)
                }
            }
        }
    }
    
    func getFotoSalva(named: String) -> UIImage? {
        //localiza o diretorio da pasta documents
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            //pega a url da imagem que está na pasta Fotos e a retorna
            let fileURL = URL(fileURLWithPath: dir.absoluteString).appendingPathComponent("/Fotos").appendingPathComponent(named).path
            print(fileURL)
            return UIImage(contentsOfFile:fileURL)
        }
        return nil
    }
    
}
