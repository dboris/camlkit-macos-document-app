open AppKit
open Runtime

let applicationDidFinishLaunching =
  NSApplicationDelegate.applicationDidFinishLaunching' @@ fun _self _cmd _notif ->
    (* Insert code here to initialize your application *)
    ()

let applicationWillTerminate =
  NSApplicationDelegate.applicationWillTerminate' @@ fun _self _cmd _notif ->
    (* Insert code here to tear down your application *)
    ()

let applicationSupportsSecureRestorableState =
  NSApplicationDelegate.applicationSupportsSecureRestorableState' @@ fun _self _cmd _app ->
    true

let define () =
  Class.define "AppDelegate"
    ~superclass: NSResponder.self
    ~methods:
      [ applicationDidFinishLaunching
      ; applicationWillTerminate
      ; applicationSupportsSecureRestorableState
      ]
