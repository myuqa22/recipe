//
//  Message.swift
//  Recipe
//
//  Created by Privat on 08.10.23.
//

import Foundation
import UIKit

import SwiftMessages

class Message {
    
    static func getView(with message: String) -> UIView {
        
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.error)
        view.configureDropShadow()
        view.configureContent(title: "Error", body: message)
        view.button?.isHidden = true
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        
        return view
    }
}
