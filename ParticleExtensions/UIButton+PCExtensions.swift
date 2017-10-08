//
//  UIButton+Block.swift
//  ParticleExtensions
//
//  Created by Stephen Silber on 2/21/17.
//  Copyright © 2017 particle Co. All rights reserved.
//

import UIKit
import ObjectiveC

private var blockAssociationKey: Int = 0

extension UIButton {

    public convenience init(with block: @escaping () -> Void) {
        self.init(frame: CGRect.zero)
        self.block = block
    }

    public var block: (() -> Void)? {
        get {
            return objc_getAssociatedObject(self, &blockAssociationKey) as? () -> Void
        }
        set {
            guard let newBlock = newValue else {
                removeTarget(self, action: #selector(handler), for: .touchUpInside)
                return
            }

            if block == nil {
                addTarget(self, action: #selector(handler), for: .touchUpInside)
            }

            objc_setAssociatedObject(self, &blockAssociationKey, newBlock, .OBJC_ASSOCIATION_COPY)
        }
    }

    @objc private func handler() {
        block?()
    }
    
}

