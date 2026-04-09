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
function get_d_date_sk#26(arg0: Iterator (Table (date_dim))) returns (int);
function model_get_d_date_sk#26(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (date_dim)) :: hasNext(iter) ==> get_d_date_sk#26(iter) == model_get_d_date_sk#26(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_t_time_sk#27(arg0: Iterator (Table (time_dim))) returns (int);
function model_get_t_time_sk#27(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (time_dim)) :: hasNext(iter) ==> get_t_time_sk#27(iter) == model_get_t_time_sk#27(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_p_promo_sk#28(arg0: Iterator (Table (promotion))) returns (int);
function model_get_p_promo_sk#28(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (promotion)) :: hasNext(iter) ==> get_p_promo_sk#28(iter) == model_get_p_promo_sk#28(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_i_item_sk#29(arg0: Iterator (Table (item))) returns (int);
function model_get_i_item_sk#29(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (item)) :: hasNext(iter) ==> get_i_item_sk#29(iter) == model_get_i_item_sk#29(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_c_customer_sk#30(arg0: Iterator (Table (customer))) returns (int);
function model_get_c_customer_sk#30(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (customer)) :: hasNext(iter) ==> get_c_customer_sk#30(iter) == model_get_c_customer_sk#30(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_cd_demo_sk#31(arg0: Iterator (Table (customer_demographics))) returns (int);
function model_get_cd_demo_sk#31(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (customer_demographics)) :: hasNext(iter) ==> get_cd_demo_sk#31(iter) == model_get_cd_demo_sk#31(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ca_address_sk#32(arg0: Iterator (Table (customer_address))) returns (int);
function model_get_ca_address_sk#32(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (customer_address)) :: hasNext(iter) ==> get_ca_address_sk#32(iter) == model_get_ca_address_sk#32(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_s_store_sk#33(arg0: Iterator (Table (store))) returns (int);
function model_get_s_store_sk#33(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (store)) :: hasNext(iter) ==> get_s_store_sk#33(iter) == model_get_s_store_sk#33(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_w_warehouse_sk#34(arg0: Iterator (Table (warehouse))) returns (int);
function model_get_w_warehouse_sk#34(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (warehouse)) :: hasNext(iter) ==> get_w_warehouse_sk#34(iter) == model_get_w_warehouse_sk#34(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ss_item_sk#35(arg0: Iterator (Table (store_sales))) returns (int);
function model_get_ss_item_sk#35(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (store_sales)) :: hasNext(iter) ==> get_ss_item_sk#35(iter) == model_get_ss_item_sk#35(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ss_ticket_number#36(arg0: Iterator (Table (store_sales))) returns (int);
function model_get_ss_ticket_number#36(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (store_sales)) :: hasNext(iter) ==> get_ss_ticket_number#36(iter) == model_get_ss_ticket_number#36(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_sr_item_sk#37(arg0: Iterator (Table (store_returns))) returns (int);
function model_get_sr_item_sk#37(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (store_returns)) :: hasNext(iter) ==> get_sr_item_sk#37(iter) == model_get_sr_item_sk#37(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_sr_ticket_number#38(arg0: Iterator (Table (store_returns))) returns (int);
function model_get_sr_ticket_number#38(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (store_returns)) :: hasNext(iter) ==> get_sr_ticket_number#38(iter) == model_get_sr_ticket_number#38(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_cs_item_sk#39(arg0: Iterator (Table (catalog_sales))) returns (int);
function model_get_cs_item_sk#39(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (catalog_sales)) :: hasNext(iter) ==> get_cs_item_sk#39(iter) == model_get_cs_item_sk#39(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_cs_order_number#40(arg0: Iterator (Table (catalog_sales))) returns (int);
function model_get_cs_order_number#40(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (catalog_sales)) :: hasNext(iter) ==> get_cs_order_number#40(iter) == model_get_cs_order_number#40(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_cr_item_sk#41(arg0: Iterator (Table (catalog_returns))) returns (int);
function model_get_cr_item_sk#41(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (catalog_returns)) :: hasNext(iter) ==> get_cr_item_sk#41(iter) == model_get_cr_item_sk#41(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_cr_order_number#42(arg0: Iterator (Table (catalog_returns))) returns (int);
function model_get_cr_order_number#42(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (catalog_returns)) :: hasNext(iter) ==> get_cr_order_number#42(iter) == model_get_cr_order_number#42(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ws_item_sk#43(arg0: Iterator (Table (web_sales))) returns (int);
function model_get_ws_item_sk#43(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (web_sales)) :: hasNext(iter) ==> get_ws_item_sk#43(iter) == model_get_ws_item_sk#43(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_ws_order_number#44(arg0: Iterator (Table (web_sales))) returns (int);
function model_get_ws_order_number#44(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (web_sales)) :: hasNext(iter) ==> get_ws_order_number#44(iter) == model_get_ws_order_number#44(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_wr_item_sk#45(arg0: Iterator (Table (web_returns))) returns (int);
function model_get_wr_item_sk#45(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (web_returns)) :: hasNext(iter) ==> get_wr_item_sk#45(iter) == model_get_wr_item_sk#45(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_wr_order_number#46(arg0: Iterator (Table (web_returns))) returns (int);
function model_get_wr_order_number#46(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (web_returns)) :: hasNext(iter) ==> get_wr_order_number#46(iter) == model_get_wr_order_number#46(iter_n(iter), iter_m(iter), iter_position(iter)));
type Table a;
type date_dim;
type time_dim;
type promotion;
type item;
type customer;
type customer_demographics;
type customer_address;
type store;
type warehouse;
type store_sales;
type store_returns;
type catalog_sales;
type catalog_returns;
type web_sales;
type web_returns;
type Row a;
function construct_Row_date_dim(d_date_sk: int, d_date: int, d_year: int, d_month_seq: int, d_qoy: int, d_moy: int, d_day_name: String): Row (Table date_dim);
axiom (forall
    d_date_sk_1: int, d_date_1: int, d_year_1: int, d_month_seq_1: int, d_qoy_1: int, d_moy_1: int, d_day_name_1: String,
    d_date_sk_2: int, d_date_2: int, d_year_2: int, d_month_seq_2: int, d_qoy_2: int, d_moy_2: int, d_day_name_2: String
    ::
    construct_Row_date_dim(d_date_sk_1, d_date_1, d_year_1, d_month_seq_1, d_qoy_1, d_moy_1, d_day_name_1) == construct_Row_date_dim(d_date_sk_2, d_date_2, d_year_2, d_month_seq_2, d_qoy_2, d_moy_2, d_day_name_2)
    <==>
    (d_date_sk_1 == d_date_sk_2 && d_date_1 == d_date_2 && d_year_1 == d_year_2 && d_month_seq_1 == d_month_seq_2 && d_qoy_1 == d_qoy_2 && d_moy_1 == d_moy_2 && d_day_name_1 == d_day_name_2)
);
function construct_Row_time_dim(t_time_sk: int, t_hour: int, t_minute: int, t_am_pm: String): Row (Table time_dim);
axiom (forall
    t_time_sk_1: int, t_hour_1: int, t_minute_1: int, t_am_pm_1: String,
    t_time_sk_2: int, t_hour_2: int, t_minute_2: int, t_am_pm_2: String
    ::
    construct_Row_time_dim(t_time_sk_1, t_hour_1, t_minute_1, t_am_pm_1) == construct_Row_time_dim(t_time_sk_2, t_hour_2, t_minute_2, t_am_pm_2)
    <==>
    (t_time_sk_1 == t_time_sk_2 && t_hour_1 == t_hour_2 && t_minute_1 == t_minute_2 && t_am_pm_1 == t_am_pm_2)
);
function construct_Row_promotion(p_promo_sk: int, p_promo_name: String, p_channel_email: String, p_channel_tv: String, p_channel_radio: String): Row (Table promotion);
axiom (forall
    p_promo_sk_1: int, p_promo_name_1: String, p_channel_email_1: String, p_channel_tv_1: String, p_channel_radio_1: String,
    p_promo_sk_2: int, p_promo_name_2: String, p_channel_email_2: String, p_channel_tv_2: String, p_channel_radio_2: String
    ::
    construct_Row_promotion(p_promo_sk_1, p_promo_name_1, p_channel_email_1, p_channel_tv_1, p_channel_radio_1) == construct_Row_promotion(p_promo_sk_2, p_promo_name_2, p_channel_email_2, p_channel_tv_2, p_channel_radio_2)
    <==>
    (p_promo_sk_1 == p_promo_sk_2 && p_promo_name_1 == p_promo_name_2 && p_channel_email_1 == p_channel_email_2 && p_channel_tv_1 == p_channel_tv_2 && p_channel_radio_1 == p_channel_radio_2)
);
function construct_Row_item(i_item_sk: int, i_item_id: String, i_item_desc: String, i_current_price: real, i_class: String, i_category: String, i_manufact: String): Row (Table item);
axiom (forall
    i_item_sk_1: int, i_item_id_1: String, i_item_desc_1: String, i_current_price_1: real, i_class_1: String, i_category_1: String, i_manufact_1: String,
    i_item_sk_2: int, i_item_id_2: String, i_item_desc_2: String, i_current_price_2: real, i_class_2: String, i_category_2: String, i_manufact_2: String
    ::
    construct_Row_item(i_item_sk_1, i_item_id_1, i_item_desc_1, i_current_price_1, i_class_1, i_category_1, i_manufact_1) == construct_Row_item(i_item_sk_2, i_item_id_2, i_item_desc_2, i_current_price_2, i_class_2, i_category_2, i_manufact_2)
    <==>
    (i_item_sk_1 == i_item_sk_2 && i_item_id_1 == i_item_id_2 && i_item_desc_1 == i_item_desc_2 && i_current_price_1 == i_current_price_2 && i_class_1 == i_class_2 && i_category_1 == i_category_2 && i_manufact_1 == i_manufact_2)
);
function construct_Row_customer(c_customer_sk: int, c_customer_id: String, c_first_name: String, c_last_name: String, c_birth_year: int, c_email_address: String): Row (Table customer);
axiom (forall
    c_customer_sk_1: int, c_customer_id_1: String, c_first_name_1: String, c_last_name_1: String, c_birth_year_1: int, c_email_address_1: String,
    c_customer_sk_2: int, c_customer_id_2: String, c_first_name_2: String, c_last_name_2: String, c_birth_year_2: int, c_email_address_2: String
    ::
    construct_Row_customer(c_customer_sk_1, c_customer_id_1, c_first_name_1, c_last_name_1, c_birth_year_1, c_email_address_1) == construct_Row_customer(c_customer_sk_2, c_customer_id_2, c_first_name_2, c_last_name_2, c_birth_year_2, c_email_address_2)
    <==>
    (c_customer_sk_1 == c_customer_sk_2 && c_customer_id_1 == c_customer_id_2 && c_first_name_1 == c_first_name_2 && c_last_name_1 == c_last_name_2 && c_birth_year_1 == c_birth_year_2 && c_email_address_1 == c_email_address_2)
);
function construct_Row_customer_demographics(cd_demo_sk: int, cd_gender: String, cd_marital_status: String, cd_education_status: String, cd_purchase_estimate: int, cd_credit_rating: String): Row (Table customer_demographics);
axiom (forall
    cd_demo_sk_1: int, cd_gender_1: String, cd_marital_status_1: String, cd_education_status_1: String, cd_purchase_estimate_1: int, cd_credit_rating_1: String,
    cd_demo_sk_2: int, cd_gender_2: String, cd_marital_status_2: String, cd_education_status_2: String, cd_purchase_estimate_2: int, cd_credit_rating_2: String
    ::
    construct_Row_customer_demographics(cd_demo_sk_1, cd_gender_1, cd_marital_status_1, cd_education_status_1, cd_purchase_estimate_1, cd_credit_rating_1) == construct_Row_customer_demographics(cd_demo_sk_2, cd_gender_2, cd_marital_status_2, cd_education_status_2, cd_purchase_estimate_2, cd_credit_rating_2)
    <==>
    (cd_demo_sk_1 == cd_demo_sk_2 && cd_gender_1 == cd_gender_2 && cd_marital_status_1 == cd_marital_status_2 && cd_education_status_1 == cd_education_status_2 && cd_purchase_estimate_1 == cd_purchase_estimate_2 && cd_credit_rating_1 == cd_credit_rating_2)
);
function construct_Row_customer_address(ca_address_sk: int, ca_street_number: String, ca_street_name: String, ca_city: String, ca_state: String, ca_zip: String, ca_country: String, ca_gmt_offset: real): Row (Table customer_address);
axiom (forall
    ca_address_sk_1: int, ca_street_number_1: String, ca_street_name_1: String, ca_city_1: String, ca_state_1: String, ca_zip_1: String, ca_country_1: String, ca_gmt_offset_1: real,
    ca_address_sk_2: int, ca_street_number_2: String, ca_street_name_2: String, ca_city_2: String, ca_state_2: String, ca_zip_2: String, ca_country_2: String, ca_gmt_offset_2: real
    ::
    construct_Row_customer_address(ca_address_sk_1, ca_street_number_1, ca_street_name_1, ca_city_1, ca_state_1, ca_zip_1, ca_country_1, ca_gmt_offset_1) == construct_Row_customer_address(ca_address_sk_2, ca_street_number_2, ca_street_name_2, ca_city_2, ca_state_2, ca_zip_2, ca_country_2, ca_gmt_offset_2)
    <==>
    (ca_address_sk_1 == ca_address_sk_2 && ca_street_number_1 == ca_street_number_2 && ca_street_name_1 == ca_street_name_2 && ca_city_1 == ca_city_2 && ca_state_1 == ca_state_2 && ca_zip_1 == ca_zip_2 && ca_country_1 == ca_country_2 && ca_gmt_offset_1 == ca_gmt_offset_2)
);
function construct_Row_store(s_store_sk: int, s_store_id: String, s_store_name: String, s_number_employees: int, s_state: String, s_country: String): Row (Table store);
axiom (forall
    s_store_sk_1: int, s_store_id_1: String, s_store_name_1: String, s_number_employees_1: int, s_state_1: String, s_country_1: String,
    s_store_sk_2: int, s_store_id_2: String, s_store_name_2: String, s_number_employees_2: int, s_state_2: String, s_country_2: String
    ::
    construct_Row_store(s_store_sk_1, s_store_id_1, s_store_name_1, s_number_employees_1, s_state_1, s_country_1) == construct_Row_store(s_store_sk_2, s_store_id_2, s_store_name_2, s_number_employees_2, s_state_2, s_country_2)
    <==>
    (s_store_sk_1 == s_store_sk_2 && s_store_id_1 == s_store_id_2 && s_store_name_1 == s_store_name_2 && s_number_employees_1 == s_number_employees_2 && s_state_1 == s_state_2 && s_country_1 == s_country_2)
);
function construct_Row_warehouse(w_warehouse_sk: int, w_warehouse_name: String, w_state: String, w_country: String): Row (Table warehouse);
axiom (forall
    w_warehouse_sk_1: int, w_warehouse_name_1: String, w_state_1: String, w_country_1: String,
    w_warehouse_sk_2: int, w_warehouse_name_2: String, w_state_2: String, w_country_2: String
    ::
    construct_Row_warehouse(w_warehouse_sk_1, w_warehouse_name_1, w_state_1, w_country_1) == construct_Row_warehouse(w_warehouse_sk_2, w_warehouse_name_2, w_state_2, w_country_2)
    <==>
    (w_warehouse_sk_1 == w_warehouse_sk_2 && w_warehouse_name_1 == w_warehouse_name_2 && w_state_1 == w_state_2 && w_country_1 == w_country_2)
);
function construct_Row_store_sales(ss_item_sk: int, ss_ticket_number: int, ss_sold_date_sk: int, ss_customer_sk: int, ss_store_sk: int, ss_promo_sk: int, ss_quantity: int, ss_list_price: real, ss_sales_price: real, ss_ext_sales_price: real, ss_net_paid: real, ss_net_profit: real): Row (Table store_sales);
axiom (forall
    ss_item_sk_1: int, ss_ticket_number_1: int, ss_sold_date_sk_1: int, ss_customer_sk_1: int, ss_store_sk_1: int, ss_promo_sk_1: int, ss_quantity_1: int, ss_list_price_1: real, ss_sales_price_1: real, ss_ext_sales_price_1: real, ss_net_paid_1: real, ss_net_profit_1: real,
    ss_item_sk_2: int, ss_ticket_number_2: int, ss_sold_date_sk_2: int, ss_customer_sk_2: int, ss_store_sk_2: int, ss_promo_sk_2: int, ss_quantity_2: int, ss_list_price_2: real, ss_sales_price_2: real, ss_ext_sales_price_2: real, ss_net_paid_2: real, ss_net_profit_2: real
    ::
    construct_Row_store_sales(ss_item_sk_1, ss_ticket_number_1, ss_sold_date_sk_1, ss_customer_sk_1, ss_store_sk_1, ss_promo_sk_1, ss_quantity_1, ss_list_price_1, ss_sales_price_1, ss_ext_sales_price_1, ss_net_paid_1, ss_net_profit_1) == construct_Row_store_sales(ss_item_sk_2, ss_ticket_number_2, ss_sold_date_sk_2, ss_customer_sk_2, ss_store_sk_2, ss_promo_sk_2, ss_quantity_2, ss_list_price_2, ss_sales_price_2, ss_ext_sales_price_2, ss_net_paid_2, ss_net_profit_2)
    <==>
    (ss_item_sk_1 == ss_item_sk_2 && ss_ticket_number_1 == ss_ticket_number_2 && ss_sold_date_sk_1 == ss_sold_date_sk_2 && ss_customer_sk_1 == ss_customer_sk_2 && ss_store_sk_1 == ss_store_sk_2 && ss_promo_sk_1 == ss_promo_sk_2 && ss_quantity_1 == ss_quantity_2 && ss_list_price_1 == ss_list_price_2 && ss_sales_price_1 == ss_sales_price_2 && ss_ext_sales_price_1 == ss_ext_sales_price_2 && ss_net_paid_1 == ss_net_paid_2 && ss_net_profit_1 == ss_net_profit_2)
);
function construct_Row_store_returns(sr_item_sk: int, sr_ticket_number: int, sr_returned_date_sk: int, sr_customer_sk: int, sr_store_sk: int, sr_return_quantity: int, sr_return_amount: real, sr_net_loss: real): Row (Table store_returns);
axiom (forall
    sr_item_sk_1: int, sr_ticket_number_1: int, sr_returned_date_sk_1: int, sr_customer_sk_1: int, sr_store_sk_1: int, sr_return_quantity_1: int, sr_return_amount_1: real, sr_net_loss_1: real,
    sr_item_sk_2: int, sr_ticket_number_2: int, sr_returned_date_sk_2: int, sr_customer_sk_2: int, sr_store_sk_2: int, sr_return_quantity_2: int, sr_return_amount_2: real, sr_net_loss_2: real
    ::
    construct_Row_store_returns(sr_item_sk_1, sr_ticket_number_1, sr_returned_date_sk_1, sr_customer_sk_1, sr_store_sk_1, sr_return_quantity_1, sr_return_amount_1, sr_net_loss_1) == construct_Row_store_returns(sr_item_sk_2, sr_ticket_number_2, sr_returned_date_sk_2, sr_customer_sk_2, sr_store_sk_2, sr_return_quantity_2, sr_return_amount_2, sr_net_loss_2)
    <==>
    (sr_item_sk_1 == sr_item_sk_2 && sr_ticket_number_1 == sr_ticket_number_2 && sr_returned_date_sk_1 == sr_returned_date_sk_2 && sr_customer_sk_1 == sr_customer_sk_2 && sr_store_sk_1 == sr_store_sk_2 && sr_return_quantity_1 == sr_return_quantity_2 && sr_return_amount_1 == sr_return_amount_2 && sr_net_loss_1 == sr_net_loss_2)
);
function construct_Row_catalog_sales(cs_item_sk: int, cs_order_number: int, cs_sold_date_sk: int, cs_bill_customer_sk: int, cs_ship_customer_sk: int, cs_quantity: int, cs_list_price: real, cs_sales_price: real, cs_ext_sales_price: real, cs_net_profit: real): Row (Table catalog_sales);
axiom (forall
    cs_item_sk_1: int, cs_order_number_1: int, cs_sold_date_sk_1: int, cs_bill_customer_sk_1: int, cs_ship_customer_sk_1: int, cs_quantity_1: int, cs_list_price_1: real, cs_sales_price_1: real, cs_ext_sales_price_1: real, cs_net_profit_1: real,
    cs_item_sk_2: int, cs_order_number_2: int, cs_sold_date_sk_2: int, cs_bill_customer_sk_2: int, cs_ship_customer_sk_2: int, cs_quantity_2: int, cs_list_price_2: real, cs_sales_price_2: real, cs_ext_sales_price_2: real, cs_net_profit_2: real
    ::
    construct_Row_catalog_sales(cs_item_sk_1, cs_order_number_1, cs_sold_date_sk_1, cs_bill_customer_sk_1, cs_ship_customer_sk_1, cs_quantity_1, cs_list_price_1, cs_sales_price_1, cs_ext_sales_price_1, cs_net_profit_1) == construct_Row_catalog_sales(cs_item_sk_2, cs_order_number_2, cs_sold_date_sk_2, cs_bill_customer_sk_2, cs_ship_customer_sk_2, cs_quantity_2, cs_list_price_2, cs_sales_price_2, cs_ext_sales_price_2, cs_net_profit_2)
    <==>
    (cs_item_sk_1 == cs_item_sk_2 && cs_order_number_1 == cs_order_number_2 && cs_sold_date_sk_1 == cs_sold_date_sk_2 && cs_bill_customer_sk_1 == cs_bill_customer_sk_2 && cs_ship_customer_sk_1 == cs_ship_customer_sk_2 && cs_quantity_1 == cs_quantity_2 && cs_list_price_1 == cs_list_price_2 && cs_sales_price_1 == cs_sales_price_2 && cs_ext_sales_price_1 == cs_ext_sales_price_2 && cs_net_profit_1 == cs_net_profit_2)
);
function construct_Row_catalog_returns(cr_item_sk: int, cr_order_number: int, cr_returned_date_sk: int, cr_returning_customer_sk: int, cr_return_amount: real, cr_net_loss: real): Row (Table catalog_returns);
axiom (forall
    cr_item_sk_1: int, cr_order_number_1: int, cr_returned_date_sk_1: int, cr_returning_customer_sk_1: int, cr_return_amount_1: real, cr_net_loss_1: real,
    cr_item_sk_2: int, cr_order_number_2: int, cr_returned_date_sk_2: int, cr_returning_customer_sk_2: int, cr_return_amount_2: real, cr_net_loss_2: real
    ::
    construct_Row_catalog_returns(cr_item_sk_1, cr_order_number_1, cr_returned_date_sk_1, cr_returning_customer_sk_1, cr_return_amount_1, cr_net_loss_1) == construct_Row_catalog_returns(cr_item_sk_2, cr_order_number_2, cr_returned_date_sk_2, cr_returning_customer_sk_2, cr_return_amount_2, cr_net_loss_2)
    <==>
    (cr_item_sk_1 == cr_item_sk_2 && cr_order_number_1 == cr_order_number_2 && cr_returned_date_sk_1 == cr_returned_date_sk_2 && cr_returning_customer_sk_1 == cr_returning_customer_sk_2 && cr_return_amount_1 == cr_return_amount_2 && cr_net_loss_1 == cr_net_loss_2)
);
function construct_Row_web_sales(ws_item_sk: int, ws_order_number: int, ws_sold_date_sk: int, ws_bill_customer_sk: int, ws_quantity: int, ws_list_price: real, ws_sales_price: real, ws_ext_sales_price: real, ws_net_profit: real): Row (Table web_sales);
axiom (forall
    ws_item_sk_1: int, ws_order_number_1: int, ws_sold_date_sk_1: int, ws_bill_customer_sk_1: int, ws_quantity_1: int, ws_list_price_1: real, ws_sales_price_1: real, ws_ext_sales_price_1: real, ws_net_profit_1: real,
    ws_item_sk_2: int, ws_order_number_2: int, ws_sold_date_sk_2: int, ws_bill_customer_sk_2: int, ws_quantity_2: int, ws_list_price_2: real, ws_sales_price_2: real, ws_ext_sales_price_2: real, ws_net_profit_2: real
    ::
    construct_Row_web_sales(ws_item_sk_1, ws_order_number_1, ws_sold_date_sk_1, ws_bill_customer_sk_1, ws_quantity_1, ws_list_price_1, ws_sales_price_1, ws_ext_sales_price_1, ws_net_profit_1) == construct_Row_web_sales(ws_item_sk_2, ws_order_number_2, ws_sold_date_sk_2, ws_bill_customer_sk_2, ws_quantity_2, ws_list_price_2, ws_sales_price_2, ws_ext_sales_price_2, ws_net_profit_2)
    <==>
    (ws_item_sk_1 == ws_item_sk_2 && ws_order_number_1 == ws_order_number_2 && ws_sold_date_sk_1 == ws_sold_date_sk_2 && ws_bill_customer_sk_1 == ws_bill_customer_sk_2 && ws_quantity_1 == ws_quantity_2 && ws_list_price_1 == ws_list_price_2 && ws_sales_price_1 == ws_sales_price_2 && ws_ext_sales_price_1 == ws_ext_sales_price_2 && ws_net_profit_1 == ws_net_profit_2)
);
function construct_Row_web_returns(wr_item_sk: int, wr_order_number: int, wr_returned_date_sk: int, wr_returning_customer_sk: int, wr_return_amount: real, wr_net_loss: real): Row (Table web_returns);
axiom (forall
    wr_item_sk_1: int, wr_order_number_1: int, wr_returned_date_sk_1: int, wr_returning_customer_sk_1: int, wr_return_amount_1: real, wr_net_loss_1: real,
    wr_item_sk_2: int, wr_order_number_2: int, wr_returned_date_sk_2: int, wr_returning_customer_sk_2: int, wr_return_amount_2: real, wr_net_loss_2: real
    ::
    construct_Row_web_returns(wr_item_sk_1, wr_order_number_1, wr_returned_date_sk_1, wr_returning_customer_sk_1, wr_return_amount_1, wr_net_loss_1) == construct_Row_web_returns(wr_item_sk_2, wr_order_number_2, wr_returned_date_sk_2, wr_returning_customer_sk_2, wr_return_amount_2, wr_net_loss_2)
    <==>
    (wr_item_sk_1 == wr_item_sk_2 && wr_order_number_1 == wr_order_number_2 && wr_returned_date_sk_1 == wr_returned_date_sk_2 && wr_returning_customer_sk_1 == wr_returning_customer_sk_2 && wr_return_amount_1 == wr_return_amount_2 && wr_net_loss_1 == wr_net_loss_2)
);
var time_dim_t_hour : [int]int;
var item_i_class : [int]String;
var customer_c_customer_id : [int]String;
var customer_c_birth_year : [int]int;
var store_returns_sr_customer_sk : [int][int]int;
var store_sales_ss_sold_date_sk : [int][int]int;
var catalog_returns_cr_net_loss : [int][int]real;
var catalog_sales_cs_bill_customer_sk : [int][int]int;
var date_dim_d_date_sk : [int]int;
var time_dim_t_minute : [int]int;
const __slice__ : int;
var store_s_store_sk : [int]int;
var store_sales_ss_net_profit : [int][int]real;
var store_sales_ss_promo_sk : [int][int]int;
var catalog_sales_cs_order_number : [int][int]int;
var promotion_p_channel_email : [int]String;
var web_returns_wr_return_amount : [int][int]real;
var item_i_item_id : [int]String;
const TBL_web_sales : Table (web_sales);
const TBL_store_sales : Table (store_sales);
const TBL_web_returns : Table (web_returns);
var warehouse_w_country : [int]String;
var customer_c_customer_sk : [int]int;
const TBL_promotion : Table (promotion);
var web_returns_wr_returned_date_sk : [int][int]int;
var customer_c_email_address : [int]String;
const TBL_customer_address : Table (customer_address);
var customer_address_ca_state : [int]String;
var web_returns_wr_returning_customer_sk : [int][int]int;
var store_sales_ss_ext_sales_price : [int][int]real;
var date_dim_d_date : [int]int;
var customer_demographics_cd_education_status : [int]String;
var warehouse_w_state : [int]String;
var warehouse_w_warehouse_name : [int]String;
var store_s_state : [int]String;
var store_sales_ss_sales_price : [int][int]real;
var item_i_category : [int]String;
const TBL_catalog_sales : Table (catalog_sales);
var web_sales_ws_net_profit : [int][int]real;
var store_s_store_name : [int]String;
var customer_demographics_cd_purchase_estimate : [int]int;
var store_s_store_id : [int]String;
var warehouse_w_warehouse_sk : [int]int;
var item_i_item_sk : [int]int;
var date_dim_d_day_name : [int]String;
var item_i_manufact : [int]String;
const TBL_catalog_returns : Table (catalog_returns);
var web_sales_ws_ext_sales_price : [int][int]real;
var customer_address_ca_city : [int]String;
var store_returns_sr_store_sk : [int][int]int;
var date_dim_d_month_seq : [int]int;
var catalog_returns_cr_returned_date_sk : [int][int]int;
var catalog_sales_cs_sold_date_sk : [int][int]int;
var catalog_sales_cs_ext_sales_price : [int][int]real;
var customer_address_ca_zip : [int]String;
var store_returns_sr_net_loss : [int][int]real;
var catalog_returns_cr_order_number : [int][int]int;
var customer_demographics_cd_demo_sk : [int]int;
var customer_address_ca_address_sk : [int]int;
var catalog_sales_cs_item_sk : [int][int]int;
var catalog_sales_cs_quantity : [int][int]int;
var time_dim_t_time_sk : [int]int;
var store_sales_ss_item_sk : [int][int]int;
var customer_demographics_cd_marital_status : [int]String;
var customer_address_ca_street_name : [int]String;
var store_s_country : [int]String;
const TBL_warehouse : Table (warehouse);
var customer_demographics_cd_credit_rating : [int]String;
var store_returns_sr_return_quantity : [int][int]int;
var web_sales_ws_sales_price : [int][int]real;
var web_sales_ws_order_number : [int][int]int;
const TBL_store : Table (store);
var catalog_sales_cs_sales_price : [int][int]real;
var time_dim_t_am_pm : [int]String;
var store_returns_sr_return_amount : [int][int]real;
var store_sales_ss_customer_sk : [int][int]int;
var catalog_sales_cs_net_profit : [int][int]real;
var customer_c_first_name : [int]String;
var customer_c_last_name : [int]String;
const TBL_customer : Table (customer);
var promotion_p_channel_radio : [int]String;
var catalog_sales_cs_ship_customer_sk : [int][int]int;
var promotion_p_channel_tv : [int]String;
const TBL_customer_demographics : Table (customer_demographics);
var store_sales_ss_net_paid : [int][int]real;
var customer_address_ca_country : [int]String;
const TBL_item : Table (item);
var date_dim_d_qoy : [int]int;
var store_sales_ss_ticket_number : [int][int]int;
var date_dim_d_moy : [int]int;
const TBL_store_returns : Table (store_returns);
var store_returns_sr_returned_date_sk : [int][int]int;
const TBL_date_dim : Table (date_dim);
var catalog_returns_cr_returning_customer_sk : [int][int]int;
var store_returns_sr_item_sk : [int][int]int;
var promotion_p_promo_sk : [int]int;
var web_sales_ws_item_sk : [int][int]int;
var customer_address_ca_gmt_offset : [int]real;
var web_sales_ws_sold_date_sk : [int][int]int;
var web_returns_wr_net_loss : [int][int]real;
var web_returns_wr_item_sk : [int][int]int;
var store_sales_ss_store_sk : [int][int]int;
var web_sales_ws_bill_customer_sk : [int][int]int;
var store_sales_ss_list_price : [int][int]real;
var web_sales_ws_quantity : [int][int]int;
const __shards__ : int;
var promotion_p_promo_name : [int]String;
var web_returns_wr_order_number : [int][int]int;
var customer_address_ca_street_number : [int]String;
var store_returns_sr_ticket_number : [int][int]int;
var catalog_sales_cs_list_price : [int][int]real;
var item_i_current_price : [int]real;
var store_s_number_employees : [int]int;
var catalog_returns_cr_item_sk : [int][int]int;
var store_sales_ss_quantity : [int][int]int;
var catalog_returns_cr_return_amount : [int][int]real;
var customer_demographics_cd_gender : [int]String;
var date_dim_d_year : [int]int;
const TBL_time_dim : Table (time_dim);
var web_sales_ws_list_price : [int][int]real;
var item_i_item_desc : [int]String;
procedure verify_hop_partitions_Q34(item_sk: int, ticket_num: int, cust_sk: int, cd_sk: int, store_sk: int, date_sk: int)
{
  // Hop partition verification for function 'Q34'
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
    goto s21_epilogue;
  s21_hop_exit:
  s17_epilogue:
  s18_epilogue:
  s19_epilogue:
  s20_epilogue:
  s21_epilogue:
}

