//
//  ViewController.swift
//  AsyncAwaitProj
//
//  Created by Kamlesh Kumar Sharma on 15/09/24.
//

import UIKit

import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.font = UIFont.systemFont(ofSize: 40)
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        Task.detached { [weak self] in
            print(Thread.isMainThread)
            let firstName = await self?.getMyFirstName()
            await self?.setText(text: firstName ?? "")
            print(firstName)
            print(Thread.isMainThread)
        }
        
        print("Kamlesh")
        setText(text: "Kamlesh")
        
        for i in 0...100000000 {
            if i==100000000 {
                print(i)
            }
        }
    }
    
    func getMyFirstName() async -> String {
        try? await Task.sleep(nanoseconds: 5000000000)
        return "Sharma"
    }
    
    @MainActor
    func setText(text: String) {
        myLabel.text = text
    }
}

