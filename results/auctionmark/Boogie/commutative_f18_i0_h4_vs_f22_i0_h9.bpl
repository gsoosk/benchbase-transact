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
function get_u_id#28(arg0: Iterator (Table (USERACCT))) returns (int);
function model_get_u_id#28(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (USERACCT)) :: hasNext(iter) ==> get_u_id#28(iter) == model_get_u_id#28(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_r_id#29(arg0: Iterator (Table (REGION))) returns (int);
function model_get_r_id#29(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (REGION)) :: hasNext(iter) ==> get_r_id#29(iter) == model_get_r_id#29(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_i_id#30(arg0: Iterator (Table (ITEM))) returns (int);
function model_get_i_id#30(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (ITEM)) :: hasNext(iter) ==> get_i_id#30(iter) == model_get_i_id#30(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_i_u_id#31(arg0: Iterator (Table (ITEM))) returns (int);
function model_get_i_u_id#31(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (ITEM)) :: hasNext(iter) ==> get_i_u_id#31(iter) == model_get_i_u_id#31(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ib_id#32(arg0: Iterator (Table (ITEM_BID))) returns (int);
function model_get_ib_id#32(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (ITEM_BID)) :: hasNext(iter) ==> get_ib_id#32(iter) == model_get_ib_id#32(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ib_i_id#33(arg0: Iterator (Table (ITEM_BID))) returns (int);
function model_get_ib_i_id#33(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (ITEM_BID)) :: hasNext(iter) ==> get_ib_i_id#33(iter) == model_get_ib_i_id#33(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ib_u_id#34(arg0: Iterator (Table (ITEM_BID))) returns (int);
function model_get_ib_u_id#34(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (ITEM_BID)) :: hasNext(iter) ==> get_ib_u_id#34(iter) == model_get_ib_u_id#34(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_imb_i_id#35(arg0: Iterator (Table (ITEM_MAX_BID))) returns (int);
function model_get_imb_i_id#35(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (ITEM_MAX_BID)) :: hasNext(iter) ==> get_imb_i_id#35(iter) == model_get_imb_i_id#35(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_imb_u_id#36(arg0: Iterator (Table (ITEM_MAX_BID))) returns (int);
function model_get_imb_u_id#36(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (ITEM_MAX_BID)) :: hasNext(iter) ==> get_imb_u_id#36(iter) == model_get_imb_u_id#36(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ic_id#37(arg0: Iterator (Table (ITEM_COMMENT))) returns (int);
function model_get_ic_id#37(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (ITEM_COMMENT)) :: hasNext(iter) ==> get_ic_id#37(iter) == model_get_ic_id#37(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ic_i_id#38(arg0: Iterator (Table (ITEM_COMMENT))) returns (int);
function model_get_ic_i_id#38(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (ITEM_COMMENT)) :: hasNext(iter) ==> get_ic_i_id#38(iter) == model_get_ic_i_id#38(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ic_u_id#39(arg0: Iterator (Table (ITEM_COMMENT))) returns (int);
function model_get_ic_u_id#39(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (ITEM_COMMENT)) :: hasNext(iter) ==> get_ic_u_id#39(iter) == model_get_ic_u_id#39(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ui_u_id#40(arg0: Iterator (Table (USERACCT_ITEM))) returns (int);
function model_get_ui_u_id#40(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (USERACCT_ITEM)) :: hasNext(iter) ==> get_ui_u_id#40(iter) == model_get_ui_u_id#40(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ui_i_id#41(arg0: Iterator (Table (USERACCT_ITEM))) returns (int);
function model_get_ui_i_id#41(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (USERACCT_ITEM)) :: hasNext(iter) ==> get_ui_i_id#41(iter) == model_get_ui_i_id#41(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ui_i_u_id#42(arg0: Iterator (Table (USERACCT_ITEM))) returns (int);
function model_get_ui_i_u_id#42(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (USERACCT_ITEM)) :: hasNext(iter) ==> get_ui_i_u_id#42(iter) == model_get_ui_i_u_id#42(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_uf_u_id#43(arg0: Iterator (Table (USERACCT_FEEDBACK))) returns (int);
function model_get_uf_u_id#43(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (USERACCT_FEEDBACK)) :: hasNext(iter) ==> get_uf_u_id#43(iter) == model_get_uf_u_id#43(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_uf_i_id#44(arg0: Iterator (Table (USERACCT_FEEDBACK))) returns (int);
function model_get_uf_i_id#44(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (USERACCT_FEEDBACK)) :: hasNext(iter) ==> get_uf_i_id#44(iter) == model_get_uf_i_id#44(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_uf_i_u_id#45(arg0: Iterator (Table (USERACCT_FEEDBACK))) returns (int);
function model_get_uf_i_u_id#45(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (USERACCT_FEEDBACK)) :: hasNext(iter) ==> get_uf_i_u_id#45(iter) == model_get_uf_i_u_id#45(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_uf_from_id#46(arg0: Iterator (Table (USERACCT_FEEDBACK))) returns (int);
function model_get_uf_from_id#46(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (USERACCT_FEEDBACK)) :: hasNext(iter) ==> get_uf_from_id#46(iter) == model_get_uf_from_id#46(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_uw_u_id#47(arg0: Iterator (Table (USERACCT_WATCH))) returns (int);
function model_get_uw_u_id#47(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (USERACCT_WATCH)) :: hasNext(iter) ==> get_uw_u_id#47(iter) == model_get_uw_u_id#47(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_uw_i_id#48(arg0: Iterator (Table (USERACCT_WATCH))) returns (int);
function model_get_uw_i_id#48(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (USERACCT_WATCH)) :: hasNext(iter) ==> get_uw_i_id#48(iter) == model_get_uw_i_id#48(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_uw_i_u_id#49(arg0: Iterator (Table (USERACCT_WATCH))) returns (int);
function model_get_uw_i_u_id#49(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (USERACCT_WATCH)) :: hasNext(iter) ==> get_uw_i_u_id#49(iter) == model_get_uw_i_u_id#49(iter_n(iter), iter_m(iter), iter_position(iter)));
type Table a;
type USERACCT;
type REGION;
type ITEM;
type ITEM_BID;
type ITEM_MAX_BID;
type ITEM_COMMENT;
type USERACCT_ITEM;
type USERACCT_FEEDBACK;
type USERACCT_WATCH;
type Row a;
function construct_Row_USERACCT(u_id: int, u_rating: int, u_balance: real, u_comments: int, u_r_id: int, u_sattr0: String, u_sattr1: String, u_sattr2: String, u_sattr3: String, u_sattr4: String): Row (Table USERACCT);
axiom (forall
    u_id_1: int, u_rating_1: int, u_balance_1: real, u_comments_1: int, u_r_id_1: int, u_sattr0_1: String, u_sattr1_1: String, u_sattr2_1: String, u_sattr3_1: String, u_sattr4_1: String,
    u_id_2: int, u_rating_2: int, u_balance_2: real, u_comments_2: int, u_r_id_2: int, u_sattr0_2: String, u_sattr1_2: String, u_sattr2_2: String, u_sattr3_2: String, u_sattr4_2: String
    ::
    construct_Row_USERACCT(u_id_1, u_rating_1, u_balance_1, u_comments_1, u_r_id_1, u_sattr0_1, u_sattr1_1, u_sattr2_1, u_sattr3_1, u_sattr4_1) == construct_Row_USERACCT(u_id_2, u_rating_2, u_balance_2, u_comments_2, u_r_id_2, u_sattr0_2, u_sattr1_2, u_sattr2_2, u_sattr3_2, u_sattr4_2)
    <==>
    (u_id_1 == u_id_2 && u_rating_1 == u_rating_2 && u_balance_1 == u_balance_2 && u_comments_1 == u_comments_2 && u_r_id_1 == u_r_id_2 && u_sattr0_1 == u_sattr0_2 && u_sattr1_1 == u_sattr1_2 && u_sattr2_1 == u_sattr2_2 && u_sattr3_1 == u_sattr3_2 && u_sattr4_1 == u_sattr4_2)
);
function construct_Row_REGION(r_id: int, r_name: String): Row (Table REGION);
axiom (forall
    r_id_1: int, r_name_1: String,
    r_id_2: int, r_name_2: String
    ::
    construct_Row_REGION(r_id_1, r_name_1) == construct_Row_REGION(r_id_2, r_name_2)
    <==>
    (r_id_1 == r_id_2 && r_name_1 == r_name_2)
);
function construct_Row_ITEM(i_id: int, i_u_id: int, i_name: String, i_initial_price: real, i_current_price: real, i_num_bids: int, i_end_date: int, i_start_date: int, i_status: int, i_num_comments: int, i_c_id: int): Row (Table ITEM);
axiom (forall
    i_id_1: int, i_u_id_1: int, i_name_1: String, i_initial_price_1: real, i_current_price_1: real, i_num_bids_1: int, i_end_date_1: int, i_start_date_1: int, i_status_1: int, i_num_comments_1: int, i_c_id_1: int,
    i_id_2: int, i_u_id_2: int, i_name_2: String, i_initial_price_2: real, i_current_price_2: real, i_num_bids_2: int, i_end_date_2: int, i_start_date_2: int, i_status_2: int, i_num_comments_2: int, i_c_id_2: int
    ::
    construct_Row_ITEM(i_id_1, i_u_id_1, i_name_1, i_initial_price_1, i_current_price_1, i_num_bids_1, i_end_date_1, i_start_date_1, i_status_1, i_num_comments_1, i_c_id_1) == construct_Row_ITEM(i_id_2, i_u_id_2, i_name_2, i_initial_price_2, i_current_price_2, i_num_bids_2, i_end_date_2, i_start_date_2, i_status_2, i_num_comments_2, i_c_id_2)
    <==>
    (i_id_1 == i_id_2 && i_u_id_1 == i_u_id_2 && i_name_1 == i_name_2 && i_initial_price_1 == i_initial_price_2 && i_current_price_1 == i_current_price_2 && i_num_bids_1 == i_num_bids_2 && i_end_date_1 == i_end_date_2 && i_start_date_1 == i_start_date_2 && i_status_1 == i_status_2 && i_num_comments_1 == i_num_comments_2 && i_c_id_1 == i_c_id_2)
);
function construct_Row_ITEM_BID(ib_id: int, ib_i_id: int, ib_u_id: int, ib_buyer_id: int, ib_bid: real, ib_max_bid: real): Row (Table ITEM_BID);
axiom (forall
    ib_id_1: int, ib_i_id_1: int, ib_u_id_1: int, ib_buyer_id_1: int, ib_bid_1: real, ib_max_bid_1: real,
    ib_id_2: int, ib_i_id_2: int, ib_u_id_2: int, ib_buyer_id_2: int, ib_bid_2: real, ib_max_bid_2: real
    ::
    construct_Row_ITEM_BID(ib_id_1, ib_i_id_1, ib_u_id_1, ib_buyer_id_1, ib_bid_1, ib_max_bid_1) == construct_Row_ITEM_BID(ib_id_2, ib_i_id_2, ib_u_id_2, ib_buyer_id_2, ib_bid_2, ib_max_bid_2)
    <==>
    (ib_id_1 == ib_id_2 && ib_i_id_1 == ib_i_id_2 && ib_u_id_1 == ib_u_id_2 && ib_buyer_id_1 == ib_buyer_id_2 && ib_bid_1 == ib_bid_2 && ib_max_bid_1 == ib_max_bid_2)
);
function construct_Row_ITEM_MAX_BID(imb_i_id: int, imb_u_id: int, imb_ib_id: int, imb_ib_i_id: int, imb_ib_u_id: int): Row (Table ITEM_MAX_BID);
axiom (forall
    imb_i_id_1: int, imb_u_id_1: int, imb_ib_id_1: int, imb_ib_i_id_1: int, imb_ib_u_id_1: int,
    imb_i_id_2: int, imb_u_id_2: int, imb_ib_id_2: int, imb_ib_i_id_2: int, imb_ib_u_id_2: int
    ::
    construct_Row_ITEM_MAX_BID(imb_i_id_1, imb_u_id_1, imb_ib_id_1, imb_ib_i_id_1, imb_ib_u_id_1) == construct_Row_ITEM_MAX_BID(imb_i_id_2, imb_u_id_2, imb_ib_id_2, imb_ib_i_id_2, imb_ib_u_id_2)
    <==>
    (imb_i_id_1 == imb_i_id_2 && imb_u_id_1 == imb_u_id_2 && imb_ib_id_1 == imb_ib_id_2 && imb_ib_i_id_1 == imb_ib_i_id_2 && imb_ib_u_id_1 == imb_ib_u_id_2)
);
function construct_Row_ITEM_COMMENT(ic_id: int, ic_i_id: int, ic_u_id: int, ic_buyer_id: int, ic_question: String, ic_response: String): Row (Table ITEM_COMMENT);
axiom (forall
    ic_id_1: int, ic_i_id_1: int, ic_u_id_1: int, ic_buyer_id_1: int, ic_question_1: String, ic_response_1: String,
    ic_id_2: int, ic_i_id_2: int, ic_u_id_2: int, ic_buyer_id_2: int, ic_question_2: String, ic_response_2: String
    ::
    construct_Row_ITEM_COMMENT(ic_id_1, ic_i_id_1, ic_u_id_1, ic_buyer_id_1, ic_question_1, ic_response_1) == construct_Row_ITEM_COMMENT(ic_id_2, ic_i_id_2, ic_u_id_2, ic_buyer_id_2, ic_question_2, ic_response_2)
    <==>
    (ic_id_1 == ic_id_2 && ic_i_id_1 == ic_i_id_2 && ic_u_id_1 == ic_u_id_2 && ic_buyer_id_1 == ic_buyer_id_2 && ic_question_1 == ic_question_2 && ic_response_1 == ic_response_2)
);
function construct_Row_USERACCT_ITEM(ui_u_id: int, ui_i_id: int, ui_i_u_id: int): Row (Table USERACCT_ITEM);
axiom (forall
    ui_u_id_1: int, ui_i_id_1: int, ui_i_u_id_1: int,
    ui_u_id_2: int, ui_i_id_2: int, ui_i_u_id_2: int
    ::
    construct_Row_USERACCT_ITEM(ui_u_id_1, ui_i_id_1, ui_i_u_id_1) == construct_Row_USERACCT_ITEM(ui_u_id_2, ui_i_id_2, ui_i_u_id_2)
    <==>
    (ui_u_id_1 == ui_u_id_2 && ui_i_id_1 == ui_i_id_2 && ui_i_u_id_1 == ui_i_u_id_2)
);
function construct_Row_USERACCT_FEEDBACK(uf_u_id: int, uf_i_id: int, uf_i_u_id: int, uf_from_id: int, uf_rating: int): Row (Table USERACCT_FEEDBACK);
axiom (forall
    uf_u_id_1: int, uf_i_id_1: int, uf_i_u_id_1: int, uf_from_id_1: int, uf_rating_1: int,
    uf_u_id_2: int, uf_i_id_2: int, uf_i_u_id_2: int, uf_from_id_2: int, uf_rating_2: int
    ::
    construct_Row_USERACCT_FEEDBACK(uf_u_id_1, uf_i_id_1, uf_i_u_id_1, uf_from_id_1, uf_rating_1) == construct_Row_USERACCT_FEEDBACK(uf_u_id_2, uf_i_id_2, uf_i_u_id_2, uf_from_id_2, uf_rating_2)
    <==>
    (uf_u_id_1 == uf_u_id_2 && uf_i_id_1 == uf_i_id_2 && uf_i_u_id_1 == uf_i_u_id_2 && uf_from_id_1 == uf_from_id_2 && uf_rating_1 == uf_rating_2)
);
function construct_Row_USERACCT_WATCH(uw_u_id: int, uw_i_id: int, uw_i_u_id: int): Row (Table USERACCT_WATCH);
axiom (forall
    uw_u_id_1: int, uw_i_id_1: int, uw_i_u_id_1: int,
    uw_u_id_2: int, uw_i_id_2: int, uw_i_u_id_2: int
    ::
    construct_Row_USERACCT_WATCH(uw_u_id_1, uw_i_id_1, uw_i_u_id_1) == construct_Row_USERACCT_WATCH(uw_u_id_2, uw_i_id_2, uw_i_u_id_2)
    <==>
    (uw_u_id_1 == uw_u_id_2 && uw_i_id_1 == uw_i_id_2 && uw_i_u_id_1 == uw_i_u_id_2)
);
var ITEM_i_status : [int][int]int;
const TBL_USERACCT_WATCH : Table (USERACCT_WATCH);
const ITEM_STATUS_OPEN : int;
var ITEM_i_start_date : [int][int]int;
var USERACCT_FEEDBACK_uf_rating : [int][int][int][int]int;
const TBL_ITEM_BID : Table (ITEM_BID);
var ITEM_i_current_price : [int][int]real;
var USERACCT_u_sattr1 : [int]String;
var ITEM_BID_ib_id : [int][int][int]int;
const ITEM_STATUS_WAITING_FOR_PURCHASE : int;
var ITEM_COMMENT_ic_u_id : [int][int][int]int;
var ITEM_MAX_BID_imb_i_id : [int][int]int;
var ITEM_MAX_BID_imb_ib_i_id : [int][int]int;
const TBL_USERACCT_ITEM : Table (USERACCT_ITEM);
var USERACCT_WATCH_uw_i_u_id : [int][int][int]int;
var ITEM_BID_ib_max_bid : [int][int][int]real;
const TBL_ITEM : Table (ITEM);
var USERACCT_ITEM_ui_i_u_id : [int][int][int]int;
var ITEM_i_num_comments : [int][int]int;
const TBL_USERACCT_FEEDBACK : Table (USERACCT_FEEDBACK);
var USERACCT_FEEDBACK_uf_i_u_id : [int][int][int][int]int;
var ITEM_i_c_id : [int][int]int;
var USERACCT_u_id : [int]int;
var ITEM_COMMENT_ic_buyer_id : [int][int][int]int;
var USERACCT_WATCH_uw_u_id : [int][int][int]int;
const ITEM_STATUS_CLOSED : int;
const TBL_ITEM_MAX_BID : Table (ITEM_MAX_BID);
var USERACCT_u_sattr4 : [int]String;
const __slice__ : int;
var ITEM_BID_ib_u_id : [int][int][int]int;
var USERACCT_WATCH_uw_i_id : [int][int][int]int;
var USERACCT_ITEM_ui_u_id : [int][int][int]int;
var ITEM_MAX_BID_imb_u_id : [int][int]int;
var USERACCT_u_comments : [int]int;
const TBL_REGION : Table (REGION);
var USERACCT_u_sattr2 : [int]String;
var ITEM_COMMENT_ic_i_id : [int][int][int]int;
var ITEM_COMMENT_ic_id : [int][int][int]int;
var USERACCT_u_rating : [int]int;
var ITEM_MAX_BID_imb_ib_id : [int][int]int;
var USERACCT_u_balance : [int]real;
var USERACCT_FEEDBACK_uf_u_id : [int][int][int][int]int;
const __shards__ : int;
var ITEM_i_end_date : [int][int]int;
var USERACCT_u_r_id : [int]int;
var ITEM_BID_ib_buyer_id : [int][int][int]int;
var REGION_r_name : [int]String;
var ITEM_i_initial_price : [int][int]real;
const TBL_ITEM_COMMENT : Table (ITEM_COMMENT);
var ITEM_i_name : [int][int]String;
var ITEM_i_u_id : [int][int]int;
var ITEM_BID_ib_i_id : [int][int][int]int;
var ITEM_COMMENT_ic_question : [int][int][int]String;
var USERACCT_u_sattr0 : [int]String;
var REGION_r_id : [int]int;
var ITEM_i_id : [int][int]int;
var ITEM_BID_ib_bid : [int][int][int]real;
var USERACCT_u_sattr3 : [int]String;
var ITEM_MAX_BID_imb_ib_u_id : [int][int]int;
var ITEM_COMMENT_ic_response : [int][int][int]String;
var USERACCT_FEEDBACK_uf_i_id : [int][int][int][int]int;
var USERACCT_FEEDBACK_uf_from_id : [int][int][int][int]int;
const TBL_USERACCT : Table (USERACCT);
var ITEM_i_num_bids : [int][int]int;
var USERACCT_ITEM_ui_i_id : [int][int][int]int;
procedure Check_SliceCommut_Hop4_vs_Hop9()
modifies ITEM_COMMENT_ic_buyer_id, ITEM_COMMENT_ic_question, ITEM_COMMENT_ic_response, ITEM_i_c_id, ITEM_i_current_price, ITEM_i_end_date, ITEM_i_id, ITEM_i_initial_price, ITEM_i_name, ITEM_i_num_bids, ITEM_i_num_comments, ITEM_i_start_date, ITEM_i_status, ITEM_i_u_id, USERACCT_u_balance, USERACCT_u_comments, USERACCT_u_id, USERACCT_u_r_id, USERACCT_u_rating, USERACCT_u_sattr0, USERACCT_u_sattr1, USERACCT_u_sattr2, USERACCT_u_sattr3, USERACCT_u_sattr4;
{
  var s0_item_id : int;
  var s0_seller_id : int;
  var s1_item_id : int;
  var s1_seller_id : int;
  var s1_buyer_id : int;
  var s1_comment_id : int;
  var s1_question : String;
  var s0_active : bool;
  var s1_active : bool;
  var ITEM_COMMENT_ic_buyer_id_init : [int][int][int]int;
  var ITEM_COMMENT_ic_question_init : [int][int][int]String;
  var ITEM_COMMENT_ic_response_init : [int][int][int]String;
  var ITEM_i_c_id_init : [int][int]int;
  var ITEM_i_current_price_init : [int][int]real;
  var ITEM_i_end_date_init : [int][int]int;
  var ITEM_i_id_init : [int][int]int;
  var ITEM_i_initial_price_init : [int][int]real;
  var ITEM_i_name_init : [int][int]String;
  var ITEM_i_num_bids_init : [int][int]int;
  var ITEM_i_num_comments_init : [int][int]int;
  var ITEM_i_start_date_init : [int][int]int;
  var ITEM_i_status_init : [int][int]int;
  var ITEM_i_u_id_init : [int][int]int;
  var USERACCT_u_balance_init : [int]real;
  var USERACCT_u_comments_init : [int]int;
  var USERACCT_u_id_init : [int]int;
  var USERACCT_u_r_id_init : [int]int;
  var USERACCT_u_rating_init : [int]int;
  var USERACCT_u_sattr0_init : [int]String;
  var USERACCT_u_sattr1_init : [int]String;
  var USERACCT_u_sattr2_init : [int]String;
  var USERACCT_u_sattr3_init : [int]String;
  var USERACCT_u_sattr4_init : [int]String;
  var s0_item_id_init : int;
  var s0_seller_id_init : int;
  var s1_item_id_init : int;
  var s1_seller_id_init : int;
  var s1_buyer_id_init : int;
  var s1_comment_id_init : int;
  var s1_question_init : String;
  var s0_item#i_c_id : int;
  var s0_item#i_current_price : real;
  var s0_item#i_end_date : int;
  var s0_item#i_id : int;
  var s0_item#i_initial_price : real;
  var s0_item#i_name : String;
  var s0_item#i_num_bids : int;
  var s0_item#i_num_comments : int;
  var s0_item#i_start_date : int;
  var s0_item#i_u_id : int;
  var s0_item#i_status : int;
  var s1_item#i_c_id : int;
  var s1_item#i_current_price : real;
  var s1_item#i_end_date : int;
  var s1_item#i_id : int;
  var s1_item#i_initial_price : real;
  var s1_item#i_name : String;
  var s1_item#i_num_bids : int;
  var s1_item#i_num_comments : int;
  var s1_item#i_start_date : int;
  var s1_item#i_status : int;
  var s1_item#i_u_id : int;
  var s1_#tmp18 : int;
  var s1_seller#u_balance : real;
  var s1_seller#u_comments : int;
  var s1_seller#u_id : int;
  var s1_seller#u_r_id : int;
  var s1_seller#u_rating : int;
  var s1_seller#u_sattr0 : String;
  var s1_seller#u_sattr1 : String;
  var s1_seller#u_sattr2 : String;
  var s1_seller#u_sattr3 : String;
  var s1_seller#u_sattr4 : String;
  var s1_#tmp20 : int;
  var ITEM_COMMENT_ic_buyer_id_a_then_b : [int][int][int]int;
  var ITEM_COMMENT_ic_question_a_then_b : [int][int][int]String;
  var ITEM_COMMENT_ic_response_a_then_b : [int][int][int]String;
  var ITEM_i_c_id_a_then_b : [int][int]int;
  var ITEM_i_current_price_a_then_b : [int][int]real;
  var ITEM_i_end_date_a_then_b : [int][int]int;
  var ITEM_i_id_a_then_b : [int][int]int;
  var ITEM_i_initial_price_a_then_b : [int][int]real;
  var ITEM_i_name_a_then_b : [int][int]String;
  var ITEM_i_num_bids_a_then_b : [int][int]int;
  var ITEM_i_num_comments_a_then_b : [int][int]int;
  var ITEM_i_start_date_a_then_b : [int][int]int;
  var ITEM_i_status_a_then_b : [int][int]int;
  var ITEM_i_u_id_a_then_b : [int][int]int;
  var USERACCT_u_balance_a_then_b : [int]real;
  var USERACCT_u_comments_a_then_b : [int]int;
  var USERACCT_u_id_a_then_b : [int]int;
  var USERACCT_u_r_id_a_then_b : [int]int;
  var USERACCT_u_rating_a_then_b : [int]int;
  var USERACCT_u_sattr0_a_then_b : [int]String;
  var USERACCT_u_sattr1_a_then_b : [int]String;
  var USERACCT_u_sattr2_a_then_b : [int]String;
  var USERACCT_u_sattr3_a_then_b : [int]String;
  var USERACCT_u_sattr4_a_then_b : [int]String;
  var ITEM_COMMENT_ic_buyer_id_b_then_a : [int][int][int]int;
  var ITEM_COMMENT_ic_question_b_then_a : [int][int][int]String;
  var ITEM_COMMENT_ic_response_b_then_a : [int][int][int]String;
  var ITEM_i_c_id_b_then_a : [int][int]int;
  var ITEM_i_current_price_b_then_a : [int][int]real;
  var ITEM_i_end_date_b_then_a : [int][int]int;
  var ITEM_i_id_b_then_a : [int][int]int;
  var ITEM_i_initial_price_b_then_a : [int][int]real;
  var ITEM_i_name_b_then_a : [int][int]String;
  var ITEM_i_num_bids_b_then_a : [int][int]int;
  var ITEM_i_num_comments_b_then_a : [int][int]int;
  var ITEM_i_start_date_b_then_a : [int][int]int;
  var ITEM_i_status_b_then_a : [int][int]int;
  var ITEM_i_u_id_b_then_a : [int][int]int;
  var USERACCT_u_balance_b_then_a : [int]real;
  var USERACCT_u_comments_b_then_a : [int]int;
  var USERACCT_u_id_b_then_a : [int]int;
  var USERACCT_u_r_id_b_then_a : [int]int;
  var USERACCT_u_rating_b_then_a : [int]int;
  var USERACCT_u_sattr0_b_then_a : [int]String;
  var USERACCT_u_sattr1_b_then_a : [int]String;
  var USERACCT_u_sattr2_b_then_a : [int]String;
  var USERACCT_u_sattr3_b_then_a : [int]String;
  var USERACCT_u_sattr4_b_then_a : [int]String;

  // Slice commutativity verification: hop 4 vs hop 9
  // --- Step 1: Havoc initial state ---
    havoc ITEM_COMMENT_ic_buyer_id;
    havoc ITEM_COMMENT_ic_question;
    havoc ITEM_COMMENT_ic_response;
    havoc ITEM_i_c_id;
    havoc ITEM_i_current_price;
    havoc ITEM_i_end_date;
    havoc ITEM_i_id;
    havoc ITEM_i_initial_price;
    havoc ITEM_i_name;
    havoc ITEM_i_num_bids;
    havoc ITEM_i_num_comments;
    havoc ITEM_i_start_date;
    havoc ITEM_i_status;
    havoc ITEM_i_u_id;
    havoc USERACCT_u_balance;
    havoc USERACCT_u_comments;
    havoc USERACCT_u_id;
    havoc USERACCT_u_r_id;
    havoc USERACCT_u_rating;
    havoc USERACCT_u_sattr0;
    havoc USERACCT_u_sattr1;
    havoc USERACCT_u_sattr2;
    havoc USERACCT_u_sattr3;
    havoc USERACCT_u_sattr4;
    havoc s0_item_id;
    havoc s0_seller_id;
    havoc s1_item_id;
    havoc s1_seller_id;
    havoc s1_buyer_id;
    havoc s1_comment_id;
    havoc s1_question;
    s0_active := true;
    s1_active := true;
  // --- Step 2: Save initial state ---
    ITEM_COMMENT_ic_buyer_id_init := ITEM_COMMENT_ic_buyer_id;
    ITEM_COMMENT_ic_question_init := ITEM_COMMENT_ic_question;
    ITEM_COMMENT_ic_response_init := ITEM_COMMENT_ic_response;
    ITEM_i_c_id_init := ITEM_i_c_id;
    ITEM_i_current_price_init := ITEM_i_current_price;
    ITEM_i_end_date_init := ITEM_i_end_date;
    ITEM_i_id_init := ITEM_i_id;
    ITEM_i_initial_price_init := ITEM_i_initial_price;
    ITEM_i_name_init := ITEM_i_name;
    ITEM_i_num_bids_init := ITEM_i_num_bids;
    ITEM_i_num_comments_init := ITEM_i_num_comments;
    ITEM_i_start_date_init := ITEM_i_start_date;
    ITEM_i_status_init := ITEM_i_status;
    ITEM_i_u_id_init := ITEM_i_u_id;
    USERACCT_u_balance_init := USERACCT_u_balance;
    USERACCT_u_comments_init := USERACCT_u_comments;
    USERACCT_u_id_init := USERACCT_u_id;
    USERACCT_u_r_id_init := USERACCT_u_r_id;
    USERACCT_u_rating_init := USERACCT_u_rating;
    USERACCT_u_sattr0_init := USERACCT_u_sattr0;
    USERACCT_u_sattr1_init := USERACCT_u_sattr1;
    USERACCT_u_sattr2_init := USERACCT_u_sattr2;
    USERACCT_u_sattr3_init := USERACCT_u_sattr3;
    USERACCT_u_sattr4_init := USERACCT_u_sattr4;
    s0_item_id_init := s0_item_id;
    s0_seller_id_init := s0_seller_id;
    s1_item_id_init := s1_item_id;
    s1_seller_id_init := s1_seller_id;
    s1_buyer_id_init := s1_buyer_id;
    s1_comment_id_init := s1_comment_id;
    s1_question_init := s1_question;
  // --- Step 3: Execute special interleavings ---
  // Executing A then B:
    if (s0_active) {
    s0_block4__ab:
      s0_item#i_c_id := ITEM_i_c_id[s0_item_id][s0_seller_id];
      s0_item#i_current_price := ITEM_i_current_price[s0_item_id][s0_seller_id];
      s0_item#i_end_date := ITEM_i_end_date[s0_item_id][s0_seller_id];
      s0_item#i_id := ITEM_i_id[s0_item_id][s0_seller_id];
      s0_item#i_initial_price := ITEM_i_initial_price[s0_item_id][s0_seller_id];
      s0_item#i_name := ITEM_i_name[s0_item_id][s0_seller_id];
      s0_item#i_num_bids := ITEM_i_num_bids[s0_item_id][s0_seller_id];
      s0_item#i_num_comments := ITEM_i_num_comments[s0_item_id][s0_seller_id];
      s0_item#i_start_date := ITEM_i_start_date[s0_item_id][s0_seller_id];
      s0_item#i_u_id := ITEM_i_u_id[s0_item_id][s0_seller_id];
      s0_item#i_status := ITEM_STATUS_CLOSED;
      ITEM_i_c_id := ITEM_i_c_id[s0_item_id := ITEM_i_c_id[s0_item_id][s0_seller_id := s0_item#i_c_id]];
      ITEM_i_current_price := ITEM_i_current_price[s0_item_id := ITEM_i_current_price[s0_item_id][s0_seller_id := s0_item#i_current_price]];
      ITEM_i_end_date := ITEM_i_end_date[s0_item_id := ITEM_i_end_date[s0_item_id][s0_seller_id := s0_item#i_end_date]];
      ITEM_i_id := ITEM_i_id[s0_item_id := ITEM_i_id[s0_item_id][s0_seller_id := s0_item#i_id]];
      ITEM_i_initial_price := ITEM_i_initial_price[s0_item_id := ITEM_i_initial_price[s0_item_id][s0_seller_id := s0_item#i_initial_price]];
      ITEM_i_name := ITEM_i_name[s0_item_id := ITEM_i_name[s0_item_id][s0_seller_id := s0_item#i_name]];
      ITEM_i_num_bids := ITEM_i_num_bids[s0_item_id := ITEM_i_num_bids[s0_item_id][s0_seller_id := s0_item#i_num_bids]];
      ITEM_i_num_comments := ITEM_i_num_comments[s0_item_id := ITEM_i_num_comments[s0_item_id][s0_seller_id := s0_item#i_num_comments]];
      ITEM_i_start_date := ITEM_i_start_date[s0_item_id := ITEM_i_start_date[s0_item_id][s0_seller_id := s0_item#i_start_date]];
      ITEM_i_status := ITEM_i_status[s0_item_id := ITEM_i_status[s0_item_id][s0_seller_id := s0_item#i_status]];
      ITEM_i_u_id := ITEM_i_u_id[s0_item_id := ITEM_i_u_id[s0_item_id][s0_seller_id := s0_item#i_u_id]];
      s0_active := false;
      goto s0_hop_exit__ab;
    s0_hop_exit__ab:
    }
    if (s1_active) {
    s1_block13__ab:
      s1_item#i_c_id := ITEM_i_c_id[s1_item_id][s1_seller_id];
      s1_item#i_current_price := ITEM_i_current_price[s1_item_id][s1_seller_id];
      s1_item#i_end_date := ITEM_i_end_date[s1_item_id][s1_seller_id];
      s1_item#i_id := ITEM_i_id[s1_item_id][s1_seller_id];
      s1_item#i_initial_price := ITEM_i_initial_price[s1_item_id][s1_seller_id];
      s1_item#i_name := ITEM_i_name[s1_item_id][s1_seller_id];
      s1_item#i_num_bids := ITEM_i_num_bids[s1_item_id][s1_seller_id];
      s1_item#i_num_comments := ITEM_i_num_comments[s1_item_id][s1_seller_id];
      s1_item#i_start_date := ITEM_i_start_date[s1_item_id][s1_seller_id];
      s1_item#i_status := ITEM_i_status[s1_item_id][s1_seller_id];
      s1_item#i_u_id := ITEM_i_u_id[s1_item_id][s1_seller_id];
      s1_#tmp18 := s1_item#i_num_comments + 1;
      s1_item#i_num_comments := s1_#tmp18;
      ITEM_i_c_id := ITEM_i_c_id[s1_item_id := ITEM_i_c_id[s1_item_id][s1_seller_id := s1_item#i_c_id]];
      ITEM_i_current_price := ITEM_i_current_price[s1_item_id := ITEM_i_current_price[s1_item_id][s1_seller_id := s1_item#i_current_price]];
      ITEM_i_end_date := ITEM_i_end_date[s1_item_id := ITEM_i_end_date[s1_item_id][s1_seller_id := s1_item#i_end_date]];
      ITEM_i_id := ITEM_i_id[s1_item_id := ITEM_i_id[s1_item_id][s1_seller_id := s1_item#i_id]];
      ITEM_i_initial_price := ITEM_i_initial_price[s1_item_id := ITEM_i_initial_price[s1_item_id][s1_seller_id := s1_item#i_initial_price]];
      ITEM_i_name := ITEM_i_name[s1_item_id := ITEM_i_name[s1_item_id][s1_seller_id := s1_item#i_name]];
      ITEM_i_num_bids := ITEM_i_num_bids[s1_item_id := ITEM_i_num_bids[s1_item_id][s1_seller_id := s1_item#i_num_bids]];
      ITEM_i_num_comments := ITEM_i_num_comments[s1_item_id := ITEM_i_num_comments[s1_item_id][s1_seller_id := s1_item#i_num_comments]];
      ITEM_i_start_date := ITEM_i_start_date[s1_item_id := ITEM_i_start_date[s1_item_id][s1_seller_id := s1_item#i_start_date]];
      ITEM_i_status := ITEM_i_status[s1_item_id := ITEM_i_status[s1_item_id][s1_seller_id := s1_item#i_status]];
      ITEM_i_u_id := ITEM_i_u_id[s1_item_id := ITEM_i_u_id[s1_item_id][s1_seller_id := s1_item#i_u_id]];
      ITEM_COMMENT_ic_buyer_id := ITEM_COMMENT_ic_buyer_id[s1_comment_id := ITEM_COMMENT_ic_buyer_id[s1_comment_id][s1_item_id := ITEM_COMMENT_ic_buyer_id[s1_comment_id][s1_item_id][s1_seller_id := s1_buyer_id]]];
      ITEM_COMMENT_ic_question := ITEM_COMMENT_ic_question[s1_comment_id := ITEM_COMMENT_ic_question[s1_comment_id][s1_item_id := ITEM_COMMENT_ic_question[s1_comment_id][s1_item_id][s1_seller_id := s1_question]]];
      ITEM_COMMENT_ic_response := ITEM_COMMENT_ic_response[s1_comment_id := ITEM_COMMENT_ic_response[s1_comment_id][s1_item_id := ITEM_COMMENT_ic_response[s1_comment_id][s1_item_id][s1_seller_id := empty]]];
      s1_seller#u_balance := USERACCT_u_balance[s1_seller_id];
      s1_seller#u_comments := USERACCT_u_comments[s1_seller_id];
      s1_seller#u_id := USERACCT_u_id[s1_seller_id];
      s1_seller#u_r_id := USERACCT_u_r_id[s1_seller_id];
      s1_seller#u_rating := USERACCT_u_rating[s1_seller_id];
      s1_seller#u_sattr0 := USERACCT_u_sattr0[s1_seller_id];
      s1_seller#u_sattr1 := USERACCT_u_sattr1[s1_seller_id];
      s1_seller#u_sattr2 := USERACCT_u_sattr2[s1_seller_id];
      s1_seller#u_sattr3 := USERACCT_u_sattr3[s1_seller_id];
      s1_seller#u_sattr4 := USERACCT_u_sattr4[s1_seller_id];
      s1_#tmp20 := s1_seller#u_comments + 1;
      s1_seller#u_comments := s1_#tmp20;
      USERACCT_u_balance := USERACCT_u_balance[s1_seller_id := s1_seller#u_balance];
      USERACCT_u_comments := USERACCT_u_comments[s1_seller_id := s1_seller#u_comments];
      USERACCT_u_id := USERACCT_u_id[s1_seller_id := s1_seller#u_id];
      USERACCT_u_r_id := USERACCT_u_r_id[s1_seller_id := s1_seller#u_r_id];
      USERACCT_u_rating := USERACCT_u_rating[s1_seller_id := s1_seller#u_rating];
      USERACCT_u_sattr0 := USERACCT_u_sattr0[s1_seller_id := s1_seller#u_sattr0];
      USERACCT_u_sattr1 := USERACCT_u_sattr1[s1_seller_id := s1_seller#u_sattr1];
      USERACCT_u_sattr2 := USERACCT_u_sattr2[s1_seller_id := s1_seller#u_sattr2];
      USERACCT_u_sattr3 := USERACCT_u_sattr3[s1_seller_id := s1_seller#u_sattr3];
      USERACCT_u_sattr4 := USERACCT_u_sattr4[s1_seller_id := s1_seller#u_sattr4];
      s1_active := false;
      goto s1_hop_exit__ab;
    s1_hop_exit__ab:
    }
  // Snapshotting final state for a_then_b
    ITEM_COMMENT_ic_buyer_id_a_then_b := ITEM_COMMENT_ic_buyer_id;
    ITEM_COMMENT_ic_question_a_then_b := ITEM_COMMENT_ic_question;
    ITEM_COMMENT_ic_response_a_then_b := ITEM_COMMENT_ic_response;
    ITEM_i_c_id_a_then_b := ITEM_i_c_id;
    ITEM_i_current_price_a_then_b := ITEM_i_current_price;
    ITEM_i_end_date_a_then_b := ITEM_i_end_date;
    ITEM_i_id_a_then_b := ITEM_i_id;
    ITEM_i_initial_price_a_then_b := ITEM_i_initial_price;
    ITEM_i_name_a_then_b := ITEM_i_name;
    ITEM_i_num_bids_a_then_b := ITEM_i_num_bids;
    ITEM_i_num_comments_a_then_b := ITEM_i_num_comments;
    ITEM_i_start_date_a_then_b := ITEM_i_start_date;
    ITEM_i_status_a_then_b := ITEM_i_status;
    ITEM_i_u_id_a_then_b := ITEM_i_u_id;
    USERACCT_u_balance_a_then_b := USERACCT_u_balance;
    USERACCT_u_comments_a_then_b := USERACCT_u_comments;
    USERACCT_u_id_a_then_b := USERACCT_u_id;
    USERACCT_u_r_id_a_then_b := USERACCT_u_r_id;
    USERACCT_u_rating_a_then_b := USERACCT_u_rating;
    USERACCT_u_sattr0_a_then_b := USERACCT_u_sattr0;
    USERACCT_u_sattr1_a_then_b := USERACCT_u_sattr1;
    USERACCT_u_sattr2_a_then_b := USERACCT_u_sattr2;
    USERACCT_u_sattr3_a_then_b := USERACCT_u_sattr3;
    USERACCT_u_sattr4_a_then_b := USERACCT_u_sattr4;
  // Restoring initial state:
    ITEM_COMMENT_ic_buyer_id := ITEM_COMMENT_ic_buyer_id_init;
    ITEM_COMMENT_ic_question := ITEM_COMMENT_ic_question_init;
    ITEM_COMMENT_ic_response := ITEM_COMMENT_ic_response_init;
    ITEM_i_c_id := ITEM_i_c_id_init;
    ITEM_i_current_price := ITEM_i_current_price_init;
    ITEM_i_end_date := ITEM_i_end_date_init;
    ITEM_i_id := ITEM_i_id_init;
    ITEM_i_initial_price := ITEM_i_initial_price_init;
    ITEM_i_name := ITEM_i_name_init;
    ITEM_i_num_bids := ITEM_i_num_bids_init;
    ITEM_i_num_comments := ITEM_i_num_comments_init;
    ITEM_i_start_date := ITEM_i_start_date_init;
    ITEM_i_status := ITEM_i_status_init;
    ITEM_i_u_id := ITEM_i_u_id_init;
    USERACCT_u_balance := USERACCT_u_balance_init;
    USERACCT_u_comments := USERACCT_u_comments_init;
    USERACCT_u_id := USERACCT_u_id_init;
    USERACCT_u_r_id := USERACCT_u_r_id_init;
    USERACCT_u_rating := USERACCT_u_rating_init;
    USERACCT_u_sattr0 := USERACCT_u_sattr0_init;
    USERACCT_u_sattr1 := USERACCT_u_sattr1_init;
    USERACCT_u_sattr2 := USERACCT_u_sattr2_init;
    USERACCT_u_sattr3 := USERACCT_u_sattr3_init;
    USERACCT_u_sattr4 := USERACCT_u_sattr4_init;
    s0_item_id := s0_item_id_init;
    s0_seller_id := s0_seller_id_init;
    s1_item_id := s1_item_id_init;
    s1_seller_id := s1_seller_id_init;
    s1_buyer_id := s1_buyer_id_init;
    s1_comment_id := s1_comment_id_init;
    s1_question := s1_question_init;
    s0_active := true;
    s1_active := true;
  // Executing B then A:
    if (s1_active) {
    s1_block13__ba:
      s1_item#i_c_id := ITEM_i_c_id[s1_item_id][s1_seller_id];
      s1_item#i_current_price := ITEM_i_current_price[s1_item_id][s1_seller_id];
      s1_item#i_end_date := ITEM_i_end_date[s1_item_id][s1_seller_id];
      s1_item#i_id := ITEM_i_id[s1_item_id][s1_seller_id];
      s1_item#i_initial_price := ITEM_i_initial_price[s1_item_id][s1_seller_id];
      s1_item#i_name := ITEM_i_name[s1_item_id][s1_seller_id];
      s1_item#i_num_bids := ITEM_i_num_bids[s1_item_id][s1_seller_id];
      s1_item#i_num_comments := ITEM_i_num_comments[s1_item_id][s1_seller_id];
      s1_item#i_start_date := ITEM_i_start_date[s1_item_id][s1_seller_id];
      s1_item#i_status := ITEM_i_status[s1_item_id][s1_seller_id];
      s1_item#i_u_id := ITEM_i_u_id[s1_item_id][s1_seller_id];
      s1_#tmp18 := s1_item#i_num_comments + 1;
      s1_item#i_num_comments := s1_#tmp18;
      ITEM_i_c_id := ITEM_i_c_id[s1_item_id := ITEM_i_c_id[s1_item_id][s1_seller_id := s1_item#i_c_id]];
      ITEM_i_current_price := ITEM_i_current_price[s1_item_id := ITEM_i_current_price[s1_item_id][s1_seller_id := s1_item#i_current_price]];
      ITEM_i_end_date := ITEM_i_end_date[s1_item_id := ITEM_i_end_date[s1_item_id][s1_seller_id := s1_item#i_end_date]];
      ITEM_i_id := ITEM_i_id[s1_item_id := ITEM_i_id[s1_item_id][s1_seller_id := s1_item#i_id]];
      ITEM_i_initial_price := ITEM_i_initial_price[s1_item_id := ITEM_i_initial_price[s1_item_id][s1_seller_id := s1_item#i_initial_price]];
      ITEM_i_name := ITEM_i_name[s1_item_id := ITEM_i_name[s1_item_id][s1_seller_id := s1_item#i_name]];
      ITEM_i_num_bids := ITEM_i_num_bids[s1_item_id := ITEM_i_num_bids[s1_item_id][s1_seller_id := s1_item#i_num_bids]];
      ITEM_i_num_comments := ITEM_i_num_comments[s1_item_id := ITEM_i_num_comments[s1_item_id][s1_seller_id := s1_item#i_num_comments]];
      ITEM_i_start_date := ITEM_i_start_date[s1_item_id := ITEM_i_start_date[s1_item_id][s1_seller_id := s1_item#i_start_date]];
      ITEM_i_status := ITEM_i_status[s1_item_id := ITEM_i_status[s1_item_id][s1_seller_id := s1_item#i_status]];
      ITEM_i_u_id := ITEM_i_u_id[s1_item_id := ITEM_i_u_id[s1_item_id][s1_seller_id := s1_item#i_u_id]];
      ITEM_COMMENT_ic_buyer_id := ITEM_COMMENT_ic_buyer_id[s1_comment_id := ITEM_COMMENT_ic_buyer_id[s1_comment_id][s1_item_id := ITEM_COMMENT_ic_buyer_id[s1_comment_id][s1_item_id][s1_seller_id := s1_buyer_id]]];
      ITEM_COMMENT_ic_question := ITEM_COMMENT_ic_question[s1_comment_id := ITEM_COMMENT_ic_question[s1_comment_id][s1_item_id := ITEM_COMMENT_ic_question[s1_comment_id][s1_item_id][s1_seller_id := s1_question]]];
      ITEM_COMMENT_ic_response := ITEM_COMMENT_ic_response[s1_comment_id := ITEM_COMMENT_ic_response[s1_comment_id][s1_item_id := ITEM_COMMENT_ic_response[s1_comment_id][s1_item_id][s1_seller_id := empty]]];
      s1_seller#u_balance := USERACCT_u_balance[s1_seller_id];
      s1_seller#u_comments := USERACCT_u_comments[s1_seller_id];
      s1_seller#u_id := USERACCT_u_id[s1_seller_id];
      s1_seller#u_r_id := USERACCT_u_r_id[s1_seller_id];
      s1_seller#u_rating := USERACCT_u_rating[s1_seller_id];
      s1_seller#u_sattr0 := USERACCT_u_sattr0[s1_seller_id];
      s1_seller#u_sattr1 := USERACCT_u_sattr1[s1_seller_id];
      s1_seller#u_sattr2 := USERACCT_u_sattr2[s1_seller_id];
      s1_seller#u_sattr3 := USERACCT_u_sattr3[s1_seller_id];
      s1_seller#u_sattr4 := USERACCT_u_sattr4[s1_seller_id];
      s1_#tmp20 := s1_seller#u_comments + 1;
      s1_seller#u_comments := s1_#tmp20;
      USERACCT_u_balance := USERACCT_u_balance[s1_seller_id := s1_seller#u_balance];
      USERACCT_u_comments := USERACCT_u_comments[s1_seller_id := s1_seller#u_comments];
      USERACCT_u_id := USERACCT_u_id[s1_seller_id := s1_seller#u_id];
      USERACCT_u_r_id := USERACCT_u_r_id[s1_seller_id := s1_seller#u_r_id];
      USERACCT_u_rating := USERACCT_u_rating[s1_seller_id := s1_seller#u_rating];
      USERACCT_u_sattr0 := USERACCT_u_sattr0[s1_seller_id := s1_seller#u_sattr0];
      USERACCT_u_sattr1 := USERACCT_u_sattr1[s1_seller_id := s1_seller#u_sattr1];
      USERACCT_u_sattr2 := USERACCT_u_sattr2[s1_seller_id := s1_seller#u_sattr2];
      USERACCT_u_sattr3 := USERACCT_u_sattr3[s1_seller_id := s1_seller#u_sattr3];
      USERACCT_u_sattr4 := USERACCT_u_sattr4[s1_seller_id := s1_seller#u_sattr4];
      s1_active := false;
      goto s1_hop_exit__ba;
    s1_hop_exit__ba:
    }
    if (s0_active) {
    s0_block4__ba:
      s0_item#i_c_id := ITEM_i_c_id[s0_item_id][s0_seller_id];
      s0_item#i_current_price := ITEM_i_current_price[s0_item_id][s0_seller_id];
      s0_item#i_end_date := ITEM_i_end_date[s0_item_id][s0_seller_id];
      s0_item#i_id := ITEM_i_id[s0_item_id][s0_seller_id];
      s0_item#i_initial_price := ITEM_i_initial_price[s0_item_id][s0_seller_id];
      s0_item#i_name := ITEM_i_name[s0_item_id][s0_seller_id];
      s0_item#i_num_bids := ITEM_i_num_bids[s0_item_id][s0_seller_id];
      s0_item#i_num_comments := ITEM_i_num_comments[s0_item_id][s0_seller_id];
      s0_item#i_start_date := ITEM_i_start_date[s0_item_id][s0_seller_id];
      s0_item#i_u_id := ITEM_i_u_id[s0_item_id][s0_seller_id];
      s0_item#i_status := ITEM_STATUS_CLOSED;
      ITEM_i_c_id := ITEM_i_c_id[s0_item_id := ITEM_i_c_id[s0_item_id][s0_seller_id := s0_item#i_c_id]];
      ITEM_i_current_price := ITEM_i_current_price[s0_item_id := ITEM_i_current_price[s0_item_id][s0_seller_id := s0_item#i_current_price]];
      ITEM_i_end_date := ITEM_i_end_date[s0_item_id := ITEM_i_end_date[s0_item_id][s0_seller_id := s0_item#i_end_date]];
      ITEM_i_id := ITEM_i_id[s0_item_id := ITEM_i_id[s0_item_id][s0_seller_id := s0_item#i_id]];
      ITEM_i_initial_price := ITEM_i_initial_price[s0_item_id := ITEM_i_initial_price[s0_item_id][s0_seller_id := s0_item#i_initial_price]];
      ITEM_i_name := ITEM_i_name[s0_item_id := ITEM_i_name[s0_item_id][s0_seller_id := s0_item#i_name]];
      ITEM_i_num_bids := ITEM_i_num_bids[s0_item_id := ITEM_i_num_bids[s0_item_id][s0_seller_id := s0_item#i_num_bids]];
      ITEM_i_num_comments := ITEM_i_num_comments[s0_item_id := ITEM_i_num_comments[s0_item_id][s0_seller_id := s0_item#i_num_comments]];
      ITEM_i_start_date := ITEM_i_start_date[s0_item_id := ITEM_i_start_date[s0_item_id][s0_seller_id := s0_item#i_start_date]];
      ITEM_i_status := ITEM_i_status[s0_item_id := ITEM_i_status[s0_item_id][s0_seller_id := s0_item#i_status]];
      ITEM_i_u_id := ITEM_i_u_id[s0_item_id := ITEM_i_u_id[s0_item_id][s0_seller_id := s0_item#i_u_id]];
      s0_active := false;
      goto s0_hop_exit__ba;
    s0_hop_exit__ba:
    }
  // Snapshotting final state for b_then_a
    ITEM_COMMENT_ic_buyer_id_b_then_a := ITEM_COMMENT_ic_buyer_id;
    ITEM_COMMENT_ic_question_b_then_a := ITEM_COMMENT_ic_question;
    ITEM_COMMENT_ic_response_b_then_a := ITEM_COMMENT_ic_response;
    ITEM_i_c_id_b_then_a := ITEM_i_c_id;
    ITEM_i_current_price_b_then_a := ITEM_i_current_price;
    ITEM_i_end_date_b_then_a := ITEM_i_end_date;
    ITEM_i_id_b_then_a := ITEM_i_id;
    ITEM_i_initial_price_b_then_a := ITEM_i_initial_price;
    ITEM_i_name_b_then_a := ITEM_i_name;
    ITEM_i_num_bids_b_then_a := ITEM_i_num_bids;
    ITEM_i_num_comments_b_then_a := ITEM_i_num_comments;
    ITEM_i_start_date_b_then_a := ITEM_i_start_date;
    ITEM_i_status_b_then_a := ITEM_i_status;
    ITEM_i_u_id_b_then_a := ITEM_i_u_id;
    USERACCT_u_balance_b_then_a := USERACCT_u_balance;
    USERACCT_u_comments_b_then_a := USERACCT_u_comments;
    USERACCT_u_id_b_then_a := USERACCT_u_id;
    USERACCT_u_r_id_b_then_a := USERACCT_u_r_id;
    USERACCT_u_rating_b_then_a := USERACCT_u_rating;
    USERACCT_u_sattr0_b_then_a := USERACCT_u_sattr0;
    USERACCT_u_sattr1_b_then_a := USERACCT_u_sattr1;
    USERACCT_u_sattr2_b_then_a := USERACCT_u_sattr2;
    USERACCT_u_sattr3_b_then_a := USERACCT_u_sattr3;
    USERACCT_u_sattr4_b_then_a := USERACCT_u_sattr4;
  // --- Step 4: Verify A→B ≡ B→A (Special interleavings equivalence) ---
  // Verifying A->B === B->A equivalence:
    assert {:msg "(SpecialInterleavingNonEquivalence (node_1 (function_id . 18) (instance . 0) (hop_id . 4)) (node_2 (function_id . 22) (instance . 0) (hop_id . 9)))"} ((((((((((((((((((((((((ITEM_COMMENT_ic_buyer_id_a_then_b == ITEM_COMMENT_ic_buyer_id_b_then_a) && (ITEM_COMMENT_ic_question_a_then_b == ITEM_COMMENT_ic_question_b_then_a)) && (ITEM_COMMENT_ic_response_a_then_b == ITEM_COMMENT_ic_response_b_then_a)) && (ITEM_i_c_id_a_then_b == ITEM_i_c_id_b_then_a)) && (ITEM_i_current_price_a_then_b == ITEM_i_current_price_b_then_a)) && (ITEM_i_end_date_a_then_b == ITEM_i_end_date_b_then_a)) && (ITEM_i_id_a_then_b == ITEM_i_id_b_then_a)) && (ITEM_i_initial_price_a_then_b == ITEM_i_initial_price_b_then_a)) && (ITEM_i_name_a_then_b == ITEM_i_name_b_then_a)) && (ITEM_i_num_bids_a_then_b == ITEM_i_num_bids_b_then_a)) && (ITEM_i_num_comments_a_then_b == ITEM_i_num_comments_b_then_a)) && (ITEM_i_start_date_a_then_b == ITEM_i_start_date_b_then_a)) && (ITEM_i_status_a_then_b == ITEM_i_status_b_then_a)) && (ITEM_i_u_id_a_then_b == ITEM_i_u_id_b_then_a)) && (USERACCT_u_balance_a_then_b == USERACCT_u_balance_b_then_a)) && (USERACCT_u_comments_a_then_b == USERACCT_u_comments_b_then_a)) && (USERACCT_u_id_a_then_b == USERACCT_u_id_b_then_a)) && (USERACCT_u_r_id_a_then_b == USERACCT_u_r_id_b_then_a)) && (USERACCT_u_rating_a_then_b == USERACCT_u_rating_b_then_a)) && (USERACCT_u_sattr0_a_then_b == USERACCT_u_sattr0_b_then_a)) && (USERACCT_u_sattr1_a_then_b == USERACCT_u_sattr1_b_then_a)) && (USERACCT_u_sattr2_a_then_b == USERACCT_u_sattr2_b_then_a)) && (USERACCT_u_sattr3_a_then_b == USERACCT_u_sattr3_b_then_a)) && (USERACCT_u_sattr4_a_then_b == USERACCT_u_sattr4_b_then_a));
}

