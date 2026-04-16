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
const __shards__ : int;
var Savings_custid : [int]int;
const TBL_Checking : Table (Checking);
var Checking_bal : [int]real;
var Accounts_custid : [int]int;
const TBL_Savings : Table (Savings);
var Accounts_name : [int]String;
const __slice__ : int;
const TBL_Accounts : Table (Accounts);
var Savings_bal : [int]real;
var Checking_custid : [int]int;
procedure verify_hop_partitions_WriteCheck(custId: int, amount: real)
modifies Checking_bal, Checking_custid;
{
  var s8_s#bal : real;
  var s8_custId : int;
  var s8_c#bal : real;
  var s8_c#custid : int;
  var s8_#tmp25 : real;
  var s8_total : real;
  var s8_#tmp26 : bool;
  var s8_amount : real;
  var s8_#tmp27 : real;
  var s8_#tmp28 : real;
  var s8_#tmp29 : real;

  // Hop partition verification for function 'WriteCheck'
  s8_block8:
    s8_s#bal := Savings_bal[s8_custId];
    s8_c#bal := Checking_bal[s8_custId];
  // Partition check hop 8 func 'f' tables 'Savings'=>'Checking' keys [k0=custId] first_span Span { start: 3019, end: 3042, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" } current_span Span { start: 3075, end: 3099, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 21) (hop_id . 8) (table_id . 2) (span ((start . 3075) (end . 3099) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact\"))))"} (s8_custId == s8_custId);
    s8_c#custid := Checking_custid[s8_custId];
  // Partition check hop 8 func 'f' tables 'Savings'=>'Checking' keys [k0=custId] first_span Span { start: 3019, end: 3042, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" } current_span Span { start: 3075, end: 3099, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 21) (hop_id . 8) (table_id . 2) (span ((start . 3075) (end . 3099) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact\"))))"} (s8_custId == s8_custId);
    s8_#tmp25 := s8_s#bal + s8_c#bal;
    s8_total := s8_#tmp25;
    s8_#tmp26 := s8_total < s8_amount;
    if (s8_#tmp26) {
      goto s8_block9;
    } else {
      goto s8_block11;
    }
  s8_block9:
    s8_#tmp27 := s8_c#bal - s8_amount;
    s8_#tmp28 := s8_#tmp27 - 1.0000000;
    s8_c#bal := s8_#tmp28;
    goto s8_block10;
  s8_block10:
    Checking_bal := Checking_bal[s8_custId := s8_c#bal];
  // Partition check hop 8 func 'f' tables 'Savings'=>'Checking' keys [k0=custId] first_span Span { start: 3019, end: 3042, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" } current_span Span { start: 3348, end: 3376, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 21) (hop_id . 8) (table_id . 2) (span ((start . 3348) (end . 3376) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact\"))))"} (s8_custId == s8_custId);
    Checking_custid := Checking_custid[s8_custId := s8_c#custid];
  // Partition check hop 8 func 'f' tables 'Savings'=>'Checking' keys [k0=custId] first_span Span { start: 3019, end: 3042, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" } current_span Span { start: 3348, end: 3376, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 21) (hop_id . 8) (table_id . 2) (span ((start . 3348) (end . 3376) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact\"))))"} (s8_custId == s8_custId);
    goto s8_epilogue;
  s8_block11:
    s8_#tmp29 := s8_c#bal - s8_amount;
    s8_c#bal := s8_#tmp29;
    goto s8_block10;
  s8_hop_exit:
  s8_epilogue:
}

