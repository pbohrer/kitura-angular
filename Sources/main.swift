import Foundation
import Kitura
import HeliumLogger
import SwiftyJSON

HeliumLogger.use()

let router = Router()

router.all("/", middleware: StaticFileServer(path: "./public"))

var timestamps = [String]()

func addTimestamp() {
	let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium)
	timestamps.append(timestamp)
}

router.get("/timestamps") {
    request, response, next in
    response.send(json: JSON(timestamps))
    next()
}
router.post("/timestamps") {
    request, response, next in
    addTimestamp()
    response.status(.OK)
    next()
}
router.delete("/timestamps") {
    request, response, next in
    
    timestamps = []
    
    response.status(.OK)
    next()
}

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()
