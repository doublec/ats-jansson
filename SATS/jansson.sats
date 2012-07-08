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
%{#
#include "contrib/jansson/CATS/jansson.cats"
%}

#define ATS_STALOADFLAG 0 // no need for staloading at run-time

abst@ype json_type = $extype "json_type"
macdef JSON_OBJECT   = $extval (json_type, "JSON_OBJECT")
macdef JSON_ARRAY    = $extval (json_type, "JSON_ARRAY")
macdef JSON_STRING   = $extval (json_type, "JSON_STRING")
macdef JSON_INTEGER  = $extval (json_type, "JSON_INTEGER")
macdef JSON_REAL     = $extval (json_type, "JSON_REAL")
macdef JSON_TRUE     = $extval (json_type, "JSON_TRUE")
macdef JSON_FALSE    = $extval (json_type, "JSON_FALSE")
macdef JSON_NULL     = $extval (json_type, "JSON_NULL")

absviewtype JSONptr (l:addr,n:int) // json_t*

absview JSONptr_minus (addr, view)
prfun JSONptr_minus_addback {l1:addr} {v:view} {n:int}
  (pf1: JSONptr_minus (l1, v), pf2: v |
   obj: !JSONptr (l1, n) >> JSONptr (l1, n-1)): void

absviewtype JSONiter (l:addr)
viewtypedef JSONiter0 = [l:addr] JSONiter l
viewtypedef JSONiter1 = [l:addr | l > null] JSONiter l

abst@ype json_error_t = $extype "json_error_t"

fun JSONptr_is_null {l:addr} {n:int} (x: !JSONptr (l,n)):<> bool (l == null)
  = "mac#atspre_ptr_is_null"
// end of [JSONptr_is_null]

fun JSONptr_isnot_null {l:addr} {n:int} (x: !JSONptr (l,n)):<> bool (l > null)
  = "mac#atspre_ptr_isnot_null"
// end of [JSONptr_isnot_null]

overload ~ with JSONptr_isnot_null

fun JSONiter_is_null {l:addr} (x: !JSONiter l):<> bool (l == null)
  = "mac#atspre_ptr_is_null"
// end of [JSONiter_is_null]

fun JSONiter_isnot_null {l:addr} (x: !JSONiter l):<> bool (l > null)
  = "mac#atspre_ptr_isnot_null"
// end of [JSONiter_isnot_null]

overload ~ with JSONiter_isnot_null

fun json_typeof
  {l:addr} {n:int} (json: !JSONptr (l, n)) : int = "mac#atsctrb_json_typeof"
fun json_is_object
  {l:addr} {n:int} (json: !JSONptr (l, n)) : bool = "mac#atsctrb_json_is_object"
fun json_is_array
  {l:addr} {n:int} (json: !JSONptr (l, n)) : bool = "mac#atsctrb_json_is_array"
fun json_is_string
  {l:addr} {n:int} (json: !JSONptr (l, n)) : bool = "mac#atsctrb_json_is_string"
fun json_is_integer
  {l:addr} {n:int} (json: !JSONptr (l, n)) : bool = "mac#atsctrb_json_is_integer"
fun json_is_real
  {l:addr} {n:int} (json: !JSONptr (l, n)) : bool = "mac#atsctrb_json_is_real"
fun json_is_true
  {l:addr} {n:int} (json: !JSONptr (l, n)) : bool = "mac#atsctrb_json_is_true"
fun json_is_false
  {l:addr} {n:int} (json: !JSONptr (l, n)) : bool = "mac#atsctrb_json_is_false"
fun json_is_null
  {l:addr} {n:int} (json: !JSONptr (l, n)) : bool = "mac#atsctrb_json_is_null"
fun json_is_number
  {l:addr} {n:int} (json: !JSONptr (l, n)) : bool = "mac#atsctrb_json_is_number"
fun json_is_boolean
  {l:addr} {n:int} (json: !JSONptr (l, n)) : bool = "mac#atsctrb_json_is_boolean"

fun json_incref
  {l:agz} {n:int} (
    json: !JSONptr (l, n)
  ) : JSONptr (l, 0) = "mac#atsctrb_json_incref"
   
fun json_decref
  {l:addr} (
    json: JSONptr (l, 0)
  ) : void = "mac#atsctrb_json_decref"

fun json_true () : [l:agz] JSONptr (l, 0) = "mac#atsctrb_json_true"
fun json_false () : [l:agz] JSONptr (l, 0) = "mac#atsctrb_json_false"
fun json_null () : [l:agz] JSONptr (l, 0) = "mac#atsctrb_json_null"

fun json_string	
  (
    value: string
  ) : [l:addr] JSONptr (l, 0) = "mac#atsctrb_json_string"

fun json_string_nocheck
  (
    value: string
  ) : [l:addr] JSONptr (l, 0) = "mac#atsctrb_json_string_nocheck"

fun json_string_value
  {l1:addr} {n:int} (
    json: !JSONptr (l1,n) >> JSONptr (l1, n+1)
  ) : [l2:addr] (JSONptr_minus (l1, strptr l2) | strptr l2)
  = "mac#atsctrb_json_string_value"

symintr json_string_set

fun json_string_set_string
  {l:agz} (
    json: !JSONptr (l, 0), value: string
  ) : int = "mac#atsctrb_json_string_set"

fun json_string_set_strptr
  {l1,l2:agz} (
    json: !JSONptr (l1,0), value: !strptr l2
  ) : int = "mac#atsctrb_json_string_set"

overload json_string_set with json_string_set_string
overload json_string_set with json_string_set_strptr

symintr json_string_set_nocheck

fun json_string_set_nocheck_string
  {l:agz} (
    json: !JSONptr (l, 0), value: string
  ) : int = "mac#atsctrb_json_string_set_nocheck"

fun json_string_set_nocheck_strptr
  {l1,l2:agz} (
    json: !JSONptr (l1,0), value: !strptr l2
  ) : int = "mac#atsctrb_json_string_set_nocheck"

overload json_string_set_nocheck with json_string_set_nocheck_string
overload json_string_set_nocheck with json_string_set_nocheck_strptr

fun json_integer	
  (
    value: int
  ) : [l:addr] JSONptr (l, 0) = "mac#atsctrb_json_integer"

fun json_integer_value
  {l:addr} {n:int} (
    json: !JSONptr (l, n)
  ) : int = "mac#atsctrb_json_integer_value"

fun json_integer_set
  {l:agz} {n:int} (
    json: !JSONptr (l, n), value: int
  ) : int = "mac#atsctrb_json_integer_set"

fun json_real	
  (
    value: double
  ) : [l:addr] JSONptr (l, 0) = "mac#atsctrb_json_real"

fun json_real_value
  {l:agz} {n:int} (
    json: !JSONptr (l, n)
  ) : double = "mac#atsctrb_json_real_value"

fun json_real_set
  {l:agz} {n:int} (
    json: !JSONptr (l, n), value: double
  ) : int = "mac#atsctrb_json_real_set"

fun json_number_value
  {l:agz} {n:int} (
    json: !JSONptr (l, n)
  ) : double = "mac#atsctrb_json_number_value"

fun json_array
  (
  ) : [l:addr] JSONptr (l, 0) = "mac#atsctrb_json_array"

fun json_array_size
  {l:agz} {n:int} (
    json: !JSONptr (l, n)
  ) : size_t = "mac#atsctrb_json_array_size"

fun json_array_get
  {n:int} {l1:addr} (
    json: !JSONptr (l1,n), index: size_t
  ) : [l2:addr] (minus(JSONptr (l1,n), JSONptr (l2,n)) | JSONptr (l2,n))
  = "mac#atsctrb_json_array_get"

fun json_array_set
  {l1, l2:addr} {n:nat} {n2,n3:int} (
    json: !JSONptr (l1, n2), index: int n, value: !JSONptr (l2, n3)
  ) : int = "mac#atsctrb_json_array_set"

fun json_array_set_new
  {l1, l2:addr} {n:nat} {n2, n3:int} (
    json: !JSONptr (l1, n2), index: int n, value: JSONptr (l2, n3)
  ) : int = "mac#atsctrb_json_array_set_new"

fun json_array_append
  {l1, l2:addr} {n1, n2:int} (
    json: !JSONptr (l1, n1), value: !JSONptr (l2, n2)
  ) : int = "mac#atsctrb_json_array_append"

fun json_array_append_new
  {l1, l2:addr} {n1, n2:int} (
    json: !JSONptr (l1, n1), value: JSONptr (l2, n2)
  ) : int = "mac#atsctrb_json_array_append_new"

fun json_array_insert
  {l1, l2:addr} {n:nat} {n2, n3:int} (
    json: !JSONptr (l1, n2), index: int n, value: !JSONptr (l2, n3)
  ) : int = "mac#atsctrb_json_array_insert"

fun json_array_insert_new
  {l1, l2:addr} {n:nat} {n2, n3:int} (
    json: !JSONptr (l1, n2), index: int n, value: JSONptr (l2, n3)
  ) : int = "mac#atsctrb_json_array_insert_new"

fun json_array_remove
  {l:agz} {n:nat} {n1:int} (
    json: !JSONptr (l, n1), index: int n
  ) : int = "mac#atsctrb_json_array_remove"

fun json_array_clear
  {l:agz} {n:int} (
    json: !JSONptr (l, n)
  ) : int = "mac#atsctrb_json_array_clear"

fun json_array_extend
  {l1, l2:agz} {n1, n2:int} (
    json1: !JSONptr (l1, n1), json2: !JSONptr (l2, n2)
  ) : int = "mac#atsctrb_json_array_extend"

fun json_object
  (
  ) : [l:addr] JSONptr (l, 0) = "mac#atsctrb_json_object"

fun json_object_size
  {l:agz} {n:int} (
    json: !JSONptr (l, n)
  ) : [n2:nat] int n2 = "mac#atsctrb_json_object_size"

fun json_object_get
  {l1:addr} (
    json: !JSONptr (l1,0), key: string
  ) : [l2:addr] (minus(JSONptr (l1,0), JSONptr (l2,0)) | JSONptr (l2,0))
  = "mac#atsctrb_json_object_get"

fun json_object_set
  {l1, l2:addr} {n1, n2:int} (
    json: !JSONptr (l1, n1), key: string, value: !JSONptr (l2, n2)
  ) : int = "mac#atsctrb_json_object_set"

fun json_object_set_nocheck
  {l1, l2:addr} {n1, n2:int} (
    json: !JSONptr (l1, n2), key: string, value: !JSONptr (l2, n2)
  ) : int = "mac#atsctrb_json_object_set_nocheck"

fun json_object_set_new
  {l1:addr} {l2:addr} {n1, n2:int} (
    json: !JSONptr (l1, n1), key: string, value: JSONptr (l2, n2)
  ) : int = "mac#atsctrb_json_object_set_new"

fun json_object_set_new_nocheck
  {l1, l2:addr} {n1, n2:int} (
    json: !JSONptr (l1, n1), key: string, value: JSONptr (l2, n2)
  ) : int = "mac#atsctrb_json_object_set_new_nocheck"

fun json_object_del
  {l:agz} {n:int} (
    json: !JSONptr (l, n), key: string
  ) : int = "mac#atsctrb_json_object_del"

fun json_object_clear
  {l:agz} {n:int} (
    json: !JSONptr (l, n)
  ) : int = "mac#atsctrb_json_object_clear"

fun json_object_update
  {l1, l2:agz} {n1, n2:int} (
    json1: !JSONptr (l1, n1), json2: !JSONptr (l1, n2)
  ) : int = "mac#atsctrb_json_object_update"

fun json_object_iter
  {l1:agz} (
    json: !JSONptr (l1,0)
  ) : [l2:addr] (minus(JSONptr (l1,0), JSONiter l2) | JSONiter l2)
  = "mac#atsctrb_json_object_iter"

fun json_object_iter_at
  {l1:agz} (
    json: !JSONptr (l1,0), key: string
  ) : [l2:addr] (minus(JSONptr (l1,0), JSONiter l2) | JSONiter l2)
  = "mac#atsctrb_json_object_iter_at"

fun json_object_iter_next
  {l1:agz} (
    json: !JSONptr (l1,0), iter: !JSONiter1
  ) : [l2:addr] (minus(JSONptr (l1,0), JSONiter l2) | JSONiter l2)
  = "mac#atsctrb_json_object_iter_next"

fun json_object_iter_key
  (
    iter: !JSONiter1
  ) : string = "mac#atsctrb_json_object_iter_key"

fun json_object_iter_value
  (
    iter: !JSONiter1
  ) : [l:agz] JSONptr (l, 0) = "mac#atsctrb_json_object_iter_value"

fun json_object_iter_set
  {l1, l2, l3:agz} {n1, n2:int} (
    json: !JSONptr (l1, n1), iter: !JSONiter l3, value: !JSONptr (l2, n2)
  ) : int = "mac#atsctrb_json_object_iter_set"

fun json_object_iter_set_new
  {l1, l2, l3:agz} {n1, n2:int} (
    json: !JSONptr (l1, n1), iter: !JSONiter l3, value: JSONptr (l2, n2)
  ) : int = "mac#atsctrb_json_object_iter_set_new"


fun json_loads
  (
    input: string, flags: int, error: &json_error_t?
  ) : [l:addr] JSONptr (l, 0) = "mac#atsctrb_json_loads" 

fun json_dumps {l:agz} {n:int} (root: !JSONptr (l, n), flags: int): [l2:addr] strptr l2 = "mac#json_dumps"
