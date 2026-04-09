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
var revision_rev_timestamp : [int][int]int;
var revision_rev_len : [int][int]int;
const TBL_user_groups : Table (user_groups);
var logging_log_namespace : [int][int]int;
var page_page_is_new : [int]int;
var logging_log_timestamp : [int][int]int;
var recentchanges_rc_ip : [int]String;
var logging_log_user_text : [int][int]String;
var user_user_editcount : [int]int;
const TBL_revision : Table (revision);
const TBL_page : Table (page);
var page_page_id : [int]int;
var ipblocks_ipb_address : [int][int]String;
var recentchanges_rc_namespace : [int]int;
const TBL_logging : Table (logging);
var logging_log_page : [int][int]int;
var ipblocks_ipb_expiry : [int][int]int;
var page_page_len : [int]int;
const __shards__ : int;
var logging_log_user : [int][int]int;
var page_restrictions_pr_type : [int][String]String;
var text_old_id : [int]int;
const TBL_page_restrictions : Table (page_restrictions);
var user_groups_ug_group : [int][String]String;
var recentchanges_rc_user : [int]int;
var logging_log_action : [int][int]String;
var page_restrictions_pr_level : [int][String]String;
var text_old_page : [int]int;
var page_page_title : [int]String;
const __slice__ : int;
const TBL_user : Table (user);
var page_page_is_redirect : [int]int;
var ipblocks_ipb_user : [int][int]int;
var page_page_touched : [int]int;
var page_page_namespace : [int]int;
var ipblocks_ipb_id : [int][int]int;
var revision_rev_comment : [int][int]String;
const TBL_text : Table (text);
const TBL_recentchanges : Table (recentchanges);
var recentchanges_rc_user_text : [int]String;
var watchlist_wl_notificationtimestamp : [int][int][String]int;
var revision_rev_id : [int][int]int;
var recentchanges_rc_this_oldid : [int]int;
var logging_log_type : [int][int]String;
var logging_log_title : [int][int]String;
var watchlist_wl_title : [int][int][String]String;
var recentchanges_rc_comment : [int]String;
var revision_rev_user : [int][int]int;
var watchlist_wl_user : [int][int][String]int;
var recentchanges_rc_timestamp : [int]int;
var logging_log_comment : [int][int]String;
var text_old_flags : [int]String;
var logging_log_params : [int][int]String;
var recentchanges_rc_new_len : [int]int;
var recentchanges_rc_title : [int]String;
var recentchanges_rc_id : [int]int;
var text_old_text : [int]String;
var revision_rev_page : [int][int]int;
var recentchanges_rc_cur_id : [int]int;
const TBL_watchlist : Table (watchlist);
var user_user_id : [int]int;
var page_restrictions_pr_page : [int][String]int;
var user_user_name : [int]String;
var page_page_latest : [int]int;
var revision_rev_text_id : [int][int]int;
var watchlist_wl_namespace : [int][int][String]int;
var revision_rev_parent_id : [int][int]int;
var user_user_touched : [int]int;
var revision_rev_user_text : [int][int]String;
var user_groups_ug_user : [int][String]int;
var recentchanges_rc_old_len : [int]int;
var logging_log_id : [int][int]int;
const TBL_ipblocks : Table (ipblocks);
var recentchanges_rc_last_oldid : [int]int;
const L_patrol : String;
const L_utf$u002D8 : String;
procedure verify_hop_partitions_UpdatePage(nextTextId: int, nextRevId: int, rcId: int, pageId: int, pageTitle: String, pageText: String, pageNamespace: int, pageLen: int, userId: int, userText: String, revisionId: int, revComment: String, otherUserId: int)
modifies logging_log_action, logging_log_comment, logging_log_namespace, logging_log_page, logging_log_params, logging_log_timestamp, logging_log_title, logging_log_type, logging_log_user_text, page_page_id, page_page_is_new, page_page_is_redirect, page_page_latest, page_page_len, page_page_namespace, page_page_title, page_page_touched, recentchanges_rc_comment, recentchanges_rc_cur_id, recentchanges_rc_ip, recentchanges_rc_last_oldid, recentchanges_rc_namespace, recentchanges_rc_new_len, recentchanges_rc_old_len, recentchanges_rc_this_oldid, recentchanges_rc_timestamp, recentchanges_rc_title, recentchanges_rc_user, recentchanges_rc_user_text, revision_rev_comment, revision_rev_len, revision_rev_parent_id, revision_rev_text_id, revision_rev_timestamp, revision_rev_user, revision_rev_user_text, text_old_flags, text_old_page, text_old_text, user_user_editcount, user_user_id, user_user_name, user_user_touched, watchlist_wl_namespace, watchlist_wl_notificationtimestamp, watchlist_wl_title, watchlist_wl_user;
{
  var s8_nextTextId : int;
  var s8_pageId : int;
  var s8_pageText : String;
  var s8_nextRevId : int;
  var s8_revComment : String;
  var s8_userId : int;
  var s8_userText : String;
  var s8_pageLen : int;
  var s8_revisionId : int;
  var s8_p#page_id : int;
  var s8_p#page_is_new : int;
  var s8_p#page_is_redirect : int;
  var s8_p#page_namespace : int;
  var s8_p#page_title : String;
  var s8_p#page_latest : int;
  var s8_p#page_len : int;
  var s8_rcId : int;
  var s8_pageNamespace : int;
  var s8_pageTitle : String;
  var s9_wl#wl_namespace : int;
  var s9_otherUserId : int;
  var s9_pageNamespace : int;
  var s9_pageTitle : String;
  var s9_wl#wl_title : String;
  var s9_wl#wl_user : int;
  var s10_userId : int;
  var s10_nextRevId : int;
  var s10_userText : String;
  var s10_pageNamespace : int;
  var s10_pageTitle : String;
  var s10_pageId : int;
  var s10_u#user_editcount : int;
  var s10_u#user_id : int;
  var s10_u#user_name : String;
  var s10_#tmp20 : int;

  // Hop partition verification for function 'UpdatePage'
  s8_block12:
    text_old_page := text_old_page[s8_nextTextId := s8_pageId];
    text_old_text := text_old_text[s8_nextTextId := s8_pageText];
  // Partition check hop 8 func 'f' tables 'text'=>'text' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 6) (span ((start . 10075) (end . 10206) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_nextTextId);
    text_old_flags := text_old_flags[s8_nextTextId := L_utf$u002D8];
  // Partition check hop 8 func 'f' tables 'text'=>'text' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 6) (span ((start . 10075) (end . 10206) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_nextTextId);
    revision_rev_text_id := revision_rev_text_id[s8_pageId := revision_rev_text_id[s8_pageId][s8_nextRevId := s8_nextTextId]];
  // Partition check hop 8 func 'f' tables 'text'=>'revision' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10292, end: 10590, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 5) (span ((start . 10292) (end . 10590) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    revision_rev_comment := revision_rev_comment[s8_pageId := revision_rev_comment[s8_pageId][s8_nextRevId := s8_revComment]];
  // Partition check hop 8 func 'f' tables 'text'=>'revision' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10292, end: 10590, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 5) (span ((start . 10292) (end . 10590) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    revision_rev_user := revision_rev_user[s8_pageId := revision_rev_user[s8_pageId][s8_nextRevId := s8_userId]];
  // Partition check hop 8 func 'f' tables 'text'=>'revision' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10292, end: 10590, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 5) (span ((start . 10292) (end . 10590) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    revision_rev_user_text := revision_rev_user_text[s8_pageId := revision_rev_user_text[s8_pageId][s8_nextRevId := s8_userText]];
  // Partition check hop 8 func 'f' tables 'text'=>'revision' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10292, end: 10590, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 5) (span ((start . 10292) (end . 10590) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    revision_rev_timestamp := revision_rev_timestamp[s8_pageId := revision_rev_timestamp[s8_pageId][s8_nextRevId := 1]];
  // Partition check hop 8 func 'f' tables 'text'=>'revision' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10292, end: 10590, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 5) (span ((start . 10292) (end . 10590) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    revision_rev_len := revision_rev_len[s8_pageId := revision_rev_len[s8_pageId][s8_nextRevId := s8_pageLen]];
  // Partition check hop 8 func 'f' tables 'text'=>'revision' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10292, end: 10590, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 5) (span ((start . 10292) (end . 10590) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    revision_rev_parent_id := revision_rev_parent_id[s8_pageId := revision_rev_parent_id[s8_pageId][s8_nextRevId := s8_revisionId]];
  // Partition check hop 8 func 'f' tables 'text'=>'revision' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10292, end: 10590, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 5) (span ((start . 10292) (end . 10590) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    s8_p#page_id := page_page_id[s8_pageId];
  // Partition check hop 8 func 'f' tables 'text'=>'page' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10673, end: 10694, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 2) (span ((start . 10673) (end . 10694) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    s8_p#page_is_new := page_page_is_new[s8_pageId];
  // Partition check hop 8 func 'f' tables 'text'=>'page' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10673, end: 10694, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 2) (span ((start . 10673) (end . 10694) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    s8_p#page_is_redirect := page_page_is_redirect[s8_pageId];
  // Partition check hop 8 func 'f' tables 'text'=>'page' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10673, end: 10694, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 2) (span ((start . 10673) (end . 10694) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    s8_p#page_namespace := page_page_namespace[s8_pageId];
  // Partition check hop 8 func 'f' tables 'text'=>'page' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10673, end: 10694, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 2) (span ((start . 10673) (end . 10694) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    s8_p#page_title := page_page_title[s8_pageId];
  // Partition check hop 8 func 'f' tables 'text'=>'page' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10673, end: 10694, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 2) (span ((start . 10673) (end . 10694) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    s8_p#page_latest := s8_nextRevId;
    s8_p#page_len := s8_pageLen;
    page_page_id := page_page_id[s8_pageId := s8_p#page_id];
  // Partition check hop 8 func 'f' tables 'text'=>'page' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10797, end: 10822, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 2) (span ((start . 10797) (end . 10822) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    page_page_is_new := page_page_is_new[s8_pageId := s8_p#page_is_new];
  // Partition check hop 8 func 'f' tables 'text'=>'page' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10797, end: 10822, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 2) (span ((start . 10797) (end . 10822) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    page_page_is_redirect := page_page_is_redirect[s8_pageId := s8_p#page_is_redirect];
  // Partition check hop 8 func 'f' tables 'text'=>'page' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10797, end: 10822, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 2) (span ((start . 10797) (end . 10822) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    page_page_latest := page_page_latest[s8_pageId := s8_p#page_latest];
  // Partition check hop 8 func 'f' tables 'text'=>'page' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10797, end: 10822, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 2) (span ((start . 10797) (end . 10822) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    page_page_len := page_page_len[s8_pageId := s8_p#page_len];
  // Partition check hop 8 func 'f' tables 'text'=>'page' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10797, end: 10822, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 2) (span ((start . 10797) (end . 10822) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    page_page_namespace := page_page_namespace[s8_pageId := s8_p#page_namespace];
  // Partition check hop 8 func 'f' tables 'text'=>'page' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10797, end: 10822, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 2) (span ((start . 10797) (end . 10822) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    page_page_title := page_page_title[s8_pageId := s8_p#page_title];
  // Partition check hop 8 func 'f' tables 'text'=>'page' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10797, end: 10822, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 2) (span ((start . 10797) (end . 10822) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    page_page_touched := page_page_touched[s8_pageId := 1];
  // Partition check hop 8 func 'f' tables 'text'=>'page' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10797, end: 10822, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 2) (span ((start . 10797) (end . 10822) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_pageId);
    recentchanges_rc_timestamp := recentchanges_rc_timestamp[s8_rcId := 1];
  // Partition check hop 8 func 'f' tables 'text'=>'recentchanges' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10906, end: 11341, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 8) (span ((start . 10906) (end . 11341) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_rcId);
    recentchanges_rc_namespace := recentchanges_rc_namespace[s8_rcId := s8_pageNamespace];
  // Partition check hop 8 func 'f' tables 'text'=>'recentchanges' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10906, end: 11341, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 8) (span ((start . 10906) (end . 11341) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_rcId);
    recentchanges_rc_title := recentchanges_rc_title[s8_rcId := s8_pageTitle];
  // Partition check hop 8 func 'f' tables 'text'=>'recentchanges' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10906, end: 11341, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 8) (span ((start . 10906) (end . 11341) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_rcId);
    recentchanges_rc_cur_id := recentchanges_rc_cur_id[s8_rcId := s8_pageId];
  // Partition check hop 8 func 'f' tables 'text'=>'recentchanges' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10906, end: 11341, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 8) (span ((start . 10906) (end . 11341) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_rcId);
    recentchanges_rc_user := recentchanges_rc_user[s8_rcId := s8_userId];
  // Partition check hop 8 func 'f' tables 'text'=>'recentchanges' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10906, end: 11341, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 8) (span ((start . 10906) (end . 11341) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_rcId);
    recentchanges_rc_user_text := recentchanges_rc_user_text[s8_rcId := s8_userText];
  // Partition check hop 8 func 'f' tables 'text'=>'recentchanges' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10906, end: 11341, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 8) (span ((start . 10906) (end . 11341) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_rcId);
    recentchanges_rc_comment := recentchanges_rc_comment[s8_rcId := s8_revComment];
  // Partition check hop 8 func 'f' tables 'text'=>'recentchanges' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10906, end: 11341, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 8) (span ((start . 10906) (end . 11341) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_rcId);
    recentchanges_rc_this_oldid := recentchanges_rc_this_oldid[s8_rcId := s8_nextTextId];
  // Partition check hop 8 func 'f' tables 'text'=>'recentchanges' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10906, end: 11341, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 8) (span ((start . 10906) (end . 11341) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_rcId);
    recentchanges_rc_last_oldid := recentchanges_rc_last_oldid[s8_rcId := s8_revisionId];
  // Partition check hop 8 func 'f' tables 'text'=>'recentchanges' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10906, end: 11341, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 8) (span ((start . 10906) (end . 11341) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_rcId);
    recentchanges_rc_ip := recentchanges_rc_ip[s8_rcId := empty];
  // Partition check hop 8 func 'f' tables 'text'=>'recentchanges' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10906, end: 11341, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 8) (span ((start . 10906) (end . 11341) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_rcId);
    recentchanges_rc_old_len := recentchanges_rc_old_len[s8_rcId := 0];
  // Partition check hop 8 func 'f' tables 'text'=>'recentchanges' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10906, end: 11341, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 8) (span ((start . 10906) (end . 11341) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_rcId);
    recentchanges_rc_new_len := recentchanges_rc_new_len[s8_rcId := s8_p#page_len];
  // Partition check hop 8 func 'f' tables 'text'=>'recentchanges' keys [k0=nextTextId] first_span Span { start: 10075, end: 10206, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 10906, end: 11341, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 8) (table_id . 8) (span ((start . 10906) (end . 11341) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s8_nextTextId == s8_rcId);
    goto s8_hop_exit;
  s8_hop_exit:
  s9_block13:
    s9_wl#wl_namespace := watchlist_wl_namespace[s9_otherUserId][s9_pageNamespace][s9_pageTitle];
    s9_wl#wl_title := watchlist_wl_title[s9_otherUserId][s9_pageNamespace][s9_pageTitle];
  // Partition check hop 9 func 'f' tables 'watchlist'=>'watchlist' keys [k0=otherUserId] first_span Span { start: 11547, end: 11714, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 11547, end: 11714, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 9) (table_id . 1) (span ((start . 11547) (end . 11714) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s9_otherUserId == s9_otherUserId);
    s9_wl#wl_user := watchlist_wl_user[s9_otherUserId][s9_pageNamespace][s9_pageTitle];
  // Partition check hop 9 func 'f' tables 'watchlist'=>'watchlist' keys [k0=otherUserId] first_span Span { start: 11547, end: 11714, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 11547, end: 11714, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 9) (table_id . 1) (span ((start . 11547) (end . 11714) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s9_otherUserId == s9_otherUserId);
    watchlist_wl_namespace := watchlist_wl_namespace[s9_otherUserId := watchlist_wl_namespace[s9_otherUserId][s9_pageNamespace := watchlist_wl_namespace[s9_otherUserId][s9_pageNamespace][s9_pageTitle := s9_wl#wl_namespace]]];
  // Partition check hop 9 func 'f' tables 'watchlist'=>'watchlist' keys [k0=otherUserId] first_span Span { start: 11547, end: 11714, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 11765, end: 11851, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 9) (table_id . 1) (span ((start . 11765) (end . 11851) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s9_otherUserId == s9_otherUserId);
    watchlist_wl_notificationtimestamp := watchlist_wl_notificationtimestamp[s9_otherUserId := watchlist_wl_notificationtimestamp[s9_otherUserId][s9_pageNamespace := watchlist_wl_notificationtimestamp[s9_otherUserId][s9_pageNamespace][s9_pageTitle := 1]]];
  // Partition check hop 9 func 'f' tables 'watchlist'=>'watchlist' keys [k0=otherUserId] first_span Span { start: 11547, end: 11714, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 11765, end: 11851, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 9) (table_id . 1) (span ((start . 11765) (end . 11851) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s9_otherUserId == s9_otherUserId);
    watchlist_wl_title := watchlist_wl_title[s9_otherUserId := watchlist_wl_title[s9_otherUserId][s9_pageNamespace := watchlist_wl_title[s9_otherUserId][s9_pageNamespace][s9_pageTitle := s9_wl#wl_title]]];
  // Partition check hop 9 func 'f' tables 'watchlist'=>'watchlist' keys [k0=otherUserId] first_span Span { start: 11547, end: 11714, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 11765, end: 11851, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 9) (table_id . 1) (span ((start . 11765) (end . 11851) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s9_otherUserId == s9_otherUserId);
    watchlist_wl_user := watchlist_wl_user[s9_otherUserId := watchlist_wl_user[s9_otherUserId][s9_pageNamespace := watchlist_wl_user[s9_otherUserId][s9_pageNamespace][s9_pageTitle := s9_wl#wl_user]]];
  // Partition check hop 9 func 'f' tables 'watchlist'=>'watchlist' keys [k0=otherUserId] first_span Span { start: 11547, end: 11714, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 11765, end: 11851, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 9) (table_id . 1) (span ((start . 11765) (end . 11851) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s9_otherUserId == s9_otherUserId);
    goto s9_hop_exit;
  s9_hop_exit:
  s10_block14:
    logging_log_type := logging_log_type[s10_userId := logging_log_type[s10_userId][s10_nextRevId := L_patrol]];
    logging_log_action := logging_log_action[s10_userId := logging_log_action[s10_userId][s10_nextRevId := L_patrol]];
  // Partition check hop 10 func 'f' tables 'logging'=>'logging' keys [k0=userId] first_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 10) (table_id . 9) (span ((start . 11966) (end . 12319) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s10_userId == s10_userId);
    logging_log_timestamp := logging_log_timestamp[s10_userId := logging_log_timestamp[s10_userId][s10_nextRevId := 1]];
  // Partition check hop 10 func 'f' tables 'logging'=>'logging' keys [k0=userId] first_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 10) (table_id . 9) (span ((start . 11966) (end . 12319) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s10_userId == s10_userId);
    logging_log_user_text := logging_log_user_text[s10_userId := logging_log_user_text[s10_userId][s10_nextRevId := s10_userText]];
  // Partition check hop 10 func 'f' tables 'logging'=>'logging' keys [k0=userId] first_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 10) (table_id . 9) (span ((start . 11966) (end . 12319) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s10_userId == s10_userId);
    logging_log_namespace := logging_log_namespace[s10_userId := logging_log_namespace[s10_userId][s10_nextRevId := s10_pageNamespace]];
  // Partition check hop 10 func 'f' tables 'logging'=>'logging' keys [k0=userId] first_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 10) (table_id . 9) (span ((start . 11966) (end . 12319) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s10_userId == s10_userId);
    logging_log_title := logging_log_title[s10_userId := logging_log_title[s10_userId][s10_nextRevId := s10_pageTitle]];
  // Partition check hop 10 func 'f' tables 'logging'=>'logging' keys [k0=userId] first_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 10) (table_id . 9) (span ((start . 11966) (end . 12319) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s10_userId == s10_userId);
    logging_log_page := logging_log_page[s10_userId := logging_log_page[s10_userId][s10_nextRevId := s10_pageId]];
  // Partition check hop 10 func 'f' tables 'logging'=>'logging' keys [k0=userId] first_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 10) (table_id . 9) (span ((start . 11966) (end . 12319) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s10_userId == s10_userId);
    logging_log_comment := logging_log_comment[s10_userId := logging_log_comment[s10_userId][s10_nextRevId := empty]];
  // Partition check hop 10 func 'f' tables 'logging'=>'logging' keys [k0=userId] first_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 10) (table_id . 9) (span ((start . 11966) (end . 12319) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s10_userId == s10_userId);
    logging_log_params := logging_log_params[s10_userId := logging_log_params[s10_userId][s10_nextRevId := empty]];
  // Partition check hop 10 func 'f' tables 'logging'=>'logging' keys [k0=userId] first_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 10) (table_id . 9) (span ((start . 11966) (end . 12319) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s10_userId == s10_userId);
    s10_u#user_editcount := user_user_editcount[s10_userId];
  // Partition check hop 10 func 'f' tables 'logging'=>'user' keys [k0=userId] first_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 12349, end: 12370, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 10) (table_id . 0) (span ((start . 12349) (end . 12370) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s10_userId == s10_userId);
    s10_u#user_id := user_user_id[s10_userId];
  // Partition check hop 10 func 'f' tables 'logging'=>'user' keys [k0=userId] first_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 12349, end: 12370, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 10) (table_id . 0) (span ((start . 12349) (end . 12370) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s10_userId == s10_userId);
    s10_u#user_name := user_user_name[s10_userId];
  // Partition check hop 10 func 'f' tables 'logging'=>'user' keys [k0=userId] first_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 12349, end: 12370, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 10) (table_id . 0) (span ((start . 12349) (end . 12370) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s10_userId == s10_userId);
    s10_#tmp20 := s10_u#user_editcount + 1;
    s10_u#user_editcount := s10_#tmp20;
    user_user_editcount := user_user_editcount[s10_userId := s10_u#user_editcount];
  // Partition check hop 10 func 'f' tables 'logging'=>'user' keys [k0=userId] first_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 12457, end: 12482, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 10) (table_id . 0) (span ((start . 12457) (end . 12482) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s10_userId == s10_userId);
    user_user_id := user_user_id[s10_userId := s10_u#user_id];
  // Partition check hop 10 func 'f' tables 'logging'=>'user' keys [k0=userId] first_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 12457, end: 12482, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 10) (table_id . 0) (span ((start . 12457) (end . 12482) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s10_userId == s10_userId);
    user_user_name := user_user_name[s10_userId := s10_u#user_name];
  // Partition check hop 10 func 'f' tables 'logging'=>'user' keys [k0=userId] first_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 12457, end: 12482, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 10) (table_id . 0) (span ((start . 12457) (end . 12482) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s10_userId == s10_userId);
    user_user_touched := user_user_touched[s10_userId := 1];
  // Partition check hop 10 func 'f' tables 'logging'=>'user' keys [k0=userId] first_span Span { start: 11966, end: 12319, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" } current_span Span { start: 12457, end: 12482, filename: "/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 10) (table_id . 0) (span ((start . 12457) (end . 12482) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/wikipedia.transact\"))))"} (s10_userId == s10_userId);
    goto s10_epilogue;
  s10_hop_exit:
  s8_epilogue:
  s9_epilogue:
  s10_epilogue:
}

