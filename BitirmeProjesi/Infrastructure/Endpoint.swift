
import Foundation

public enum HTTPMethodType: String {
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

public enum HTTPTask{
    case request
    case requestParameters(bodyParameters:Parameters)
    case requestParametersAndHeaders
}

enum RequestGenerationError:Error{
    case components
}

public typealias Parameters = [String:Any]
public typealias HTTPHeaders = [String:String]



public protocol Requestable{
    
    var baseURL: URL {get set}
    var path: String  {get set}
    var parameters: Parameters  {get set}
    var queryItems:[URLQueryItem]?  {get set}
    var httpMethod: HTTPMethodType  {get set}
    var httpTask: HTTPTask  {get set}
    var httpHeaders: HTTPHeaders  {get set}
}
public protocol ResponseRequestable:Requestable{
    associatedtype Response
}

public struct Endpoint<R>:ResponseRequestable{
    public typealias Response = R
    
    
    
    public var baseURL: URL
    public var path: String
    public var parameters: Parameters
    public var queryItems:[URLQueryItem]?
    public var httpMethod: HTTPMethodType
    public var httpTask: HTTPTask
    public var httpHeaders: HTTPHeaders
    
    public init(baseURL: URL = URL(string: "https://new-english-app.herokuapp.com/")!,
                path: String,
                parameters: Parameters = [:],
                httpMethod: HTTPMethodType,
                httpTask: HTTPTask = .request,
                httpHeaders: HTTPHeaders = ["Accept": "application/json"],
                queryItems:[URLQueryItem]? = nil
                
    ) {
        self.baseURL = baseURL
        self.path = path
        self.parameters = parameters
        self.httpMethod = httpMethod
        self.httpTask = httpTask
        self.httpHeaders = httpHeaders
        self.queryItems = queryItems
        
    }
    
}
extension Requestable{
    @discardableResult
    func createUrl()->URL?{
        var urlComponents = URLComponents(string: self.baseURL.absoluteString)
        urlComponents?.path = self.path
        urlComponents?.queryItems = self.queryItems
        return urlComponents?.url
    }
    func url(with config: NetworkConfigurable) throws -> URL {
        
        let baseURL = config.baseURL.absoluteString.last != "/" ? config.baseURL.absoluteString + "/" : config.baseURL.absoluteString
        
        
        guard var urlComponents = URLComponents(string: baseURL) else { throw RequestGenerationError.components }
        var urlQueryItems = [URLQueryItem]()

        
//        let queryParameters = try queryParametersEncodable?.toDictionary() ?? self.queryParameters
        
        config.queryParameters.forEach {
            urlQueryItems.append(URLQueryItem(name: $0.key, value: $0.value))
        }
        urlComponents.queryItems = !urlQueryItems.isEmpty ? urlQueryItems : nil
        guard let url = urlComponents.url else { throw RequestGenerationError.components }
        return url
      
        
    }
    public func urlRequest(with config: NetworkConfigurable) throws -> URLRequest {
        let url = try self.url(with: config)
        var urlRequest = URLRequest(url: url)
        let allHeaders: [String: String] = config.headers

        
        
        urlRequest.httpMethod = self.httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = allHeaders
        return urlRequest
    }
}
