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
var iotable_data1 : [int]String;
var iotable_data2 : [int]String;
const TBL_cputable : Table (cputable);
const __shards__ : int;
var locktable_salary : [int]int;
const TBL_iotablesmallrow : Table (iotablesmallrow);
const TBL_locktable : Table (locktable);
const CPU_RANGE : int;
const TBL_iotable : Table (iotable);
var cputable_empid : [int]int;
var locktable_empid : [int]int;
var iotable_empid : [int]int;
var iotablesmallrow_flag1 : [int]int;
const __slice__ : int;
var iotablesmallrow_empid : [int]int;
var cputable_passwd : [int]String;
procedure verify_hop_partitions_IO1(leftKey: int, newData1: String, newData2: String)
modifies iotable_data1, iotable_data2, iotable_empid;
{
  var s205_r1#empid : int;
  var s205_leftKey : int;
  var s205_r1#data1 : String;
  var s205_newData1 : String;
  var s205_r1#data2 : String;
  var s205_newData2 : String;
  var s206_#tmp209 : int;
  var s206_leftKey : int;
  var s206_#tmp211 : int;
  var s206_#tmp212 : int;
  var s206_#tmp213 : int;
  var s206_r2#empid : int;
  var s206_r2#data1 : String;
  var s206_newData1 : String;
  var s206_r2#data2 : String;
  var s206_newData2 : String;
  var s206_#tmp214 : int;

  // Hop partition verification for function 'IO1'
  s205_block205:
    s205_r1#empid := iotable_empid[s205_leftKey];
    s205_r1#data1 := s205_newData1;
    s205_r1#data2 := s205_newData2;
    iotable_data1 := iotable_data1[s205_leftKey := s205_r1#data1];
  // Partition check hop 205 func 'f' tables 'iotable'=>'iotable' keys [k0=leftKey] first_span Span { start: 3666, end: 3689, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" } current_span Span { start: 3757, end: 3785, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 205) (table_id . 2) (span ((start . 3757) (end . 3785) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact\"))))"} (s205_leftKey == s205_leftKey);
    iotable_data2 := iotable_data2[s205_leftKey := s205_r1#data2];
  // Partition check hop 205 func 'f' tables 'iotable'=>'iotable' keys [k0=leftKey] first_span Span { start: 3666, end: 3689, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" } current_span Span { start: 3757, end: 3785, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 205) (table_id . 2) (span ((start . 3757) (end . 3785) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact\"))))"} (s205_leftKey == s205_leftKey);
    iotable_empid := iotable_empid[s205_leftKey := s205_r1#empid];
  // Partition check hop 205 func 'f' tables 'iotable'=>'iotable' keys [k0=leftKey] first_span Span { start: 3666, end: 3689, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" } current_span Span { start: 3757, end: 3785, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 205) (table_id . 2) (span ((start . 3757) (end . 3785) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact\"))))"} (s205_leftKey == s205_leftKey);
    goto s205_hop_exit;
  s205_hop_exit:
  s206_block206:
    s206_#tmp209 := s206_leftKey + 1;
    s206_#tmp211 := s206_#tmp209;
    s206_#tmp212 := s206_#tmp211;
    s206_#tmp213 := s206_#tmp212;
    s206_r2#empid := iotable_empid[s206_#tmp213];
    s206_r2#data1 := s206_newData1;
    s206_r2#data2 := s206_newData2;
    s206_#tmp214 := s206_#tmp213;
    iotable_data1 := iotable_data1[s206_#tmp214 := s206_r2#data1];
  // Partition check hop 206 func 'f' tables 'iotable'=>'iotable' keys [k0=#tmp213] first_span Span { start: 3834, end: 3861, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" } current_span Span { start: 3929, end: 3961, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 206) (table_id . 2) (span ((start . 3929) (end . 3961) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact\"))))"} (s206_#tmp213 == s206_#tmp214);
    iotable_data2 := iotable_data2[s206_#tmp214 := s206_r2#data2];
  // Partition check hop 206 func 'f' tables 'iotable'=>'iotable' keys [k0=#tmp213] first_span Span { start: 3834, end: 3861, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" } current_span Span { start: 3929, end: 3961, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 206) (table_id . 2) (span ((start . 3929) (end . 3961) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact\"))))"} (s206_#tmp213 == s206_#tmp214);
    iotable_empid := iotable_empid[s206_#tmp214 := s206_r2#empid];
  // Partition check hop 206 func 'f' tables 'iotable'=>'iotable' keys [k0=#tmp213] first_span Span { start: 3834, end: 3861, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" } current_span Span { start: 3929, end: 3961, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 206) (table_id . 2) (span ((start . 3929) (end . 3961) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact\"))))"} (s206_#tmp213 == s206_#tmp214);
    goto s206_epilogue;
  s206_hop_exit:
  s205_epilogue:
  s206_epilogue:
}

