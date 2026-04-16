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
function get_id#18(arg0: Iterator (Table (SITable))) returns (int);
function model_get_id#18(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (SITable)) :: hasNext(iter) ==> get_id#18(iter) == model_get_id#18(iter_n(iter), iter_m(iter), iter_position(iter)));
type Table a;
type SITable;
type Row a;
function construct_Row_SITable(id: int, value: int): Row (Table SITable);
axiom (forall
    id_1: int, value_1: int,
    id_2: int, value_2: int
    ::
    construct_Row_SITable(id_1, value_1) == construct_Row_SITable(id_2, value_2)
    <==>
    (id_1 == id_2 && value_1 == value_2)
);
const TBL_SITable : Table (SITable);
const __slice__ : int;
const __shards__ : int;
var SITable_value : [int]int;
var SITable_id : [int]int;
procedure verify_hop_partitions_UpdateRecord(id: int)
modifies SITable_id, SITable_value;
{
  var s2_row#id : int;
  var s2_id : int;
  var s2_row#value : int;
  var s2_#tmp3 : int;

  // Hop partition verification for function 'UpdateRecord'
  s2_block2:
    s2_row#id := SITable_id[s2_id];
    s2_row#value := SITable_value[s2_id];
  // Partition check hop 2 func 'f' tables 'SITable'=>'SITable' keys [k0=id] first_span Span { start: 1629, end: 1644, filename: "/Users/farzad/Desktop/Research/benchbase-transact/sibench.transact" } current_span Span { start: 1629, end: 1644, filename: "/Users/farzad/Desktop/Research/benchbase-transact/sibench.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 17) (hop_id . 2) (table_id . 0) (span ((start . 1629) (end . 1644) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/sibench.transact\"))))"} (s2_id == s2_id);
    s2_#tmp3 := s2_row#value + 1;
    s2_row#value := s2_#tmp3;
    SITable_id := SITable_id[s2_id := s2_row#id];
  // Partition check hop 2 func 'f' tables 'SITable'=>'SITable' keys [k0=id] first_span Span { start: 1629, end: 1644, filename: "/Users/farzad/Desktop/Research/benchbase-transact/sibench.transact" } current_span Span { start: 1689, end: 1710, filename: "/Users/farzad/Desktop/Research/benchbase-transact/sibench.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 17) (hop_id . 2) (table_id . 0) (span ((start . 1689) (end . 1710) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/sibench.transact\"))))"} (s2_id == s2_id);
    SITable_value := SITable_value[s2_id := s2_row#value];
  // Partition check hop 2 func 'f' tables 'SITable'=>'SITable' keys [k0=id] first_span Span { start: 1629, end: 1644, filename: "/Users/farzad/Desktop/Research/benchbase-transact/sibench.transact" } current_span Span { start: 1689, end: 1710, filename: "/Users/farzad/Desktop/Research/benchbase-transact/sibench.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 17) (hop_id . 2) (table_id . 0) (span ((start . 1689) (end . 1710) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/sibench.transact\"))))"} (s2_id == s2_id);
    goto s2_epilogue;
  s2_hop_exit:
  s2_epilogue:
}

