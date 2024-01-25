//
//  String.swift
//  Joker
//
//  Created by Joao Flores on 01/08/21.
//  Copyright © 2021 Gustavo Lima. All rights reserved.
//

import Foundation
extension String {
    /// Uses NSLocalizedString to return a localized string,
    /// from the Localizable.strings file in the main bundle.
    /// - Note: Supporting English (Base) and Portuguese localization
    func localized() -> String {
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
