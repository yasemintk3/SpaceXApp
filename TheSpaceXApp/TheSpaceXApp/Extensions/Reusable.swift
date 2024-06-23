//
//  Reusable.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 16.06.2024.
//

import Foundation

protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String { return String(describing: Self.self) }
}
