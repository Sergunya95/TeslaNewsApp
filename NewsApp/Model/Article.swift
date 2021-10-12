//
//  Article.swift
//  NewsApp
//
//  Created by apple on 09.10.2021.
//

import Foundation

/*
 {
 -"source": {
 "id": "rt",
 "name": "RT"
 },
 "author": "RT",
 "title": "India faces a power crisis as coal stocks decline – Delhi chief minister",
 "description": "The chief minister of Delhi on Saturday warned that the power crisis which has already caused electricity cuts in some eastern and northern states is about to impact the Indian capital and its 20 million citizens. Read Full Article at RT.com",
 "url": "https://www.rt.com/business/537053-india-faces-power-crisis-coal/",
 "urlToImage": "https://cdni.rt.com/files/2021.10/article/61618fd3203027247d630dd5.jpg",
 "publishedAt": "2021-10-09T13:48:37Z",
 "content": "“Delhi could face a power crisis. I am personally keeping a close watch over the situation. We are trying our best to avoid it,” Arvind Kejriwal said in a tweet, adding that he had sent an official r… [+2454 chars]"
 }
 */

struct Article {
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var sourceName: String
    
    init(dictionary: Dictionary<String, Any>) {
        author = dictionary["author"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        
        sourceName = (dictionary["source"] as? Dictionary<String, Any> ?? ["":""])["name"] as? String ?? ""
    }
}
