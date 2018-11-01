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
    
    private static let _BooksPath = "books"
    private static let _PathPage = "page"
    private var _page = 0
    
    public func fetchBooks() -> SignalProducer<[Book], RepositoryError> {
        let path = BookRepository._BooksPath
        _page += 1
        return performRequest(method: .get, path: path, parameters: [BookRepository._PathPage: _page])
        {
            decode($0).toResult()
        } 
    }
}
