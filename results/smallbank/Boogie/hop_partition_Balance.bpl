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
const TBL_Savings : Table (Savings);
var Accounts_name : [int]String;
const TBL_Accounts : Table (Accounts);
const __shards__ : int;
var Savings_custid : [int]int;
const TBL_Checking : Table (Checking);
var Savings_bal : [int]real;
const __slice__ : int;
var Accounts_custid : [int]int;
var Checking_custid : [int]int;
var Checking_bal : [int]real;
procedure verify_hop_partitions_Balance(custId: int)
{
  var s3_#tmp5 : Row (Table (Accounts));
  var s3_custId : int;
  var s3_a : Row (Table (Accounts));
  var s3_#tmp6 : unit;
  var s3_s#bal : real;
  var s3_c#bal : real;
  var s3_#tmp9 : real;
  var s3_total : real;
  var s3_#tmp10 : unit;

  // Hop partition verification for function 'Balance'
  s3_block3:
    s3_#tmp5 := construct_Row_Accounts(Accounts_custid[s3_custId], Accounts_name[s3_custId]);
    s3_a := s3_#tmp5;
    s3_#tmp6 := to_unit(s3_a);
    s3_s#bal := Savings_bal[s3_custId];
  // Partition check hop 3 func 'f' tables 'Accounts'=>'Savings' keys [k0=custId] first_span Span { start: 1624, end: 1648, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" } current_span Span { start: 1700, end: 1723, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 17) (hop_id . 3) (table_id . 1) (span ((start . 1700) (end . 1723) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact\"))))"} (s3_custId == s3_custId);
    s3_c#bal := Checking_bal[s3_custId];
  // Partition check hop 3 func 'f' tables 'Accounts'=>'Checking' keys [k0=custId] first_span Span { start: 1624, end: 1648, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" } current_span Span { start: 1756, end: 1780, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 17) (hop_id . 3) (table_id . 2) (span ((start . 1756) (end . 1780) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact\"))))"} (s3_custId == s3_custId);
    s3_#tmp9 := s3_s#bal + s3_c#bal;
    s3_total := s3_#tmp9;
    s3_#tmp10 := to_unit(s3_total);
    goto s3_epilogue;
  s3_hop_exit:
  s3_epilogue:
}

