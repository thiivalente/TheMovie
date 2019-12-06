//
//  Endpoint.swift
//  TheMovie
//
//  Created by Thiago Valente on 06/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol EndpointType {
    var url: URL? { get }
    var httpMethod: HttpMethod { get }
    var body: String? { get }
    var headers: [String: String]? { get }
}

