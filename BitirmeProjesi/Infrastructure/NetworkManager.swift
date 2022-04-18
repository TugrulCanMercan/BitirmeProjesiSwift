


public protocol NetworkManagerProtocol{
    typealias CompletionHandler = (Result<Data, Error>) -> Void
    
    func request(_ endpoint: Requestable,
                 completion: @escaping CompletionHandler)
}

public final class NetworkManager{
    
    
    let networkConfig:NetworkConfigurable
    public init(networkConfig:NetworkConfigurable){
        
        self.networkConfig = networkConfig
    }
    
    
    
    
    func request(request:URLRequest,completion: @escaping (Result<Data,Error>) ->Void){
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                
                return completion(.failure(URLError.init(.badURL)))
                
            }
            
            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 300 else {
                return completion(.failure(URLError.init(.badServerResponse)))
                
            }
            guard let data = data else {
                return
            }
            completion(.success(data))

        }.resume()
        
        
    }
    
    
    
    
}

extension NetworkManager:NetworkManagerProtocol{
    public func request(_ endpoint: Requestable, completion: @escaping CompletionHandler) {
        do {
            
            let urlRequest = try endpoint.urlRequest(with: networkConfig)
            self.request(request: urlRequest, completion: completion)
            
        } catch {
            
            
            
        }
    }
    

}
