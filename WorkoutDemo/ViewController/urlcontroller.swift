//
//  urlcontroller.swift
//  urlTest
//
//  Created by 김규민 on 2023/11/04.
//

import Foundation

class urlRequest {

    static let shared = urlRequest()
    
    var login = false
    var join = false
    var logout = false
    
    private init() {}
    
    func setlogin(inp: Bool)
    {
        self.login = inp
    }
    
    func setjoin(inp: Bool)
    {
        self.join = inp
    }
    
    func setlogout(inp: Bool)
    {
        self.logout = inp
    }
    
    func trylogin(email :String, password :String, httpmethod :String) -> Void
    {
        let urlstring = "http://localhost:8080/login?email=" + email + "&password=" + password
        print("{trylogin}urlstring : " + urlstring)
        let url = URL(string: urlstring)!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = httpmethod
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            defer {
                        semaphore.signal()
                    }
            
            guard error == nil else {
                print("Error occur: error calling POST - \(String(describing: error))")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                    print("Error: HTTP request failed")
                    return
                }
            
            print("{trylogin}Response status code: \(response.statusCode)")
            
            if response.statusCode == 200 {
                // HTTP 응답 코드가 200인 경우에만 처리를 수행합니다.
                self.setlogin(inp: true)
            }
            else
            {
                self.setlogin(inp: false)
            }
        }
        task.resume()
        
        semaphore.wait()
    }
    
    func tryjoin(name :String, email :String, password :String, httpmethod :String) -> Void
    {
        let urlstring = "http://localhost:8080/join?name=" + name + "&email=" + email + "&password=" + password
        
        let session = URLSession.shared
        let url = URL(string: urlstring)!
        var request = URLRequest(url: url)
        request.httpMethod = httpmethod
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            defer {
                        semaphore.signal()
                    }
            
            guard error == nil else {
                print("Error occur: error calling tryjoin - \(String(describing: error))")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                    print("Error: HTTP request failed")
                    return
                }
            
            print("{tryjoin}Response status code: \(response.statusCode)")
            
            if response.statusCode == 200 {
                // HTTP 응답 코드가 200인 경우에만 처리를 수행합니다.
                self.setjoin(inp: true)
            } else {
                self.setjoin(inp: false)
            }
        }
        task.resume()
        
        semaphore.wait()
    }
}
