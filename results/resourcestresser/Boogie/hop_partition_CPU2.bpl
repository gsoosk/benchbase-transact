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
var iotable_empid : [int]int;
var locktable_salary : [int]int;
var locktable_empid : [int]int;
var iotable_data1 : [int]String;
var iotablesmallrow_empid : [int]int;
const TBL_iotable : Table (iotable);
const TBL_locktable : Table (locktable);
const __slice__ : int;
const __shards__ : int;
const TBL_cputable : Table (cputable);
var cputable_empid : [int]int;
const CPU_RANGE : int;
var cputable_passwd : [int]String;
const TBL_iotablesmallrow : Table (iotablesmallrow);
var iotablesmallrow_flag1 : [int]int;
var iotable_data2 : [int]String;
procedure verify_hop_partitions_CPU2()
{
  // Hop partition verification for function 'CPU2'
  s101_block101:
    goto s101_hop_exit;
  s101_hop_exit:
  s102_block102:
    goto s102_hop_exit;
  s102_hop_exit:
  s103_block103:
    goto s103_hop_exit;
  s103_hop_exit:
  s104_block104:
    goto s104_hop_exit;
  s104_hop_exit:
  s105_block105:
    goto s105_hop_exit;
  s105_hop_exit:
  s106_block106:
    goto s106_hop_exit;
  s106_hop_exit:
  s107_block107:
    goto s107_hop_exit;
  s107_hop_exit:
  s108_block108:
    goto s108_hop_exit;
  s108_hop_exit:
  s109_block109:
    goto s109_hop_exit;
  s109_hop_exit:
  s110_block110:
    goto s110_hop_exit;
  s110_hop_exit:
  s111_block111:
    goto s111_hop_exit;
  s111_hop_exit:
  s112_block112:
    goto s112_hop_exit;
  s112_hop_exit:
  s113_block113:
    goto s113_hop_exit;
  s113_hop_exit:
  s114_block114:
    goto s114_hop_exit;
  s114_hop_exit:
  s115_block115:
    goto s115_hop_exit;
  s115_hop_exit:
  s116_block116:
    goto s116_hop_exit;
  s116_hop_exit:
  s117_block117:
    goto s117_hop_exit;
  s117_hop_exit:
  s118_block118:
    goto s118_hop_exit;
  s118_hop_exit:
  s119_block119:
    goto s119_hop_exit;
  s119_hop_exit:
  s120_block120:
    goto s120_hop_exit;
  s120_hop_exit:
  s121_block121:
    goto s121_hop_exit;
  s121_hop_exit:
  s122_block122:
    goto s122_hop_exit;
  s122_hop_exit:
  s123_block123:
    goto s123_hop_exit;
  s123_hop_exit:
  s124_block124:
    goto s124_hop_exit;
  s124_hop_exit:
  s125_block125:
    goto s125_hop_exit;
  s125_hop_exit:
  s126_block126:
    goto s126_hop_exit;
  s126_hop_exit:
  s127_block127:
    goto s127_hop_exit;
  s127_hop_exit:
  s128_block128:
    goto s128_hop_exit;
  s128_hop_exit:
  s129_block129:
    goto s129_hop_exit;
  s129_hop_exit:
  s130_block130:
    goto s130_hop_exit;
  s130_hop_exit:
  s131_block131:
    goto s131_hop_exit;
  s131_hop_exit:
  s132_block132:
    goto s132_hop_exit;
  s132_hop_exit:
  s133_block133:
    goto s133_hop_exit;
  s133_hop_exit:
  s134_block134:
    goto s134_hop_exit;
  s134_hop_exit:
  s135_block135:
    goto s135_hop_exit;
  s135_hop_exit:
  s136_block136:
    goto s136_hop_exit;
  s136_hop_exit:
  s137_block137:
    goto s137_hop_exit;
  s137_hop_exit:
  s138_block138:
    goto s138_hop_exit;
  s138_hop_exit:
  s139_block139:
    goto s139_hop_exit;
  s139_hop_exit:
  s140_block140:
    goto s140_hop_exit;
  s140_hop_exit:
  s141_block141:
    goto s141_hop_exit;
  s141_hop_exit:
  s142_block142:
    goto s142_hop_exit;
  s142_hop_exit:
  s143_block143:
    goto s143_hop_exit;
  s143_hop_exit:
  s144_block144:
    goto s144_hop_exit;
  s144_hop_exit:
  s145_block145:
    goto s145_hop_exit;
  s145_hop_exit:
  s146_block146:
    goto s146_hop_exit;
  s146_hop_exit:
  s147_block147:
    goto s147_hop_exit;
  s147_hop_exit:
  s148_block148:
    goto s148_hop_exit;
  s148_hop_exit:
  s149_block149:
    goto s149_hop_exit;
  s149_hop_exit:
  s150_block150:
    goto s150_hop_exit;
  s150_hop_exit:
  s151_block151:
    goto s151_hop_exit;
  s151_hop_exit:
  s152_block152:
    goto s152_hop_exit;
  s152_hop_exit:
  s153_block153:
    goto s153_hop_exit;
  s153_hop_exit:
  s154_block154:
    goto s154_hop_exit;
  s154_hop_exit:
  s155_block155:
    goto s155_hop_exit;
  s155_hop_exit:
  s156_block156:
    goto s156_hop_exit;
  s156_hop_exit:
  s157_block157:
    goto s157_hop_exit;
  s157_hop_exit:
  s158_block158:
    goto s158_hop_exit;
  s158_hop_exit:
  s159_block159:
    goto s159_hop_exit;
  s159_hop_exit:
  s160_block160:
    goto s160_hop_exit;
  s160_hop_exit:
  s161_block161:
    goto s161_hop_exit;
  s161_hop_exit:
  s162_block162:
    goto s162_hop_exit;
  s162_hop_exit:
  s163_block163:
    goto s163_hop_exit;
  s163_hop_exit:
  s164_block164:
    goto s164_hop_exit;
  s164_hop_exit:
  s165_block165:
    goto s165_hop_exit;
  s165_hop_exit:
  s166_block166:
    goto s166_hop_exit;
  s166_hop_exit:
  s167_block167:
    goto s167_hop_exit;
  s167_hop_exit:
  s168_block168:
    goto s168_hop_exit;
  s168_hop_exit:
  s169_block169:
    goto s169_hop_exit;
  s169_hop_exit:
  s170_block170:
    goto s170_hop_exit;
  s170_hop_exit:
  s171_block171:
    goto s171_hop_exit;
  s171_hop_exit:
  s172_block172:
    goto s172_hop_exit;
  s172_hop_exit:
  s173_block173:
    goto s173_hop_exit;
  s173_hop_exit:
  s174_block174:
    goto s174_hop_exit;
  s174_hop_exit:
  s175_block175:
    goto s175_hop_exit;
  s175_hop_exit:
  s176_block176:
    goto s176_hop_exit;
  s176_hop_exit:
  s177_block177:
    goto s177_hop_exit;
  s177_hop_exit:
  s178_block178:
    goto s178_hop_exit;
  s178_hop_exit:
  s179_block179:
    goto s179_hop_exit;
  s179_hop_exit:
  s180_block180:
    goto s180_hop_exit;
  s180_hop_exit:
  s181_block181:
    goto s181_hop_exit;
  s181_hop_exit:
  s182_block182:
    goto s182_hop_exit;
  s182_hop_exit:
  s183_block183:
    goto s183_hop_exit;
  s183_hop_exit:
  s184_block184:
    goto s184_hop_exit;
  s184_hop_exit:
  s185_block185:
    goto s185_hop_exit;
  s185_hop_exit:
  s186_block186:
    goto s186_hop_exit;
  s186_hop_exit:
  s187_block187:
    goto s187_hop_exit;
  s187_hop_exit:
  s188_block188:
    goto s188_hop_exit;
  s188_hop_exit:
  s189_block189:
    goto s189_hop_exit;
  s189_hop_exit:
  s190_block190:
    goto s190_hop_exit;
  s190_hop_exit:
  s191_block191:
    goto s191_hop_exit;
  s191_hop_exit:
  s192_block192:
    goto s192_hop_exit;
  s192_hop_exit:
  s193_block193:
    goto s193_hop_exit;
  s193_hop_exit:
  s194_block194:
    goto s194_hop_exit;
  s194_hop_exit:
  s195_block195:
    goto s195_hop_exit;
  s195_hop_exit:
  s196_block196:
    goto s196_hop_exit;
  s196_hop_exit:
  s197_block197:
    goto s197_hop_exit;
  s197_hop_exit:
  s198_block198:
    goto s198_hop_exit;
  s198_hop_exit:
  s199_block199:
    goto s199_hop_exit;
  s199_hop_exit:
  s200_block200:
    goto s200_epilogue;
  s200_hop_exit:
  s101_epilogue:
  s102_epilogue:
  s103_epilogue:
  s104_epilogue:
  s105_epilogue:
  s106_epilogue:
  s107_epilogue:
  s108_epilogue:
  s109_epilogue:
  s110_epilogue:
  s111_epilogue:
  s112_epilogue:
  s113_epilogue:
  s114_epilogue:
  s115_epilogue:
  s116_epilogue:
  s117_epilogue:
  s118_epilogue:
  s119_epilogue:
  s120_epilogue:
  s121_epilogue:
  s122_epilogue:
  s123_epilogue:
  s124_epilogue:
  s125_epilogue:
  s126_epilogue:
  s127_epilogue:
  s128_epilogue:
  s129_epilogue:
  s130_epilogue:
  s131_epilogue:
  s132_epilogue:
  s133_epilogue:
  s134_epilogue:
  s135_epilogue:
  s136_epilogue:
  s137_epilogue:
  s138_epilogue:
  s139_epilogue:
  s140_epilogue:
  s141_epilogue:
  s142_epilogue:
  s143_epilogue:
  s144_epilogue:
  s145_epilogue:
  s146_epilogue:
  s147_epilogue:
  s148_epilogue:
  s149_epilogue:
  s150_epilogue:
  s151_epilogue:
  s152_epilogue:
  s153_epilogue:
  s154_epilogue:
  s155_epilogue:
  s156_epilogue:
  s157_epilogue:
  s158_epilogue:
  s159_epilogue:
  s160_epilogue:
  s161_epilogue:
  s162_epilogue:
  s163_epilogue:
  s164_epilogue:
  s165_epilogue:
  s166_epilogue:
  s167_epilogue:
  s168_epilogue:
  s169_epilogue:
  s170_epilogue:
  s171_epilogue:
  s172_epilogue:
  s173_epilogue:
  s174_epilogue:
  s175_epilogue:
  s176_epilogue:
  s177_epilogue:
  s178_epilogue:
  s179_epilogue:
  s180_epilogue:
  s181_epilogue:
  s182_epilogue:
  s183_epilogue:
  s184_epilogue:
  s185_epilogue:
  s186_epilogue:
  s187_epilogue:
  s188_epilogue:
  s189_epilogue:
  s190_epilogue:
  s191_epilogue:
  s192_epilogue:
  s193_epilogue:
  s194_epilogue:
  s195_epilogue:
  s196_epilogue:
  s197_epilogue:
  s198_epilogue:
  s199_epilogue:
  s200_epilogue:
}

