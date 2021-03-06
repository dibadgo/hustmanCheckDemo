//
//  TicketTicketViewInput.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

protocol TicketViewInput: class {

    /**
        @author dibadgo
        Show error
    */
    func showError(withMessage message: String)

    func setTicket(_ ticket: LMTicket)

    func disableActionSection()

    func disableSaveButton()
}
