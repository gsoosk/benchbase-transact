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
function get_i_id#26(arg0: Iterator (Table (item))) returns (int);
function model_get_i_id#26(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (item)) :: hasNext(iter) ==> get_i_id#26(iter) == model_get_i_id#26(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_u_id#27(arg0: Iterator (Table (useracct))) returns (int);
function model_get_u_id#27(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (useracct)) :: hasNext(iter) ==> get_u_id#27(iter) == model_get_u_id#27(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_u_id#28(arg0: Iterator (Table (review))) returns (int);
function model_get_u_id#28(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (review)) :: hasNext(iter) ==> get_u_id#28(iter) == model_get_u_id#28(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_i_id#29(arg0: Iterator (Table (review))) returns (int);
function model_get_i_id#29(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (review)) :: hasNext(iter) ==> get_i_id#29(iter) == model_get_i_id#29(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_source_u_id#30(arg0: Iterator (Table (trust))) returns (int);
function model_get_source_u_id#30(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (trust)) :: hasNext(iter) ==> get_source_u_id#30(iter) == model_get_source_u_id#30(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_target_u_id#31(arg0: Iterator (Table (trust))) returns (int);
function model_get_target_u_id#31(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (trust)) :: hasNext(iter) ==> get_target_u_id#31(iter) == model_get_target_u_id#31(iter_n(iter), iter_m(iter), iter_position(iter)));
type Table a;
type item;
type useracct;
type review;
type trust;
type Row a;
function construct_Row_item(i_id: int, title: String): Row (Table item);
axiom (forall
    i_id_1: int, title_1: String,
    i_id_2: int, title_2: String
    ::
    construct_Row_item(i_id_1, title_1) == construct_Row_item(i_id_2, title_2)
    <==>
    (i_id_1 == i_id_2 && title_1 == title_2)
);
function construct_Row_useracct(u_id: int, name: String): Row (Table useracct);
axiom (forall
    u_id_1: int, name_1: String,
    u_id_2: int, name_2: String
    ::
    construct_Row_useracct(u_id_1, name_1) == construct_Row_useracct(u_id_2, name_2)
    <==>
    (u_id_1 == u_id_2 && name_1 == name_2)
);
function construct_Row_review(u_id: int, i_id: int, rating: int, creation_date: int): Row (Table review);
axiom (forall
    u_id_1: int, i_id_1: int, rating_1: int, creation_date_1: int,
    u_id_2: int, i_id_2: int, rating_2: int, creation_date_2: int
    ::
    construct_Row_review(u_id_1, i_id_1, rating_1, creation_date_1) == construct_Row_review(u_id_2, i_id_2, rating_2, creation_date_2)
    <==>
    (u_id_1 == u_id_2 && i_id_1 == i_id_2 && rating_1 == rating_2 && creation_date_1 == creation_date_2)
);
function construct_Row_trust(source_u_id: int, target_u_id: int, trust: int): Row (Table trust);
axiom (forall
    source_u_id_1: int, target_u_id_1: int, trust_1: int,
    source_u_id_2: int, target_u_id_2: int, trust_2: int
    ::
    construct_Row_trust(source_u_id_1, target_u_id_1, trust_1) == construct_Row_trust(source_u_id_2, target_u_id_2, trust_2)
    <==>
    (source_u_id_1 == source_u_id_2 && target_u_id_1 == target_u_id_2 && trust_1 == trust_2)
);
var review_rating : [int][int]int;
var trust_target_u_id : [int][int]int;
var item_title : [int]String;
const __shards__ : int;
const TBL_item : Table (item);
const TBL_trust : Table (trust);
var review_u_id : [int][int]int;
var review_creation_date : [int][int]int;
var trust_source_u_id : [int][int]int;
const __slice__ : int;
var useracct_u_id : [int]int;
var review_i_id : [int][int]int;
var useracct_name : [int]String;
const TBL_useracct : Table (useracct);
const TBL_review : Table (review);
var trust_trust : [int][int]int;
var item_i_id : [int]int;
procedure Check_SliceCommut_Hop12_vs_Hop12()
modifies trust_source_u_id, trust_target_u_id, trust_trust;
{
  var s0_source_uid : int;
  var s0_target_uid : int;
  var s0_trust_val : int;
  var s1_source_uid : int;
  var s1_target_uid : int;
  var s1_trust_val : int;
  var s0_active : bool;
  var s1_active : bool;
  var trust_source_u_id_init : [int][int]int;
  var trust_target_u_id_init : [int][int]int;
  var trust_trust_init : [int][int]int;
  var s0_source_uid_init : int;
  var s0_target_uid_init : int;
  var s0_trust_val_init : int;
  var s1_source_uid_init : int;
  var s1_target_uid_init : int;
  var s1_trust_val_init : int;
  var s0_t#source_u_id : int;
  var s0_t#target_u_id : int;
  var s0_t#trust : int;
  var s1_t#source_u_id : int;
  var s1_t#target_u_id : int;
  var s1_t#trust : int;
  var trust_source_u_id_a_then_b : [int][int]int;
  var trust_target_u_id_a_then_b : [int][int]int;
  var trust_trust_a_then_b : [int][int]int;
  var trust_source_u_id_b_then_a : [int][int]int;
  var trust_target_u_id_b_then_a : [int][int]int;
  var trust_trust_b_then_a : [int][int]int;

  // Slice commutativity verification: hop 12 vs hop 12
  // --- Step 1: Havoc initial state ---
    havoc trust_source_u_id;
    havoc trust_target_u_id;
    havoc trust_trust;
    havoc s0_source_uid;
    havoc s0_target_uid;
    havoc s0_trust_val;
    havoc s1_source_uid;
    havoc s1_target_uid;
    havoc s1_trust_val;
    s0_active := true;
    s1_active := true;
  // --- Step 2: Save initial state ---
    trust_source_u_id_init := trust_source_u_id;
    trust_target_u_id_init := trust_target_u_id;
    trust_trust_init := trust_trust;
    s0_source_uid_init := s0_source_uid;
    s0_target_uid_init := s0_target_uid;
    s0_trust_val_init := s0_trust_val;
    s1_source_uid_init := s1_source_uid;
    s1_target_uid_init := s1_target_uid;
    s1_trust_val_init := s1_trust_val;
  // --- Step 3: Execute special interleavings ---
  // Executing A then B:
    if (s0_active) {
    s0_block12__ab:
      s0_t#source_u_id := trust_source_u_id[s0_source_uid][s0_target_uid];
      s0_t#target_u_id := trust_target_u_id[s0_source_uid][s0_target_uid];
      s0_t#trust := s0_trust_val;
      trust_source_u_id := trust_source_u_id[s0_source_uid := trust_source_u_id[s0_source_uid][s0_target_uid := s0_t#source_u_id]];
      trust_target_u_id := trust_target_u_id[s0_source_uid := trust_target_u_id[s0_source_uid][s0_target_uid := s0_t#target_u_id]];
      trust_trust := trust_trust[s0_source_uid := trust_trust[s0_source_uid][s0_target_uid := s0_t#trust]];
      s0_active := false;
      goto s0_hop_exit__ab;
    s0_hop_exit__ab:
    }
    if (s1_active) {
    s1_block12__ab:
      s1_t#source_u_id := trust_source_u_id[s1_source_uid][s1_target_uid];
      s1_t#target_u_id := trust_target_u_id[s1_source_uid][s1_target_uid];
      s1_t#trust := s1_trust_val;
      trust_source_u_id := trust_source_u_id[s1_source_uid := trust_source_u_id[s1_source_uid][s1_target_uid := s1_t#source_u_id]];
      trust_target_u_id := trust_target_u_id[s1_source_uid := trust_target_u_id[s1_source_uid][s1_target_uid := s1_t#target_u_id]];
      trust_trust := trust_trust[s1_source_uid := trust_trust[s1_source_uid][s1_target_uid := s1_t#trust]];
      s1_active := false;
      goto s1_hop_exit__ab;
    s1_hop_exit__ab:
    }
  // Snapshotting final state for a_then_b
    trust_source_u_id_a_then_b := trust_source_u_id;
    trust_target_u_id_a_then_b := trust_target_u_id;
    trust_trust_a_then_b := trust_trust;
  // Restoring initial state:
    trust_source_u_id := trust_source_u_id_init;
    trust_target_u_id := trust_target_u_id_init;
    trust_trust := trust_trust_init;
    s0_source_uid := s0_source_uid_init;
    s0_target_uid := s0_target_uid_init;
    s0_trust_val := s0_trust_val_init;
    s1_source_uid := s1_source_uid_init;
    s1_target_uid := s1_target_uid_init;
    s1_trust_val := s1_trust_val_init;
    s0_active := true;
    s1_active := true;
  // Executing B then A:
    if (s1_active) {
    s1_block12__ba:
      s1_t#source_u_id := trust_source_u_id[s1_source_uid][s1_target_uid];
      s1_t#target_u_id := trust_target_u_id[s1_source_uid][s1_target_uid];
      s1_t#trust := s1_trust_val;
      trust_source_u_id := trust_source_u_id[s1_source_uid := trust_source_u_id[s1_source_uid][s1_target_uid := s1_t#source_u_id]];
      trust_target_u_id := trust_target_u_id[s1_source_uid := trust_target_u_id[s1_source_uid][s1_target_uid := s1_t#target_u_id]];
      trust_trust := trust_trust[s1_source_uid := trust_trust[s1_source_uid][s1_target_uid := s1_t#trust]];
      s1_active := false;
      goto s1_hop_exit__ba;
    s1_hop_exit__ba:
    }
    if (s0_active) {
    s0_block12__ba:
      s0_t#source_u_id := trust_source_u_id[s0_source_uid][s0_target_uid];
      s0_t#target_u_id := trust_target_u_id[s0_source_uid][s0_target_uid];
      s0_t#trust := s0_trust_val;
      trust_source_u_id := trust_source_u_id[s0_source_uid := trust_source_u_id[s0_source_uid][s0_target_uid := s0_t#source_u_id]];
      trust_target_u_id := trust_target_u_id[s0_source_uid := trust_target_u_id[s0_source_uid][s0_target_uid := s0_t#target_u_id]];
      trust_trust := trust_trust[s0_source_uid := trust_trust[s0_source_uid][s0_target_uid := s0_t#trust]];
      s0_active := false;
      goto s0_hop_exit__ba;
    s0_hop_exit__ba:
    }
  // Snapshotting final state for b_then_a
    trust_source_u_id_b_then_a := trust_source_u_id;
    trust_target_u_id_b_then_a := trust_target_u_id;
    trust_trust_b_then_a := trust_trust;
  // --- Step 4: Verify A→B ≡ B→A (Special interleavings equivalence) ---
  // Verifying A->B === B->A equivalence:
    assert {:msg "(SpecialInterleavingNonEquivalence (node_1 (function_id . 24) (instance . 0) (hop_id . 12)) (node_2 (function_id . 24) (instance . 1) (hop_id . 12)))"} (((trust_source_u_id_a_then_b == trust_source_u_id_b_then_a) && (trust_target_u_id_a_then_b == trust_target_u_id_b_then_a)) && (trust_trust_a_then_b == trust_trust_b_then_a));
}

