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
const TBL_VOTES : Table (VOTES);
const __shards__ : int;
const TBL_CONTESTANTS : Table (CONTESTANTS);
const __slice__ : int;
var VOTES_phone_number : [int][int]int;
var VOTES_vote_id : [int][int]int;
var VOTES_state : [int][int]String;
var CONTESTANTS_contestant_name : [int]String;
var VOTES_contestant_number : [int][int]int;
var CONTESTANTS_contestant_number : [int]int;
var LOCATIONS_state : [int]String;
var LOCATIONS_area_code : [int]int;
const TBL_LOCATIONS : Table (LOCATIONS);
procedure verify_hop_partitions_Vote(voteId: int, phoneNumber: int, contestantNumber: int)
modifies VOTES_contestant_number, VOTES_state;
{
  var s4_#tmp1 : int;
  var s4_phoneNumber : int;
  var s4_area_code : int;
  var s4_loc#state : String;
  var s4_state : String;
  var s5_phoneNumber : int;
  var s5_voteId : int;
  var s5_state : String;
  var s5_contestantNumber : int;

  // Hop partition verification for function 'Vote'
  s3_block3:
    goto s3_hop_exit;
  s3_hop_exit:
  s4_block4:
    s4_#tmp1 := s4_phoneNumber / 10000000;
    s4_area_code := s4_#tmp1;
    s4_loc#state := LOCATIONS_state[s4_area_code];
    s4_state := s4_loc#state;
    goto s4_hop_exit;
  s4_hop_exit:
  s5_block5:
    VOTES_state := VOTES_state[s5_phoneNumber := VOTES_state[s5_phoneNumber][s5_voteId := s5_state]];
    VOTES_contestant_number := VOTES_contestant_number[s5_phoneNumber := VOTES_contestant_number[s5_phoneNumber][s5_voteId := s5_contestantNumber]];
  // Partition check hop 5 func 'p_phone' tables 'VOTES'=>'VOTES' keys [k0=phoneNumber] first_span Span { start: 3086, end: 3223, filename: "/Users/farzad/Desktop/Research/benchbase-transact/voter.transact" } current_span Span { start: 3086, end: 3223, filename: "/Users/farzad/Desktop/Research/benchbase-transact/voter.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 18) (hop_id . 5) (table_id . 2) (span ((start . 3086) (end . 3223) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/voter.transact\"))))"} (s5_phoneNumber == s5_phoneNumber);
    goto s5_epilogue;
  s5_hop_exit:
  s3_epilogue:
  s4_epilogue:
  s5_epilogue:
}

