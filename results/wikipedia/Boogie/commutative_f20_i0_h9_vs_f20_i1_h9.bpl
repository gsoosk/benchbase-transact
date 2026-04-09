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
function get_user_id#21(arg0: Iterator (Table (user))) returns (int);
function model_get_user_id#21(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (user)) :: hasNext(iter) ==> get_user_id#21(iter) == model_get_user_id#21(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_wl_user#22(arg0: Iterator (Table (watchlist))) returns (int);
function model_get_wl_user#22(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (watchlist)) :: hasNext(iter) ==> get_wl_user#22(iter) == model_get_wl_user#22(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_wl_namespace#23(arg0: Iterator (Table (watchlist))) returns (int);
function model_get_wl_namespace#23(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (watchlist)) :: hasNext(iter) ==> get_wl_namespace#23(iter) == model_get_wl_namespace#23(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_wl_title#24(arg0: Iterator (Table (watchlist))) returns (String);
function model_get_wl_title#24(n: int, m: int, index: int) returns (String);
axiom (forall iter: Iterator (Table (watchlist)) :: hasNext(iter) ==> get_wl_title#24(iter) == model_get_wl_title#24(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_page_id#25(arg0: Iterator (Table (page))) returns (int);
function model_get_page_id#25(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (page)) :: hasNext(iter) ==> get_page_id#25(iter) == model_get_page_id#25(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_pr_page#26(arg0: Iterator (Table (page_restrictions))) returns (int);
function model_get_pr_page#26(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (page_restrictions)) :: hasNext(iter) ==> get_pr_page#26(iter) == model_get_pr_page#26(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_pr_type#27(arg0: Iterator (Table (page_restrictions))) returns (String);
function model_get_pr_type#27(n: int, m: int, index: int) returns (String);
axiom (forall iter: Iterator (Table (page_restrictions)) :: hasNext(iter) ==> get_pr_type#27(iter) == model_get_pr_type#27(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ipb_user#28(arg0: Iterator (Table (ipblocks))) returns (int);
function model_get_ipb_user#28(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (ipblocks)) :: hasNext(iter) ==> get_ipb_user#28(iter) == model_get_ipb_user#28(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ipb_id#29(arg0: Iterator (Table (ipblocks))) returns (int);
function model_get_ipb_id#29(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (ipblocks)) :: hasNext(iter) ==> get_ipb_id#29(iter) == model_get_ipb_id#29(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_rev_page#30(arg0: Iterator (Table (revision))) returns (int);
function model_get_rev_page#30(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (revision)) :: hasNext(iter) ==> get_rev_page#30(iter) == model_get_rev_page#30(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_rev_id#31(arg0: Iterator (Table (revision))) returns (int);
function model_get_rev_id#31(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (revision)) :: hasNext(iter) ==> get_rev_id#31(iter) == model_get_rev_id#31(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_old_id#32(arg0: Iterator (Table (text))) returns (int);
function model_get_old_id#32(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (text)) :: hasNext(iter) ==> get_old_id#32(iter) == model_get_old_id#32(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ug_user#33(arg0: Iterator (Table (user_groups))) returns (int);
function model_get_ug_user#33(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (user_groups)) :: hasNext(iter) ==> get_ug_user#33(iter) == model_get_ug_user#33(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ug_group#34(arg0: Iterator (Table (user_groups))) returns (String);
function model_get_ug_group#34(n: int, m: int, index: int) returns (String);
axiom (forall iter: Iterator (Table (user_groups)) :: hasNext(iter) ==> get_ug_group#34(iter) == model_get_ug_group#34(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_rc_id#35(arg0: Iterator (Table (recentchanges))) returns (int);
function model_get_rc_id#35(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (recentchanges)) :: hasNext(iter) ==> get_rc_id#35(iter) == model_get_rc_id#35(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_log_user#36(arg0: Iterator (Table (logging))) returns (int);
function model_get_log_user#36(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (logging)) :: hasNext(iter) ==> get_log_user#36(iter) == model_get_log_user#36(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_log_id#37(arg0: Iterator (Table (logging))) returns (int);
function model_get_log_id#37(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (logging)) :: hasNext(iter) ==> get_log_id#37(iter) == model_get_log_id#37(iter_n(iter), iter_m(iter), iter_position(iter)));
type Table a;
type user;
type watchlist;
type page;
type page_restrictions;
type ipblocks;
type revision;
type text;
type user_groups;
type recentchanges;
type logging;
type Row a;
function construct_Row_user(user_id: int, user_name: String, user_touched: int, user_editcount: int): Row (Table user);
axiom (forall
    user_id_1: int, user_name_1: String, user_touched_1: int, user_editcount_1: int,
    user_id_2: int, user_name_2: String, user_touched_2: int, user_editcount_2: int
    ::
    construct_Row_user(user_id_1, user_name_1, user_touched_1, user_editcount_1) == construct_Row_user(user_id_2, user_name_2, user_touched_2, user_editcount_2)
    <==>
    (user_id_1 == user_id_2 && user_name_1 == user_name_2 && user_touched_1 == user_touched_2 && user_editcount_1 == user_editcount_2)
);
function construct_Row_watchlist(wl_user: int, wl_namespace: int, wl_title: String, wl_notificationtimestamp: int): Row (Table watchlist);
axiom (forall
    wl_user_1: int, wl_namespace_1: int, wl_title_1: String, wl_notificationtimestamp_1: int,
    wl_user_2: int, wl_namespace_2: int, wl_title_2: String, wl_notificationtimestamp_2: int
    ::
    construct_Row_watchlist(wl_user_1, wl_namespace_1, wl_title_1, wl_notificationtimestamp_1) == construct_Row_watchlist(wl_user_2, wl_namespace_2, wl_title_2, wl_notificationtimestamp_2)
    <==>
    (wl_user_1 == wl_user_2 && wl_namespace_1 == wl_namespace_2 && wl_title_1 == wl_title_2 && wl_notificationtimestamp_1 == wl_notificationtimestamp_2)
);
function construct_Row_page(page_id: int, page_namespace: int, page_title: String, page_latest: int, page_touched: int, page_is_new: int, page_is_redirect: int, page_len: int): Row (Table page);
axiom (forall
    page_id_1: int, page_namespace_1: int, page_title_1: String, page_latest_1: int, page_touched_1: int, page_is_new_1: int, page_is_redirect_1: int, page_len_1: int,
    page_id_2: int, page_namespace_2: int, page_title_2: String, page_latest_2: int, page_touched_2: int, page_is_new_2: int, page_is_redirect_2: int, page_len_2: int
    ::
    construct_Row_page(page_id_1, page_namespace_1, page_title_1, page_latest_1, page_touched_1, page_is_new_1, page_is_redirect_1, page_len_1) == construct_Row_page(page_id_2, page_namespace_2, page_title_2, page_latest_2, page_touched_2, page_is_new_2, page_is_redirect_2, page_len_2)
    <==>
    (page_id_1 == page_id_2 && page_namespace_1 == page_namespace_2 && page_title_1 == page_title_2 && page_latest_1 == page_latest_2 && page_touched_1 == page_touched_2 && page_is_new_1 == page_is_new_2 && page_is_redirect_1 == page_is_redirect_2 && page_len_1 == page_len_2)
);
function construct_Row_page_restrictions(pr_page: int, pr_type: String, pr_level: String): Row (Table page_restrictions);
axiom (forall
    pr_page_1: int, pr_type_1: String, pr_level_1: String,
    pr_page_2: int, pr_type_2: String, pr_level_2: String
    ::
    construct_Row_page_restrictions(pr_page_1, pr_type_1, pr_level_1) == construct_Row_page_restrictions(pr_page_2, pr_type_2, pr_level_2)
    <==>
    (pr_page_1 == pr_page_2 && pr_type_1 == pr_type_2 && pr_level_1 == pr_level_2)
);
function construct_Row_ipblocks(ipb_user: int, ipb_id: int, ipb_address: String, ipb_expiry: int): Row (Table ipblocks);
axiom (forall
    ipb_user_1: int, ipb_id_1: int, ipb_address_1: String, ipb_expiry_1: int,
    ipb_user_2: int, ipb_id_2: int, ipb_address_2: String, ipb_expiry_2: int
    ::
    construct_Row_ipblocks(ipb_user_1, ipb_id_1, ipb_address_1, ipb_expiry_1) == construct_Row_ipblocks(ipb_user_2, ipb_id_2, ipb_address_2, ipb_expiry_2)
    <==>
    (ipb_user_1 == ipb_user_2 && ipb_id_1 == ipb_id_2 && ipb_address_1 == ipb_address_2 && ipb_expiry_1 == ipb_expiry_2)
);
function construct_Row_revision(rev_page: int, rev_id: int, rev_text_id: int, rev_comment: String, rev_user: int, rev_user_text: String, rev_timestamp: int, rev_len: int, rev_parent_id: int): Row (Table revision);
axiom (forall
    rev_page_1: int, rev_id_1: int, rev_text_id_1: int, rev_comment_1: String, rev_user_1: int, rev_user_text_1: String, rev_timestamp_1: int, rev_len_1: int, rev_parent_id_1: int,
    rev_page_2: int, rev_id_2: int, rev_text_id_2: int, rev_comment_2: String, rev_user_2: int, rev_user_text_2: String, rev_timestamp_2: int, rev_len_2: int, rev_parent_id_2: int
    ::
    construct_Row_revision(rev_page_1, rev_id_1, rev_text_id_1, rev_comment_1, rev_user_1, rev_user_text_1, rev_timestamp_1, rev_len_1, rev_parent_id_1) == construct_Row_revision(rev_page_2, rev_id_2, rev_text_id_2, rev_comment_2, rev_user_2, rev_user_text_2, rev_timestamp_2, rev_len_2, rev_parent_id_2)
    <==>
    (rev_page_1 == rev_page_2 && rev_id_1 == rev_id_2 && rev_text_id_1 == rev_text_id_2 && rev_comment_1 == rev_comment_2 && rev_user_1 == rev_user_2 && rev_user_text_1 == rev_user_text_2 && rev_timestamp_1 == rev_timestamp_2 && rev_len_1 == rev_len_2 && rev_parent_id_1 == rev_parent_id_2)
);
function construct_Row_text(old_id: int, old_page: int, old_text: String, old_flags: String): Row (Table text);
axiom (forall
    old_id_1: int, old_page_1: int, old_text_1: String, old_flags_1: String,
    old_id_2: int, old_page_2: int, old_text_2: String, old_flags_2: String
    ::
    construct_Row_text(old_id_1, old_page_1, old_text_1, old_flags_1) == construct_Row_text(old_id_2, old_page_2, old_text_2, old_flags_2)
    <==>
    (old_id_1 == old_id_2 && old_page_1 == old_page_2 && old_text_1 == old_text_2 && old_flags_1 == old_flags_2)
);
function construct_Row_user_groups(ug_user: int, ug_group: String): Row (Table user_groups);
axiom (forall
    ug_user_1: int, ug_group_1: String,
    ug_user_2: int, ug_group_2: String
    ::
    construct_Row_user_groups(ug_user_1, ug_group_1) == construct_Row_user_groups(ug_user_2, ug_group_2)
    <==>
    (ug_user_1 == ug_user_2 && ug_group_1 == ug_group_2)
);
function construct_Row_recentchanges(rc_id: int, rc_timestamp: int, rc_namespace: int, rc_title: String, rc_cur_id: int, rc_user: int, rc_user_text: String, rc_comment: String, rc_this_oldid: int, rc_last_oldid: int, rc_ip: String, rc_old_len: int, rc_new_len: int): Row (Table recentchanges);
axiom (forall
    rc_id_1: int, rc_timestamp_1: int, rc_namespace_1: int, rc_title_1: String, rc_cur_id_1: int, rc_user_1: int, rc_user_text_1: String, rc_comment_1: String, rc_this_oldid_1: int, rc_last_oldid_1: int, rc_ip_1: String, rc_old_len_1: int, rc_new_len_1: int,
    rc_id_2: int, rc_timestamp_2: int, rc_namespace_2: int, rc_title_2: String, rc_cur_id_2: int, rc_user_2: int, rc_user_text_2: String, rc_comment_2: String, rc_this_oldid_2: int, rc_last_oldid_2: int, rc_ip_2: String, rc_old_len_2: int, rc_new_len_2: int
    ::
    construct_Row_recentchanges(rc_id_1, rc_timestamp_1, rc_namespace_1, rc_title_1, rc_cur_id_1, rc_user_1, rc_user_text_1, rc_comment_1, rc_this_oldid_1, rc_last_oldid_1, rc_ip_1, rc_old_len_1, rc_new_len_1) == construct_Row_recentchanges(rc_id_2, rc_timestamp_2, rc_namespace_2, rc_title_2, rc_cur_id_2, rc_user_2, rc_user_text_2, rc_comment_2, rc_this_oldid_2, rc_last_oldid_2, rc_ip_2, rc_old_len_2, rc_new_len_2)
    <==>
    (rc_id_1 == rc_id_2 && rc_timestamp_1 == rc_timestamp_2 && rc_namespace_1 == rc_namespace_2 && rc_title_1 == rc_title_2 && rc_cur_id_1 == rc_cur_id_2 && rc_user_1 == rc_user_2 && rc_user_text_1 == rc_user_text_2 && rc_comment_1 == rc_comment_2 && rc_this_oldid_1 == rc_this_oldid_2 && rc_last_oldid_1 == rc_last_oldid_2 && rc_ip_1 == rc_ip_2 && rc_old_len_1 == rc_old_len_2 && rc_new_len_1 == rc_new_len_2)
);
function construct_Row_logging(log_user: int, log_id: int, log_type: String, log_action: String, log_timestamp: int, log_user_text: String, log_namespace: int, log_title: String, log_page: int, log_comment: String, log_params: String): Row (Table logging);
axiom (forall
    log_user_1: int, log_id_1: int, log_type_1: String, log_action_1: String, log_timestamp_1: int, log_user_text_1: String, log_namespace_1: int, log_title_1: String, log_page_1: int, log_comment_1: String, log_params_1: String,
    log_user_2: int, log_id_2: int, log_type_2: String, log_action_2: String, log_timestamp_2: int, log_user_text_2: String, log_namespace_2: int, log_title_2: String, log_page_2: int, log_comment_2: String, log_params_2: String
    ::
    construct_Row_logging(log_user_1, log_id_1, log_type_1, log_action_1, log_timestamp_1, log_user_text_1, log_namespace_1, log_title_1, log_page_1, log_comment_1, log_params_1) == construct_Row_logging(log_user_2, log_id_2, log_type_2, log_action_2, log_timestamp_2, log_user_text_2, log_namespace_2, log_title_2, log_page_2, log_comment_2, log_params_2)
    <==>
    (log_user_1 == log_user_2 && log_id_1 == log_id_2 && log_type_1 == log_type_2 && log_action_1 == log_action_2 && log_timestamp_1 == log_timestamp_2 && log_user_text_1 == log_user_text_2 && log_namespace_1 == log_namespace_2 && log_title_1 == log_title_2 && log_page_1 == log_page_2 && log_comment_1 == log_comment_2 && log_params_1 == log_params_2)
);
var text_old_page : [int]int;
var recentchanges_rc_this_oldid : [int]int;
var watchlist_wl_user : [int][int][String]int;
var page_restrictions_pr_page : [int][String]int;
var revision_rev_len : [int][int]int;
var recentchanges_rc_user_text : [int]String;
const TBL_recentchanges : Table (recentchanges);
var logging_log_id : [int][int]int;
var logging_log_namespace : [int][int]int;
var text_old_flags : [int]String;
var ipblocks_ipb_address : [int][int]String;
var user_groups_ug_group : [int][String]String;
var revision_rev_timestamp : [int][int]int;
var revision_rev_page : [int][int]int;
var revision_rev_comment : [int][int]String;
var user_user_id : [int]int;
var page_page_namespace : [int]int;
var user_user_touched : [int]int;
var text_old_text : [int]String;
var recentchanges_rc_last_oldid : [int]int;
var recentchanges_rc_comment : [int]String;
var page_page_id : [int]int;
var logging_log_user : [int][int]int;
var logging_log_page : [int][int]int;
const TBL_user_groups : Table (user_groups);
var logging_log_action : [int][int]String;
const TBL_revision : Table (revision);
const TBL_logging : Table (logging);
var page_page_len : [int]int;
const TBL_watchlist : Table (watchlist);
var revision_rev_id : [int][int]int;
var recentchanges_rc_cur_id : [int]int;
const TBL_text : Table (text);
const TBL_page_restrictions : Table (page_restrictions);
var recentchanges_rc_ip : [int]String;
var logging_log_comment : [int][int]String;
var recentchanges_rc_timestamp : [int]int;
const TBL_page : Table (page);
const TBL_ipblocks : Table (ipblocks);
var logging_log_params : [int][int]String;
var user_groups_ug_user : [int][String]int;
var user_user_name : [int]String;
var page_page_title : [int]String;
const __shards__ : int;
var logging_log_user_text : [int][int]String;
var page_restrictions_pr_level : [int][String]String;
var revision_rev_text_id : [int][int]int;
var recentchanges_rc_title : [int]String;
var recentchanges_rc_id : [int]int;
var page_page_is_new : [int]int;
var revision_rev_user : [int][int]int;
var revision_rev_parent_id : [int][int]int;
var watchlist_wl_namespace : [int][int][String]int;
var page_restrictions_pr_type : [int][String]String;
var recentchanges_rc_user : [int]int;
var user_user_editcount : [int]int;
var ipblocks_ipb_id : [int][int]int;
var watchlist_wl_notificationtimestamp : [int][int][String]int;
var recentchanges_rc_namespace : [int]int;
const __slice__ : int;
var recentchanges_rc_new_len : [int]int;
var ipblocks_ipb_user : [int][int]int;
var logging_log_timestamp : [int][int]int;
var watchlist_wl_title : [int][int][String]String;
var logging_log_type : [int][int]String;
var page_page_latest : [int]int;
var page_page_is_redirect : [int]int;
var ipblocks_ipb_expiry : [int][int]int;
var page_page_touched : [int]int;
var revision_rev_user_text : [int][int]String;
var text_old_id : [int]int;
var recentchanges_rc_old_len : [int]int;
var logging_log_title : [int][int]String;
const TBL_user : Table (user);
procedure Check_SliceCommut_Hop9_vs_Hop9()
modifies watchlist_wl_namespace, watchlist_wl_notificationtimestamp, watchlist_wl_title, watchlist_wl_user;
{
  var s0_nextRevId : int;
  var s0_pageId : int;
  var s0_pageTitle : String;
  var s0_pageNamespace : int;
  var s0_userId : int;
  var s0_userText : String;
  var s0_otherUserId : int;
  var s1_nextRevId : int;
  var s1_pageId : int;
  var s1_pageTitle : String;
  var s1_pageNamespace : int;
  var s1_userId : int;
  var s1_userText : String;
  var s1_otherUserId : int;
  var s0_active : bool;
  var s1_active : bool;
  var watchlist_wl_namespace_init : [int][int][String]int;
  var watchlist_wl_notificationtimestamp_init : [int][int][String]int;
  var watchlist_wl_title_init : [int][int][String]String;
  var watchlist_wl_user_init : [int][int][String]int;
  var s0_nextRevId_init : int;
  var s0_pageId_init : int;
  var s0_pageTitle_init : String;
  var s0_pageNamespace_init : int;
  var s0_userId_init : int;
  var s0_userText_init : String;
  var s0_otherUserId_init : int;
  var s1_nextRevId_init : int;
  var s1_pageId_init : int;
  var s1_pageTitle_init : String;
  var s1_pageNamespace_init : int;
  var s1_userId_init : int;
  var s1_userText_init : String;
  var s1_otherUserId_init : int;
  var s0_wl#wl_namespace : int;
  var s0_wl#wl_title : String;
  var s0_wl#wl_user : int;
  var s1_wl#wl_namespace : int;
  var s1_wl#wl_title : String;
  var s1_wl#wl_user : int;
  var watchlist_wl_namespace_a_then_b : [int][int][String]int;
  var watchlist_wl_notificationtimestamp_a_then_b : [int][int][String]int;
  var watchlist_wl_title_a_then_b : [int][int][String]String;
  var watchlist_wl_user_a_then_b : [int][int][String]int;
  var s0_nextRevId_a_then_b : int;
  var s0_pageId_a_then_b : int;
  var s0_pageTitle_a_then_b : String;
  var s0_pageNamespace_a_then_b : int;
  var s0_userId_a_then_b : int;
  var s0_userText_a_then_b : String;
  var s1_nextRevId_a_then_b : int;
  var s1_pageId_a_then_b : int;
  var s1_pageTitle_a_then_b : String;
  var s1_pageNamespace_a_then_b : int;
  var s1_userId_a_then_b : int;
  var s1_userText_a_then_b : String;
  var watchlist_wl_namespace_b_then_a : [int][int][String]int;
  var watchlist_wl_notificationtimestamp_b_then_a : [int][int][String]int;
  var watchlist_wl_title_b_then_a : [int][int][String]String;
  var watchlist_wl_user_b_then_a : [int][int][String]int;
  var s0_nextRevId_b_then_a : int;
  var s0_pageId_b_then_a : int;
  var s0_pageTitle_b_then_a : String;
  var s0_pageNamespace_b_then_a : int;
  var s0_userId_b_then_a : int;
  var s0_userText_b_then_a : String;
  var s1_nextRevId_b_then_a : int;
  var s1_pageId_b_then_a : int;
  var s1_pageTitle_b_then_a : String;
  var s1_pageNamespace_b_then_a : int;
  var s1_userId_b_then_a : int;
  var s1_userText_b_then_a : String;

  // Slice commutativity verification: hop 9 vs hop 9
  // --- Step 1: Havoc initial state ---
    havoc watchlist_wl_namespace;
    havoc watchlist_wl_notificationtimestamp;
    havoc watchlist_wl_title;
    havoc watchlist_wl_user;
    havoc s0_nextRevId;
    havoc s0_pageId;
    havoc s0_pageTitle;
    havoc s0_pageNamespace;
    havoc s0_userId;
    havoc s0_userText;
    havoc s0_otherUserId;
    havoc s1_nextRevId;
    havoc s1_pageId;
    havoc s1_pageTitle;
    havoc s1_pageNamespace;
    havoc s1_userId;
    havoc s1_userText;
    havoc s1_otherUserId;
    s0_active := true;
    s1_active := true;
  // --- Step 2: Save initial state ---
    watchlist_wl_namespace_init := watchlist_wl_namespace;
    watchlist_wl_notificationtimestamp_init := watchlist_wl_notificationtimestamp;
    watchlist_wl_title_init := watchlist_wl_title;
    watchlist_wl_user_init := watchlist_wl_user;
    s0_nextRevId_init := s0_nextRevId;
    s0_pageId_init := s0_pageId;
    s0_pageTitle_init := s0_pageTitle;
    s0_pageNamespace_init := s0_pageNamespace;
    s0_userId_init := s0_userId;
    s0_userText_init := s0_userText;
    s0_otherUserId_init := s0_otherUserId;
    s1_nextRevId_init := s1_nextRevId;
    s1_pageId_init := s1_pageId;
    s1_pageTitle_init := s1_pageTitle;
    s1_pageNamespace_init := s1_pageNamespace;
    s1_userId_init := s1_userId;
    s1_userText_init := s1_userText;
    s1_otherUserId_init := s1_otherUserId;
  // --- Step 3: Execute special interleavings ---
  // Executing A then B:
    if (s0_active) {
    s0_block13__ab:
      s0_wl#wl_namespace := watchlist_wl_namespace[s0_otherUserId][s0_pageNamespace][s0_pageTitle];
      s0_wl#wl_title := watchlist_wl_title[s0_otherUserId][s0_pageNamespace][s0_pageTitle];
      s0_wl#wl_user := watchlist_wl_user[s0_otherUserId][s0_pageNamespace][s0_pageTitle];
      watchlist_wl_namespace := watchlist_wl_namespace[s0_otherUserId := watchlist_wl_namespace[s0_otherUserId][s0_pageNamespace := watchlist_wl_namespace[s0_otherUserId][s0_pageNamespace][s0_pageTitle := s0_wl#wl_namespace]]];
      watchlist_wl_notificationtimestamp := watchlist_wl_notificationtimestamp[s0_otherUserId := watchlist_wl_notificationtimestamp[s0_otherUserId][s0_pageNamespace := watchlist_wl_notificationtimestamp[s0_otherUserId][s0_pageNamespace][s0_pageTitle := 1]]];
      watchlist_wl_title := watchlist_wl_title[s0_otherUserId := watchlist_wl_title[s0_otherUserId][s0_pageNamespace := watchlist_wl_title[s0_otherUserId][s0_pageNamespace][s0_pageTitle := s0_wl#wl_title]]];
      watchlist_wl_user := watchlist_wl_user[s0_otherUserId := watchlist_wl_user[s0_otherUserId][s0_pageNamespace := watchlist_wl_user[s0_otherUserId][s0_pageNamespace][s0_pageTitle := s0_wl#wl_user]]];
      goto s0_hop_exit__ab;
    s0_hop_exit__ab:
    }
    if (s1_active) {
    s1_block13__ab:
      s1_wl#wl_namespace := watchlist_wl_namespace[s1_otherUserId][s1_pageNamespace][s1_pageTitle];
      s1_wl#wl_title := watchlist_wl_title[s1_otherUserId][s1_pageNamespace][s1_pageTitle];
      s1_wl#wl_user := watchlist_wl_user[s1_otherUserId][s1_pageNamespace][s1_pageTitle];
      watchlist_wl_namespace := watchlist_wl_namespace[s1_otherUserId := watchlist_wl_namespace[s1_otherUserId][s1_pageNamespace := watchlist_wl_namespace[s1_otherUserId][s1_pageNamespace][s1_pageTitle := s1_wl#wl_namespace]]];
      watchlist_wl_notificationtimestamp := watchlist_wl_notificationtimestamp[s1_otherUserId := watchlist_wl_notificationtimestamp[s1_otherUserId][s1_pageNamespace := watchlist_wl_notificationtimestamp[s1_otherUserId][s1_pageNamespace][s1_pageTitle := 1]]];
      watchlist_wl_title := watchlist_wl_title[s1_otherUserId := watchlist_wl_title[s1_otherUserId][s1_pageNamespace := watchlist_wl_title[s1_otherUserId][s1_pageNamespace][s1_pageTitle := s1_wl#wl_title]]];
      watchlist_wl_user := watchlist_wl_user[s1_otherUserId := watchlist_wl_user[s1_otherUserId][s1_pageNamespace := watchlist_wl_user[s1_otherUserId][s1_pageNamespace][s1_pageTitle := s1_wl#wl_user]]];
      goto s1_hop_exit__ab;
    s1_hop_exit__ab:
    }
  // Snapshotting final state for a_then_b
    watchlist_wl_namespace_a_then_b := watchlist_wl_namespace;
    watchlist_wl_notificationtimestamp_a_then_b := watchlist_wl_notificationtimestamp;
    watchlist_wl_title_a_then_b := watchlist_wl_title;
    watchlist_wl_user_a_then_b := watchlist_wl_user;
    s0_nextRevId_a_then_b := s0_nextRevId;
    s0_pageId_a_then_b := s0_pageId;
    s0_pageTitle_a_then_b := s0_pageTitle;
    s0_pageNamespace_a_then_b := s0_pageNamespace;
    s0_userId_a_then_b := s0_userId;
    s0_userText_a_then_b := s0_userText;
    s1_nextRevId_a_then_b := s1_nextRevId;
    s1_pageId_a_then_b := s1_pageId;
    s1_pageTitle_a_then_b := s1_pageTitle;
    s1_pageNamespace_a_then_b := s1_pageNamespace;
    s1_userId_a_then_b := s1_userId;
    s1_userText_a_then_b := s1_userText;
  // Restoring initial state:
    watchlist_wl_namespace := watchlist_wl_namespace_init;
    watchlist_wl_notificationtimestamp := watchlist_wl_notificationtimestamp_init;
    watchlist_wl_title := watchlist_wl_title_init;
    watchlist_wl_user := watchlist_wl_user_init;
    s0_nextRevId := s0_nextRevId_init;
    s0_pageId := s0_pageId_init;
    s0_pageTitle := s0_pageTitle_init;
    s0_pageNamespace := s0_pageNamespace_init;
    s0_userId := s0_userId_init;
    s0_userText := s0_userText_init;
    s0_otherUserId := s0_otherUserId_init;
    s1_nextRevId := s1_nextRevId_init;
    s1_pageId := s1_pageId_init;
    s1_pageTitle := s1_pageTitle_init;
    s1_pageNamespace := s1_pageNamespace_init;
    s1_userId := s1_userId_init;
    s1_userText := s1_userText_init;
    s1_otherUserId := s1_otherUserId_init;
    s0_active := true;
    s1_active := true;
  // Executing B then A:
    if (s1_active) {
    s1_block13__ba:
      s1_wl#wl_namespace := watchlist_wl_namespace[s1_otherUserId][s1_pageNamespace][s1_pageTitle];
      s1_wl#wl_title := watchlist_wl_title[s1_otherUserId][s1_pageNamespace][s1_pageTitle];
      s1_wl#wl_user := watchlist_wl_user[s1_otherUserId][s1_pageNamespace][s1_pageTitle];
      watchlist_wl_namespace := watchlist_wl_namespace[s1_otherUserId := watchlist_wl_namespace[s1_otherUserId][s1_pageNamespace := watchlist_wl_namespace[s1_otherUserId][s1_pageNamespace][s1_pageTitle := s1_wl#wl_namespace]]];
      watchlist_wl_notificationtimestamp := watchlist_wl_notificationtimestamp[s1_otherUserId := watchlist_wl_notificationtimestamp[s1_otherUserId][s1_pageNamespace := watchlist_wl_notificationtimestamp[s1_otherUserId][s1_pageNamespace][s1_pageTitle := 1]]];
      watchlist_wl_title := watchlist_wl_title[s1_otherUserId := watchlist_wl_title[s1_otherUserId][s1_pageNamespace := watchlist_wl_title[s1_otherUserId][s1_pageNamespace][s1_pageTitle := s1_wl#wl_title]]];
      watchlist_wl_user := watchlist_wl_user[s1_otherUserId := watchlist_wl_user[s1_otherUserId][s1_pageNamespace := watchlist_wl_user[s1_otherUserId][s1_pageNamespace][s1_pageTitle := s1_wl#wl_user]]];
      goto s1_hop_exit__ba;
    s1_hop_exit__ba:
    }
    if (s0_active) {
    s0_block13__ba:
      s0_wl#wl_namespace := watchlist_wl_namespace[s0_otherUserId][s0_pageNamespace][s0_pageTitle];
      s0_wl#wl_title := watchlist_wl_title[s0_otherUserId][s0_pageNamespace][s0_pageTitle];
      s0_wl#wl_user := watchlist_wl_user[s0_otherUserId][s0_pageNamespace][s0_pageTitle];
      watchlist_wl_namespace := watchlist_wl_namespace[s0_otherUserId := watchlist_wl_namespace[s0_otherUserId][s0_pageNamespace := watchlist_wl_namespace[s0_otherUserId][s0_pageNamespace][s0_pageTitle := s0_wl#wl_namespace]]];
      watchlist_wl_notificationtimestamp := watchlist_wl_notificationtimestamp[s0_otherUserId := watchlist_wl_notificationtimestamp[s0_otherUserId][s0_pageNamespace := watchlist_wl_notificationtimestamp[s0_otherUserId][s0_pageNamespace][s0_pageTitle := 1]]];
      watchlist_wl_title := watchlist_wl_title[s0_otherUserId := watchlist_wl_title[s0_otherUserId][s0_pageNamespace := watchlist_wl_title[s0_otherUserId][s0_pageNamespace][s0_pageTitle := s0_wl#wl_title]]];
      watchlist_wl_user := watchlist_wl_user[s0_otherUserId := watchlist_wl_user[s0_otherUserId][s0_pageNamespace := watchlist_wl_user[s0_otherUserId][s0_pageNamespace][s0_pageTitle := s0_wl#wl_user]]];
      goto s0_hop_exit__ba;
    s0_hop_exit__ba:
    }
  // Snapshotting final state for b_then_a
    watchlist_wl_namespace_b_then_a := watchlist_wl_namespace;
    watchlist_wl_notificationtimestamp_b_then_a := watchlist_wl_notificationtimestamp;
    watchlist_wl_title_b_then_a := watchlist_wl_title;
    watchlist_wl_user_b_then_a := watchlist_wl_user;
    s0_nextRevId_b_then_a := s0_nextRevId;
    s0_pageId_b_then_a := s0_pageId;
    s0_pageTitle_b_then_a := s0_pageTitle;
    s0_pageNamespace_b_then_a := s0_pageNamespace;
    s0_userId_b_then_a := s0_userId;
    s0_userText_b_then_a := s0_userText;
    s1_nextRevId_b_then_a := s1_nextRevId;
    s1_pageId_b_then_a := s1_pageId;
    s1_pageTitle_b_then_a := s1_pageTitle;
    s1_pageNamespace_b_then_a := s1_pageNamespace;
    s1_userId_b_then_a := s1_userId;
    s1_userText_b_then_a := s1_userText;
  // --- Step 4: Verify A→B ≡ B→A (Special interleavings equivalence) ---
  // Verifying A->B === B->A equivalence:
    assert {:msg "(SpecialInterleavingNonEquivalence (node_1 (function_id . 20) (instance . 0) (hop_id . 9)) (node_2 (function_id . 20) (instance . 1) (hop_id . 9)))"} ((((((((((((((((watchlist_wl_namespace_a_then_b == watchlist_wl_namespace_b_then_a) && (watchlist_wl_notificationtimestamp_a_then_b == watchlist_wl_notificationtimestamp_b_then_a)) && (watchlist_wl_title_a_then_b == watchlist_wl_title_b_then_a)) && (watchlist_wl_user_a_then_b == watchlist_wl_user_b_then_a)) && (s0_nextRevId_a_then_b == s0_nextRevId_b_then_a)) && (s0_pageId_a_then_b == s0_pageId_b_then_a)) && (s0_pageTitle_a_then_b == s0_pageTitle_b_then_a)) && (s0_pageNamespace_a_then_b == s0_pageNamespace_b_then_a)) && (s0_userId_a_then_b == s0_userId_b_then_a)) && (s0_userText_a_then_b == s0_userText_b_then_a)) && (s1_nextRevId_a_then_b == s1_nextRevId_b_then_a)) && (s1_pageId_a_then_b == s1_pageId_b_then_a)) && (s1_pageTitle_a_then_b == s1_pageTitle_b_then_a)) && (s1_pageNamespace_a_then_b == s1_pageNamespace_b_then_a)) && (s1_userId_a_then_b == s1_userId_b_then_a)) && (s1_userText_a_then_b == s1_userText_b_then_a));
}

