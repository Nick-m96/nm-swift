//
//  CommentRepository.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 01/11/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Networking
import Argo
import Result
import ReactiveSwift
import Foundation

internal class CommentRepository: AbstractRepository {
    
    private static let _BooksPath = "books"
    private static let _PathBookIDComment = "3"
    private static let _PathComments = "comments"

    
    public func fetchComments() -> SignalProducer<[UserComment], RepositoryError> {
        let path = CommentRepository._BooksPath + "/" + CommentRepository._PathBookIDComment + "/" + CommentRepository._PathComments
        return performRequest(method: .get, path: path)
        {
            decode($0).toResult()
        }
    }
}
