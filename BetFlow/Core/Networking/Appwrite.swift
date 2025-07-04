////
////  Appwrite.swift
////  BetFlow
////
////  Created by Bartek on 04/07/2025.
////
//
//import Foundation
//import Appwrite
//import JSONCodable
//
//class Appwrite {
//    var client: Client
//    var account: Account
//    
//    public init() {
//        self.client = Client()
//            .setEndpoint("https://<REGION>.cloud.appwrite.io/v1")
//            .setProject("")
//        
//        self.account = Account(client)
//    }
//    
//    public func onRegister(
//        _ email: String,
//        _ password: String
//    ) async throws -> User<[String: AnyCodable]> {
//        try await account.create(
//            userId: ID.unique(),
//            email: email,
//            password: password
//        )
//    }
//    
//    public func onLogin(
//        _ email: String,
//        _ password: String
//    ) async throws -> Session {
//        try await account.createEmailPasswordSession(
//            email: email,
//            password: password
//        )
//    }
//    
//    public func onLogout() async throws {
//        _ = try await account.deleteSession(
//            sessionId: "current"
//        )
//    }
//    
//}
//
