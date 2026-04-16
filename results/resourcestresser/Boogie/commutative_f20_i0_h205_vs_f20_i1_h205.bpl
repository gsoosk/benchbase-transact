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
function get_empid#22(arg0: Iterator (Table (cputable))) returns (int);
function model_get_empid#22(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (cputable)) :: hasNext(iter) ==> get_empid#22(iter) == model_get_empid#22(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_empid#23(arg0: Iterator (Table (locktable))) returns (int);
function model_get_empid#23(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (locktable)) :: hasNext(iter) ==> get_empid#23(iter) == model_get_empid#23(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_empid#24(arg0: Iterator (Table (iotable))) returns (int);
function model_get_empid#24(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (iotable)) :: hasNext(iter) ==> get_empid#24(iter) == model_get_empid#24(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_empid#25(arg0: Iterator (Table (iotablesmallrow))) returns (int);
function model_get_empid#25(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (iotablesmallrow)) :: hasNext(iter) ==> get_empid#25(iter) == model_get_empid#25(iter_n(iter), iter_m(iter), iter_position(iter)));
type Table a;
type cputable;
type locktable;
type iotable;
type iotablesmallrow;
type Row a;
function construct_Row_cputable(empid: int, passwd: String): Row (Table cputable);
axiom (forall
    empid_1: int, passwd_1: String,
    empid_2: int, passwd_2: String
    ::
    construct_Row_cputable(empid_1, passwd_1) == construct_Row_cputable(empid_2, passwd_2)
    <==>
    (empid_1 == empid_2 && passwd_1 == passwd_2)
);
function construct_Row_locktable(empid: int, salary: int): Row (Table locktable);
axiom (forall
    empid_1: int, salary_1: int,
    empid_2: int, salary_2: int
    ::
    construct_Row_locktable(empid_1, salary_1) == construct_Row_locktable(empid_2, salary_2)
    <==>
    (empid_1 == empid_2 && salary_1 == salary_2)
);
function construct_Row_iotable(empid: int, data1: String, data2: String): Row (Table iotable);
axiom (forall
    empid_1: int, data1_1: String, data2_1: String,
    empid_2: int, data1_2: String, data2_2: String
    ::
    construct_Row_iotable(empid_1, data1_1, data2_1) == construct_Row_iotable(empid_2, data1_2, data2_2)
    <==>
    (empid_1 == empid_2 && data1_1 == data1_2 && data2_1 == data2_2)
);
function construct_Row_iotablesmallrow(empid: int, flag1: int): Row (Table iotablesmallrow);
axiom (forall
    empid_1: int, flag1_1: int,
    empid_2: int, flag1_2: int
    ::
    construct_Row_iotablesmallrow(empid_1, flag1_1) == construct_Row_iotablesmallrow(empid_2, flag1_2)
    <==>
    (empid_1 == empid_2 && flag1_1 == flag1_2)
);
const CPU_RANGE : int;
const TBL_cputable : Table (cputable);
const TBL_iotablesmallrow : Table (iotablesmallrow);
var iotable_empid : [int]int;
var iotable_data2 : [int]String;
var cputable_empid : [int]int;
const __slice__ : int;
const TBL_iotable : Table (iotable);
var iotablesmallrow_flag1 : [int]int;
var iotablesmallrow_empid : [int]int;
var iotable_data1 : [int]String;
const __shards__ : int;
const TBL_locktable : Table (locktable);
var cputable_passwd : [int]String;
var locktable_empid : [int]int;
var locktable_salary : [int]int;
procedure Check_SliceCommut_Hop205_vs_Hop205()
modifies iotable_data1, iotable_data2, iotable_empid;
{
  var s0_leftKey : int;
  var s0_newData1 : String;
  var s0_newData2 : String;
  var s1_leftKey : int;
  var s1_newData1 : String;
  var s1_newData2 : String;
  var s0_active : bool;
  var s1_active : bool;
  var iotable_data1_init : [int]String;
  var iotable_data2_init : [int]String;
  var iotable_empid_init : [int]int;
  var s0_leftKey_init : int;
  var s0_newData1_init : String;
  var s0_newData2_init : String;
  var s1_leftKey_init : int;
  var s1_newData1_init : String;
  var s1_newData2_init : String;
  var s0_r1#empid : int;
  var s0_r1#data1 : String;
  var s0_r1#data2 : String;
  var s1_r1#empid : int;
  var s1_r1#data1 : String;
  var s1_r1#data2 : String;
  var iotable_data1_a_then_b : [int]String;
  var iotable_data2_a_then_b : [int]String;
  var iotable_empid_a_then_b : [int]int;
  var s0_leftKey_a_then_b : int;
  var s0_newData1_a_then_b : String;
  var s0_newData2_a_then_b : String;
  var s1_leftKey_a_then_b : int;
  var s1_newData1_a_then_b : String;
  var s1_newData2_a_then_b : String;
  var iotable_data1_b_then_a : [int]String;
  var iotable_data2_b_then_a : [int]String;
  var iotable_empid_b_then_a : [int]int;
  var s0_leftKey_b_then_a : int;
  var s0_newData1_b_then_a : String;
  var s0_newData2_b_then_a : String;
  var s1_leftKey_b_then_a : int;
  var s1_newData1_b_then_a : String;
  var s1_newData2_b_then_a : String;

  // Slice commutativity verification: hop 205 vs hop 205
  // --- Step 1: Havoc initial state ---
    havoc iotable_data1;
    havoc iotable_data2;
    havoc iotable_empid;
    havoc s0_leftKey;
    havoc s0_newData1;
    havoc s0_newData2;
    havoc s1_leftKey;
    havoc s1_newData1;
    havoc s1_newData2;
    s0_active := true;
    s1_active := true;
  // --- Step 2: Save initial state ---
    iotable_data1_init := iotable_data1;
    iotable_data2_init := iotable_data2;
    iotable_empid_init := iotable_empid;
    s0_leftKey_init := s0_leftKey;
    s0_newData1_init := s0_newData1;
    s0_newData2_init := s0_newData2;
    s1_leftKey_init := s1_leftKey;
    s1_newData1_init := s1_newData1;
    s1_newData2_init := s1_newData2;
  // --- Step 3: Execute special interleavings ---
  // Executing A then B:
    if (s0_active) {
    s0_block205__ab:
      s0_r1#empid := iotable_empid[s0_leftKey];
      s0_r1#data1 := s0_newData1;
      s0_r1#data2 := s0_newData2;
      iotable_data1 := iotable_data1[s0_leftKey := s0_r1#data1];
      iotable_data2 := iotable_data2[s0_leftKey := s0_r1#data2];
      iotable_empid := iotable_empid[s0_leftKey := s0_r1#empid];
      goto s0_hop_exit__ab;
    s0_hop_exit__ab:
    }
    if (s1_active) {
    s1_block205__ab:
      s1_r1#empid := iotable_empid[s1_leftKey];
      s1_r1#data1 := s1_newData1;
      s1_r1#data2 := s1_newData2;
      iotable_data1 := iotable_data1[s1_leftKey := s1_r1#data1];
      iotable_data2 := iotable_data2[s1_leftKey := s1_r1#data2];
      iotable_empid := iotable_empid[s1_leftKey := s1_r1#empid];
      goto s1_hop_exit__ab;
    s1_hop_exit__ab:
    }
  // Snapshotting final state for a_then_b
    iotable_data1_a_then_b := iotable_data1;
    iotable_data2_a_then_b := iotable_data2;
    iotable_empid_a_then_b := iotable_empid;
    s0_leftKey_a_then_b := s0_leftKey;
    s0_newData1_a_then_b := s0_newData1;
    s0_newData2_a_then_b := s0_newData2;
    s1_leftKey_a_then_b := s1_leftKey;
    s1_newData1_a_then_b := s1_newData1;
    s1_newData2_a_then_b := s1_newData2;
  // Restoring initial state:
    iotable_data1 := iotable_data1_init;
    iotable_data2 := iotable_data2_init;
    iotable_empid := iotable_empid_init;
    s0_leftKey := s0_leftKey_init;
    s0_newData1 := s0_newData1_init;
    s0_newData2 := s0_newData2_init;
    s1_leftKey := s1_leftKey_init;
    s1_newData1 := s1_newData1_init;
    s1_newData2 := s1_newData2_init;
    s0_active := true;
    s1_active := true;
  // Executing B then A:
    if (s1_active) {
    s1_block205__ba:
      s1_r1#empid := iotable_empid[s1_leftKey];
      s1_r1#data1 := s1_newData1;
      s1_r1#data2 := s1_newData2;
      iotable_data1 := iotable_data1[s1_leftKey := s1_r1#data1];
      iotable_data2 := iotable_data2[s1_leftKey := s1_r1#data2];
      iotable_empid := iotable_empid[s1_leftKey := s1_r1#empid];
      goto s1_hop_exit__ba;
    s1_hop_exit__ba:
    }
    if (s0_active) {
    s0_block205__ba:
      s0_r1#empid := iotable_empid[s0_leftKey];
      s0_r1#data1 := s0_newData1;
      s0_r1#data2 := s0_newData2;
      iotable_data1 := iotable_data1[s0_leftKey := s0_r1#data1];
      iotable_data2 := iotable_data2[s0_leftKey := s0_r1#data2];
      iotable_empid := iotable_empid[s0_leftKey := s0_r1#empid];
      goto s0_hop_exit__ba;
    s0_hop_exit__ba:
    }
  // Snapshotting final state for b_then_a
    iotable_data1_b_then_a := iotable_data1;
    iotable_data2_b_then_a := iotable_data2;
    iotable_empid_b_then_a := iotable_empid;
    s0_leftKey_b_then_a := s0_leftKey;
    s0_newData1_b_then_a := s0_newData1;
    s0_newData2_b_then_a := s0_newData2;
    s1_leftKey_b_then_a := s1_leftKey;
    s1_newData1_b_then_a := s1_newData1;
    s1_newData2_b_then_a := s1_newData2;
  // --- Step 4: Verify A→B ≡ B→A (Special interleavings equivalence) ---
  // Verifying A->B === B->A equivalence:
    assert {:msg "(SpecialInterleavingNonEquivalence (node_1 (function_id . 20) (instance . 0) (hop_id . 205)) (node_2 (function_id . 20) (instance . 1) (hop_id . 205)))"} (((((((((iotable_data1_a_then_b == iotable_data1_b_then_a) && (iotable_data2_a_then_b == iotable_data2_b_then_a)) && (iotable_empid_a_then_b == iotable_empid_b_then_a)) && (s0_leftKey_a_then_b == s0_leftKey_b_then_a)) && (s0_newData1_a_then_b == s0_newData1_b_then_a)) && (s0_newData2_a_then_b == s0_newData2_b_then_a)) && (s1_leftKey_a_then_b == s1_leftKey_b_then_a)) && (s1_newData1_a_then_b == s1_newData1_b_then_a)) && (s1_newData2_a_then_b == s1_newData2_b_then_a));
}

