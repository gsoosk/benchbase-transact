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
function get_uid#21(arg0: Iterator (Table (USER))) returns (int);
function model_get_uid#21(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (USER)) :: hasNext(iter) ==> get_uid#21(iter) == model_get_uid#21(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_f1#22(arg0: Iterator (Table (FOLLOWERS))) returns (int);
function model_get_f1#22(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (FOLLOWERS)) :: hasNext(iter) ==> get_f1#22(iter) == model_get_f1#22(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_f2#23(arg0: Iterator (Table (FOLLOWERS))) returns (int);
function model_get_f2#23(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (FOLLOWERS)) :: hasNext(iter) ==> get_f2#23(iter) == model_get_f2#23(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_f1#24(arg0: Iterator (Table (FOLLOWS))) returns (int);
function model_get_f1#24(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (FOLLOWS)) :: hasNext(iter) ==> get_f1#24(iter) == model_get_f1#24(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_f2#25(arg0: Iterator (Table (FOLLOWS))) returns (int);
function model_get_f2#25(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (FOLLOWS)) :: hasNext(iter) ==> get_f2#25(iter) == model_get_f2#25(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_uid#26(arg0: Iterator (Table (TWEETS))) returns (int);
function model_get_uid#26(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (TWEETS)) :: hasNext(iter) ==> get_uid#26(iter) == model_get_uid#26(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_id#27(arg0: Iterator (Table (TWEETS))) returns (int);
function model_get_id#27(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (TWEETS)) :: hasNext(iter) ==> get_id#27(iter) == model_get_id#27(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_uid#28(arg0: Iterator (Table (ADDED_TWEETS))) returns (int);
function model_get_uid#28(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (ADDED_TWEETS)) :: hasNext(iter) ==> get_uid#28(iter) == model_get_uid#28(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_id#29(arg0: Iterator (Table (ADDED_TWEETS))) returns (int);
function model_get_id#29(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (ADDED_TWEETS)) :: hasNext(iter) ==> get_id#29(iter) == model_get_id#29(iter_n(iter), iter_m(iter), iter_position(iter)));
type Table a;
type USER;
type FOLLOWERS;
type FOLLOWS;
type TWEETS;
type ADDED_TWEETS;
type Row a;
function construct_Row_USER(uid: int, name: String): Row (Table USER);
axiom (forall
    uid_1: int, name_1: String,
    uid_2: int, name_2: String
    ::
    construct_Row_USER(uid_1, name_1) == construct_Row_USER(uid_2, name_2)
    <==>
    (uid_1 == uid_2 && name_1 == name_2)
);
function construct_Row_FOLLOWERS(f1: int, f2: int): Row (Table FOLLOWERS);
axiom (forall
    f1_1: int, f2_1: int,
    f1_2: int, f2_2: int
    ::
    construct_Row_FOLLOWERS(f1_1, f2_1) == construct_Row_FOLLOWERS(f1_2, f2_2)
    <==>
    (f1_1 == f1_2 && f2_1 == f2_2)
);
function construct_Row_FOLLOWS(f1: int, f2: int): Row (Table FOLLOWS);
axiom (forall
    f1_1: int, f2_1: int,
    f1_2: int, f2_2: int
    ::
    construct_Row_FOLLOWS(f1_1, f2_1) == construct_Row_FOLLOWS(f1_2, f2_2)
    <==>
    (f1_1 == f1_2 && f2_1 == f2_2)
);
function construct_Row_TWEETS(uid: int, id: int, text: String, createdate: int): Row (Table TWEETS);
axiom (forall
    uid_1: int, id_1: int, text_1: String, createdate_1: int,
    uid_2: int, id_2: int, text_2: String, createdate_2: int
    ::
    construct_Row_TWEETS(uid_1, id_1, text_1, createdate_1) == construct_Row_TWEETS(uid_2, id_2, text_2, createdate_2)
    <==>
    (uid_1 == uid_2 && id_1 == id_2 && text_1 == text_2 && createdate_1 == createdate_2)
);
function construct_Row_ADDED_TWEETS(uid: int, id: int, text: String, createdate: int): Row (Table ADDED_TWEETS);
axiom (forall
    uid_1: int, id_1: int, text_1: String, createdate_1: int,
    uid_2: int, id_2: int, text_2: String, createdate_2: int
    ::
    construct_Row_ADDED_TWEETS(uid_1, id_1, text_1, createdate_1) == construct_Row_ADDED_TWEETS(uid_2, id_2, text_2, createdate_2)
    <==>
    (uid_1 == uid_2 && id_1 == id_2 && text_1 == text_2 && createdate_1 == createdate_2)
);
const __slice__ : int;
const TBL_FOLLOWERS : Table (FOLLOWERS);
var TWEETS_createdate : [int][int]int;
var ADDED_TWEETS_id : [int][int]int;
const TBL_FOLLOWS : Table (FOLLOWS);
const TBL_TWEETS : Table (TWEETS);
const TBL_ADDED_TWEETS : Table (ADDED_TWEETS);
var FOLLOWS_f2 : [int][int]int;
var ADDED_TWEETS_createdate : [int][int]int;
const __shards__ : int;
var USER_name : [int]String;
var FOLLOWERS_f1 : [int][int]int;
var ADDED_TWEETS_uid : [int][int]int;
const TBL_USER : Table (USER);
var TWEETS_uid : [int][int]int;
var TWEETS_id : [int][int]int;
var ADDED_TWEETS_text : [int][int]String;
var TWEETS_text : [int][int]String;
var FOLLOWS_f1 : [int][int]int;
var USER_uid : [int]int;
var FOLLOWERS_f2 : [int][int]int;
procedure verify_hop_partitions_InsertTweet(uid: int, tweet_id: int, text: String, createdate: int)
modifies ADDED_TWEETS_createdate, ADDED_TWEETS_text;
{
  var s7_uid : int;
  var s7_tweet_id : int;
  var s7_text : String;
  var s7_createdate : int;

  // Hop partition verification for function 'InsertTweet'
  s7_block7:
    ADDED_TWEETS_text := ADDED_TWEETS_text[s7_uid := ADDED_TWEETS_text[s7_uid][s7_tweet_id := s7_text]];
    ADDED_TWEETS_createdate := ADDED_TWEETS_createdate[s7_uid := ADDED_TWEETS_createdate[s7_uid][s7_tweet_id := s7_createdate]];
  // Partition check hop 7 func 'p' tables 'ADDED_TWEETS'=>'ADDED_TWEETS' keys [k0=uid] first_span Span { start: 4301, end: 4410, filename: "/Users/farzad/Desktop/Research/benchbase-transact/twitter.transact" } current_span Span { start: 4301, end: 4410, filename: "/Users/farzad/Desktop/Research/benchbase-transact/twitter.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 15) (function_id . 20) (hop_id . 7) (table_id . 4) (span ((start . 4301) (end . 4410) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/twitter.transact\"))))"} (s7_uid == s7_uid);
    goto s7_epilogue;
  s7_hop_exit:
  s7_epilogue:
}

