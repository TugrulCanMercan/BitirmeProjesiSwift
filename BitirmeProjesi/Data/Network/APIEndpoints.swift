//
//  ApiEndpoint.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 15.04.2022.
//

import Foundation
import Infrastructure


struct english:Codable{
    let Word:String
    let turkish:String
    
}

struct APIEndpoints {
    
//    static func getUser(with UUIDRequestDTO:UUIDRequestDTO)-> Endpoint<UserResponseDTO>{
//        return Endpoint(path: "3/search/movie/",
//                        method: .get,
//                        queryParametersEncodable: UUIDRequestDTO)
//    }
    static func english() -> Endpoint<[english]>{
        return Endpoint(path: "", httpMethod: .get)
    }
    
//    static func loginUser(with userLoginRequestDTO:UserLoginRequestDTO)-> Endpoint<UserAccessResponseDTO>{
//        return Endpoint(path: "", method: .get)
//    }
    
    //    static func getMovies(with moviesRequestDTO: MoviesRequestDTO) -> Endpoint<MoviesResponseDTO> {
    //
    //        return Endpoint(path: "3/search/movie/",
    //                        method: .get,
    //                        queryParametersEncodable: moviesRequestDTO)
    //    }
    //
    //    static func getMoviePoster(path: String, width: Int) -> Endpoint<Data> {
    //
    //        let sizes = [92, 154, 185, 342, 500, 780]
    //        let closestWidth = sizes.enumerated().min { abs($0.1 - width) < abs($1.1 - width) }?.element ?? sizes.first!
    //
    //        return Endpoint(path: "t/p/w\(closestWidth)\(path)",
    //                        method: .get,
    //                        responseDecoder: RawDataResponseDecoder())
    //    }
}
