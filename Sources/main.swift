import Foundation
import Kitura
import HeliumLogger
import SwiftyJSON

HeliumLogger.use()

let router = Router()

//
//	Allow for serving up static files found in the public directory
//
router.all("/", middleware: StaticFileServer(path: "./public"))

//
//	Timestamps
//
//	Add REST endpoints for getting, setting and clearing timestamps in an array in memory
//
var timestamps = [String]()

router.get("/timestamps") {
    request, response, next in
    response.send(json: JSON(timestamps))
    next()
}

router.post("/timestamps") {
    request, response, next in

	let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium)
	timestamps.append(timestamp)

    response.status(.OK)
    next()
}

router.delete("/timestamps") {
    request, response, next in
    
    timestamps = []
    
    response.status(.OK)
    next()
}

//
// Read environment variables and look for port we should listen on
//
let envVars = ProcessInfo.processInfo.environment
let portString: String = envVars["PORT"] ?? envVars["CF_INSTANCE_PORT"] ??  envVars["VCAP_APP_PORT"] ?? "8090"
let port = Int(portString) ?? 8090

Kitura.addHTTPServer(onPort: port, with: router)
Kitura.run()
