//
//  KeychainManager.swift
//  Plugin
//
//  Created by Danutha Fernando on 2022-12-13.
//  Copyright © 2022 Max Lynch. All rights reserved.
//

import Foundation

open class KeychainManager  {
    /*Class Properties*/
    fileprivate var device_uuid:String = ""
    fileprivate var device = Device(service:"com.cake.app.uuid_service", account: "madmobile.cake.app", uuid: UUID().uuidString)
    
    init() {

        if let val = getKeychainUUID(){
                self.device_uuid = val
        }else {
            do{
                try saveEntry(service: device.service,
                              account: device.account,
                              data: device.uuid.data(using: .utf8) ?? Data ())}
            catch{print(error)}
                self.device_uuid = getKeychainUUID() ?? ""
        }
    }
    
    //Publically accessible function to retrievethe UUID
    open func getUUID ()-> String {

        return device_uuid
    }
    
    fileprivate func getKeychainUUID() -> String? {
        guard let val = getEntry(service: device.service,
                                 account: device.account) else {return nil}
        
        return String(decoding: val, as: UTF8.self)
    }
    
    fileprivate func saveEntry (service:String,account:String,data:Data) throws {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecValueData as String: data as AnyObject,
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status != errSecDuplicateItem else {
            throw KeychainError.DUPLICATE_ENTRY
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.UNKNOWN(status)
        }

        print("Saved Items to the keychain......")
    }
    
    fileprivate func getEntry (service:String,account:String) -> Data? {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne,
        ]
        
        var result:AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        print("Read Status......\(status)")
        return result as? Data ?? Data()
    }
}


fileprivate enum KeychainError:Error {
    case DUPLICATE_ENTRY
    case UNKNOWN(OSStatus)
}

struct Device {
    let service:String
    let account:String
    let uuid:String
}
