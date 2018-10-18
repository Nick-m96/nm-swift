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
    
    public func fetchBooks() -> SignalProducer<[Book], RepositoryError> {
        let path = BookRepository._BooksPath
        return performRequest(method: .get, path: path) {
            decode($0).toResult()
        }
    }
}
