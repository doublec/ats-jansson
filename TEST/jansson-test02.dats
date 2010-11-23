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
  val a = json_string("this is a string")
  val () = assert_errmsg(JSONptr_isnot_null a, "json_string failed");

  val (pf | s) = json_string_value(a)
  val () = assert_errmsg(strptr_isnot_null s, "json_string_value failed");
  val () = assert_errmsg(json_is_string(a), "json_is_string failed");
  val x = strptr_dup(s)
  prval () = JSONptr_minus_addback(pf, s | a)

  val _ = json_string_set(a, x)
  val () = print_string("Value is: ")
  val () = print_strptr(x)
  val () = print_newline()
  val () = strptr_free(x)
//  prval () = JSONptr_minus_addback(pf, s | a)

  val () = json_decref(a);

} 
