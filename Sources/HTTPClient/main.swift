/// The HTTPClient aims to be a simple way to generate and send HTTP requests.
///
/// This exercise allows students the opportunity to work with the `NIOHTTP1`
/// toolset, and send requests (typically locally, using something like
/// `cak/server.swift`) to a server that does not use TLS.
///

// We need both NIO and NIOHTTP1

// We need an EventLoopGroup

// We need to Bootstrap a Client
// And initialize its channel
// Then add HTTP Client Handlers to the pipeline

// Once that's done, we need to connect to localhost on port 8000

// We should make sure we've actually connected by using the Future


// We need to create an HTTPRequestHead

// Then wrap it inside HTTPClientRequestPart, and wrap that in NIOAny

// Then we can write that to the channel

// Lastly, we should wrap an `end` HTTPClientRequestPart in NIOAny
// and then wait for the completion
