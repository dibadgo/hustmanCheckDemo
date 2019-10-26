//
//  TicketTicketInteractor.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import Foundation

class TicketInteractor: BaseInteractor, TicketInteractorInput {

    private let ticketsDao: TicketsDao

    weak var output: TicketInteractorOutput?

    init(ticketsBaseDao: TicketsDao) {
        self.ticketsDao = ticketsBaseDao
        super.init()
    }

    func saveTicket(_ ticket: LMTicket) {

        // Check the user has black mark
        guard ticket.isBackMark == false else {
            output?.onError(message: L10n.Tickets.userHasBlackMarkMessage)
            return
        }

        // Check the user has already invited
        guard ticket.isSaved == false else {
            output?.onError(message: L10n.Tickets.userAlreadyInvitedMessage)
            return
        }

        // Add user to local DB
        ticketsDao.add(ticket: ticket)

        //Notify all subscribers (e.g History Module) that ticket has added
        NotificationCenter
                .default
                .post(name: .createTicket, object: nil)
    }
}
