# nio-demo

Demo repository to help with the Swift NIO Workshop.

# Part 1: Setup

Let's make sure you can build & run the system correctly.

At the console, try to run the `NIOEchoServer`:

```swift
swift package update
swift run NIOEchoServer
```

And then you should open a new terminal and attempt to communicate. You should receive whatever you submit in response:

```sh
echo "Hello World" | nc localhost 9999
```

# Part 2: Build your own EchoServer

Using what you learned about `EventLoop`s, `Channel`s, and `ChannelHandler`s, you're going to reproduce that echo behavior on your own.

Open up `./Sources/EchoServer/main.swift` (or create a new repository from scratch).

To run it, you can execute `swift run echo-server` in a terminal.

If you want a few hints, take a look at the branch named `echo-server`:

```sh
git checkout echo-server
```

# Part 3: Create an HTTPClient

Now we're going to attempt to build a simple HTTP client.

Make sure you have `swift sh` installed:

```sh
brew install mxcl/made/swift-sh
```

Then in a separate tab, clone [@cak](https://github.com/cak)'s [`server.swift`](https://github.com/cak/server.swift).

```sh
git clone https://github.com/cak/server.swift
```

Then you'll run it:

```
cd ./server.swift
swift sh server.swift
```

This will give you a simple HTTP server to test out your client and see what requests you're sending over. Because we're running this locally, we don't need to worry about TLS and certificates, though that's an eventual "Step 4."

You're going to import `NIOHTTP1` and utilize the primitives available for communicating with the HTTP protocol. The skeleton file is located in `./Sources/HTTPClient/main.swift`, and can be run with `swift run http-client`.

If you're looking for hints, check out the `http-client` branch:

```sh
git checkout http-client
```
