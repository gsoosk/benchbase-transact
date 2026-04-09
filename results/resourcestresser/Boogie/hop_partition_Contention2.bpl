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
const TBL_iotablesmallrow : Table (iotablesmallrow);
var iotablesmallrow_flag1 : [int]int;
const TBL_locktable : Table (locktable);
var iotable_data1 : [int]String;
const TBL_iotable : Table (iotable);
var iotable_empid : [int]int;
var cputable_passwd : [int]String;
const __shards__ : int;
const TBL_cputable : Table (cputable);
var locktable_empid : [int]int;
var iotable_data2 : [int]String;
const CPU_RANGE : int;
var cputable_empid : [int]int;
const __slice__ : int;
var iotablesmallrow_empid : [int]int;
var locktable_salary : [int]int;
procedure verify_hop_partitions_Contention2(leftKey: int, newSalary: int)
modifies locktable_empid, locktable_salary;
{
  var s203_r1#empid : int;
  var s203_leftKey : int;
  var s203_r1#salary : int;
  var s203_newSalary : int;
  var s204_#tmp203 : int;
  var s204_leftKey : int;
  var s204_#tmp205 : int;
  var s204_r2#empid : int;
  var s204_#tmp206 : int;
  var s204_r2#salary : int;
  var s204_newSalary : int;
  var s204_#tmp207 : int;

  // Hop partition verification for function 'Contention2'
  s203_block203:
    s203_r1#empid := locktable_empid[s203_leftKey];
    s203_r1#salary := s203_newSalary;
    locktable_empid := locktable_empid[s203_leftKey := s203_r1#empid];
  // Partition check hop 203 func 'f' tables 'locktable'=>'locktable' keys [k0=leftKey] first_span Span { start: 3148, end: 3173, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" } current_span Span { start: 3214, end: 3244, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 203) (table_id . 1) (span ((start . 3214) (end . 3244) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact\"))))"} (s203_leftKey == s203_leftKey);
    locktable_salary := locktable_salary[s203_leftKey := s203_r1#salary];
  // Partition check hop 203 func 'f' tables 'locktable'=>'locktable' keys [k0=leftKey] first_span Span { start: 3148, end: 3173, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" } current_span Span { start: 3214, end: 3244, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 203) (table_id . 1) (span ((start . 3214) (end . 3244) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact\"))))"} (s203_leftKey == s203_leftKey);
    goto s203_hop_exit;
  s203_hop_exit:
  s204_block204:
    s204_#tmp203 := s204_leftKey + 1;
    s204_#tmp205 := s204_#tmp203;
    s204_r2#empid := locktable_empid[s204_#tmp205];
    s204_#tmp206 := s204_#tmp205;
    s204_r2#salary := s204_newSalary;
    s204_#tmp207 := s204_#tmp206;
    locktable_empid := locktable_empid[s204_#tmp207 := s204_r2#empid];
  // Partition check hop 204 func 'f' tables 'locktable'=>'locktable' keys [k0=#tmp205] first_span Span { start: 3295, end: 3324, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" } current_span Span { start: 3365, end: 3399, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 204) (table_id . 1) (span ((start . 3365) (end . 3399) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact\"))))"} (s204_#tmp205 == s204_#tmp207);
    locktable_salary := locktable_salary[s204_#tmp207 := s204_r2#salary];
  // Partition check hop 204 func 'f' tables 'locktable'=>'locktable' keys [k0=#tmp205] first_span Span { start: 3295, end: 3324, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" } current_span Span { start: 3365, end: 3399, filename: "/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 19) (hop_id . 204) (table_id . 1) (span ((start . 3365) (end . 3399) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/resourcestresser.transact\"))))"} (s204_#tmp205 == s204_#tmp207);
    goto s204_epilogue;
  s204_hop_exit:
  s203_epilogue:
  s204_epilogue:
}

