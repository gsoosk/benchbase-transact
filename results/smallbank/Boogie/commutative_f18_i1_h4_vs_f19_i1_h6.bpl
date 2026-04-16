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
function get_custid#22(arg0: Iterator (Table (Accounts))) returns (int);
function model_get_custid#22(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Accounts)) :: hasNext(iter) ==> get_custid#22(iter) == model_get_custid#22(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_custid#23(arg0: Iterator (Table (Savings))) returns (int);
function model_get_custid#23(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Savings)) :: hasNext(iter) ==> get_custid#23(iter) == model_get_custid#23(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_custid#24(arg0: Iterator (Table (Checking))) returns (int);
function model_get_custid#24(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Checking)) :: hasNext(iter) ==> get_custid#24(iter) == model_get_custid#24(iter_n(iter), iter_m(iter), iter_position(iter)));
type Table a;
type Accounts;
type Savings;
type Checking;
type Row a;
function construct_Row_Accounts(custid: int, name: String): Row (Table Accounts);
axiom (forall
    custid_1: int, name_1: String,
    custid_2: int, name_2: String
    ::
    construct_Row_Accounts(custid_1, name_1) == construct_Row_Accounts(custid_2, name_2)
    <==>
    (custid_1 == custid_2 && name_1 == name_2)
);
function construct_Row_Savings(custid: int, bal: real): Row (Table Savings);
axiom (forall
    custid_1: int, bal_1: real,
    custid_2: int, bal_2: real
    ::
    construct_Row_Savings(custid_1, bal_1) == construct_Row_Savings(custid_2, bal_2)
    <==>
    (custid_1 == custid_2 && bal_1 == bal_2)
);
function construct_Row_Checking(custid: int, bal: real): Row (Table Checking);
axiom (forall
    custid_1: int, bal_1: real,
    custid_2: int, bal_2: real
    ::
    construct_Row_Checking(custid_1, bal_1) == construct_Row_Checking(custid_2, bal_2)
    <==>
    (custid_1 == custid_2 && bal_1 == bal_2)
);
const __slice__ : int;
const TBL_Savings : Table (Savings);
var Savings_custid : [int]int;
const TBL_Accounts : Table (Accounts);
const TBL_Checking : Table (Checking);
var Accounts_custid : [int]int;
var Savings_bal : [int]real;
var Checking_custid : [int]int;
var Accounts_name : [int]String;
var Checking_bal : [int]real;
const __shards__ : int;
procedure Check_SliceCommut_Hop4_vs_Hop6()
modifies Accounts_name, Checking_bal, Checking_custid;
{
  var s0_custId : int;
  var s0_amount : real;
  var s1_destAcct : int;
  var s1_amount : real;
  var s0_active : bool;
  var s1_active : bool;
  var Accounts_name_init : [int]String;
  var Checking_bal_init : [int]real;
  var Checking_custid_init : [int]int;
  var s0_custId_init : int;
  var s0_amount_init : real;
  var s1_destAcct_init : int;
  var s1_amount_init : real;
  var s0_#tmp11 : Row (Table (Accounts));
  var s0_a : Row (Table (Accounts));
  var s0_#tmp12 : unit;
  var s0_c#bal : real;
  var s0_c#custid : int;
  var s0_#tmp14 : real;
  var s1_c1#bal : real;
  var s1_c1#custid : int;
  var s1_#tmp18 : real;
  var Checking_bal_a_then_b : [int]real;
  var Checking_custid_a_then_b : [int]int;
  var Checking_bal_b_then_a : [int]real;
  var Checking_custid_b_then_a : [int]int;

  // Slice commutativity verification: hop 4 vs hop 6
  // --- Step 1: Havoc initial state ---
    havoc Accounts_name;
    havoc Checking_bal;
    havoc Checking_custid;
    havoc s0_custId;
    havoc s0_amount;
    havoc s1_destAcct;
    havoc s1_amount;
    s0_active := true;
    s1_active := true;
  // --- Step 2: Save initial state ---
    Accounts_name_init := Accounts_name;
    Checking_bal_init := Checking_bal;
    Checking_custid_init := Checking_custid;
    s0_custId_init := s0_custId;
    s0_amount_init := s0_amount;
    s1_destAcct_init := s1_destAcct;
    s1_amount_init := s1_amount;
  // --- Step 3: Execute special interleavings ---
  // Executing A then B:
    if (s0_active) {
    s0_block4__ab:
      s0_#tmp11 := construct_Row_Accounts(Accounts_custid[s0_custId], Accounts_name[s0_custId]);
      s0_a := s0_#tmp11;
      s0_#tmp12 := to_unit(s0_a);
      s0_c#bal := Checking_bal[s0_custId];
      s0_c#custid := Checking_custid[s0_custId];
      s0_#tmp14 := s0_c#bal + s0_amount;
      s0_c#bal := s0_#tmp14;
      Checking_bal := Checking_bal[s0_custId := s0_c#bal];
      Checking_custid := Checking_custid[s0_custId := s0_c#custid];
      s0_active := false;
      goto s0_hop_exit__ab;
    s0_hop_exit__ab:
    }
    if (s1_active) {
    s1_block6__ab:
      s1_c1#bal := Checking_bal[s1_destAcct];
      s1_c1#custid := Checking_custid[s1_destAcct];
      s1_#tmp18 := s1_c1#bal + s1_amount;
      s1_c1#bal := s1_#tmp18;
      Checking_bal := Checking_bal[s1_destAcct := s1_c1#bal];
      Checking_custid := Checking_custid[s1_destAcct := s1_c1#custid];
      s1_active := false;
      goto s1_hop_exit__ab;
    s1_hop_exit__ab:
    }
  // Snapshotting final state for a_then_b
    Checking_bal_a_then_b := Checking_bal;
    Checking_custid_a_then_b := Checking_custid;
  // Restoring initial state:
    Accounts_name := Accounts_name_init;
    Checking_bal := Checking_bal_init;
    Checking_custid := Checking_custid_init;
    s0_custId := s0_custId_init;
    s0_amount := s0_amount_init;
    s1_destAcct := s1_destAcct_init;
    s1_amount := s1_amount_init;
    s0_active := true;
    s1_active := true;
  // Executing B then A:
    if (s1_active) {
    s1_block6__ba:
      s1_c1#bal := Checking_bal[s1_destAcct];
      s1_c1#custid := Checking_custid[s1_destAcct];
      s1_#tmp18 := s1_c1#bal + s1_amount;
      s1_c1#bal := s1_#tmp18;
      Checking_bal := Checking_bal[s1_destAcct := s1_c1#bal];
      Checking_custid := Checking_custid[s1_destAcct := s1_c1#custid];
      s1_active := false;
      goto s1_hop_exit__ba;
    s1_hop_exit__ba:
    }
    if (s0_active) {
    s0_block4__ba:
      s0_#tmp11 := construct_Row_Accounts(Accounts_custid[s0_custId], Accounts_name[s0_custId]);
      s0_a := s0_#tmp11;
      s0_#tmp12 := to_unit(s0_a);
      s0_c#bal := Checking_bal[s0_custId];
      s0_c#custid := Checking_custid[s0_custId];
      s0_#tmp14 := s0_c#bal + s0_amount;
      s0_c#bal := s0_#tmp14;
      Checking_bal := Checking_bal[s0_custId := s0_c#bal];
      Checking_custid := Checking_custid[s0_custId := s0_c#custid];
      s0_active := false;
      goto s0_hop_exit__ba;
    s0_hop_exit__ba:
    }
  // Snapshotting final state for b_then_a
    Checking_bal_b_then_a := Checking_bal;
    Checking_custid_b_then_a := Checking_custid;
  // --- Step 4: Verify A→B ≡ B→A (Special interleavings equivalence) ---
  // Verifying A->B === B->A equivalence:
    assert {:msg "(SpecialInterleavingNonEquivalence (node_1 (function_id . 18) (instance . 1) (hop_id . 4)) (node_2 (function_id . 19) (instance . 1) (hop_id . 6)))"} ((Checking_bal_a_then_b == Checking_bal_b_then_a) && (Checking_custid_a_then_b == Checking_custid_b_then_a));
}

