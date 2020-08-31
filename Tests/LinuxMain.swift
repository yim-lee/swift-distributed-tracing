//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift Distributed Tracing open source project
//
// Copyright (c) 2020 Moritz Lang and the Swift Tracing project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//
//
// LinuxMain.swift
//
import XCTest
///
/// NOTE: This file was generated by generate_linux_tests.rb
///
/// Do NOT edit this file directly as it will be regenerated automatically when needed.
///

#if os(Linux) || os(FreeBSD)
   @testable import InstrumentationTests
   @testable import NIOInstrumentationTests
   @testable import OpenTelemetryInstrumentationSupportTests
   @testable import TracingTests

// This protocol is necessary to we can call the 'run' method (on an existential of this protocol)
// without the compiler noticing that we're calling a deprecated function.
// This hack exists so we can deprecate individual tests which test deprecated functionality without
// getting a compiler warning...
protocol LinuxMainRunner { func run() }
class LinuxMainRunnerImpl: LinuxMainRunner {
   @available(*, deprecated, message: "not actually deprecated. Just deprecated to allow deprecated tests (which test deprecated functionality) without warnings")
   func run() {
       XCTMain([
             testCase(BaggageContextInboundHTTPHandlerTests.allTests),
             testCase(BaggageContextOutboundHTTPHandlerTests.allTests),
             testCase(InstrumentTests.allTests),
             testCase(InstrumentationSystemTests.allTests),
             testCase(SpanAttributeSemanticsTests.allTests),
             testCase(SpanTests.allTests),
             testCase(TimestampTests.allTests),
             testCase(TracedLockTests.allTests),
             testCase(TracingInstrumentTests.allTests),
        ])
    }
}
(LinuxMainRunnerImpl() as LinuxMainRunner).run()
#endif
