//
//  TVShowInfoWorker.swift
//  StarsPlayChallenge
//
//  Created by Matloob on 10/9/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class TVShowInfoWorker
{
    // we can make this worker as a public worker instead of TvShow worker.
    
    public func FetchRemoteData<T: Decodable>(for: T.Type = T.self,type: AppNetwork, completion: @escaping ((Result<T,Error>) -> Void))
    {
        appNetworkProvider.request(type) { [weak self](result) in
            
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(T.self, from: data)
                  //
                   // print(responseModel)
                    completion(.success(responseModel))
                    
                }catch (let error) {
                    completion(.failure(error))
                }
                
            case let .failure(error):
                completion(.failure(error))
                break
                
            }
            
        }
    }
}
