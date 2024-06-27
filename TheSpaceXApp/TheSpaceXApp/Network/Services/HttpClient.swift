//
//  HttpClient.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 14.06.2024.
//

import Foundation
import Alamofire

typealias resultClosure<T: Codable> = (Result<T, Error>) -> Void

enum HttpError: Error {
    case badRequest, badURL, errorDecodingData, invalidURL, badResponse
}

protocol HttpClientProtocol: AnyObject {
    func fetch<T: Codable>(url: URL, completion: @escaping resultClosure<T>)
}

class HttpClient: HttpClientProtocol {
    
    // MARK: Properties
    
    private var alamofireSession: Session
    
    // MARK: Init
    
    init(alamofireSession: Session) {
        self.alamofireSession = alamofireSession
    }
    
    // MARK: Funcs
    
    func fetch<T>(url: URL, completion: @escaping resultClosure<T>) where T : Decodable, T : Encodable {
        
        alamofireSession.request(url, method: .get).responseDecodable(of: T.self) { model in
            
            if model.response?.statusCode == 400 {
                return completion(.failure(HttpError.badRequest))
            }
            
            guard let data = model.value else {
                return completion(.failure(HttpError.errorDecodingData))
            }
            completion(.success(data))
        }
    }
}
