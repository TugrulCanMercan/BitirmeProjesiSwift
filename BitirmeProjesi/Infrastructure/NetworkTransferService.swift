
//where E.Response == T
public protocol NetworkTransferServiceProtocol {
    typealias CompletionHandler<T> = (Result<T, Error>) -> Void
    
    
    func request<T: Decodable, E: Requestable>(with endpoint: E,
                                                       completion: @escaping CompletionHandler<T>)
//    @discardableResult
//    func request<E: ResponseRequestable>(with endpoint: E,
//                                         completion: @escaping CompletionHandler<Void>) -> NetworkCancellable? where E.Response == Void
}

public final class NetworkTransferService{
    
    public let networkManager:NetworkManagerProtocol
    
    public init(networkManager:NetworkManagerProtocol){
        self.networkManager = networkManager
    }
    
    
    
    
}

extension NetworkTransferService:NetworkTransferServiceProtocol{
    public func request<T, E>(with endpoint: E, completion: @escaping CompletionHandler<T>) where T : Decodable, E : Requestable {
        return networkManager.request(endpoint) { result in
            switch result{
                
            case .success(let data):
                if let response = try? JSONDecoder().decode(T.self, from: data){
                    completion(.success(response))
                }
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        
    }
    
    
}
