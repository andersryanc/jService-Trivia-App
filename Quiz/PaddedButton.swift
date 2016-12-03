//
//  PaddedButton.swift
//  Quiz
//
//  Created by Ryan Anderson on 12/3/16.
//  Copyright © 2016 mranderson. All rights reserved.
//

import UIKit

@IBDesignable
class PaddedButton: UIButton {

    override func contentRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20.0, dy: 20.0)
    }

}
