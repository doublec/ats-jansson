(*
** Copyright (C) 2010 Chris Double.
**
** Permission to use, copy, modify, and distribute this software for any
** purpose with or without fee is hereby granted, provided that the above
** copyright notice and this permission notice appear in all copies.
** 
** THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
** WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
** MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
** ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
** WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
** ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
** OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*)
staload "contrib/jansson/SATS/jansson.sats"

implement main () = () where {
  var e: json_error_t? 
  val root = json_loads("{\"one\":1}", 0, e);
  val () = assert_errmsg(JSONptr_isnot_null root, "json_loads failed");
  val (pf | one) = json_object_get(root, "one");
  val () = assert_errmsg(JSONptr_isnot_null one, "json_object_get failed");
//  val c = json_incref(one);
  prval () = minus_addback(pf, one | root) 

  val () = printf("test\n", @())

  val s = json_dumps (root, 0)
  val () = assertloc (strptr_isnot_null s)

  val () = print_strptr (s)
  val () = print_newline ()
  val () = strptr_free (s)

  val () = json_decref(root);
//  val () = json_decref(c);
} 
