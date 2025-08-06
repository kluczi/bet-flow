//
//  Appwrite.swift
//  BetFlow
//
//  Created by Bartek on 04/07/2025.
//



import Foundation
import Appwrite
import JSONCodable


class Appwrite {
    
    var client: Client?
    var account: Account?
    
    public init() {
        #if DEBUG
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            print("Appwrite unlinked")
            return
        }
        #endif
        
        self.client = Client()
            .setEndpoint("https://fra.cloud.appwrite.io/v1")
            .setProject("68482a8f00257c4f1c6d")
        
        self.account = Account(client!)
    }
    
    public func onRegister(
        _ email: String,
        _ password: String,
        _ name: String
    ) async throws -> User<[String: AnyCodable]> {
        try await account!.create(
            userId: ID.unique(),
            email: email,
            password: password,
            name: name
        )
    }
    
    public func onLogin(
        _ email: String,
        _ password: String
    ) async throws -> Session {
        try await account!.createEmailPasswordSession(
            email: email,
            password: password
        )
    }
    
    public func onLogout() async throws {
        _ = try await account!.deleteSession(
            sessionId: "current"
        )
    }
    
    public func checkSession() async -> Bool {
        do {
            _ = try await account?.get()
            return true
        } catch {
            return false
        }
    }
    
    
    
}

