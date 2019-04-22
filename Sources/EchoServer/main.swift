/// The Echo Server is the first exercise in the NIO Workshop.
///
/// It is based off `NIOEchoServer`, included in `apple/swift-nio`.
/// The goal is to introduce core concepts of Swift NIO, and decrease the number
/// of components to work with.
///
/// Much less robust version of
/// https://github.com/apple/swift-nio/blob/master/Sources/NIOEchoServer/main.swift

import NIO

/// This is a handler that writes back to the Channel's context as soon as it reads any data.
/// By not reading it any further, the Handler stops processing and instead sends the same
/// data back down the pipeline toward the client.
class EchoHandler: ChannelInboundHandler {
    public typealias InboundIn = ByteBuffer
    public typealias OutboundOut = ByteBuffer

    public func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        context.write(data, promise: nil)
    }

    // Flush it out. This can make use of gathering writes if multiple buffers are pending
    public func channelReadComplete(context: ChannelHandlerContext) {
        context.flush()
    }
}

let group = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)

defer {
    try! group.syncShutdownGracefully()
}

let bootstrap = ServerBootstrap(group: group)
    // Set the handlers that are applied to the channel
    .childChannelInitializer { channel in
        channel.pipeline.addHandler(EchoHandler())
    }

// Just listen on a port we hardcode for now
let channel = try bootstrap.bind(host: "localhost", port: 8080).wait()

// This should not exit since we don't close the server
try channel.closeFuture.wait()
