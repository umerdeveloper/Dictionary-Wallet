//
//  ViewController.swift
//  Dictionary Wallet
//
//  Created by Umer Khan on 02/04/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//
//curl --header "Authorization: Token 26db1439d6e565db2225c9291b6ceb1a9fc0c8cf" https://owlbot.info/api/v4/dictionary/owl -s | json_pp


import UIKit

class ViewController: UIViewController, URLSessionDelegate {
    
    var words = [Json4Swift_Base]()
    private var searchedWord: String = ""
    
    // MARK: - UI Properties
    @IBOutlet weak var searchButtonOutlet: UIButton!
    @IBOutlet weak var wordTextField: UITextField!
    
    // MARK: - API Token
    private let apiToken: String = "Token 26db1439d6e565db2225c9291b6ceb1a9fc0c8cf"
    private let urlString: String = "https://owlbot.info/api/v4/dictionary/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButtonOutlet.layer.cornerRadius = 8
        wordTextField.becomeFirstResponder()
    }
    
    // MARK: - UI Methods
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
        guard wordTextField.text != "" else { return }
        searchedWord = String(wordTextField.text!)
        simpleURLRequest(with: searchedWord)
    }
    func simpleURLRequest(with word: String) {
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.httpAdditionalHeaders = ["Authorization": apiToken]
        let session = URLSession(configuration: sessionConfig, delegate: self , delegateQueue: nil)
        
        guard let url = URL(string: urlString+word) else { return }
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let word =  try decoder.decode(Json4Swift_Base.self, from: data)
                    print(word.definitions!)
                }
                catch { return }
            }
        }
        task.resume()
    }
    
    
    func jsonFormatData(data: JSON) {
        
    }
}

