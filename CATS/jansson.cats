/*
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
*/
#ifndef ATSCTRB_JANSSON_CATS
#define ATSCTRB_JANSSON_CATS

/* ****** ****** */

#include <jansson.h>

ATSinline()
ats_int_type
atsctrb_json_typeof(ats_ptr_type x) {
  return json_typeof((json_t*)x);
}

ATSinline()
ats_bool_type
atsctrb_json_is_object(ats_ptr_type x) {
  return json_is_object((json_t*)x) ? ats_true_bool : ats_false_bool;
}

ATSinline()
ats_bool_type
atsctrb_json_is_array(ats_ptr_type x) {
  return json_is_array((json_t*)x) ? ats_true_bool : ats_false_bool;
}

ATSinline()
ats_bool_type
atsctrb_json_is_string(ats_ptr_type x) {
  return json_is_string((json_t*)x) ? ats_true_bool : ats_false_bool;
}

ATSinline()
ats_bool_type
atsctrb_json_is_integer(ats_ptr_type x) {
  return json_is_integer((json_t*)x) ? ats_true_bool : ats_false_bool;
}

ATSinline()
ats_bool_type
atsctrb_json_is_real(ats_ptr_type x) {
  return json_is_real((json_t*)x) ? ats_true_bool : ats_false_bool;
}

ATSinline()
ats_bool_type
atsctrb_json_is_number(ats_ptr_type x) {
  return json_is_number((json_t*)x) ? ats_true_bool : ats_false_bool;
}

ATSinline()
ats_bool_type
atsctrb_json_is_true(ats_ptr_type x) {
  return json_is_true((json_t*)x) ? ats_true_bool : ats_false_bool;
}

ATSinline()
ats_bool_type
atsctrb_json_is_false(ats_ptr_type x) {
  return json_is_false((json_t*)x) ? ats_true_bool : ats_false_bool;
}

ATSinline()
ats_bool_type
atsctrb_json_is_boolean(ats_ptr_type x) {
  return json_is_boolean((json_t*)x) ? ats_true_bool : ats_false_bool;
}

ATSinline()
ats_bool_type
atsctrb_json_is_null(ats_ptr_type x) {
  return json_is_null((json_t*)x) ? ats_true_bool : ats_false_bool;
}

ATSinline()
ats_void_type
atsctrb_json_decref(ats_ptr_type x) {
  json_decref((json_t*)x);
}

ATSinline()
ats_ptr_type
atsctrb_json_incref(ats_ptr_type x) {
  return json_incref((json_t*)x);
}

#define atsctrb_json_true json_true
#define atsctrb_json_false json_false
#define atsctrb_json_null json_null
#define atsctrb_json_string json_string
#define atsctrb_json_string_nocheck json_string_nocheck
#define atsctrb_json_string_value json_string_value
#define atsctrb_json_string_set json_string_set
#define atsctrb_json_string_set_nocheck json_string_set_nocheck
#define atsctrb_json_integer json_integer
#define atsctrb_json_integer_value json_integer_value
#define atsctrb_json_integer_set json_integer_set
#define atsctrb_json_real json_real
#define atsctrb_json_real_value json_real_value
#define atsctrb_json_real_set json_real_set
#define atsctrb_json_number_value json_number_value
#define atsctrb_json_array json_array
#define atsctrb_json_array_size json_array_size
#define atsctrb_json_array_get json_array_get
#define atsctrb_json_array_set json_array_set
#define atsctrb_json_array_set_new json_array_set_new
#define atsctrb_json_array_append json_array_append
#define atsctrb_json_array_append_new json_array_append_new
#define atsctrb_json_array_insert json_array_insert
#define atsctrb_json_array_insert_new json_array_insert_new
#define atsctrb_json_array_remove json_array_remove
#define atsctrb_json_array_clear json_array_clear
#define atsctrb_json_array_extend json_array_extend
#define atsctrb_json_object json_object
#define atsctrb_json_object_size json_object_size
#define atsctrb_json_object_get json_object_get
#define atsctrb_json_object_set json_object_set
#define atsctrb_json_object_set_nocheck json_object_set_nocheck
#define atsctrb_json_object_set_new json_object_set_new
#define atsctrb_json_object_set_new_nocheck json_object_set_new_nocheck
#define atsctrb_json_object_del json_object_del
#define atsctrb_json_object_clear json_object_clear
#define atsctrb_json_object_update json_object_update
#define atsctrb_json_object_iter json_object_iter
#define atsctrb_json_object_iter_at json_object_iter_at
#define atsctrb_json_object_iter_next json_object_iter_next
#define atsctrb_json_object_iter_key json_object_iter_key
#define atsctrb_json_object_iter_value json_object_iter_value
#define atsctrb_json_object_iter_set json_object_iter_set
#define atsctrb_json_object_iter_set_new json_object_iter_set_new
#define atsctrb_json_dumps json_dumps
#define atsctrb_json_dumpf json_dumpf
#define atsctrb_json_dump_file json_dump_file
#define atsctrb_json_loads json_loads
#define atsctrb_json_loadf json_loadf
#define atsctrb_json_load_file json_load_file
#define atsctrb_json_equal json_equal
#define atsctrb_json_copy json_copy
#define atsctrb_json_deep_copy json_deep_copy

#endif


