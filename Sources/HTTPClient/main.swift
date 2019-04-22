/// The HTTPClient aims to be a simple way to generate and send HTTP requests.
///
/// This exercise allows students the opportunity to work with the `NIOHTTP1`
/// toolset, and send requests (typically locally, using something like
/// `cak/server.swift`) to a server that does not use TLS.
/// 

import NIO
import NIOHTTP1

let group = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)

let store = ResponseStore()
let accumulation = HTTPClientResponseHandler(store: store)

let channel = try ClientBootstrap(group: group)
    .channelInitializer { channel in
        channel.pipeline.addHTTPClientHandlers().flatMap { _ in
            channel.pipeline.addHandler(accumulation)
        }
    }
    .connect(host: "localhost", port: 8000).wait()

let head = HTTPRequestHead(version: HTTPVersion(major: 1, minor: 1), method: .GET, uri: "/test")

let _ = try channel.write(NIOAny(HTTPClientRequestPart.head(head))).and(
    channel.writeAndFlush(NIOAny(HTTPClientRequestPart.end(nil)))
).wait()

accumulation.syncWaitForCompletion()
for response in store.responses {
    print(response)
}
