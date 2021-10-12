//
//  Model.swift
//  NewsApp
//
//  Created by apple on 09.10.2021.
//

import Foundation

var articles: [Article] {
    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return []
    }
    
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return []
    }
    
    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionary == nil {
        return []
    }

    if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>] {
        var returnArray: [Article] = []
        
        for dict in array {
            let newArticle = Article(dictionary: dict)
            returnArray.append(newArticle)
        }
        
        return returnArray
    }

    return []
}

var urlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    
    return urlPath
}

func loadNews(complitionHandler: (() -> Void)?) {
    let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2021-09-09&sortBy=publishedAt&apiKey=950b9654e07f4a82b84c6d948501c67e")
    let session = URLSession(configuration: .default)
    
    let downloadTask = session.downloadTask(with: url!) { (urlFile, responce, error) in
        if urlFile != nil {
            try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            complitionHandler?()
        }
    }
    downloadTask.resume()
}

