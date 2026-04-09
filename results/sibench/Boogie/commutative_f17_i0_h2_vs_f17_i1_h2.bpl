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
var SITable_id : [int]int;
var SITable_value : [int]int;
procedure Check_SliceCommut_Hop2_vs_Hop2()
modifies SITable_id, SITable_value;
{
  var s0_id : int;
  var s1_id : int;
  var s0_active : bool;
  var s1_active : bool;
  var SITable_id_init : [int]int;
  var SITable_value_init : [int]int;
  var s0_id_init : int;
  var s1_id_init : int;
  var s0_row#id : int;
  var s0_row#value : int;
  var s0_#tmp2 : int;
  var s1_row#id : int;
  var s1_row#value : int;
  var s1_#tmp2 : int;
  var SITable_id_a_then_b : [int]int;
  var SITable_value_a_then_b : [int]int;
  var SITable_id_b_then_a : [int]int;
  var SITable_value_b_then_a : [int]int;

  // Slice commutativity verification: hop 2 vs hop 2
  // --- Step 1: Havoc initial state ---
    havoc SITable_id;
    havoc SITable_value;
    havoc s0_id;
    havoc s1_id;
    s0_active := true;
    s1_active := true;
  // --- Step 2: Save initial state ---
    SITable_id_init := SITable_id;
    SITable_value_init := SITable_value;
    s0_id_init := s0_id;
    s1_id_init := s1_id;
  // --- Step 3: Execute special interleavings ---
  // Executing A then B:
    if (s0_active) {
    s0_block2__ab:
      s0_row#id := SITable_id[s0_id];
      s0_row#value := SITable_value[s0_id];
      s0_#tmp2 := s0_row#value + 1;
      s0_row#value := s0_#tmp2;
      SITable_id := SITable_id[s0_id := s0_row#id];
      SITable_value := SITable_value[s0_id := s0_row#value];
      s0_active := false;
      goto s0_hop_exit__ab;
    s0_hop_exit__ab:
    }
    if (s1_active) {
    s1_block2__ab:
      s1_row#id := SITable_id[s1_id];
      s1_row#value := SITable_value[s1_id];
      s1_#tmp2 := s1_row#value + 1;
      s1_row#value := s1_#tmp2;
      SITable_id := SITable_id[s1_id := s1_row#id];
      SITable_value := SITable_value[s1_id := s1_row#value];
      s1_active := false;
      goto s1_hop_exit__ab;
    s1_hop_exit__ab:
    }
  // Snapshotting final state for a_then_b
    SITable_id_a_then_b := SITable_id;
    SITable_value_a_then_b := SITable_value;
  // Restoring initial state:
    SITable_id := SITable_id_init;
    SITable_value := SITable_value_init;
    s0_id := s0_id_init;
    s1_id := s1_id_init;
    s0_active := true;
    s1_active := true;
  // Executing B then A:
    if (s1_active) {
    s1_block2__ba:
      s1_row#id := SITable_id[s1_id];
      s1_row#value := SITable_value[s1_id];
      s1_#tmp2 := s1_row#value + 1;
      s1_row#value := s1_#tmp2;
      SITable_id := SITable_id[s1_id := s1_row#id];
      SITable_value := SITable_value[s1_id := s1_row#value];
      s1_active := false;
      goto s1_hop_exit__ba;
    s1_hop_exit__ba:
    }
    if (s0_active) {
    s0_block2__ba:
      s0_row#id := SITable_id[s0_id];
      s0_row#value := SITable_value[s0_id];
      s0_#tmp2 := s0_row#value + 1;
      s0_row#value := s0_#tmp2;
      SITable_id := SITable_id[s0_id := s0_row#id];
      SITable_value := SITable_value[s0_id := s0_row#value];
      s0_active := false;
      goto s0_hop_exit__ba;
    s0_hop_exit__ba:
    }
  // Snapshotting final state for b_then_a
    SITable_id_b_then_a := SITable_id;
    SITable_value_b_then_a := SITable_value;
  // --- Step 4: Verify A→B ≡ B→A (Special interleavings equivalence) ---
  // Verifying A->B === B->A equivalence:
    assert {:msg "(SpecialInterleavingNonEquivalence (node_1 (function_id . 17) (instance . 0) (hop_id . 2)) (node_2 (function_id . 17) (instance . 1) (hop_id . 2)))"} ((SITable_id_a_then_b == SITable_id_b_then_a) && (SITable_value_a_then_b == SITable_value_b_then_a));
}

