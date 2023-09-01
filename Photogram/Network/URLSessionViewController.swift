//
//  URLSessionViewController.swift
//  Photogram
//
//  Created by 서동운 on 8/30/23.
//

import UIKit

class URLSessionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.callRequest()
    }
    
    func callRequest() {
        let url = URL(string: "https://api.nasa.gov/assets/img/general/apod.jpg")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData)
        
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        let dataTask = urlSession.dataTask(with: request)
        dataTask.resume()
    }
}

extension URLSessionViewController: URLSessionDataDelegate {
    
    
    // -------------
    
//    func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge) async -> (URLSession.AuthChallengeDisposition, URLCredential?) {
//
//    }
    
//    func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//
//    }
    
    // ---------
    
//    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge) async -> (URLSession.AuthChallengeDisposition, URLCredential?) {
//
//    }
    
//    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//
//    }
    
    // ---------
    
//    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
//
//    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        print(response.expectedContentLength)
        completionHandler(.allow)
    }
    
    // -------
    
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print(data)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("end")
    }
}
