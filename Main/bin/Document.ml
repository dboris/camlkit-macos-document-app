open AppKit
open Runtime

let init =
  NSDocumentMethods.init @@ fun self cmd ->
    let self = msg_super ~self cmd ~args:Objc_t.[] ~return:Objc_t.id in
    (* Add your subclass-specific initialization here. *)
    self

let autosavesInPlace =
  NSDocumentClassMethods.autosavesInPlace @@ fun _self _cmd ->
    true

let windowNibName =
  NSDocumentMethods.windowNibName @@ fun _self _cmd ->
    new_string "Document"

let dataOfType =
  NSDocumentMethods.dataOfType'error' @@ fun _self _cmd _data_type _err ->
    raise (NSException ("UnimplementedMethod", string_of_selector _cmd ^ "is unimplemented"))

let readFromData =
  NSDocumentMethods.readFromData'ofType'error' @@ fun _self _cmd _data _data_type _err ->
    raise (NSException ("UnimplementedMethod", string_of_selector _cmd ^ "is unimplemented"))

let define () =
  Class.define "Document"
    ~superclass: NSDocument.self
    ~methods: [ init; windowNibName; dataOfType; readFromData ]
    ~class_methods: [ autosavesInPlace ]
