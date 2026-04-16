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
function get_T_ID#20(arg0: Iterator (Table (TEMPLATED_TABLE))) returns (int);
function model_get_T_ID#20(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (TEMPLATED_TABLE)) :: hasNext(iter) ==> get_T_ID#20(iter) == model_get_T_ID#20(iter_n(iter), iter_m(iter), iter_position(iter)));
type Table a;
type TEMPLATED_TABLE;
type Row a;
function construct_Row_TEMPLATED_TABLE(T_ID: int, T_INT_VAL: int, T_FLOAT_VAL: real, T_STRING_VAL: String): Row (Table TEMPLATED_TABLE);
axiom (forall
    T_ID_1: int, T_INT_VAL_1: int, T_FLOAT_VAL_1: real, T_STRING_VAL_1: String,
    T_ID_2: int, T_INT_VAL_2: int, T_FLOAT_VAL_2: real, T_STRING_VAL_2: String
    ::
    construct_Row_TEMPLATED_TABLE(T_ID_1, T_INT_VAL_1, T_FLOAT_VAL_1, T_STRING_VAL_1) == construct_Row_TEMPLATED_TABLE(T_ID_2, T_INT_VAL_2, T_FLOAT_VAL_2, T_STRING_VAL_2)
    <==>
    (T_ID_1 == T_ID_2 && T_INT_VAL_1 == T_INT_VAL_2 && T_FLOAT_VAL_1 == T_FLOAT_VAL_2 && T_STRING_VAL_1 == T_STRING_VAL_2)
);
var TEMPLATED_TABLE_T_ID : [int]int;
var TEMPLATED_TABLE_T_FLOAT_VAL : [int]real;
const TBL_TEMPLATED_TABLE : Table (TEMPLATED_TABLE);
var TEMPLATED_TABLE_T_STRING_VAL : [int]String;
const __shards__ : int;
const __slice__ : int;
var TEMPLATED_TABLE_T_INT_VAL : [int]int;
procedure verify_hop_partitions_GenericUpdate(key: int, new_string: String)
modifies TEMPLATED_TABLE_T_FLOAT_VAL, TEMPLATED_TABLE_T_ID, TEMPLATED_TABLE_T_INT_VAL, TEMPLATED_TABLE_T_STRING_VAL;
{
  var s2_r#T_FLOAT_VAL : real;
  var s2_key : int;
  var s2_r#T_ID : int;
  var s2_r#T_INT_VAL : int;
  var s2_r#T_STRING_VAL : String;
  var s2_new_string : String;

  // Hop partition verification for function 'GenericUpdate'
  s2_block2:
    s2_r#T_FLOAT_VAL := TEMPLATED_TABLE_T_FLOAT_VAL[s2_key];
    s2_r#T_ID := TEMPLATED_TABLE_T_ID[s2_key];
  // Partition check hop 2 func 'f' tables 'TEMPLATED_TABLE'=>'TEMPLATED_TABLE' keys [k0=key] first_span Span { start: 1424, end: 1450, filename: "/Users/farzad/Desktop/Research/benchbase-transact/templated.transact" } current_span Span { start: 1424, end: 1450, filename: "/Users/farzad/Desktop/Research/benchbase-transact/templated.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 17) (hop_id . 2) (table_id . 0) (span ((start . 1424) (end . 1450) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/templated.transact\"))))"} (s2_key == s2_key);
    s2_r#T_INT_VAL := TEMPLATED_TABLE_T_INT_VAL[s2_key];
  // Partition check hop 2 func 'f' tables 'TEMPLATED_TABLE'=>'TEMPLATED_TABLE' keys [k0=key] first_span Span { start: 1424, end: 1450, filename: "/Users/farzad/Desktop/Research/benchbase-transact/templated.transact" } current_span Span { start: 1424, end: 1450, filename: "/Users/farzad/Desktop/Research/benchbase-transact/templated.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 17) (hop_id . 2) (table_id . 0) (span ((start . 1424) (end . 1450) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/templated.transact\"))))"} (s2_key == s2_key);
    s2_r#T_STRING_VAL := s2_new_string;
    TEMPLATED_TABLE_T_FLOAT_VAL := TEMPLATED_TABLE_T_FLOAT_VAL[s2_key := s2_r#T_FLOAT_VAL];
  // Partition check hop 2 func 'f' tables 'TEMPLATED_TABLE'=>'TEMPLATED_TABLE' keys [k0=key] first_span Span { start: 1424, end: 1450, filename: "/Users/farzad/Desktop/Research/benchbase-transact/templated.transact" } current_span Span { start: 1497, end: 1527, filename: "/Users/farzad/Desktop/Research/benchbase-transact/templated.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 17) (hop_id . 2) (table_id . 0) (span ((start . 1497) (end . 1527) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/templated.transact\"))))"} (s2_key == s2_key);
    TEMPLATED_TABLE_T_ID := TEMPLATED_TABLE_T_ID[s2_key := s2_r#T_ID];
  // Partition check hop 2 func 'f' tables 'TEMPLATED_TABLE'=>'TEMPLATED_TABLE' keys [k0=key] first_span Span { start: 1424, end: 1450, filename: "/Users/farzad/Desktop/Research/benchbase-transact/templated.transact" } current_span Span { start: 1497, end: 1527, filename: "/Users/farzad/Desktop/Research/benchbase-transact/templated.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 17) (hop_id . 2) (table_id . 0) (span ((start . 1497) (end . 1527) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/templated.transact\"))))"} (s2_key == s2_key);
    TEMPLATED_TABLE_T_INT_VAL := TEMPLATED_TABLE_T_INT_VAL[s2_key := s2_r#T_INT_VAL];
  // Partition check hop 2 func 'f' tables 'TEMPLATED_TABLE'=>'TEMPLATED_TABLE' keys [k0=key] first_span Span { start: 1424, end: 1450, filename: "/Users/farzad/Desktop/Research/benchbase-transact/templated.transact" } current_span Span { start: 1497, end: 1527, filename: "/Users/farzad/Desktop/Research/benchbase-transact/templated.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 17) (hop_id . 2) (table_id . 0) (span ((start . 1497) (end . 1527) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/templated.transact\"))))"} (s2_key == s2_key);
    TEMPLATED_TABLE_T_STRING_VAL := TEMPLATED_TABLE_T_STRING_VAL[s2_key := s2_r#T_STRING_VAL];
  // Partition check hop 2 func 'f' tables 'TEMPLATED_TABLE'=>'TEMPLATED_TABLE' keys [k0=key] first_span Span { start: 1424, end: 1450, filename: "/Users/farzad/Desktop/Research/benchbase-transact/templated.transact" } current_span Span { start: 1497, end: 1527, filename: "/Users/farzad/Desktop/Research/benchbase-transact/templated.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 17) (hop_id . 2) (table_id . 0) (span ((start . 1497) (end . 1527) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/templated.transact\"))))"} (s2_key == s2_key);
    goto s2_epilogue;
  s2_hop_exit:
  s2_epilogue:
}

