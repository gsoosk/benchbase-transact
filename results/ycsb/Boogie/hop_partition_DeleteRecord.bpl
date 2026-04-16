type String;
const empty: String;
function concat(x: String, y: String): String;
function str<a>(x: a): String;
axiom (forall s: String :: {concat(empty, s)} concat(empty, s) == s);
axiom (forall s: String :: {concat(s, empty)} concat(s, empty) == s);
axiom (forall<a> x: a, y: a :: {str(x), str(y)} str(x) == str(y) ==> x == y);
axiom (forall<a> x: a :: {str(x)} str(x) != empty);
type List a;
function length<a>(List a) returns (int);
function get<a>(List a, int) returns (a);
function append<a>(List a, a) returns (List a);
function emptyList<a>(a) returns (List a);
axiom (forall<a> w1:a, w2:a :: emptyList(w1) == emptyList(w2));
axiom (forall<a> w:a :: length(emptyList(w)) == 0);
axiom (forall<a> l:List a, e:a :: length(append(l, e)) == length(l) + 1);
axiom (forall<a> l:List a, e:a :: get(append(l, e), length(l)) == e);
axiom (forall<a> l:List a, e:a, i:int :: 0 <= i && i < length(l) ==> get(append(l, e), i) == get(l, i));
axiom (forall<a> l:List a :: length(l) >= 0);
axiom (forall<a> l1:List a, l2:List a :: (length(l1) != length(l2) ==> l1 != l2));
axiom (forall<a> l1:List a, l2:List a, e:a, f:a :: (e == f && l1 == l2) ==> append(l1, e) == append(l2, f));
type UUID;
function genUUID(n: int, m: int): UUID;
axiom (forall n1: int, m1: int, n2: int, m2: int :: {genUUID(n1, m1), genUUID(n2, m2)} genUUID(n1, m1) == genUUID(n2, m2) ==> (n1 == n2 && m1 == m2));
axiom (forall n1: int, m1: int, n2: int, m2: int :: {genUUID(n1, m1), genUUID(n2, m2)} (n1 != n2 || m1 != m2) ==> genUUID(n1, m1) != genUUID(n2, m2));
type Iterator a;
function iter_position<T>(iter: Iterator T) returns (int);
function iter_length<T>(iter: Iterator T) returns (int);
function iter_n<T>(iter: Iterator T) returns (int);
function iter_m<T>(iter: Iterator T) returns (int);
function model_iter_length(n: int, m: int) returns (int);
function scan<T>(t: Table T, n: int, m: int) returns (Iterator (Table T));
function next<T>(iter: Iterator T) returns (Iterator T);
function hasNext<T>(iter: Iterator T) returns (bool);
axiom (forall n: int, m: int :: model_iter_length(n, m) >= 0);
axiom (forall n: int, m: int :: model_iter_length(n, m) == 1);
axiom (forall<T> t: Table T, n: int, m: int :: iter_position(scan(t, n, m)) == 0);
axiom (forall<T> t: Table T, n: int, m: int :: iter_n(scan(t, n, m)) == n);
axiom (forall<T> t: Table T, n: int, m: int :: iter_m(scan(t, n, m)) == m);
axiom (forall<T> t: Table T, n: int, m: int :: iter_length(scan(t, n, m)) == model_iter_length(n, m));
axiom (forall<T> iter: Iterator T :: iter_position(next(iter)) == iter_position(iter) + 1);
axiom (forall<T> iter: Iterator T :: iter_length(next(iter)) == iter_length(iter));
axiom (forall<T> iter: Iterator T :: iter_n(next(iter)) == iter_n(iter));
axiom (forall<T> iter: Iterator T :: iter_m(next(iter)) == iter_m(iter));
axiom (forall<T> iter: Iterator T :: hasNext(iter) <==> iter_position(iter) < iter_length(iter));
type unit;
const c_unit: unit;
axiom (forall u1: unit, u2: unit :: u1 == u2);
function to_unit<a>(x: a): unit;
function get_ycsb_key#22(arg0: Iterator (Table (UserTable))) returns (int);
function model_get_ycsb_key#22(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (UserTable)) :: hasNext(iter) ==> get_ycsb_key#22(iter) == model_get_ycsb_key#22(iter_n(iter), iter_m(iter), iter_position(iter)));
type Table a;
type UserTable;
type Row a;
function construct_Row_UserTable(ycsb_key: int, field1: String, field2: String, field3: String, field4: String, field5: String, field6: String, field7: String, field8: String, field9: String, field10: String): Row (Table UserTable);
axiom (forall
    ycsb_key_1: int, field1_1: String, field2_1: String, field3_1: String, field4_1: String, field5_1: String, field6_1: String, field7_1: String, field8_1: String, field9_1: String, field10_1: String,
    ycsb_key_2: int, field1_2: String, field2_2: String, field3_2: String, field4_2: String, field5_2: String, field6_2: String, field7_2: String, field8_2: String, field9_2: String, field10_2: String
    ::
    construct_Row_UserTable(ycsb_key_1, field1_1, field2_1, field3_1, field4_1, field5_1, field6_1, field7_1, field8_1, field9_1, field10_1) == construct_Row_UserTable(ycsb_key_2, field1_2, field2_2, field3_2, field4_2, field5_2, field6_2, field7_2, field8_2, field9_2, field10_2)
    <==>
    (ycsb_key_1 == ycsb_key_2 && field1_1 == field1_2 && field2_1 == field2_2 && field3_1 == field3_2 && field4_1 == field4_2 && field5_1 == field5_2 && field6_1 == field6_2 && field7_1 == field7_2 && field8_1 == field8_2 && field9_1 == field9_2 && field10_1 == field10_2)
);
var UserTable_field9 : [int]String;
var UserTable_field7 : [int]String;
var UserTable_field5 : [int]String;
const __slice__ : int;
var UserTable_ycsb_key : [int]int;
var UserTable_field6 : [int]String;
var UserTable_field10 : [int]String;
var UserTable_field3 : [int]String;
var UserTable_field8 : [int]String;
var UserTable_field4 : [int]String;
var UserTable_field1 : [int]String;
const YCSB_SCAN_SIZE : int;
const __shards__ : int;
var UserTable_field2 : [int]String;
const TBL_UserTable : Table (UserTable);
procedure verify_hop_partitions_DeleteRecord(keyname: int)
modifies UserTable_field1, UserTable_field10, UserTable_field2, UserTable_field3, UserTable_field4, UserTable_field5, UserTable_field6, UserTable_field7, UserTable_field8, UserTable_field9, UserTable_ycsb_key;
{
  var s4_r#field1 : String;
  var s4_keyname : int;
  var s4_r#field10 : String;
  var s4_r#field2 : String;
  var s4_r#field3 : String;
  var s4_r#field4 : String;
  var s4_r#field5 : String;
  var s4_r#field6 : String;
  var s4_r#field7 : String;
  var s4_r#field8 : String;
  var s4_r#field9 : String;
  var s4_r#ycsb_key : int;

  // Hop partition verification for function 'DeleteRecord'
  s4_block4:
    s4_r#field1 := UserTable_field1[s4_keyname];
    s4_r#field10 := UserTable_field10[s4_keyname];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2192) (end . 2220) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    s4_r#field2 := UserTable_field2[s4_keyname];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2192) (end . 2220) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    s4_r#field3 := UserTable_field3[s4_keyname];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2192) (end . 2220) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    s4_r#field4 := UserTable_field4[s4_keyname];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2192) (end . 2220) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    s4_r#field5 := UserTable_field5[s4_keyname];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2192) (end . 2220) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    s4_r#field6 := UserTable_field6[s4_keyname];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2192) (end . 2220) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    s4_r#field7 := UserTable_field7[s4_keyname];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2192) (end . 2220) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    s4_r#field8 := UserTable_field8[s4_keyname];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2192) (end . 2220) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    s4_r#field9 := UserTable_field9[s4_keyname];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2192) (end . 2220) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    s4_r#ycsb_key := UserTable_ycsb_key[s4_keyname];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2192) (end . 2220) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    UserTable_field1 := UserTable_field1[s4_keyname := s4_r#field1];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2230, end: 2262, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2230) (end . 2262) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    UserTable_field10 := UserTable_field10[s4_keyname := s4_r#field10];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2230, end: 2262, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2230) (end . 2262) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    UserTable_field2 := UserTable_field2[s4_keyname := s4_r#field2];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2230, end: 2262, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2230) (end . 2262) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    UserTable_field3 := UserTable_field3[s4_keyname := s4_r#field3];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2230, end: 2262, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2230) (end . 2262) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    UserTable_field4 := UserTable_field4[s4_keyname := s4_r#field4];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2230, end: 2262, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2230) (end . 2262) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    UserTable_field5 := UserTable_field5[s4_keyname := s4_r#field5];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2230, end: 2262, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2230) (end . 2262) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    UserTable_field6 := UserTable_field6[s4_keyname := s4_r#field6];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2230, end: 2262, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2230) (end . 2262) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    UserTable_field7 := UserTable_field7[s4_keyname := s4_r#field7];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2230, end: 2262, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2230) (end . 2262) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    UserTable_field8 := UserTable_field8[s4_keyname := s4_r#field8];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2230, end: 2262, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2230) (end . 2262) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    UserTable_field9 := UserTable_field9[s4_keyname := s4_r#field9];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2230, end: 2262, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2230) (end . 2262) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    UserTable_ycsb_key := UserTable_ycsb_key[s4_keyname := s4_r#ycsb_key];
  // Partition check hop 4 func 'f' tables 'UserTable'=>'UserTable' keys [k0=keyname] first_span Span { start: 2192, end: 2220, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" } current_span Span { start: 2230, end: 2262, filename: "/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 4) (table_id . 0) (span ((start . 2230) (end . 2262) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/ycsb.transact\"))))"} (s4_keyname == s4_keyname);
    goto s4_epilogue;
  s4_hop_exit:
  s4_epilogue:
}

