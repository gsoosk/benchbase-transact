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
const YCSB_SCAN_SIZE : int;
var UserTable_field4 : [int]String;
const __shards__ : int;
var UserTable_field6 : [int]String;
var UserTable_field10 : [int]String;
const __slice__ : int;
var UserTable_field2 : [int]String;
var UserTable_field8 : [int]String;
var UserTable_field7 : [int]String;
var UserTable_field9 : [int]String;
var UserTable_field5 : [int]String;
const TBL_UserTable : Table (UserTable);
var UserTable_field1 : [int]String;
var UserTable_ycsb_key : [int]int;
var UserTable_field3 : [int]String;
procedure Check_SliceCommut_Hop3_vs_Hop15()
modifies UserTable_field1, UserTable_field10, UserTable_field2, UserTable_field3, UserTable_field4, UserTable_field5, UserTable_field6, UserTable_field7, UserTable_field8, UserTable_field9, UserTable_ycsb_key;
{
  var s0_keyname : int;
  var s0_f1 : String;
  var s0_f2 : String;
  var s0_f3 : String;
  var s0_f4 : String;
  var s0_f5 : String;
  var s0_f6 : String;
  var s0_f7 : String;
  var s0_f8 : String;
  var s0_f9 : String;
  var s0_f10 : String;
  var s1_keyname : int;
  var s1_f2 : String;
  var s1_f3 : String;
  var s1_f4 : String;
  var s1_f5 : String;
  var s1_f6 : String;
  var s1_f7 : String;
  var s1_f8 : String;
  var s1_f9 : String;
  var s1_f10 : String;
  var s0_active : bool;
  var s1_active : bool;
  var UserTable_field1_init : [int]String;
  var UserTable_field10_init : [int]String;
  var UserTable_field2_init : [int]String;
  var UserTable_field3_init : [int]String;
  var UserTable_field4_init : [int]String;
  var UserTable_field5_init : [int]String;
  var UserTable_field6_init : [int]String;
  var UserTable_field7_init : [int]String;
  var UserTable_field8_init : [int]String;
  var UserTable_field9_init : [int]String;
  var UserTable_ycsb_key_init : [int]int;
  var s0_keyname_init : int;
  var s0_f1_init : String;
  var s0_f2_init : String;
  var s0_f3_init : String;
  var s0_f4_init : String;
  var s0_f5_init : String;
  var s0_f6_init : String;
  var s0_f7_init : String;
  var s0_f8_init : String;
  var s0_f9_init : String;
  var s0_f10_init : String;
  var s1_keyname_init : int;
  var s1_f2_init : String;
  var s1_f3_init : String;
  var s1_f4_init : String;
  var s1_f5_init : String;
  var s1_f6_init : String;
  var s1_f7_init : String;
  var s1_f8_init : String;
  var s1_f9_init : String;
  var s1_f10_init : String;
  var s1_r#field1 : String;
  var s1_r#ycsb_key : int;
  var s1_data : String;
  var s1_r#field2 : String;
  var s1_r#field3 : String;
  var s1_r#field4 : String;
  var s1_r#field5 : String;
  var s1_r#field6 : String;
  var s1_r#field7 : String;
  var s1_r#field8 : String;
  var s1_r#field9 : String;
  var s1_r#field10 : String;
  var UserTable_field1_a_then_b : [int]String;
  var UserTable_field10_a_then_b : [int]String;
  var UserTable_field2_a_then_b : [int]String;
  var UserTable_field3_a_then_b : [int]String;
  var UserTable_field4_a_then_b : [int]String;
  var UserTable_field5_a_then_b : [int]String;
  var UserTable_field6_a_then_b : [int]String;
  var UserTable_field7_a_then_b : [int]String;
  var UserTable_field8_a_then_b : [int]String;
  var UserTable_field9_a_then_b : [int]String;
  var UserTable_ycsb_key_a_then_b : [int]int;
  var UserTable_field1_b_then_a : [int]String;
  var UserTable_field10_b_then_a : [int]String;
  var UserTable_field2_b_then_a : [int]String;
  var UserTable_field3_b_then_a : [int]String;
  var UserTable_field4_b_then_a : [int]String;
  var UserTable_field5_b_then_a : [int]String;
  var UserTable_field6_b_then_a : [int]String;
  var UserTable_field7_b_then_a : [int]String;
  var UserTable_field8_b_then_a : [int]String;
  var UserTable_field9_b_then_a : [int]String;
  var UserTable_ycsb_key_b_then_a : [int]int;

  // Slice commutativity verification: hop 3 vs hop 15
  // --- Step 1: Havoc initial state ---
    havoc UserTable_field1;
    havoc UserTable_field10;
    havoc UserTable_field2;
    havoc UserTable_field3;
    havoc UserTable_field4;
    havoc UserTable_field5;
    havoc UserTable_field6;
    havoc UserTable_field7;
    havoc UserTable_field8;
    havoc UserTable_field9;
    havoc UserTable_ycsb_key;
    havoc s0_keyname;
    havoc s0_f1;
    havoc s0_f2;
    havoc s0_f3;
    havoc s0_f4;
    havoc s0_f5;
    havoc s0_f6;
    havoc s0_f7;
    havoc s0_f8;
    havoc s0_f9;
    havoc s0_f10;
    havoc s1_keyname;
    havoc s1_f2;
    havoc s1_f3;
    havoc s1_f4;
    havoc s1_f5;
    havoc s1_f6;
    havoc s1_f7;
    havoc s1_f8;
    havoc s1_f9;
    havoc s1_f10;
    s0_active := true;
    s1_active := true;
  // --- Step 2: Save initial state ---
    UserTable_field1_init := UserTable_field1;
    UserTable_field10_init := UserTable_field10;
    UserTable_field2_init := UserTable_field2;
    UserTable_field3_init := UserTable_field3;
    UserTable_field4_init := UserTable_field4;
    UserTable_field5_init := UserTable_field5;
    UserTable_field6_init := UserTable_field6;
    UserTable_field7_init := UserTable_field7;
    UserTable_field8_init := UserTable_field8;
    UserTable_field9_init := UserTable_field9;
    UserTable_ycsb_key_init := UserTable_ycsb_key;
    s0_keyname_init := s0_keyname;
    s0_f1_init := s0_f1;
    s0_f2_init := s0_f2;
    s0_f3_init := s0_f3;
    s0_f4_init := s0_f4;
    s0_f5_init := s0_f5;
    s0_f6_init := s0_f6;
    s0_f7_init := s0_f7;
    s0_f8_init := s0_f8;
    s0_f9_init := s0_f9;
    s0_f10_init := s0_f10;
    s1_keyname_init := s1_keyname;
    s1_f2_init := s1_f2;
    s1_f3_init := s1_f3;
    s1_f4_init := s1_f4;
    s1_f5_init := s1_f5;
    s1_f6_init := s1_f6;
    s1_f7_init := s1_f7;
    s1_f8_init := s1_f8;
    s1_f9_init := s1_f9;
    s1_f10_init := s1_f10;
  // --- Step 3: Execute special interleavings ---
  // Executing A then B:
    if (s0_active) {
    s0_block3__ab:
      UserTable_field1 := UserTable_field1[s0_keyname := s0_f1];
      UserTable_field2 := UserTable_field2[s0_keyname := s0_f2];
      UserTable_field3 := UserTable_field3[s0_keyname := s0_f3];
      UserTable_field4 := UserTable_field4[s0_keyname := s0_f4];
      UserTable_field5 := UserTable_field5[s0_keyname := s0_f5];
      UserTable_field6 := UserTable_field6[s0_keyname := s0_f6];
      UserTable_field7 := UserTable_field7[s0_keyname := s0_f7];
      UserTable_field8 := UserTable_field8[s0_keyname := s0_f8];
      UserTable_field9 := UserTable_field9[s0_keyname := s0_f9];
      UserTable_field10 := UserTable_field10[s0_keyname := s0_f10];
      s0_active := false;
      goto s0_hop_exit__ab;
    s0_hop_exit__ab:
    }
    if (s1_active) {
    s1_block15__ab:
      s1_r#field1 := UserTable_field1[s1_keyname];
      s1_r#ycsb_key := UserTable_ycsb_key[s1_keyname];
      s1_data := s1_r#field1;
      s1_r#field2 := s1_f2;
      s1_r#field3 := s1_f3;
      s1_r#field4 := s1_f4;
      s1_r#field5 := s1_f5;
      s1_r#field6 := s1_f6;
      s1_r#field7 := s1_f7;
      s1_r#field8 := s1_f8;
      s1_r#field9 := s1_f9;
      s1_r#field10 := s1_f10;
      UserTable_field1 := UserTable_field1[s1_keyname := s1_data];
      UserTable_field10 := UserTable_field10[s1_keyname := s1_r#field10];
      UserTable_field2 := UserTable_field2[s1_keyname := s1_r#field2];
      UserTable_field3 := UserTable_field3[s1_keyname := s1_r#field3];
      UserTable_field4 := UserTable_field4[s1_keyname := s1_r#field4];
      UserTable_field5 := UserTable_field5[s1_keyname := s1_r#field5];
      UserTable_field6 := UserTable_field6[s1_keyname := s1_r#field6];
      UserTable_field7 := UserTable_field7[s1_keyname := s1_r#field7];
      UserTable_field8 := UserTable_field8[s1_keyname := s1_r#field8];
      UserTable_field9 := UserTable_field9[s1_keyname := s1_r#field9];
      UserTable_ycsb_key := UserTable_ycsb_key[s1_keyname := s1_r#ycsb_key];
      s1_active := false;
      goto s1_hop_exit__ab;
    s1_hop_exit__ab:
    }
  // Snapshotting final state for a_then_b
    UserTable_field1_a_then_b := UserTable_field1;
    UserTable_field10_a_then_b := UserTable_field10;
    UserTable_field2_a_then_b := UserTable_field2;
    UserTable_field3_a_then_b := UserTable_field3;
    UserTable_field4_a_then_b := UserTable_field4;
    UserTable_field5_a_then_b := UserTable_field5;
    UserTable_field6_a_then_b := UserTable_field6;
    UserTable_field7_a_then_b := UserTable_field7;
    UserTable_field8_a_then_b := UserTable_field8;
    UserTable_field9_a_then_b := UserTable_field9;
    UserTable_ycsb_key_a_then_b := UserTable_ycsb_key;
  // Restoring initial state:
    UserTable_field1 := UserTable_field1_init;
    UserTable_field10 := UserTable_field10_init;
    UserTable_field2 := UserTable_field2_init;
    UserTable_field3 := UserTable_field3_init;
    UserTable_field4 := UserTable_field4_init;
    UserTable_field5 := UserTable_field5_init;
    UserTable_field6 := UserTable_field6_init;
    UserTable_field7 := UserTable_field7_init;
    UserTable_field8 := UserTable_field8_init;
    UserTable_field9 := UserTable_field9_init;
    UserTable_ycsb_key := UserTable_ycsb_key_init;
    s0_keyname := s0_keyname_init;
    s0_f1 := s0_f1_init;
    s0_f2 := s0_f2_init;
    s0_f3 := s0_f3_init;
    s0_f4 := s0_f4_init;
    s0_f5 := s0_f5_init;
    s0_f6 := s0_f6_init;
    s0_f7 := s0_f7_init;
    s0_f8 := s0_f8_init;
    s0_f9 := s0_f9_init;
    s0_f10 := s0_f10_init;
    s1_keyname := s1_keyname_init;
    s1_f2 := s1_f2_init;
    s1_f3 := s1_f3_init;
    s1_f4 := s1_f4_init;
    s1_f5 := s1_f5_init;
    s1_f6 := s1_f6_init;
    s1_f7 := s1_f7_init;
    s1_f8 := s1_f8_init;
    s1_f9 := s1_f9_init;
    s1_f10 := s1_f10_init;
    s0_active := true;
    s1_active := true;
  // Executing B then A:
    if (s1_active) {
    s1_block15__ba:
      s1_r#field1 := UserTable_field1[s1_keyname];
      s1_r#ycsb_key := UserTable_ycsb_key[s1_keyname];
      s1_data := s1_r#field1;
      s1_r#field2 := s1_f2;
      s1_r#field3 := s1_f3;
      s1_r#field4 := s1_f4;
      s1_r#field5 := s1_f5;
      s1_r#field6 := s1_f6;
      s1_r#field7 := s1_f7;
      s1_r#field8 := s1_f8;
      s1_r#field9 := s1_f9;
      s1_r#field10 := s1_f10;
      UserTable_field1 := UserTable_field1[s1_keyname := s1_data];
      UserTable_field10 := UserTable_field10[s1_keyname := s1_r#field10];
      UserTable_field2 := UserTable_field2[s1_keyname := s1_r#field2];
      UserTable_field3 := UserTable_field3[s1_keyname := s1_r#field3];
      UserTable_field4 := UserTable_field4[s1_keyname := s1_r#field4];
      UserTable_field5 := UserTable_field5[s1_keyname := s1_r#field5];
      UserTable_field6 := UserTable_field6[s1_keyname := s1_r#field6];
      UserTable_field7 := UserTable_field7[s1_keyname := s1_r#field7];
      UserTable_field8 := UserTable_field8[s1_keyname := s1_r#field8];
      UserTable_field9 := UserTable_field9[s1_keyname := s1_r#field9];
      UserTable_ycsb_key := UserTable_ycsb_key[s1_keyname := s1_r#ycsb_key];
      s1_active := false;
      goto s1_hop_exit__ba;
    s1_hop_exit__ba:
    }
    if (s0_active) {
    s0_block3__ba:
      UserTable_field1 := UserTable_field1[s0_keyname := s0_f1];
      UserTable_field2 := UserTable_field2[s0_keyname := s0_f2];
      UserTable_field3 := UserTable_field3[s0_keyname := s0_f3];
      UserTable_field4 := UserTable_field4[s0_keyname := s0_f4];
      UserTable_field5 := UserTable_field5[s0_keyname := s0_f5];
      UserTable_field6 := UserTable_field6[s0_keyname := s0_f6];
      UserTable_field7 := UserTable_field7[s0_keyname := s0_f7];
      UserTable_field8 := UserTable_field8[s0_keyname := s0_f8];
      UserTable_field9 := UserTable_field9[s0_keyname := s0_f9];
      UserTable_field10 := UserTable_field10[s0_keyname := s0_f10];
      s0_active := false;
      goto s0_hop_exit__ba;
    s0_hop_exit__ba:
    }
  // Snapshotting final state for b_then_a
    UserTable_field1_b_then_a := UserTable_field1;
    UserTable_field10_b_then_a := UserTable_field10;
    UserTable_field2_b_then_a := UserTable_field2;
    UserTable_field3_b_then_a := UserTable_field3;
    UserTable_field4_b_then_a := UserTable_field4;
    UserTable_field5_b_then_a := UserTable_field5;
    UserTable_field6_b_then_a := UserTable_field6;
    UserTable_field7_b_then_a := UserTable_field7;
    UserTable_field8_b_then_a := UserTable_field8;
    UserTable_field9_b_then_a := UserTable_field9;
    UserTable_ycsb_key_b_then_a := UserTable_ycsb_key;
  // --- Step 4: Verify A→B ≡ B→A (Special interleavings equivalence) ---
  // Verifying A->B === B->A equivalence:
    assert {:msg "(SpecialInterleavingNonEquivalence (node_1 (function_id . 18) (instance . 1) (hop_id . 3)) (node_2 (function_id . 21) (instance . 0) (hop_id . 15)))"} (((((((((((UserTable_field1_a_then_b == UserTable_field1_b_then_a) && (UserTable_field10_a_then_b == UserTable_field10_b_then_a)) && (UserTable_field2_a_then_b == UserTable_field2_b_then_a)) && (UserTable_field3_a_then_b == UserTable_field3_b_then_a)) && (UserTable_field4_a_then_b == UserTable_field4_b_then_a)) && (UserTable_field5_a_then_b == UserTable_field5_b_then_a)) && (UserTable_field6_a_then_b == UserTable_field6_b_then_a)) && (UserTable_field7_a_then_b == UserTable_field7_b_then_a)) && (UserTable_field8_a_then_b == UserTable_field8_b_then_a)) && (UserTable_field9_a_then_b == UserTable_field9_b_then_a)) && (UserTable_ycsb_key_a_then_b == UserTable_ycsb_key_b_then_a));
}

