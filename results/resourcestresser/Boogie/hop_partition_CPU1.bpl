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
var iotablesmallrow_flag1 : [int]int;
var iotablesmallrow_empid : [int]int;
const TBL_iotablesmallrow : Table (iotablesmallrow);
const __shards__ : int;
var cputable_passwd : [int]String;
var iotable_data1 : [int]String;
var locktable_empid : [int]int;
var iotable_data2 : [int]String;
const CPU_RANGE : int;
const __slice__ : int;
var locktable_salary : [int]int;
const TBL_cputable : Table (cputable);
var iotable_empid : [int]int;
const TBL_locktable : Table (locktable);
var cputable_empid : [int]int;
const TBL_iotable : Table (iotable);
procedure verify_hop_partitions_CPU1()
{
  // Hop partition verification for function 'CPU1'
  s1_block1:
    goto s1_hop_exit;
  s1_hop_exit:
  s2_block2:
    goto s2_hop_exit;
  s2_hop_exit:
  s3_block3:
    goto s3_hop_exit;
  s3_hop_exit:
  s4_block4:
    goto s4_hop_exit;
  s4_hop_exit:
  s5_block5:
    goto s5_hop_exit;
  s5_hop_exit:
  s6_block6:
    goto s6_hop_exit;
  s6_hop_exit:
  s7_block7:
    goto s7_hop_exit;
  s7_hop_exit:
  s8_block8:
    goto s8_hop_exit;
  s8_hop_exit:
  s9_block9:
    goto s9_hop_exit;
  s9_hop_exit:
  s10_block10:
    goto s10_hop_exit;
  s10_hop_exit:
  s11_block11:
    goto s11_hop_exit;
  s11_hop_exit:
  s12_block12:
    goto s12_hop_exit;
  s12_hop_exit:
  s13_block13:
    goto s13_hop_exit;
  s13_hop_exit:
  s14_block14:
    goto s14_hop_exit;
  s14_hop_exit:
  s15_block15:
    goto s15_hop_exit;
  s15_hop_exit:
  s16_block16:
    goto s16_hop_exit;
  s16_hop_exit:
  s17_block17:
    goto s17_hop_exit;
  s17_hop_exit:
  s18_block18:
    goto s18_hop_exit;
  s18_hop_exit:
  s19_block19:
    goto s19_hop_exit;
  s19_hop_exit:
  s20_block20:
    goto s20_hop_exit;
  s20_hop_exit:
  s21_block21:
    goto s21_hop_exit;
  s21_hop_exit:
  s22_block22:
    goto s22_hop_exit;
  s22_hop_exit:
  s23_block23:
    goto s23_hop_exit;
  s23_hop_exit:
  s24_block24:
    goto s24_hop_exit;
  s24_hop_exit:
  s25_block25:
    goto s25_hop_exit;
  s25_hop_exit:
  s26_block26:
    goto s26_hop_exit;
  s26_hop_exit:
  s27_block27:
    goto s27_hop_exit;
  s27_hop_exit:
  s28_block28:
    goto s28_hop_exit;
  s28_hop_exit:
  s29_block29:
    goto s29_hop_exit;
  s29_hop_exit:
  s30_block30:
    goto s30_hop_exit;
  s30_hop_exit:
  s31_block31:
    goto s31_hop_exit;
  s31_hop_exit:
  s32_block32:
    goto s32_hop_exit;
  s32_hop_exit:
  s33_block33:
    goto s33_hop_exit;
  s33_hop_exit:
  s34_block34:
    goto s34_hop_exit;
  s34_hop_exit:
  s35_block35:
    goto s35_hop_exit;
  s35_hop_exit:
  s36_block36:
    goto s36_hop_exit;
  s36_hop_exit:
  s37_block37:
    goto s37_hop_exit;
  s37_hop_exit:
  s38_block38:
    goto s38_hop_exit;
  s38_hop_exit:
  s39_block39:
    goto s39_hop_exit;
  s39_hop_exit:
  s40_block40:
    goto s40_hop_exit;
  s40_hop_exit:
  s41_block41:
    goto s41_hop_exit;
  s41_hop_exit:
  s42_block42:
    goto s42_hop_exit;
  s42_hop_exit:
  s43_block43:
    goto s43_hop_exit;
  s43_hop_exit:
  s44_block44:
    goto s44_hop_exit;
  s44_hop_exit:
  s45_block45:
    goto s45_hop_exit;
  s45_hop_exit:
  s46_block46:
    goto s46_hop_exit;
  s46_hop_exit:
  s47_block47:
    goto s47_hop_exit;
  s47_hop_exit:
  s48_block48:
    goto s48_hop_exit;
  s48_hop_exit:
  s49_block49:
    goto s49_hop_exit;
  s49_hop_exit:
  s50_block50:
    goto s50_hop_exit;
  s50_hop_exit:
  s51_block51:
    goto s51_hop_exit;
  s51_hop_exit:
  s52_block52:
    goto s52_hop_exit;
  s52_hop_exit:
  s53_block53:
    goto s53_hop_exit;
  s53_hop_exit:
  s54_block54:
    goto s54_hop_exit;
  s54_hop_exit:
  s55_block55:
    goto s55_hop_exit;
  s55_hop_exit:
  s56_block56:
    goto s56_hop_exit;
  s56_hop_exit:
  s57_block57:
    goto s57_hop_exit;
  s57_hop_exit:
  s58_block58:
    goto s58_hop_exit;
  s58_hop_exit:
  s59_block59:
    goto s59_hop_exit;
  s59_hop_exit:
  s60_block60:
    goto s60_hop_exit;
  s60_hop_exit:
  s61_block61:
    goto s61_hop_exit;
  s61_hop_exit:
  s62_block62:
    goto s62_hop_exit;
  s62_hop_exit:
  s63_block63:
    goto s63_hop_exit;
  s63_hop_exit:
  s64_block64:
    goto s64_hop_exit;
  s64_hop_exit:
  s65_block65:
    goto s65_hop_exit;
  s65_hop_exit:
  s66_block66:
    goto s66_hop_exit;
  s66_hop_exit:
  s67_block67:
    goto s67_hop_exit;
  s67_hop_exit:
  s68_block68:
    goto s68_hop_exit;
  s68_hop_exit:
  s69_block69:
    goto s69_hop_exit;
  s69_hop_exit:
  s70_block70:
    goto s70_hop_exit;
  s70_hop_exit:
  s71_block71:
    goto s71_hop_exit;
  s71_hop_exit:
  s72_block72:
    goto s72_hop_exit;
  s72_hop_exit:
  s73_block73:
    goto s73_hop_exit;
  s73_hop_exit:
  s74_block74:
    goto s74_hop_exit;
  s74_hop_exit:
  s75_block75:
    goto s75_hop_exit;
  s75_hop_exit:
  s76_block76:
    goto s76_hop_exit;
  s76_hop_exit:
  s77_block77:
    goto s77_hop_exit;
  s77_hop_exit:
  s78_block78:
    goto s78_hop_exit;
  s78_hop_exit:
  s79_block79:
    goto s79_hop_exit;
  s79_hop_exit:
  s80_block80:
    goto s80_hop_exit;
  s80_hop_exit:
  s81_block81:
    goto s81_hop_exit;
  s81_hop_exit:
  s82_block82:
    goto s82_hop_exit;
  s82_hop_exit:
  s83_block83:
    goto s83_hop_exit;
  s83_hop_exit:
  s84_block84:
    goto s84_hop_exit;
  s84_hop_exit:
  s85_block85:
    goto s85_hop_exit;
  s85_hop_exit:
  s86_block86:
    goto s86_hop_exit;
  s86_hop_exit:
  s87_block87:
    goto s87_hop_exit;
  s87_hop_exit:
  s88_block88:
    goto s88_hop_exit;
  s88_hop_exit:
  s89_block89:
    goto s89_hop_exit;
  s89_hop_exit:
  s90_block90:
    goto s90_hop_exit;
  s90_hop_exit:
  s91_block91:
    goto s91_hop_exit;
  s91_hop_exit:
  s92_block92:
    goto s92_hop_exit;
  s92_hop_exit:
  s93_block93:
    goto s93_hop_exit;
  s93_hop_exit:
  s94_block94:
    goto s94_hop_exit;
  s94_hop_exit:
  s95_block95:
    goto s95_hop_exit;
  s95_hop_exit:
  s96_block96:
    goto s96_hop_exit;
  s96_hop_exit:
  s97_block97:
    goto s97_hop_exit;
  s97_hop_exit:
  s98_block98:
    goto s98_hop_exit;
  s98_hop_exit:
  s99_block99:
    goto s99_hop_exit;
  s99_hop_exit:
  s100_block100:
    goto s100_epilogue;
  s100_hop_exit:
  s1_epilogue:
  s2_epilogue:
  s3_epilogue:
  s4_epilogue:
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
  s15_epilogue:
  s16_epilogue:
  s17_epilogue:
  s18_epilogue:
  s19_epilogue:
  s20_epilogue:
  s21_epilogue:
  s22_epilogue:
  s23_epilogue:
  s24_epilogue:
  s25_epilogue:
  s26_epilogue:
  s27_epilogue:
  s28_epilogue:
  s29_epilogue:
  s30_epilogue:
  s31_epilogue:
  s32_epilogue:
  s33_epilogue:
  s34_epilogue:
  s35_epilogue:
  s36_epilogue:
  s37_epilogue:
  s38_epilogue:
  s39_epilogue:
  s40_epilogue:
  s41_epilogue:
  s42_epilogue:
  s43_epilogue:
  s44_epilogue:
  s45_epilogue:
  s46_epilogue:
  s47_epilogue:
  s48_epilogue:
  s49_epilogue:
  s50_epilogue:
  s51_epilogue:
  s52_epilogue:
  s53_epilogue:
  s54_epilogue:
  s55_epilogue:
  s56_epilogue:
  s57_epilogue:
  s58_epilogue:
  s59_epilogue:
  s60_epilogue:
  s61_epilogue:
  s62_epilogue:
  s63_epilogue:
  s64_epilogue:
  s65_epilogue:
  s66_epilogue:
  s67_epilogue:
  s68_epilogue:
  s69_epilogue:
  s70_epilogue:
  s71_epilogue:
  s72_epilogue:
  s73_epilogue:
  s74_epilogue:
  s75_epilogue:
  s76_epilogue:
  s77_epilogue:
  s78_epilogue:
  s79_epilogue:
  s80_epilogue:
  s81_epilogue:
  s82_epilogue:
  s83_epilogue:
  s84_epilogue:
  s85_epilogue:
  s86_epilogue:
  s87_epilogue:
  s88_epilogue:
  s89_epilogue:
  s90_epilogue:
  s91_epilogue:
  s92_epilogue:
  s93_epilogue:
  s94_epilogue:
  s95_epilogue:
  s96_epilogue:
  s97_epilogue:
  s98_epilogue:
  s99_epilogue:
  s100_epilogue:
}

