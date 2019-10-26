//
//  BaseDaoAdapter.swift
//  HuntsmanCheck
//
//  Created by Арабаджиян Артем on 28/09/2019.
//  Copyright © 2019 DigitalCustoms. All rights reserved.
//

import Foundation
import CoreData

class BaseDaoAdapter<CDM: NSManagedObject, EMM: LMBusinessModel> {
    func map(from emm: EMM, to cdm: CDM) {
        fatalError("Not implemented")
    }

    func map(from cdm: CDM) -> EMM {
        fatalError("Not implemented")
    }
}