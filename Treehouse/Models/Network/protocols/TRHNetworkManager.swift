//
//  TRHNetworkManager.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/22/24.
//

import Foundation
import Alamofire

protocol TRHNetworkManager {
    func response<D: Codable>(_ treehouseURLRequest: any TRHURLRequest,
                              type: D.Type,
                              completion: @escaping (_ value: D?, _ error: Error?) -> Void)
    func response(_ treeURLRequest: any TRHURLRequest,
                  completion: @escaping (_ value: Data?, _ error: Error?) -> Void)
}

extension TRHNetworkManager {
    func response<D: Codable>(_ treehouseURLRequest: any TRHURLRequest,
                                type: D.Type,
                              completion: @escaping (_ value: D?, _ error: Error?) -> Void) {
        AF.request(treehouseURLRequest)
            .responseDecodable(of: TreehouseNetworkResult<D>.self) { response in
                do {
                    if let statusCode = response.response?.statusCode {
                        switch statusCode {
                        case (200..<400): break
                        case (400): throw TRHNetworkError.badRequestError
                        default: break
                        }
                    }
                    guard let networkResult = response.value else {
                        completion(nil, response.error)
                        return
                    }
                    
                    guard networkResult.isSuccess else {
                        completion(nil, TRHNetworkError.requestFail(code: networkResult.code,
                                                                    message: networkResult.message))
                        return
                    }
                    completion(networkResult.result, response.error)
                } catch {
                    print(#function, error)
                    completion(nil, error)
                }
            }
    }
    
    func response(_ treehouseURLRequest: any TRHURLRequest, 
                  completion: @escaping (_ value: Data?, _ error: Error?) -> Void) {
        AF.request(treehouseURLRequest)
            .responseData { response in
                completion(response.value, response.error)
            }
    }
}
