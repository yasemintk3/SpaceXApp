//
//  HttpClient.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 14.06.2024.
//

import Foundation
import Alamofire

typealias resultClosure<T: Codable> = (Result<T, Error>) -> Void

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
            
            guard let data = model.value else {
                return print("error")
            }
            completion(.success(data))
        }
    }
}
