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
function get_contestant_number#19(arg0: Iterator (Table (CONTESTANTS))) returns (int);
function model_get_contestant_number#19(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (CONTESTANTS)) :: hasNext(iter) ==> get_contestant_number#19(iter) == model_get_contestant_number#19(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_area_code#20(arg0: Iterator (Table (LOCATIONS))) returns (int);
function model_get_area_code#20(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (LOCATIONS)) :: hasNext(iter) ==> get_area_code#20(iter) == model_get_area_code#20(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_phone_number#21(arg0: Iterator (Table (VOTES))) returns (int);
function model_get_phone_number#21(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (VOTES)) :: hasNext(iter) ==> get_phone_number#21(iter) == model_get_phone_number#21(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_vote_id#22(arg0: Iterator (Table (VOTES))) returns (int);
function model_get_vote_id#22(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (VOTES)) :: hasNext(iter) ==> get_vote_id#22(iter) == model_get_vote_id#22(iter_n(iter), iter_m(iter), iter_position(iter)));
type Table a;
type CONTESTANTS;
type LOCATIONS;
type VOTES;
type Row a;
function construct_Row_CONTESTANTS(contestant_number: int, contestant_name: String): Row (Table CONTESTANTS);
axiom (forall
    contestant_number_1: int, contestant_name_1: String,
    contestant_number_2: int, contestant_name_2: String
    ::
    construct_Row_CONTESTANTS(contestant_number_1, contestant_name_1) == construct_Row_CONTESTANTS(contestant_number_2, contestant_name_2)
    <==>
    (contestant_number_1 == contestant_number_2 && contestant_name_1 == contestant_name_2)
);
function construct_Row_LOCATIONS(area_code: int, state: String): Row (Table LOCATIONS);
axiom (forall
    area_code_1: int, state_1: String,
    area_code_2: int, state_2: String
    ::
    construct_Row_LOCATIONS(area_code_1, state_1) == construct_Row_LOCATIONS(area_code_2, state_2)
    <==>
    (area_code_1 == area_code_2 && state_1 == state_2)
);
function construct_Row_VOTES(phone_number: int, vote_id: int, state: String, contestant_number: int): Row (Table VOTES);
axiom (forall
    phone_number_1: int, vote_id_1: int, state_1: String, contestant_number_1: int,
    phone_number_2: int, vote_id_2: int, state_2: String, contestant_number_2: int
    ::
    construct_Row_VOTES(phone_number_1, vote_id_1, state_1, contestant_number_1) == construct_Row_VOTES(phone_number_2, vote_id_2, state_2, contestant_number_2)
    <==>
    (phone_number_1 == phone_number_2 && vote_id_1 == vote_id_2 && state_1 == state_2 && contestant_number_1 == contestant_number_2)
);
const __shards__ : int;
const __slice__ : int;
const TBL_CONTESTANTS : Table (CONTESTANTS);
var VOTES_contestant_number : [int][int]int;
var CONTESTANTS_contestant_number : [int]int;
var LOCATIONS_state : [int]String;
const TBL_VOTES : Table (VOTES);
var VOTES_state : [int][int]String;
var CONTESTANTS_contestant_name : [int]String;
var VOTES_phone_number : [int][int]int;
var VOTES_vote_id : [int][int]int;
const TBL_LOCATIONS : Table (LOCATIONS);
var LOCATIONS_area_code : [int]int;
procedure Check_SliceCommut_Hop5_vs_Hop5()
modifies VOTES_contestant_number, VOTES_state;
{
  var s0_voteId : int;
  var s0_phoneNumber : int;
  var s0_contestantNumber : int;
  var s0_state : String;
  var s1_voteId : int;
  var s1_phoneNumber : int;
  var s1_contestantNumber : int;
  var s1_state : String;
  var s0_active : bool;
  var s1_active : bool;
  var VOTES_contestant_number_init : [int][int]int;
  var VOTES_state_init : [int][int]String;
  var s0_voteId_init : int;
  var s0_phoneNumber_init : int;
  var s0_contestantNumber_init : int;
  var s0_state_init : String;
  var s1_voteId_init : int;
  var s1_phoneNumber_init : int;
  var s1_contestantNumber_init : int;
  var s1_state_init : String;
  var VOTES_contestant_number_a_then_b : [int][int]int;
  var VOTES_state_a_then_b : [int][int]String;
  var VOTES_contestant_number_b_then_a : [int][int]int;
  var VOTES_state_b_then_a : [int][int]String;

  // Slice commutativity verification: hop 5 vs hop 5
  // --- Step 1: Havoc initial state ---
    havoc VOTES_contestant_number;
    havoc VOTES_state;
    havoc s0_voteId;
    havoc s0_phoneNumber;
    havoc s0_contestantNumber;
    havoc s0_state;
    havoc s1_voteId;
    havoc s1_phoneNumber;
    havoc s1_contestantNumber;
    havoc s1_state;
    s0_active := true;
    s1_active := true;
  // --- Step 2: Save initial state ---
    VOTES_contestant_number_init := VOTES_contestant_number;
    VOTES_state_init := VOTES_state;
    s0_voteId_init := s0_voteId;
    s0_phoneNumber_init := s0_phoneNumber;
    s0_contestantNumber_init := s0_contestantNumber;
    s0_state_init := s0_state;
    s1_voteId_init := s1_voteId;
    s1_phoneNumber_init := s1_phoneNumber;
    s1_contestantNumber_init := s1_contestantNumber;
    s1_state_init := s1_state;
  // --- Step 3: Execute special interleavings ---
  // Executing A then B:
    if (s0_active) {
    s0_block5__ab:
      VOTES_state := VOTES_state[s0_phoneNumber := VOTES_state[s0_phoneNumber][s0_voteId := s0_state]];
      VOTES_contestant_number := VOTES_contestant_number[s0_phoneNumber := VOTES_contestant_number[s0_phoneNumber][s0_voteId := s0_contestantNumber]];
      s0_active := false;
      goto s0_hop_exit__ab;
    s0_hop_exit__ab:
    }
    if (s1_active) {
    s1_block5__ab:
      VOTES_state := VOTES_state[s1_phoneNumber := VOTES_state[s1_phoneNumber][s1_voteId := s1_state]];
      VOTES_contestant_number := VOTES_contestant_number[s1_phoneNumber := VOTES_contestant_number[s1_phoneNumber][s1_voteId := s1_contestantNumber]];
      s1_active := false;
      goto s1_hop_exit__ab;
    s1_hop_exit__ab:
    }
  // Snapshotting final state for a_then_b
    VOTES_contestant_number_a_then_b := VOTES_contestant_number;
    VOTES_state_a_then_b := VOTES_state;
  // Restoring initial state:
    VOTES_contestant_number := VOTES_contestant_number_init;
    VOTES_state := VOTES_state_init;
    s0_voteId := s0_voteId_init;
    s0_phoneNumber := s0_phoneNumber_init;
    s0_contestantNumber := s0_contestantNumber_init;
    s0_state := s0_state_init;
    s1_voteId := s1_voteId_init;
    s1_phoneNumber := s1_phoneNumber_init;
    s1_contestantNumber := s1_contestantNumber_init;
    s1_state := s1_state_init;
    s0_active := true;
    s1_active := true;
  // Executing B then A:
    if (s1_active) {
    s1_block5__ba:
      VOTES_state := VOTES_state[s1_phoneNumber := VOTES_state[s1_phoneNumber][s1_voteId := s1_state]];
      VOTES_contestant_number := VOTES_contestant_number[s1_phoneNumber := VOTES_contestant_number[s1_phoneNumber][s1_voteId := s1_contestantNumber]];
      s1_active := false;
      goto s1_hop_exit__ba;
    s1_hop_exit__ba:
    }
    if (s0_active) {
    s0_block5__ba:
      VOTES_state := VOTES_state[s0_phoneNumber := VOTES_state[s0_phoneNumber][s0_voteId := s0_state]];
      VOTES_contestant_number := VOTES_contestant_number[s0_phoneNumber := VOTES_contestant_number[s0_phoneNumber][s0_voteId := s0_contestantNumber]];
      s0_active := false;
      goto s0_hop_exit__ba;
    s0_hop_exit__ba:
    }
  // Snapshotting final state for b_then_a
    VOTES_contestant_number_b_then_a := VOTES_contestant_number;
    VOTES_state_b_then_a := VOTES_state;
  // --- Step 4: Verify A→B ≡ B→A (Special interleavings equivalence) ---
  // Verifying A->B === B->A equivalence:
    assert {:msg "(SpecialInterleavingNonEquivalence (node_1 (function_id . 18) (instance . 0) (hop_id . 5)) (node_2 (function_id . 18) (instance . 1) (hop_id . 5)))"} ((VOTES_contestant_number_a_then_b == VOTES_contestant_number_b_then_a) && (VOTES_state_a_then_b == VOTES_state_b_then_a));
}

