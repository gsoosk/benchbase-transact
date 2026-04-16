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
function get_ycsb_key#22(arg0: Iterator (Table (UserTable))) returns (int);
function model_get_ycsb_key#22(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (UserTable)) :: hasNext(iter) ==> get_ycsb_key#22(iter) == model_get_ycsb_key#22(iter_n(iter), iter_m(iter), iter_position(iter)));
type Table a;
type UserTable;
type Row a;
function construct_Row_UserTable(ycsb_key: int, field1: String, field2: String, field3: String, field4: String, field5: String, field6: String, field7: String, field8: String, field9: String, field10: String): Row (Table UserTable);
axiom (forall
    ycsb_key_1: int, field1_1: String, field2_1: String, field3_1: String, field4_1: String, field5_1: String, field6_1: String, field7_1: String, field8_1: String, field9_1: String, field10_1: String,
    ycsb_key_2: int, field1_2: String, field2_2: String, field3_2: String, field4_2: String, field5_2: String, field6_2: String, field7_2: String, field8_2: String, field9_2: String, field10_2: String
    ::
    construct_Row_UserTable(ycsb_key_1, field1_1, field2_1, field3_1, field4_1, field5_1, field6_1, field7_1, field8_1, field9_1, field10_1) == construct_Row_UserTable(ycsb_key_2, field1_2, field2_2, field3_2, field4_2, field5_2, field6_2, field7_2, field8_2, field9_2, field10_2)
    <==>
    (ycsb_key_1 == ycsb_key_2 && field1_1 == field1_2 && field2_1 == field2_2 && field3_1 == field3_2 && field4_1 == field4_2 && field5_1 == field5_2 && field6_1 == field6_2 && field7_1 == field7_2 && field8_1 == field8_2 && field9_1 == field9_2 && field10_1 == field10_2)
);
var UserTable_field8 : [int]String;
var UserTable_ycsb_key : [int]int;
const __shards__ : int;
var UserTable_field2 : [int]String;
var UserTable_field1 : [int]String;
var UserTable_field7 : [int]String;
var UserTable_field9 : [int]String;
const YCSB_SCAN_SIZE : int;
var UserTable_field5 : [int]String;
var UserTable_field4 : [int]String;
var UserTable_field10 : [int]String;
const TBL_UserTable : Table (UserTable);
var UserTable_field6 : [int]String;
const __slice__ : int;
var UserTable_field3 : [int]String;
procedure verify_hop_partitions_ScanRecord(startKey: int)
{
  var s5_#tmp4 : int;
  var s5_startKey : int;
  var s5_#tmp5 : Row (Table (UserTable));
  var s5_r : Row (Table (UserTable));
  var s5_#tmp17 : unit;
  var s6_#tmp18 : int;
  var s6_startKey : int;
  var s6_#tmp19 : Row (Table (UserTable));
  var s6_r : Row (Table (UserTable));
  var s6_#tmp31 : unit;
  var s7_#tmp32 : int;
  var s7_startKey : int;
  var s7_#tmp33 : Row (Table (UserTable));
  var s7_r : Row (Table (UserTable));
  var s7_#tmp45 : unit;
  var s8_#tmp46 : int;
  var s8_startKey : int;
  var s8_#tmp47 : Row (Table (UserTable));
  var s8_r : Row (Table (UserTable));
  var s8_#tmp59 : unit;
  var s9_#tmp60 : int;
  var s9_startKey : int;
  var s9_#tmp61 : Row (Table (UserTable));
  var s9_r : Row (Table (UserTable));
  var s9_#tmp73 : unit;
  var s10_#tmp74 : int;
  var s10_startKey : int;
  var s10_#tmp75 : Row (Table (UserTable));
  var s10_r : Row (Table (UserTable));
  var s10_#tmp87 : unit;
  var s11_#tmp88 : int;
  var s11_startKey : int;
  var s11_#tmp89 : Row (Table (UserTable));
  var s11_r : Row (Table (UserTable));
  var s11_#tmp101 : unit;
  var s12_#tmp102 : int;
  var s12_startKey : int;
  var s12_#tmp103 : Row (Table (UserTable));
  var s12_r : Row (Table (UserTable));
  var s12_#tmp115 : unit;
  var s13_#tmp116 : int;
  var s13_startKey : int;
  var s13_#tmp117 : Row (Table (UserTable));
  var s13_r : Row (Table (UserTable));
  var s13_#tmp129 : unit;
  var s14_#tmp130 : int;
  var s14_startKey : int;
  var s14_#tmp131 : Row (Table (UserTable));
  var s14_r : Row (Table (UserTable));
  var s14_#tmp143 : unit;

  // Hop partition verification for function 'ScanRecord'
  s5_block5:
    s5_#tmp4 := s5_startKey + 0;
    s5_#tmp5 := construct_Row_UserTable(UserTable_ycsb_key[s5_#tmp4], UserTable_field1[s5_#tmp4], UserTable_field2[s5_#tmp4], UserTable_field3[s5_#tmp4], UserTable_field4[s5_#tmp4], UserTable_field5[s5_#tmp4], UserTable_field6[s5_#tmp4], UserTable_field7[s5_#tmp4], UserTable_field8[s5_#tmp4], UserTable_field9[s5_#tmp4], UserTable_field10[s5_#tmp4]);
    s5_r := s5_#tmp5;
    s5_#tmp17 := to_unit(s5_r);
    goto s5_hop_exit;
  s5_hop_exit:
  s6_block6:
    s6_#tmp18 := s6_startKey + 1;
    s6_#tmp19 := construct_Row_UserTable(UserTable_ycsb_key[s6_#tmp18], UserTable_field1[s6_#tmp18], UserTable_field2[s6_#tmp18], UserTable_field3[s6_#tmp18], UserTable_field4[s6_#tmp18], UserTable_field5[s6_#tmp18], UserTable_field6[s6_#tmp18], UserTable_field7[s6_#tmp18], UserTable_field8[s6_#tmp18], UserTable_field9[s6_#tmp18], UserTable_field10[s6_#tmp18]);
    s6_r := s6_#tmp19;
    s6_#tmp31 := to_unit(s6_r);
    goto s6_hop_exit;
  s6_hop_exit:
  s7_block7:
    s7_#tmp32 := s7_startKey + 2;
    s7_#tmp33 := construct_Row_UserTable(UserTable_ycsb_key[s7_#tmp32], UserTable_field1[s7_#tmp32], UserTable_field2[s7_#tmp32], UserTable_field3[s7_#tmp32], UserTable_field4[s7_#tmp32], UserTable_field5[s7_#tmp32], UserTable_field6[s7_#tmp32], UserTable_field7[s7_#tmp32], UserTable_field8[s7_#tmp32], UserTable_field9[s7_#tmp32], UserTable_field10[s7_#tmp32]);
    s7_r := s7_#tmp33;
    s7_#tmp45 := to_unit(s7_r);
    goto s7_hop_exit;
  s7_hop_exit:
  s8_block8:
    s8_#tmp46 := s8_startKey + 3;
    s8_#tmp47 := construct_Row_UserTable(UserTable_ycsb_key[s8_#tmp46], UserTable_field1[s8_#tmp46], UserTable_field2[s8_#tmp46], UserTable_field3[s8_#tmp46], UserTable_field4[s8_#tmp46], UserTable_field5[s8_#tmp46], UserTable_field6[s8_#tmp46], UserTable_field7[s8_#tmp46], UserTable_field8[s8_#tmp46], UserTable_field9[s8_#tmp46], UserTable_field10[s8_#tmp46]);
    s8_r := s8_#tmp47;
    s8_#tmp59 := to_unit(s8_r);
    goto s8_hop_exit;
  s8_hop_exit:
  s9_block9:
    s9_#tmp60 := s9_startKey + 4;
    s9_#tmp61 := construct_Row_UserTable(UserTable_ycsb_key[s9_#tmp60], UserTable_field1[s9_#tmp60], UserTable_field2[s9_#tmp60], UserTable_field3[s9_#tmp60], UserTable_field4[s9_#tmp60], UserTable_field5[s9_#tmp60], UserTable_field6[s9_#tmp60], UserTable_field7[s9_#tmp60], UserTable_field8[s9_#tmp60], UserTable_field9[s9_#tmp60], UserTable_field10[s9_#tmp60]);
    s9_r := s9_#tmp61;
    s9_#tmp73 := to_unit(s9_r);
    goto s9_hop_exit;
  s9_hop_exit:
  s10_block10:
    s10_#tmp74 := s10_startKey + 5;
    s10_#tmp75 := construct_Row_UserTable(UserTable_ycsb_key[s10_#tmp74], UserTable_field1[s10_#tmp74], UserTable_field2[s10_#tmp74], UserTable_field3[s10_#tmp74], UserTable_field4[s10_#tmp74], UserTable_field5[s10_#tmp74], UserTable_field6[s10_#tmp74], UserTable_field7[s10_#tmp74], UserTable_field8[s10_#tmp74], UserTable_field9[s10_#tmp74], UserTable_field10[s10_#tmp74]);
    s10_r := s10_#tmp75;
    s10_#tmp87 := to_unit(s10_r);
    goto s10_hop_exit;
  s10_hop_exit:
  s11_block11:
    s11_#tmp88 := s11_startKey + 6;
    s11_#tmp89 := construct_Row_UserTable(UserTable_ycsb_key[s11_#tmp88], UserTable_field1[s11_#tmp88], UserTable_field2[s11_#tmp88], UserTable_field3[s11_#tmp88], UserTable_field4[s11_#tmp88], UserTable_field5[s11_#tmp88], UserTable_field6[s11_#tmp88], UserTable_field7[s11_#tmp88], UserTable_field8[s11_#tmp88], UserTable_field9[s11_#tmp88], UserTable_field10[s11_#tmp88]);
    s11_r := s11_#tmp89;
    s11_#tmp101 := to_unit(s11_r);
    goto s11_hop_exit;
  s11_hop_exit:
  s12_block12:
    s12_#tmp102 := s12_startKey + 7;
    s12_#tmp103 := construct_Row_UserTable(UserTable_ycsb_key[s12_#tmp102], UserTable_field1[s12_#tmp102], UserTable_field2[s12_#tmp102], UserTable_field3[s12_#tmp102], UserTable_field4[s12_#tmp102], UserTable_field5[s12_#tmp102], UserTable_field6[s12_#tmp102], UserTable_field7[s12_#tmp102], UserTable_field8[s12_#tmp102], UserTable_field9[s12_#tmp102], UserTable_field10[s12_#tmp102]);
    s12_r := s12_#tmp103;
    s12_#tmp115 := to_unit(s12_r);
    goto s12_hop_exit;
  s12_hop_exit:
  s13_block13:
    s13_#tmp116 := s13_startKey + 8;
    s13_#tmp117 := construct_Row_UserTable(UserTable_ycsb_key[s13_#tmp116], UserTable_field1[s13_#tmp116], UserTable_field2[s13_#tmp116], UserTable_field3[s13_#tmp116], UserTable_field4[s13_#tmp116], UserTable_field5[s13_#tmp116], UserTable_field6[s13_#tmp116], UserTable_field7[s13_#tmp116], UserTable_field8[s13_#tmp116], UserTable_field9[s13_#tmp116], UserTable_field10[s13_#tmp116]);
    s13_r := s13_#tmp117;
    s13_#tmp129 := to_unit(s13_r);
    goto s13_hop_exit;
  s13_hop_exit:
  s14_block14:
    s14_#tmp130 := s14_startKey + 9;
    s14_#tmp131 := construct_Row_UserTable(UserTable_ycsb_key[s14_#tmp130], UserTable_field1[s14_#tmp130], UserTable_field2[s14_#tmp130], UserTable_field3[s14_#tmp130], UserTable_field4[s14_#tmp130], UserTable_field5[s14_#tmp130], UserTable_field6[s14_#tmp130], UserTable_field7[s14_#tmp130], UserTable_field8[s14_#tmp130], UserTable_field9[s14_#tmp130], UserTable_field10[s14_#tmp130]);
    s14_r := s14_#tmp131;
    s14_#tmp143 := to_unit(s14_r);
    goto s14_epilogue;
  s14_hop_exit:
  s5_epilogue:
  s6_epilogue:
  s7_epilogue:
  s8_epilogue:
  s9_epilogue:
  s10_epilogue:
  s11_epilogue:
  s12_epilogue:
  s13_epilogue:
  s14_epilogue:
}

