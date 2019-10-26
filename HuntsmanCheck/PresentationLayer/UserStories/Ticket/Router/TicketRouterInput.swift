//
//  TicketTicketRouterInput.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import Foundation

protocol TicketRouterInput {

    func closeCurrentModule()

    func showBlockModule(with ticket: LMTicket, moduleOutput: BlockModuleOutput)
}
