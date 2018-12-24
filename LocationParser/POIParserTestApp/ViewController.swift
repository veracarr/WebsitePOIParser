//
//  ViewController.swift
//  POIParserTestApp
//
//  Created by Marc Liyanage on 12/24/18.
//  Copyright © 2018 Vera Carr. All rights reserved.
//

import Cocoa
import SwiftSoup

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://www.zagat.com/l/best-vegetarian-restaurants-in-san-francisco-area")
        guard let myURL = url else {
            print("Error: \(String(describing: url)) doesn't seem to be a valid URL")
            return
        }
        let html = try! String(contentsOf: myURL, encoding: .utf8)
        
        do {
            let doc: Document = try SwiftSoup.parseBodyFragment(html)
            let headerTitle = try doc.title()
            print("Header title: \(headerTitle)")
        } catch Exception.Error(let type, let message) {
            print("Message: \(message)")
        } catch {
            print("error")
        }

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

