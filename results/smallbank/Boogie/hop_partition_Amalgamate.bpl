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
var Accounts_custid : [int]int;
var Accounts_name : [int]String;
var Checking_bal : [int]real;
const __shards__ : int;
var Savings_bal : [int]real;
var Savings_custid : [int]int;
const TBL_Accounts : Table (Accounts);
const __slice__ : int;
const TBL_Checking : Table (Checking);
var Checking_custid : [int]int;
procedure verify_hop_partitions_Amalgamate(custId0: int, custId1: int)
modifies Checking_bal, Checking_custid, Savings_bal, Savings_custid;
{
  var s1_s0#bal : real;
  var s1_custId0 : int;
  var s1_s0#custid : int;
  var s1_c0#bal : real;
  var s1_c0#custid : int;
  var s1_#tmp2 : real;
  var s1_total : real;
  var s2_c1#bal : real;
  var s2_custId1 : int;
  var s2_c1#custid : int;
  var s2_#tmp4 : real;
  var s2_total : real;

  // Hop partition verification for function 'Amalgamate'
  s1_block1:
    s1_s0#bal := Savings_bal[s1_custId0];
    s1_s0#custid := Savings_custid[s1_custId0];
  // Partition check hop 1 func 'f' tables 'Savings'=>'Savings' keys [k0=custId0] first_span Span { start: 1003, end: 1027, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" } current_span Span { start: 1003, end: 1027, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 16) (hop_id . 1) (table_id . 1) (span ((start . 1003) (end . 1027) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact\"))))"} (s1_custId0 == s1_custId0);
    s1_c0#bal := Checking_bal[s1_custId0];
  // Partition check hop 1 func 'f' tables 'Savings'=>'Checking' keys [k0=custId0] first_span Span { start: 1003, end: 1027, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" } current_span Span { start: 1061, end: 1086, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 16) (hop_id . 1) (table_id . 2) (span ((start . 1061) (end . 1086) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact\"))))"} (s1_custId0 == s1_custId0);
    s1_c0#custid := Checking_custid[s1_custId0];
  // Partition check hop 1 func 'f' tables 'Savings'=>'Checking' keys [k0=custId0] first_span Span { start: 1003, end: 1027, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" } current_span Span { start: 1061, end: 1086, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 16) (hop_id . 1) (table_id . 2) (span ((start . 1061) (end . 1086) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact\"))))"} (s1_custId0 == s1_custId0);
    s1_#tmp2 := s1_s0#bal + s1_c0#bal;
    s1_total := s1_#tmp2;
    Savings_bal := Savings_bal[s1_custId0 := 0.0000000];
  // Partition check hop 1 func 'f' tables 'Savings'=>'Savings' keys [k0=custId0] first_span Span { start: 1003, end: 1027, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" } current_span Span { start: 1186, end: 1215, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 16) (hop_id . 1) (table_id . 1) (span ((start . 1186) (end . 1215) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact\"))))"} (s1_custId0 == s1_custId0);
    Savings_custid := Savings_custid[s1_custId0 := s1_s0#custid];
  // Partition check hop 1 func 'f' tables 'Savings'=>'Savings' keys [k0=custId0] first_span Span { start: 1003, end: 1027, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" } current_span Span { start: 1186, end: 1215, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 16) (hop_id . 1) (table_id . 1) (span ((start . 1186) (end . 1215) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact\"))))"} (s1_custId0 == s1_custId0);
    Checking_bal := Checking_bal[s1_custId0 := 0.0000000];
  // Partition check hop 1 func 'f' tables 'Savings'=>'Checking' keys [k0=custId0] first_span Span { start: 1003, end: 1027, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" } current_span Span { start: 1225, end: 1255, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 16) (hop_id . 1) (table_id . 2) (span ((start . 1225) (end . 1255) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact\"))))"} (s1_custId0 == s1_custId0);
    Checking_custid := Checking_custid[s1_custId0 := s1_c0#custid];
  // Partition check hop 1 func 'f' tables 'Savings'=>'Checking' keys [k0=custId0] first_span Span { start: 1003, end: 1027, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" } current_span Span { start: 1225, end: 1255, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 16) (hop_id . 1) (table_id . 2) (span ((start . 1225) (end . 1255) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact\"))))"} (s1_custId0 == s1_custId0);
    goto s1_hop_exit;
  s1_hop_exit:
  s2_block2:
    s2_c1#bal := Checking_bal[s2_custId1];
    s2_c1#custid := Checking_custid[s2_custId1];
  // Partition check hop 2 func 'f' tables 'Checking'=>'Checking' keys [k0=custId1] first_span Span { start: 1439, end: 1464, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" } current_span Span { start: 1439, end: 1464, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 16) (hop_id . 2) (table_id . 2) (span ((start . 1439) (end . 1464) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact\"))))"} (s2_custId1 == s2_custId1);
    s2_#tmp4 := s2_c1#bal + s2_total;
    s2_c1#bal := s2_#tmp4;
    Checking_bal := Checking_bal[s2_custId1 := s2_c1#bal];
  // Partition check hop 2 func 'f' tables 'Checking'=>'Checking' keys [k0=custId1] first_span Span { start: 1439, end: 1464, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" } current_span Span { start: 1507, end: 1537, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 16) (hop_id . 2) (table_id . 2) (span ((start . 1507) (end . 1537) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact\"))))"} (s2_custId1 == s2_custId1);
    Checking_custid := Checking_custid[s2_custId1 := s2_c1#custid];
  // Partition check hop 2 func 'f' tables 'Checking'=>'Checking' keys [k0=custId1] first_span Span { start: 1439, end: 1464, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" } current_span Span { start: 1507, end: 1537, filename: "/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 16) (hop_id . 2) (table_id . 2) (span ((start . 1507) (end . 1537) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/smallbank.transact\"))))"} (s2_custId1 == s2_custId1);
    goto s2_epilogue;
  s2_hop_exit:
  s1_epilogue:
  s2_epilogue:
}

