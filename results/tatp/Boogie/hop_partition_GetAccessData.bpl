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
function get_s_id#23(arg0: Iterator (Table (Subscriber))) returns (int);
function model_get_s_id#23(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Subscriber)) :: hasNext(iter) ==> get_s_id#23(iter) == model_get_s_id#23(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_s_id#24(arg0: Iterator (Table (AccessInfo))) returns (int);
function model_get_s_id#24(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (AccessInfo)) :: hasNext(iter) ==> get_s_id#24(iter) == model_get_s_id#24(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ai_type#25(arg0: Iterator (Table (AccessInfo))) returns (int);
function model_get_ai_type#25(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (AccessInfo)) :: hasNext(iter) ==> get_ai_type#25(iter) == model_get_ai_type#25(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_s_id#26(arg0: Iterator (Table (SpecialFacility))) returns (int);
function model_get_s_id#26(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (SpecialFacility)) :: hasNext(iter) ==> get_s_id#26(iter) == model_get_s_id#26(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_sf_type#27(arg0: Iterator (Table (SpecialFacility))) returns (int);
function model_get_sf_type#27(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (SpecialFacility)) :: hasNext(iter) ==> get_sf_type#27(iter) == model_get_sf_type#27(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_s_id#28(arg0: Iterator (Table (CallForwarding))) returns (int);
function model_get_s_id#28(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (CallForwarding)) :: hasNext(iter) ==> get_s_id#28(iter) == model_get_s_id#28(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_sf_type#29(arg0: Iterator (Table (CallForwarding))) returns (int);
function model_get_sf_type#29(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (CallForwarding)) :: hasNext(iter) ==> get_sf_type#29(iter) == model_get_sf_type#29(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_start_time#30(arg0: Iterator (Table (CallForwarding))) returns (int);
function model_get_start_time#30(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (CallForwarding)) :: hasNext(iter) ==> get_start_time#30(iter) == model_get_start_time#30(iter_n(iter), iter_m(iter), iter_position(iter)));
type Table a;
type Subscriber;
type AccessInfo;
type SpecialFacility;
type CallForwarding;
type Row a;
function construct_Row_Subscriber(s_id: int, sub_nbr: String, bit_1: int, bit_2: int, bit_3: int, bit_4: int, bit_5: int, bit_6: int, bit_7: int, bit_8: int, bit_9: int, bit_10: int, hex_1: int, hex_2: int, hex_3: int, hex_4: int, hex_5: int, hex_6: int, hex_7: int, hex_8: int, hex_9: int, hex_10: int, byte2_1: int, byte2_2: int, byte2_3: int, byte2_4: int, byte2_5: int, byte2_6: int, byte2_7: int, byte2_8: int, byte2_9: int, byte2_10: int, msc_location: int, vlr_location: int): Row (Table Subscriber);
axiom (forall
    s_id_1: int, sub_nbr_1: String, bit_1_1: int, bit_2_1: int, bit_3_1: int, bit_4_1: int, bit_5_1: int, bit_6_1: int, bit_7_1: int, bit_8_1: int, bit_9_1: int, bit_10_1: int, hex_1_1: int, hex_2_1: int, hex_3_1: int, hex_4_1: int, hex_5_1: int, hex_6_1: int, hex_7_1: int, hex_8_1: int, hex_9_1: int, hex_10_1: int, byte2_1_1: int, byte2_2_1: int, byte2_3_1: int, byte2_4_1: int, byte2_5_1: int, byte2_6_1: int, byte2_7_1: int, byte2_8_1: int, byte2_9_1: int, byte2_10_1: int, msc_location_1: int, vlr_location_1: int,
    s_id_2: int, sub_nbr_2: String, bit_1_2: int, bit_2_2: int, bit_3_2: int, bit_4_2: int, bit_5_2: int, bit_6_2: int, bit_7_2: int, bit_8_2: int, bit_9_2: int, bit_10_2: int, hex_1_2: int, hex_2_2: int, hex_3_2: int, hex_4_2: int, hex_5_2: int, hex_6_2: int, hex_7_2: int, hex_8_2: int, hex_9_2: int, hex_10_2: int, byte2_1_2: int, byte2_2_2: int, byte2_3_2: int, byte2_4_2: int, byte2_5_2: int, byte2_6_2: int, byte2_7_2: int, byte2_8_2: int, byte2_9_2: int, byte2_10_2: int, msc_location_2: int, vlr_location_2: int
    ::
    construct_Row_Subscriber(s_id_1, sub_nbr_1, bit_1_1, bit_2_1, bit_3_1, bit_4_1, bit_5_1, bit_6_1, bit_7_1, bit_8_1, bit_9_1, bit_10_1, hex_1_1, hex_2_1, hex_3_1, hex_4_1, hex_5_1, hex_6_1, hex_7_1, hex_8_1, hex_9_1, hex_10_1, byte2_1_1, byte2_2_1, byte2_3_1, byte2_4_1, byte2_5_1, byte2_6_1, byte2_7_1, byte2_8_1, byte2_9_1, byte2_10_1, msc_location_1, vlr_location_1) == construct_Row_Subscriber(s_id_2, sub_nbr_2, bit_1_2, bit_2_2, bit_3_2, bit_4_2, bit_5_2, bit_6_2, bit_7_2, bit_8_2, bit_9_2, bit_10_2, hex_1_2, hex_2_2, hex_3_2, hex_4_2, hex_5_2, hex_6_2, hex_7_2, hex_8_2, hex_9_2, hex_10_2, byte2_1_2, byte2_2_2, byte2_3_2, byte2_4_2, byte2_5_2, byte2_6_2, byte2_7_2, byte2_8_2, byte2_9_2, byte2_10_2, msc_location_2, vlr_location_2)
    <==>
    (s_id_1 == s_id_2 && sub_nbr_1 == sub_nbr_2 && bit_1_1 == bit_1_2 && bit_2_1 == bit_2_2 && bit_3_1 == bit_3_2 && bit_4_1 == bit_4_2 && bit_5_1 == bit_5_2 && bit_6_1 == bit_6_2 && bit_7_1 == bit_7_2 && bit_8_1 == bit_8_2 && bit_9_1 == bit_9_2 && bit_10_1 == bit_10_2 && hex_1_1 == hex_1_2 && hex_2_1 == hex_2_2 && hex_3_1 == hex_3_2 && hex_4_1 == hex_4_2 && hex_5_1 == hex_5_2 && hex_6_1 == hex_6_2 && hex_7_1 == hex_7_2 && hex_8_1 == hex_8_2 && hex_9_1 == hex_9_2 && hex_10_1 == hex_10_2 && byte2_1_1 == byte2_1_2 && byte2_2_1 == byte2_2_2 && byte2_3_1 == byte2_3_2 && byte2_4_1 == byte2_4_2 && byte2_5_1 == byte2_5_2 && byte2_6_1 == byte2_6_2 && byte2_7_1 == byte2_7_2 && byte2_8_1 == byte2_8_2 && byte2_9_1 == byte2_9_2 && byte2_10_1 == byte2_10_2 && msc_location_1 == msc_location_2 && vlr_location_1 == vlr_location_2)
);
function construct_Row_AccessInfo(s_id: int, ai_type: int, data1: int, data2: int, data3: String, data4: String): Row (Table AccessInfo);
axiom (forall
    s_id_1: int, ai_type_1: int, data1_1: int, data2_1: int, data3_1: String, data4_1: String,
    s_id_2: int, ai_type_2: int, data1_2: int, data2_2: int, data3_2: String, data4_2: String
    ::
    construct_Row_AccessInfo(s_id_1, ai_type_1, data1_1, data2_1, data3_1, data4_1) == construct_Row_AccessInfo(s_id_2, ai_type_2, data1_2, data2_2, data3_2, data4_2)
    <==>
    (s_id_1 == s_id_2 && ai_type_1 == ai_type_2 && data1_1 == data1_2 && data2_1 == data2_2 && data3_1 == data3_2 && data4_1 == data4_2)
);
function construct_Row_SpecialFacility(s_id: int, sf_type: int, is_active: int, error_cntrl: int, data_a: int, data_b: String): Row (Table SpecialFacility);
axiom (forall
    s_id_1: int, sf_type_1: int, is_active_1: int, error_cntrl_1: int, data_a_1: int, data_b_1: String,
    s_id_2: int, sf_type_2: int, is_active_2: int, error_cntrl_2: int, data_a_2: int, data_b_2: String
    ::
    construct_Row_SpecialFacility(s_id_1, sf_type_1, is_active_1, error_cntrl_1, data_a_1, data_b_1) == construct_Row_SpecialFacility(s_id_2, sf_type_2, is_active_2, error_cntrl_2, data_a_2, data_b_2)
    <==>
    (s_id_1 == s_id_2 && sf_type_1 == sf_type_2 && is_active_1 == is_active_2 && error_cntrl_1 == error_cntrl_2 && data_a_1 == data_a_2 && data_b_1 == data_b_2)
);
function construct_Row_CallForwarding(s_id: int, sf_type: int, start_time: int, end_time: int, numberx: String): Row (Table CallForwarding);
axiom (forall
    s_id_1: int, sf_type_1: int, start_time_1: int, end_time_1: int, numberx_1: String,
    s_id_2: int, sf_type_2: int, start_time_2: int, end_time_2: int, numberx_2: String
    ::
    construct_Row_CallForwarding(s_id_1, sf_type_1, start_time_1, end_time_1, numberx_1) == construct_Row_CallForwarding(s_id_2, sf_type_2, start_time_2, end_time_2, numberx_2)
    <==>
    (s_id_1 == s_id_2 && sf_type_1 == sf_type_2 && start_time_1 == start_time_2 && end_time_1 == end_time_2 && numberx_1 == numberx_2)
);
var Subscriber_sub_nbr : [int]String;
var AccessInfo_data2 : [int][int]int;
var Subscriber_bit_2 : [int]int;
var Subscriber_byte2_9 : [int]int;
var Subscriber_bit_4 : [int]int;
var Subscriber_hex_6 : [int]int;
var Subscriber_hex_8 : [int]int;
var Subscriber_byte2_10 : [int]int;
var SpecialFacility_is_active : [int][int]int;
var CallForwarding_end_time : [int][int][int]int;
var Subscriber_hex_10 : [int]int;
var SpecialFacility_data_b : [int][int]String;
var Subscriber_bit_7 : [int]int;
var CallForwarding_sf_type : [int][int][int]int;
var Subscriber_byte2_5 : [int]int;
var Subscriber_hex_5 : [int]int;
var Subscriber_hex_1 : [int]int;
var Subscriber_msc_location : [int]int;
var SpecialFacility_s_id : [int][int]int;
var CallForwarding_numberx : [int][int][int]String;
const __slice__ : int;
const TBL_Subscriber : Table (Subscriber);
var Subscriber_hex_4 : [int]int;
const TBL_AccessInfo : Table (AccessInfo);
var CallForwarding_s_id : [int][int][int]int;
var Subscriber_bit_3 : [int]int;
var Subscriber_bit_5 : [int]int;
var CallForwarding_start_time : [int][int][int]int;
var Subscriber_byte2_7 : [int]int;
var SpecialFacility_sf_type : [int][int]int;
var Subscriber_bit_9 : [int]int;
var Subscriber_vlr_location : [int]int;
var Subscriber_s_id : [int]int;
var Subscriber_byte2_8 : [int]int;
var Subscriber_byte2_1 : [int]int;
var Subscriber_byte2_6 : [int]int;
var Subscriber_hex_3 : [int]int;
var AccessInfo_ai_type : [int][int]int;
var AccessInfo_data1 : [int][int]int;
const TBL_CallForwarding : Table (CallForwarding);
var Subscriber_hex_7 : [int]int;
const TBL_SpecialFacility : Table (SpecialFacility);
var Subscriber_byte2_4 : [int]int;
var Subscriber_bit_8 : [int]int;
var Subscriber_byte2_3 : [int]int;
var Subscriber_bit_1 : [int]int;
var Subscriber_hex_9 : [int]int;
var AccessInfo_data3 : [int][int]String;
var Subscriber_byte2_2 : [int]int;
var Subscriber_bit_6 : [int]int;
var Subscriber_hex_2 : [int]int;
var AccessInfo_s_id : [int][int]int;
var SpecialFacility_data_a : [int][int]int;
var SpecialFacility_error_cntrl : [int][int]int;
var Subscriber_bit_10 : [int]int;
var AccessInfo_data4 : [int][int]String;
const __shards__ : int;
procedure verify_hop_partitions_GetAccessData(s_id: int, ai_type: int)
{
  var s2_ai#data1 : int;
  var s2_s_id : int;
  var s2_ai_type : int;
  var s2_d1 : int;
  var s2_#tmp3 : unit;

  // Hop partition verification for function 'GetAccessData'
  s2_block2:
    s2_ai#data1 := AccessInfo_data1[s2_s_id][s2_ai_type];
    s2_d1 := s2_ai#data1;
    s2_#tmp3 := to_unit(s2_d1);
    goto s2_epilogue;
  s2_hop_exit:
  s2_epilogue:
}

