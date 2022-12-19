import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(UUID_GetterPlugin)
public class UUID_GetterPlugin: CAPPlugin {
    private let implementation = UUID_Getter()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
    
    @objc func getUUID(_ call: CAPPluginCall) {
        let manager = KeychainManager()
       
        let value = manager.getUUID()
        print("UUID is:....",value)
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
}
