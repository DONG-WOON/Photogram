//
//  APIManager.swift
//  Photogram
//
//  Created by 서동운 on 8/30/23.
//

import Foundation

class APIManager: NSObject {
    
    static let shared = APIManager()
    
    private override init() {
    }
    
    func callRequest() {
        let url = URL(string: "https://api.nasa.gov/assets/img/general/apod.jpg")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData)
        let urlSession = URLSession(configuration: .default, delegate: Self.shared, delegateQueue: .main)
        let dataTask = urlSession.dataTask(with: request)
        dataTask.resume()
    }
    
    func fetchImage(searchText: String, onSuccess: @escaping (Data) -> Void, onFailure: @escaping (Error?) -> Void) {
        let query = searchText
        let stringURL = "https://api.unsplash.com/search/photos"
        var url = URL(string: stringURL)!
    
        if #available(iOS 16.0, *) {
            url.append(queryItems: [
                URLQueryItem(name: "orientation", value: "portrait"),
                URLQueryItem(name: "query", value: query),
                URLQueryItem(name: "client_id", value: APIKey.accessKey)
            ])
        } else {
            var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
            urlComponents?.queryItems = [
                URLQueryItem(name: "query", value: query),
                URLQueryItem(name: "client_id", value: APIKey.accessKey)
            ]
            url = urlComponents!.url!
        }
        
        let request = URLRequest(url: url)
        let dataTask = URLSession(configuration: .default).dataTask(with: request) { data, response, error in
            guard error == nil else {
                onFailure(error)
                return
            }
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, (200...299).contains(statusCode) else {
                onFailure(error)
                return
            }
            
            guard let data = data else {
                onFailure(error)
                return
            }
            
            onSuccess(data)
        }
        dataTask.resume()
    }
}


extension APIManager: URLSessionDataDelegate {
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        print(response.expectedContentLength)
        completionHandler(.allow)
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print(data)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
    }
}


