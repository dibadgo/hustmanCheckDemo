//
//  ScanScanInteractor.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import VirgilCrypto

class ScanInteractor: BaseInteractor, ScanInteractorInput {

    private let jsonMapper: JsonMapperProtocol
    private let ticketsDao: TicketsDao
    private let blackListDao: BlockDao

    weak var output: ScanInteractorOutput?

    init(jsonMapper: JsonMapperProtocol, ticketDao: TicketsDao, blackDao: BlockDao) {
        self.jsonMapper = jsonMapper
        self.ticketsDao = ticketDao
        self.blackListDao = blackDao
        super.init()
    }

    func getTicket(from qrContent: String?) {

        guard let qrContent = qrContent else {
            output?.onError(message: L10n.Scan.cannotDecodeMessage)
            return
        }

        guard let ticketData = qrContent.data(using: .utf8) else {
            output?.onError(message: L10n.Scan.cannotDecodeMessage)
            return
        }

        guard let ticketNM = jsonMapper.map(NMTicket.self, from: ticketData) else {
            output?.onError(message: L10n.Scan.cannotDecodeMessage)
            return
        }

        let logicModel = TicketsAdapter().lm(from: ticketNM)

        if ticketsDao.get(byId: logicModel.id) != nil {
            logicModel.isSaved = true
        }

        if blackListDao.get(byUserHash: logicModel.hash) != nil {
            logicModel.isBackMark = true
        }

        output?.showTicketInfo(with: logicModel)
    }

//    private func decryptMessage(_ message: String) -> String {
//
//        let crypto = try! VirgilCrypto()
//
//        let keyPair = try! crypto.generateKeyPair()
//
//        let encryptedData = message.data(using: .utf8)!
//
////// prepare data to be decrypted
////        let decryptedData = try! crypto.decrypt(encryptedData, with: keyPair.privateKey)
////
////// decrypt the encrypted data using a private key
////        let decryptedMessage = String(data: decryptedData, encoding: .utf8)!
//
//        return message
//    }
//    }
}
