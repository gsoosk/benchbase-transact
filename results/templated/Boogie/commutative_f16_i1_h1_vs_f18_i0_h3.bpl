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
var TEMPLATED_TABLE_T_STRING_VAL : [int]String;
const TBL_TEMPLATED_TABLE : Table (TEMPLATED_TABLE);
var TEMPLATED_TABLE_T_INT_VAL : [int]int;
const __shards__ : int;
const __slice__ : int;
procedure Check_SliceCommut_Hop1_vs_Hop3()
modifies TEMPLATED_TABLE_T_FLOAT_VAL, TEMPLATED_TABLE_T_INT_VAL, TEMPLATED_TABLE_T_STRING_VAL;
{
  var s0_key : int;
  var s1_key : int;
  var s1_int_val : int;
  var s1_float_val : real;
  var s1_string_val : String;
  var s0_active : bool;
  var s1_active : bool;
  var TEMPLATED_TABLE_T_FLOAT_VAL_init : [int]real;
  var TEMPLATED_TABLE_T_INT_VAL_init : [int]int;
  var TEMPLATED_TABLE_T_STRING_VAL_init : [int]String;
  var s0_key_init : int;
  var s1_key_init : int;
  var s1_int_val_init : int;
  var s1_float_val_init : real;
  var s1_string_val_init : String;
  var s0_#tmp1 : Row (Table (TEMPLATED_TABLE));
  var s0_r : Row (Table (TEMPLATED_TABLE));
  var s0_#tmp2 : unit;
  var TEMPLATED_TABLE_T_FLOAT_VAL_a_then_b : [int]real;
  var TEMPLATED_TABLE_T_INT_VAL_a_then_b : [int]int;
  var TEMPLATED_TABLE_T_STRING_VAL_a_then_b : [int]String;
  var TEMPLATED_TABLE_T_FLOAT_VAL_b_then_a : [int]real;
  var TEMPLATED_TABLE_T_INT_VAL_b_then_a : [int]int;
  var TEMPLATED_TABLE_T_STRING_VAL_b_then_a : [int]String;

  // Slice commutativity verification: hop 1 vs hop 3
  // --- Step 1: Havoc initial state ---
    havoc TEMPLATED_TABLE_T_FLOAT_VAL;
    havoc TEMPLATED_TABLE_T_INT_VAL;
    havoc TEMPLATED_TABLE_T_STRING_VAL;
    havoc s0_key;
    havoc s1_key;
    havoc s1_int_val;
    havoc s1_float_val;
    havoc s1_string_val;
    s0_active := true;
    s1_active := true;
  // --- Step 2: Save initial state ---
    TEMPLATED_TABLE_T_FLOAT_VAL_init := TEMPLATED_TABLE_T_FLOAT_VAL;
    TEMPLATED_TABLE_T_INT_VAL_init := TEMPLATED_TABLE_T_INT_VAL;
    TEMPLATED_TABLE_T_STRING_VAL_init := TEMPLATED_TABLE_T_STRING_VAL;
    s0_key_init := s0_key;
    s1_key_init := s1_key;
    s1_int_val_init := s1_int_val;
    s1_float_val_init := s1_float_val;
    s1_string_val_init := s1_string_val;
  // --- Step 3: Execute special interleavings ---
  // Executing A then B:
    if (s0_active) {
    s0_block1__ab:
      s0_#tmp1 := construct_Row_TEMPLATED_TABLE(TEMPLATED_TABLE_T_ID[s0_key], TEMPLATED_TABLE_T_INT_VAL[s0_key], TEMPLATED_TABLE_T_FLOAT_VAL[s0_key], TEMPLATED_TABLE_T_STRING_VAL[s0_key]);
      s0_r := s0_#tmp1;
      s0_#tmp2 := to_unit(s0_r);
      s0_active := false;
      goto s0_hop_exit__ab;
    s0_hop_exit__ab:
    }
    if (s1_active) {
    s1_block3__ab:
      TEMPLATED_TABLE_T_INT_VAL := TEMPLATED_TABLE_T_INT_VAL[s1_key := s1_int_val];
      TEMPLATED_TABLE_T_FLOAT_VAL := TEMPLATED_TABLE_T_FLOAT_VAL[s1_key := s1_float_val];
      TEMPLATED_TABLE_T_STRING_VAL := TEMPLATED_TABLE_T_STRING_VAL[s1_key := s1_string_val];
      s1_active := false;
      goto s1_hop_exit__ab;
    s1_hop_exit__ab:
    }
  // Snapshotting final state for a_then_b
    TEMPLATED_TABLE_T_FLOAT_VAL_a_then_b := TEMPLATED_TABLE_T_FLOAT_VAL;
    TEMPLATED_TABLE_T_INT_VAL_a_then_b := TEMPLATED_TABLE_T_INT_VAL;
    TEMPLATED_TABLE_T_STRING_VAL_a_then_b := TEMPLATED_TABLE_T_STRING_VAL;
  // Restoring initial state:
    TEMPLATED_TABLE_T_FLOAT_VAL := TEMPLATED_TABLE_T_FLOAT_VAL_init;
    TEMPLATED_TABLE_T_INT_VAL := TEMPLATED_TABLE_T_INT_VAL_init;
    TEMPLATED_TABLE_T_STRING_VAL := TEMPLATED_TABLE_T_STRING_VAL_init;
    s0_key := s0_key_init;
    s1_key := s1_key_init;
    s1_int_val := s1_int_val_init;
    s1_float_val := s1_float_val_init;
    s1_string_val := s1_string_val_init;
    s0_active := true;
    s1_active := true;
  // Executing B then A:
    if (s1_active) {
    s1_block3__ba:
      TEMPLATED_TABLE_T_INT_VAL := TEMPLATED_TABLE_T_INT_VAL[s1_key := s1_int_val];
      TEMPLATED_TABLE_T_FLOAT_VAL := TEMPLATED_TABLE_T_FLOAT_VAL[s1_key := s1_float_val];
      TEMPLATED_TABLE_T_STRING_VAL := TEMPLATED_TABLE_T_STRING_VAL[s1_key := s1_string_val];
      s1_active := false;
      goto s1_hop_exit__ba;
    s1_hop_exit__ba:
    }
    if (s0_active) {
    s0_block1__ba:
      s0_#tmp1 := construct_Row_TEMPLATED_TABLE(TEMPLATED_TABLE_T_ID[s0_key], TEMPLATED_TABLE_T_INT_VAL[s0_key], TEMPLATED_TABLE_T_FLOAT_VAL[s0_key], TEMPLATED_TABLE_T_STRING_VAL[s0_key]);
      s0_r := s0_#tmp1;
      s0_#tmp2 := to_unit(s0_r);
      s0_active := false;
      goto s0_hop_exit__ba;
    s0_hop_exit__ba:
    }
  // Snapshotting final state for b_then_a
    TEMPLATED_TABLE_T_FLOAT_VAL_b_then_a := TEMPLATED_TABLE_T_FLOAT_VAL;
    TEMPLATED_TABLE_T_INT_VAL_b_then_a := TEMPLATED_TABLE_T_INT_VAL;
    TEMPLATED_TABLE_T_STRING_VAL_b_then_a := TEMPLATED_TABLE_T_STRING_VAL;
  // --- Step 4: Verify A→B ≡ B→A (Special interleavings equivalence) ---
  // Verifying A->B === B->A equivalence:
    assert {:msg "(SpecialInterleavingNonEquivalence (node_1 (function_id . 16) (instance . 1) (hop_id . 1)) (node_2 (function_id . 18) (instance . 0) (hop_id . 3)))"} (((TEMPLATED_TABLE_T_FLOAT_VAL_a_then_b == TEMPLATED_TABLE_T_FLOAT_VAL_b_then_a) && (TEMPLATED_TABLE_T_INT_VAL_a_then_b == TEMPLATED_TABLE_T_INT_VAL_b_then_a)) && (TEMPLATED_TABLE_T_STRING_VAL_a_then_b == TEMPLATED_TABLE_T_STRING_VAL_b_then_a));
}

