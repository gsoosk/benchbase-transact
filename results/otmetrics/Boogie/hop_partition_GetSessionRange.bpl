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
function get_source_id#17(arg0: Iterator (Table (observations))) returns (int);
function model_get_source_id#17(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (observations)) :: hasNext(iter) ==> get_source_id#17(iter) == model_get_source_id#17(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_session_id#18(arg0: Iterator (Table (observations))) returns (int);
function model_get_session_id#18(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (observations)) :: hasNext(iter) ==> get_session_id#18(iter) == model_get_session_id#18(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_created_time#19(arg0: Iterator (Table (observations))) returns (int);
function model_get_created_time#19(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (observations)) :: hasNext(iter) ==> get_created_time#19(iter) == model_get_created_time#19(iter_n(iter), iter_m(iter), iter_position(iter)));
type Table a;
type observations;
type Row a;
function construct_Row_observations(source_id: int, session_id: int, created_time: int, type_id: int): Row (Table observations);
axiom (forall
    source_id_1: int, session_id_1: int, created_time_1: int, type_id_1: int,
    source_id_2: int, session_id_2: int, created_time_2: int, type_id_2: int
    ::
    construct_Row_observations(source_id_1, session_id_1, created_time_1, type_id_1) == construct_Row_observations(source_id_2, session_id_2, created_time_2, type_id_2)
    <==>
    (source_id_1 == source_id_2 && session_id_1 == session_id_2 && created_time_1 == created_time_2 && type_id_1 == type_id_2)
);
const __shards__ : int;
const TBL_observations : Table (observations);
const __slice__ : int;
var observations_source_id : [int][int][int]int;
var observations_session_id : [int][int][int]int;
var observations_type_id : [int][int][int]int;
var observations_created_time : [int][int][int]int;
procedure verify_hop_partitions_GetSessionRange(source_id: int, session_low: int, session_high: int, type_id: int, created_time: int)
{
  var s1_obs#type_id : int;
  var s1_source_id : int;
  var s1_session_low : int;
  var s1_created_time : int;
  var s1_tid : int;
  var s1_#tmp1 : unit;

  // Hop partition verification for function 'GetSessionRange'
  s1_block1:
    s1_obs#type_id := observations_type_id[s1_source_id][s1_session_low][s1_created_time];
    s1_tid := s1_obs#type_id;
    s1_#tmp1 := to_unit(s1_tid);
    goto s1_epilogue;
  s1_hop_exit:
  s1_epilogue:
}

