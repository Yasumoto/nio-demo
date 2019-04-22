//
//  HTTPClientResponseHandler.swift
//  Accumulate response from an HTTP request
//
//  Created by Joe Smith on 4/22/19.
//

import Dispatch
import NIO
import NIOHTTP1

// Borrowed & tweaked from
// https://github.com/apple/swift-nio/blob/119893182312113a4e1e5bc6c11b576791f7cebc/Tests/NIOHTTP1Tests/HTTPServerClientTest.swift
class HTTPClientResponseHandler: ChannelInboundHandler {
    typealias InboundIn = HTTPClientResponsePart

    private var receiveds: [UInt8] = []
    private var allDoneBlock: DispatchWorkItem! = nil

    public init(store: ResponseStore) {
        self.allDoneBlock = DispatchWorkItem { [unowned self] () -> Void in
            let response = String(decoding: self.receiveds, as: Unicode.UTF8.self)
            store.responses.append(response)
        }
    }

    // Borrowed from
    // https://github.com/amzn/smoke-http/blob/master/Sources/SmokeHTTPClient/HTTPClientChannelInboundHandler.swift#L101
    public func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        let responsePart = self.unwrapInboundIn(data)
        switch responsePart {
        case .head:
            break
        case .body(let bb):
            bb.withUnsafeReadableBytes { ptr in
                receiveds.append(contentsOf: ptr)
            }
        case .end:
            self.allDoneBlock.perform()
        }
        context.fireChannelRead(data)
    }

    public func syncWaitForCompletion() {
        self.allDoneBlock.wait()
    }
}

class ResponseStore {
    public init() {}
    public var responses = [String]()
}
