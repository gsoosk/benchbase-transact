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
function get_r_regionkey#35(arg0: Iterator (Table (Region))) returns (int);
function model_get_r_regionkey#35(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Region)) :: hasNext(iter) ==> get_r_regionkey#35(iter) == model_get_r_regionkey#35(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_n_nationkey#36(arg0: Iterator (Table (Nation))) returns (int);
function model_get_n_nationkey#36(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Nation)) :: hasNext(iter) ==> get_n_nationkey#36(iter) == model_get_n_nationkey#36(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_p_partkey#37(arg0: Iterator (Table (Part))) returns (int);
function model_get_p_partkey#37(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Part)) :: hasNext(iter) ==> get_p_partkey#37(iter) == model_get_p_partkey#37(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_s_suppkey#38(arg0: Iterator (Table (Supplier))) returns (int);
function model_get_s_suppkey#38(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Supplier)) :: hasNext(iter) ==> get_s_suppkey#38(iter) == model_get_s_suppkey#38(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ps_partkey#39(arg0: Iterator (Table (Partsupp))) returns (int);
function model_get_ps_partkey#39(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Partsupp)) :: hasNext(iter) ==> get_ps_partkey#39(iter) == model_get_ps_partkey#39(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ps_suppkey#40(arg0: Iterator (Table (Partsupp))) returns (int);
function model_get_ps_suppkey#40(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Partsupp)) :: hasNext(iter) ==> get_ps_suppkey#40(iter) == model_get_ps_suppkey#40(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_c_custkey#41(arg0: Iterator (Table (Customer))) returns (int);
function model_get_c_custkey#41(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Customer)) :: hasNext(iter) ==> get_c_custkey#41(iter) == model_get_c_custkey#41(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_o_orderkey#42(arg0: Iterator (Table (Orders))) returns (int);
function model_get_o_orderkey#42(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Orders)) :: hasNext(iter) ==> get_o_orderkey#42(iter) == model_get_o_orderkey#42(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_l_orderkey#43(arg0: Iterator (Table (Lineitem))) returns (int);
function model_get_l_orderkey#43(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Lineitem)) :: hasNext(iter) ==> get_l_orderkey#43(iter) == model_get_l_orderkey#43(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_l_linenumber#44(arg0: Iterator (Table (Lineitem))) returns (int);
function model_get_l_linenumber#44(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Lineitem)) :: hasNext(iter) ==> get_l_linenumber#44(iter) == model_get_l_linenumber#44(iter_n(iter), iter_m(iter), iter_position(iter)));
type Table a;
type Region;
type Nation;
type Part;
type Supplier;
type Partsupp;
type Customer;
type Orders;
type Lineitem;
type Row a;
function construct_Row_Region(r_regionkey: int, r_name: String, r_comment: String): Row (Table Region);
axiom (forall
    r_regionkey_1: int, r_name_1: String, r_comment_1: String,
    r_regionkey_2: int, r_name_2: String, r_comment_2: String
    ::
    construct_Row_Region(r_regionkey_1, r_name_1, r_comment_1) == construct_Row_Region(r_regionkey_2, r_name_2, r_comment_2)
    <==>
    (r_regionkey_1 == r_regionkey_2 && r_name_1 == r_name_2 && r_comment_1 == r_comment_2)
);
function construct_Row_Nation(n_nationkey: int, n_name: String, n_regionkey: int, n_comment: String): Row (Table Nation);
axiom (forall
    n_nationkey_1: int, n_name_1: String, n_regionkey_1: int, n_comment_1: String,
    n_nationkey_2: int, n_name_2: String, n_regionkey_2: int, n_comment_2: String
    ::
    construct_Row_Nation(n_nationkey_1, n_name_1, n_regionkey_1, n_comment_1) == construct_Row_Nation(n_nationkey_2, n_name_2, n_regionkey_2, n_comment_2)
    <==>
    (n_nationkey_1 == n_nationkey_2 && n_name_1 == n_name_2 && n_regionkey_1 == n_regionkey_2 && n_comment_1 == n_comment_2)
);
function construct_Row_Part(p_partkey: int, p_name: String, p_mfgr: String, p_brand: String, p_type: String, p_size: int, p_container: String, p_retailprice: real, p_comment: String): Row (Table Part);
axiom (forall
    p_partkey_1: int, p_name_1: String, p_mfgr_1: String, p_brand_1: String, p_type_1: String, p_size_1: int, p_container_1: String, p_retailprice_1: real, p_comment_1: String,
    p_partkey_2: int, p_name_2: String, p_mfgr_2: String, p_brand_2: String, p_type_2: String, p_size_2: int, p_container_2: String, p_retailprice_2: real, p_comment_2: String
    ::
    construct_Row_Part(p_partkey_1, p_name_1, p_mfgr_1, p_brand_1, p_type_1, p_size_1, p_container_1, p_retailprice_1, p_comment_1) == construct_Row_Part(p_partkey_2, p_name_2, p_mfgr_2, p_brand_2, p_type_2, p_size_2, p_container_2, p_retailprice_2, p_comment_2)
    <==>
    (p_partkey_1 == p_partkey_2 && p_name_1 == p_name_2 && p_mfgr_1 == p_mfgr_2 && p_brand_1 == p_brand_2 && p_type_1 == p_type_2 && p_size_1 == p_size_2 && p_container_1 == p_container_2 && p_retailprice_1 == p_retailprice_2 && p_comment_1 == p_comment_2)
);
function construct_Row_Supplier(s_suppkey: int, s_name: String, s_address: String, s_nationkey: int, s_phone: String, s_acctbal: real, s_comment: String): Row (Table Supplier);
axiom (forall
    s_suppkey_1: int, s_name_1: String, s_address_1: String, s_nationkey_1: int, s_phone_1: String, s_acctbal_1: real, s_comment_1: String,
    s_suppkey_2: int, s_name_2: String, s_address_2: String, s_nationkey_2: int, s_phone_2: String, s_acctbal_2: real, s_comment_2: String
    ::
    construct_Row_Supplier(s_suppkey_1, s_name_1, s_address_1, s_nationkey_1, s_phone_1, s_acctbal_1, s_comment_1) == construct_Row_Supplier(s_suppkey_2, s_name_2, s_address_2, s_nationkey_2, s_phone_2, s_acctbal_2, s_comment_2)
    <==>
    (s_suppkey_1 == s_suppkey_2 && s_name_1 == s_name_2 && s_address_1 == s_address_2 && s_nationkey_1 == s_nationkey_2 && s_phone_1 == s_phone_2 && s_acctbal_1 == s_acctbal_2 && s_comment_1 == s_comment_2)
);
function construct_Row_Partsupp(ps_partkey: int, ps_suppkey: int, ps_availqty: int, ps_supplycost: real, ps_comment: String): Row (Table Partsupp);
axiom (forall
    ps_partkey_1: int, ps_suppkey_1: int, ps_availqty_1: int, ps_supplycost_1: real, ps_comment_1: String,
    ps_partkey_2: int, ps_suppkey_2: int, ps_availqty_2: int, ps_supplycost_2: real, ps_comment_2: String
    ::
    construct_Row_Partsupp(ps_partkey_1, ps_suppkey_1, ps_availqty_1, ps_supplycost_1, ps_comment_1) == construct_Row_Partsupp(ps_partkey_2, ps_suppkey_2, ps_availqty_2, ps_supplycost_2, ps_comment_2)
    <==>
    (ps_partkey_1 == ps_partkey_2 && ps_suppkey_1 == ps_suppkey_2 && ps_availqty_1 == ps_availqty_2 && ps_supplycost_1 == ps_supplycost_2 && ps_comment_1 == ps_comment_2)
);
function construct_Row_Customer(c_custkey: int, c_name: String, c_address: String, c_nationkey: int, c_phone: String, c_acctbal: real, c_mktsegment: String, c_comment: String): Row (Table Customer);
axiom (forall
    c_custkey_1: int, c_name_1: String, c_address_1: String, c_nationkey_1: int, c_phone_1: String, c_acctbal_1: real, c_mktsegment_1: String, c_comment_1: String,
    c_custkey_2: int, c_name_2: String, c_address_2: String, c_nationkey_2: int, c_phone_2: String, c_acctbal_2: real, c_mktsegment_2: String, c_comment_2: String
    ::
    construct_Row_Customer(c_custkey_1, c_name_1, c_address_1, c_nationkey_1, c_phone_1, c_acctbal_1, c_mktsegment_1, c_comment_1) == construct_Row_Customer(c_custkey_2, c_name_2, c_address_2, c_nationkey_2, c_phone_2, c_acctbal_2, c_mktsegment_2, c_comment_2)
    <==>
    (c_custkey_1 == c_custkey_2 && c_name_1 == c_name_2 && c_address_1 == c_address_2 && c_nationkey_1 == c_nationkey_2 && c_phone_1 == c_phone_2 && c_acctbal_1 == c_acctbal_2 && c_mktsegment_1 == c_mktsegment_2 && c_comment_1 == c_comment_2)
);
function construct_Row_Orders(o_orderkey: int, o_custkey: int, o_orderstatus: String, o_totalprice: real, o_orderdate: int, o_orderpriority: String, o_clerk: String, o_shippriority: int, o_comment: String): Row (Table Orders);
axiom (forall
    o_orderkey_1: int, o_custkey_1: int, o_orderstatus_1: String, o_totalprice_1: real, o_orderdate_1: int, o_orderpriority_1: String, o_clerk_1: String, o_shippriority_1: int, o_comment_1: String,
    o_orderkey_2: int, o_custkey_2: int, o_orderstatus_2: String, o_totalprice_2: real, o_orderdate_2: int, o_orderpriority_2: String, o_clerk_2: String, o_shippriority_2: int, o_comment_2: String
    ::
    construct_Row_Orders(o_orderkey_1, o_custkey_1, o_orderstatus_1, o_totalprice_1, o_orderdate_1, o_orderpriority_1, o_clerk_1, o_shippriority_1, o_comment_1) == construct_Row_Orders(o_orderkey_2, o_custkey_2, o_orderstatus_2, o_totalprice_2, o_orderdate_2, o_orderpriority_2, o_clerk_2, o_shippriority_2, o_comment_2)
    <==>
    (o_orderkey_1 == o_orderkey_2 && o_custkey_1 == o_custkey_2 && o_orderstatus_1 == o_orderstatus_2 && o_totalprice_1 == o_totalprice_2 && o_orderdate_1 == o_orderdate_2 && o_orderpriority_1 == o_orderpriority_2 && o_clerk_1 == o_clerk_2 && o_shippriority_1 == o_shippriority_2 && o_comment_1 == o_comment_2)
);
function construct_Row_Lineitem(l_orderkey: int, l_linenumber: int, l_partkey: int, l_suppkey: int, l_quantity: real, l_extendedprice: real, l_discount: real, l_tax: real, l_returnflag: String, l_linestatus: String, l_shipdate: int, l_commitdate: int, l_receiptdate: int, l_shipinstruct: String, l_shipmode: String, l_comment: String): Row (Table Lineitem);
axiom (forall
    l_orderkey_1: int, l_linenumber_1: int, l_partkey_1: int, l_suppkey_1: int, l_quantity_1: real, l_extendedprice_1: real, l_discount_1: real, l_tax_1: real, l_returnflag_1: String, l_linestatus_1: String, l_shipdate_1: int, l_commitdate_1: int, l_receiptdate_1: int, l_shipinstruct_1: String, l_shipmode_1: String, l_comment_1: String,
    l_orderkey_2: int, l_linenumber_2: int, l_partkey_2: int, l_suppkey_2: int, l_quantity_2: real, l_extendedprice_2: real, l_discount_2: real, l_tax_2: real, l_returnflag_2: String, l_linestatus_2: String, l_shipdate_2: int, l_commitdate_2: int, l_receiptdate_2: int, l_shipinstruct_2: String, l_shipmode_2: String, l_comment_2: String
    ::
    construct_Row_Lineitem(l_orderkey_1, l_linenumber_1, l_partkey_1, l_suppkey_1, l_quantity_1, l_extendedprice_1, l_discount_1, l_tax_1, l_returnflag_1, l_linestatus_1, l_shipdate_1, l_commitdate_1, l_receiptdate_1, l_shipinstruct_1, l_shipmode_1, l_comment_1) == construct_Row_Lineitem(l_orderkey_2, l_linenumber_2, l_partkey_2, l_suppkey_2, l_quantity_2, l_extendedprice_2, l_discount_2, l_tax_2, l_returnflag_2, l_linestatus_2, l_shipdate_2, l_commitdate_2, l_receiptdate_2, l_shipinstruct_2, l_shipmode_2, l_comment_2)
    <==>
    (l_orderkey_1 == l_orderkey_2 && l_linenumber_1 == l_linenumber_2 && l_partkey_1 == l_partkey_2 && l_suppkey_1 == l_suppkey_2 && l_quantity_1 == l_quantity_2 && l_extendedprice_1 == l_extendedprice_2 && l_discount_1 == l_discount_2 && l_tax_1 == l_tax_2 && l_returnflag_1 == l_returnflag_2 && l_linestatus_1 == l_linestatus_2 && l_shipdate_1 == l_shipdate_2 && l_commitdate_1 == l_commitdate_2 && l_receiptdate_1 == l_receiptdate_2 && l_shipinstruct_1 == l_shipinstruct_2 && l_shipmode_1 == l_shipmode_2 && l_comment_1 == l_comment_2)
);
var Part_p_type : [int]String;
var Part_p_retailprice : [int]real;
var Orders_o_orderstatus : [int]String;
var Customer_c_comment : [int]String;
var Lineitem_l_partkey : [int][int]int;
var Lineitem_l_shipmode : [int][int]String;
var Lineitem_l_shipinstruct : [int][int]String;
var Lineitem_l_linenumber : [int][int]int;
var Partsupp_ps_partkey : [int][int]int;
var Customer_c_phone : [int]String;
var Lineitem_l_orderkey : [int][int]int;
var Supplier_s_suppkey : [int]int;
var Part_p_size : [int]int;
var Lineitem_l_comment : [int][int]String;
var Lineitem_l_extendedprice : [int][int]real;
var Supplier_s_address : [int]String;
var Supplier_s_acctbal : [int]real;
var Customer_c_nationkey : [int]int;
var Customer_c_name : [int]String;
var Lineitem_l_tax : [int][int]real;
var Lineitem_l_commitdate : [int][int]int;
const TBL_Customer : Table (Customer);
var Lineitem_l_quantity : [int][int]real;
var Orders_o_orderdate : [int]int;
var Region_r_name : [int]String;
var Orders_o_orderpriority : [int]String;
var Lineitem_l_receiptdate : [int][int]int;
var Orders_o_shippriority : [int]int;
var Lineitem_l_discount : [int][int]real;
const TBL_Partsupp : Table (Partsupp);
var Part_p_partkey : [int]int;
const __slice__ : int;
var Orders_o_custkey : [int]int;
var Orders_o_totalprice : [int]real;
const TBL_Supplier : Table (Supplier);
var Lineitem_l_suppkey : [int][int]int;
var Customer_c_mktsegment : [int]String;
var Supplier_s_nationkey : [int]int;
var Part_p_name : [int]String;
var Customer_c_custkey : [int]int;
var Nation_n_regionkey : [int]int;
var Part_p_mfgr : [int]String;
var Nation_n_comment : [int]String;
var Region_r_regionkey : [int]int;
var Part_p_container : [int]String;
var Part_p_comment : [int]String;
var Supplier_s_comment : [int]String;
var Customer_c_address : [int]String;
var Orders_o_comment : [int]String;
var Lineitem_l_shipdate : [int][int]int;
const __shards__ : int;
var Region_r_comment : [int]String;
var Supplier_s_phone : [int]String;
const TBL_Nation : Table (Nation);
var Nation_n_name : [int]String;
var Lineitem_l_returnflag : [int][int]String;
var Nation_n_nationkey : [int]int;
var Part_p_brand : [int]String;
var Lineitem_l_linestatus : [int][int]String;
var Supplier_s_name : [int]String;
var Customer_c_acctbal : [int]real;
const TBL_Lineitem : Table (Lineitem);
const TBL_Part : Table (Part);
var Partsupp_ps_availqty : [int][int]int;
var Partsupp_ps_comment : [int][int]String;
var Orders_o_orderkey : [int]int;
const TBL_Orders : Table (Orders);
var Partsupp_ps_suppkey : [int][int]int;
var Partsupp_ps_supplycost : [int][int]real;
var Orders_o_clerk : [int]String;
const TBL_Region : Table (Region);
procedure verify_hop_partitions_Q12(orderkey: int, linenumber: int)
{
  var s19_o#o_orderpriority : String;
  var s19_orderkey : int;
  var s19_l#l_shipmode : String;
  var s19_linenumber : int;
  var s19_mode : String;
  var s19_#tmp60 : unit;
  var s19_priority : String;
  var s19_#tmp61 : unit;

  // Hop partition verification for function 'Q12'
  s19_block19:
    s19_o#o_orderpriority := Orders_o_orderpriority[s19_orderkey];
    s19_l#l_shipmode := Lineitem_l_shipmode[s19_orderkey][s19_linenumber];
  // Partition check hop 19 func 'f' tables 'Orders'=>'Lineitem' keys [k0=orderkey] first_span Span { start: 8214, end: 8242, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpch.transact" } current_span Span { start: 8275, end: 8331, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpch.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 24) (hop_id . 19) (table_id . 7) (span ((start . 8275) (end . 8331) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpch.transact\"))))"} (s19_orderkey == s19_orderkey);
    s19_mode := s19_l#l_shipmode;
    s19_#tmp60 := to_unit(s19_mode);
    s19_priority := s19_o#o_orderpriority;
    s19_#tmp61 := to_unit(s19_priority);
    goto s19_epilogue;
  s19_hop_exit:
  s19_epilogue:
}

