//
//  BookRepository.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 09/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Networking
import Argo
import Result
import ReactiveSwift
import Foundation

internal class BookRepository: AbstractRepository {
    
    private static let BooksPath = "books"
    var books = [Book]()
    
    public func fetchEntities() -> SignalProducer<[Book], RepositoryError> {
        let path = BookRepository.BooksPath
        return performRequest(method: .get, path: path) {
            decode($0).toResult()
        }
    }
    
//    func getdata() -> [Book]{
//        var allBooks = [Book]()
//
//        let headers = [
//            "Authorization":AuthUser().sessionToken!,
//            "cache-control": "no-cache"
//        ]
//
//        let request = NSMutableURLRequest(url: NSURL(string: "https://wbooks-api-stage.herokuapp.com/api/v1/books")! as URL,
//                                          cachePolicy: .useProtocolCachePolicy,
//                                          timeoutInterval: 10.0)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if let data = data {
//                print(data)
//                do {
//                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as Optional{
//                        print(json)
//
//                        let josnData = json as? NSArray
//
//                        for node in josnData!{
//                            allBooks.append(Book(id: (node as AnyObject).value(forKey: "id") as! Int, author: (node as AnyObject).value(forKey: "author") as! String,
//                                                title:  (node as AnyObject).value(forKey: "title") as! String, genre: (node as AnyObject).value(forKey: "genre") as! String,
//                                                publisher: (node as AnyObject).value(forKey: "publisher") as! String, year: (node as AnyObject).value(forKey: "year") as! String))
//                        }
//                    }
//                }
//                catch {
//                    print(error)
//                }
//            }
//        })
//        dataTask.resume()
//
//
//        return allBooks
//    }
    
}
