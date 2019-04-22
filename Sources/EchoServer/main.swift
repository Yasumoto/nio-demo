/// The Echo Server is the first exercise in the NIO Workshop.
///
/// It is based off `NIOEchoServer`, included in `apple/swift-nio`.
/// The goal is to introduce core concepts of Swift NIO, and decrease the number
/// of components to work with.
///
/// Much less robust version of
/// https://github.com/apple/swift-nio/blob/master/Sources/NIOEchoServer/main.swift

// We need to import NIO

// We need an EchoHandler, which is a ChannelInboundHandler
/// This is a handler that writes back to the Channel's context as soon as it reads any data.
/// By not reading it any further, the Handler stops processing and instead sends the same
/// data back down the pipeline toward the client.

// It should typealias both InboundIn and OutboundOut
// Since we're not inspecting what's coming in, we don't have anything other than NIO's
// default which is a raw ByteBuffer off the wire
// We want to do "something" when we read from the channel
// and also need to properly handle when reading from the channel is complete by flushing


// Once that's implemented, we want to create an EventLoopGroup

// Then we bootstrap a server with our group
// And initialize its child channel
// and setup its pipeline with one handler— our EchoHandler


// Then we want to bind to listen on a port, hardcoding localhost and port 8080
// Then we need to wait on the future for the channel to finish being setup


// Then we want to wait on the channels "closeFuture" to essentially listen forever (until we kill
// the process)
