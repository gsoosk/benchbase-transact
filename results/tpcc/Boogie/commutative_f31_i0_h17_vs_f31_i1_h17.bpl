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
function get_W_ID#36(arg0: Iterator (Table (Warehouse))) returns (int);
function model_get_W_ID#36(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Warehouse)) :: hasNext(iter) ==> get_W_ID#36(iter) == model_get_W_ID#36(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_D_W_ID#37(arg0: Iterator (Table (District))) returns (int);
function model_get_D_W_ID#37(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (District)) :: hasNext(iter) ==> get_D_W_ID#37(iter) == model_get_D_W_ID#37(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_D_ID#38(arg0: Iterator (Table (District))) returns (int);
function model_get_D_ID#38(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (District)) :: hasNext(iter) ==> get_D_ID#38(iter) == model_get_D_ID#38(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_C_W_ID#39(arg0: Iterator (Table (Customer))) returns (int);
function model_get_C_W_ID#39(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Customer)) :: hasNext(iter) ==> get_C_W_ID#39(iter) == model_get_C_W_ID#39(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_C_D_ID#40(arg0: Iterator (Table (Customer))) returns (int);
function model_get_C_D_ID#40(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Customer)) :: hasNext(iter) ==> get_C_D_ID#40(iter) == model_get_C_D_ID#40(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_C_ID#41(arg0: Iterator (Table (Customer))) returns (int);
function model_get_C_ID#41(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Customer)) :: hasNext(iter) ==> get_C_ID#41(iter) == model_get_C_ID#41(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_NO_W_ID#42(arg0: Iterator (Table (New_Order))) returns (int);
function model_get_NO_W_ID#42(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (New_Order)) :: hasNext(iter) ==> get_NO_W_ID#42(iter) == model_get_NO_W_ID#42(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_NO_D_ID#43(arg0: Iterator (Table (New_Order))) returns (int);
function model_get_NO_D_ID#43(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (New_Order)) :: hasNext(iter) ==> get_NO_D_ID#43(iter) == model_get_NO_D_ID#43(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_NO_O_ID#44(arg0: Iterator (Table (New_Order))) returns (int);
function model_get_NO_O_ID#44(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (New_Order)) :: hasNext(iter) ==> get_NO_O_ID#44(iter) == model_get_NO_O_ID#44(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_O_W_ID#45(arg0: Iterator (Table (Order))) returns (int);
function model_get_O_W_ID#45(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Order)) :: hasNext(iter) ==> get_O_W_ID#45(iter) == model_get_O_W_ID#45(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_O_D_ID#46(arg0: Iterator (Table (Order))) returns (int);
function model_get_O_D_ID#46(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Order)) :: hasNext(iter) ==> get_O_D_ID#46(iter) == model_get_O_D_ID#46(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_O_ID#47(arg0: Iterator (Table (Order))) returns (int);
function model_get_O_ID#47(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Order)) :: hasNext(iter) ==> get_O_ID#47(iter) == model_get_O_ID#47(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_OL_W_ID#48(arg0: Iterator (Table (Order_Line))) returns (int);
function model_get_OL_W_ID#48(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Order_Line)) :: hasNext(iter) ==> get_OL_W_ID#48(iter) == model_get_OL_W_ID#48(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_OL_D_ID#49(arg0: Iterator (Table (Order_Line))) returns (int);
function model_get_OL_D_ID#49(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Order_Line)) :: hasNext(iter) ==> get_OL_D_ID#49(iter) == model_get_OL_D_ID#49(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_OL_O_ID#50(arg0: Iterator (Table (Order_Line))) returns (int);
function model_get_OL_O_ID#50(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Order_Line)) :: hasNext(iter) ==> get_OL_O_ID#50(iter) == model_get_OL_O_ID#50(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_OL_NUMBER#51(arg0: Iterator (Table (Order_Line))) returns (int);
function model_get_OL_NUMBER#51(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Order_Line)) :: hasNext(iter) ==> get_OL_NUMBER#51(iter) == model_get_OL_NUMBER#51(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_I_ID#52(arg0: Iterator (Table (Item))) returns (int);
function model_get_I_ID#52(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Item)) :: hasNext(iter) ==> get_I_ID#52(iter) == model_get_I_ID#52(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_W_ID#53(arg0: Iterator (Table (Item))) returns (int);
function model_get_W_ID#53(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Item)) :: hasNext(iter) ==> get_W_ID#53(iter) == model_get_W_ID#53(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_S_W_ID#54(arg0: Iterator (Table (Stock))) returns (int);
function model_get_S_W_ID#54(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Stock)) :: hasNext(iter) ==> get_S_W_ID#54(iter) == model_get_S_W_ID#54(iter_n(iter), iter_m(iter), iter_position(iter)));
function get_S_I_ID#55(arg0: Iterator (Table (Stock))) returns (int);
function model_get_S_I_ID#55(n: int, m: int, index: int) returns (int);
axiom (forall iter: Iterator (Table (Stock)) :: hasNext(iter) ==> get_S_I_ID#55(iter) == model_get_S_I_ID#55(iter_n(iter), iter_m(iter), iter_position(iter)));
type Table a;
type Warehouse;
type District;
type Customer;
type New_Order;
type Order;
type Order_Line;
type Item;
type Stock;
type Row a;
function construct_Row_Warehouse(W_ID: int, W_NAME: String, W_STREET_1: String, W_STREET_2: String, W_CITY: String, W_STATE: String, W_ZIP: String, W_TAX: real, W_YTD: real): Row (Table Warehouse);
axiom (forall
    W_ID_1: int, W_NAME_1: String, W_STREET_1_1: String, W_STREET_2_1: String, W_CITY_1: String, W_STATE_1: String, W_ZIP_1: String, W_TAX_1: real, W_YTD_1: real,
    W_ID_2: int, W_NAME_2: String, W_STREET_1_2: String, W_STREET_2_2: String, W_CITY_2: String, W_STATE_2: String, W_ZIP_2: String, W_TAX_2: real, W_YTD_2: real
    ::
    construct_Row_Warehouse(W_ID_1, W_NAME_1, W_STREET_1_1, W_STREET_2_1, W_CITY_1, W_STATE_1, W_ZIP_1, W_TAX_1, W_YTD_1) == construct_Row_Warehouse(W_ID_2, W_NAME_2, W_STREET_1_2, W_STREET_2_2, W_CITY_2, W_STATE_2, W_ZIP_2, W_TAX_2, W_YTD_2)
    <==>
    (W_ID_1 == W_ID_2 && W_NAME_1 == W_NAME_2 && W_STREET_1_1 == W_STREET_1_2 && W_STREET_2_1 == W_STREET_2_2 && W_CITY_1 == W_CITY_2 && W_STATE_1 == W_STATE_2 && W_ZIP_1 == W_ZIP_2 && W_TAX_1 == W_TAX_2 && W_YTD_1 == W_YTD_2)
);
function construct_Row_District(D_W_ID: int, D_ID: int, D_NAME: String, D_STREET_1: String, D_STREET_2: String, D_CITY: String, D_STATE: String, D_ZIP: String, D_TAX: real, D_YTD: real, D_NEXT_O_ID: int, D_NEXT_NO_ID: int): Row (Table District);
axiom (forall
    D_W_ID_1: int, D_ID_1: int, D_NAME_1: String, D_STREET_1_1: String, D_STREET_2_1: String, D_CITY_1: String, D_STATE_1: String, D_ZIP_1: String, D_TAX_1: real, D_YTD_1: real, D_NEXT_O_ID_1: int, D_NEXT_NO_ID_1: int,
    D_W_ID_2: int, D_ID_2: int, D_NAME_2: String, D_STREET_1_2: String, D_STREET_2_2: String, D_CITY_2: String, D_STATE_2: String, D_ZIP_2: String, D_TAX_2: real, D_YTD_2: real, D_NEXT_O_ID_2: int, D_NEXT_NO_ID_2: int
    ::
    construct_Row_District(D_W_ID_1, D_ID_1, D_NAME_1, D_STREET_1_1, D_STREET_2_1, D_CITY_1, D_STATE_1, D_ZIP_1, D_TAX_1, D_YTD_1, D_NEXT_O_ID_1, D_NEXT_NO_ID_1) == construct_Row_District(D_W_ID_2, D_ID_2, D_NAME_2, D_STREET_1_2, D_STREET_2_2, D_CITY_2, D_STATE_2, D_ZIP_2, D_TAX_2, D_YTD_2, D_NEXT_O_ID_2, D_NEXT_NO_ID_2)
    <==>
    (D_W_ID_1 == D_W_ID_2 && D_ID_1 == D_ID_2 && D_NAME_1 == D_NAME_2 && D_STREET_1_1 == D_STREET_1_2 && D_STREET_2_1 == D_STREET_2_2 && D_CITY_1 == D_CITY_2 && D_STATE_1 == D_STATE_2 && D_ZIP_1 == D_ZIP_2 && D_TAX_1 == D_TAX_2 && D_YTD_1 == D_YTD_2 && D_NEXT_O_ID_1 == D_NEXT_O_ID_2 && D_NEXT_NO_ID_1 == D_NEXT_NO_ID_2)
);
function construct_Row_Customer(C_W_ID: int, C_D_ID: int, C_ID: int, C_FIRST: String, C_MIDDLE: String, C_LAST: String, C_STREET_1: String, C_STREET_2: String, C_CITY: String, C_STATE: String, C_ZIP: String, C_PHONE: String, C_SINCE: int, C_CREDIT: String, C_CREDIT_LIMIT: real, C_DISCOUNT: real, C_BALANCE: real, C_YTD_PAYMENT: real, C_PAYMENT_CNT: real, C_DELIVERY_CNT: real, C_DATA: String): Row (Table Customer);
axiom (forall
    C_W_ID_1: int, C_D_ID_1: int, C_ID_1: int, C_FIRST_1: String, C_MIDDLE_1: String, C_LAST_1: String, C_STREET_1_1: String, C_STREET_2_1: String, C_CITY_1: String, C_STATE_1: String, C_ZIP_1: String, C_PHONE_1: String, C_SINCE_1: int, C_CREDIT_1: String, C_CREDIT_LIMIT_1: real, C_DISCOUNT_1: real, C_BALANCE_1: real, C_YTD_PAYMENT_1: real, C_PAYMENT_CNT_1: real, C_DELIVERY_CNT_1: real, C_DATA_1: String,
    C_W_ID_2: int, C_D_ID_2: int, C_ID_2: int, C_FIRST_2: String, C_MIDDLE_2: String, C_LAST_2: String, C_STREET_1_2: String, C_STREET_2_2: String, C_CITY_2: String, C_STATE_2: String, C_ZIP_2: String, C_PHONE_2: String, C_SINCE_2: int, C_CREDIT_2: String, C_CREDIT_LIMIT_2: real, C_DISCOUNT_2: real, C_BALANCE_2: real, C_YTD_PAYMENT_2: real, C_PAYMENT_CNT_2: real, C_DELIVERY_CNT_2: real, C_DATA_2: String
    ::
    construct_Row_Customer(C_W_ID_1, C_D_ID_1, C_ID_1, C_FIRST_1, C_MIDDLE_1, C_LAST_1, C_STREET_1_1, C_STREET_2_1, C_CITY_1, C_STATE_1, C_ZIP_1, C_PHONE_1, C_SINCE_1, C_CREDIT_1, C_CREDIT_LIMIT_1, C_DISCOUNT_1, C_BALANCE_1, C_YTD_PAYMENT_1, C_PAYMENT_CNT_1, C_DELIVERY_CNT_1, C_DATA_1) == construct_Row_Customer(C_W_ID_2, C_D_ID_2, C_ID_2, C_FIRST_2, C_MIDDLE_2, C_LAST_2, C_STREET_1_2, C_STREET_2_2, C_CITY_2, C_STATE_2, C_ZIP_2, C_PHONE_2, C_SINCE_2, C_CREDIT_2, C_CREDIT_LIMIT_2, C_DISCOUNT_2, C_BALANCE_2, C_YTD_PAYMENT_2, C_PAYMENT_CNT_2, C_DELIVERY_CNT_2, C_DATA_2)
    <==>
    (C_W_ID_1 == C_W_ID_2 && C_D_ID_1 == C_D_ID_2 && C_ID_1 == C_ID_2 && C_FIRST_1 == C_FIRST_2 && C_MIDDLE_1 == C_MIDDLE_2 && C_LAST_1 == C_LAST_2 && C_STREET_1_1 == C_STREET_1_2 && C_STREET_2_1 == C_STREET_2_2 && C_CITY_1 == C_CITY_2 && C_STATE_1 == C_STATE_2 && C_ZIP_1 == C_ZIP_2 && C_PHONE_1 == C_PHONE_2 && C_SINCE_1 == C_SINCE_2 && C_CREDIT_1 == C_CREDIT_2 && C_CREDIT_LIMIT_1 == C_CREDIT_LIMIT_2 && C_DISCOUNT_1 == C_DISCOUNT_2 && C_BALANCE_1 == C_BALANCE_2 && C_YTD_PAYMENT_1 == C_YTD_PAYMENT_2 && C_PAYMENT_CNT_1 == C_PAYMENT_CNT_2 && C_DELIVERY_CNT_1 == C_DELIVERY_CNT_2 && C_DATA_1 == C_DATA_2)
);
function construct_Row_New_Order(NO_W_ID: int, NO_D_ID: int, NO_O_ID: int): Row (Table New_Order);
axiom (forall
    NO_W_ID_1: int, NO_D_ID_1: int, NO_O_ID_1: int,
    NO_W_ID_2: int, NO_D_ID_2: int, NO_O_ID_2: int
    ::
    construct_Row_New_Order(NO_W_ID_1, NO_D_ID_1, NO_O_ID_1) == construct_Row_New_Order(NO_W_ID_2, NO_D_ID_2, NO_O_ID_2)
    <==>
    (NO_W_ID_1 == NO_W_ID_2 && NO_D_ID_1 == NO_D_ID_2 && NO_O_ID_1 == NO_O_ID_2)
);
function construct_Row_Order(O_W_ID: int, O_D_ID: int, O_ID: int, O_C_ID: int, O_ENTRY_DATE: int, O_CARRIER_ID: int, O_OL_CNT: int, O_ALL_LOCAL: int): Row (Table Order);
axiom (forall
    O_W_ID_1: int, O_D_ID_1: int, O_ID_1: int, O_C_ID_1: int, O_ENTRY_DATE_1: int, O_CARRIER_ID_1: int, O_OL_CNT_1: int, O_ALL_LOCAL_1: int,
    O_W_ID_2: int, O_D_ID_2: int, O_ID_2: int, O_C_ID_2: int, O_ENTRY_DATE_2: int, O_CARRIER_ID_2: int, O_OL_CNT_2: int, O_ALL_LOCAL_2: int
    ::
    construct_Row_Order(O_W_ID_1, O_D_ID_1, O_ID_1, O_C_ID_1, O_ENTRY_DATE_1, O_CARRIER_ID_1, O_OL_CNT_1, O_ALL_LOCAL_1) == construct_Row_Order(O_W_ID_2, O_D_ID_2, O_ID_2, O_C_ID_2, O_ENTRY_DATE_2, O_CARRIER_ID_2, O_OL_CNT_2, O_ALL_LOCAL_2)
    <==>
    (O_W_ID_1 == O_W_ID_2 && O_D_ID_1 == O_D_ID_2 && O_ID_1 == O_ID_2 && O_C_ID_1 == O_C_ID_2 && O_ENTRY_DATE_1 == O_ENTRY_DATE_2 && O_CARRIER_ID_1 == O_CARRIER_ID_2 && O_OL_CNT_1 == O_OL_CNT_2 && O_ALL_LOCAL_1 == O_ALL_LOCAL_2)
);
function construct_Row_Order_Line(OL_W_ID: int, OL_D_ID: int, OL_O_ID: int, OL_NUMBER: int, OL_I_ID: int, OL_SUPPLY_W_ID: int, OL_DELIVERY_DATE: int, OL_QUANTITY: int, OL_AMOUNT: int, OL_DIST_INTO: String): Row (Table Order_Line);
axiom (forall
    OL_W_ID_1: int, OL_D_ID_1: int, OL_O_ID_1: int, OL_NUMBER_1: int, OL_I_ID_1: int, OL_SUPPLY_W_ID_1: int, OL_DELIVERY_DATE_1: int, OL_QUANTITY_1: int, OL_AMOUNT_1: int, OL_DIST_INTO_1: String,
    OL_W_ID_2: int, OL_D_ID_2: int, OL_O_ID_2: int, OL_NUMBER_2: int, OL_I_ID_2: int, OL_SUPPLY_W_ID_2: int, OL_DELIVERY_DATE_2: int, OL_QUANTITY_2: int, OL_AMOUNT_2: int, OL_DIST_INTO_2: String
    ::
    construct_Row_Order_Line(OL_W_ID_1, OL_D_ID_1, OL_O_ID_1, OL_NUMBER_1, OL_I_ID_1, OL_SUPPLY_W_ID_1, OL_DELIVERY_DATE_1, OL_QUANTITY_1, OL_AMOUNT_1, OL_DIST_INTO_1) == construct_Row_Order_Line(OL_W_ID_2, OL_D_ID_2, OL_O_ID_2, OL_NUMBER_2, OL_I_ID_2, OL_SUPPLY_W_ID_2, OL_DELIVERY_DATE_2, OL_QUANTITY_2, OL_AMOUNT_2, OL_DIST_INTO_2)
    <==>
    (OL_W_ID_1 == OL_W_ID_2 && OL_D_ID_1 == OL_D_ID_2 && OL_O_ID_1 == OL_O_ID_2 && OL_NUMBER_1 == OL_NUMBER_2 && OL_I_ID_1 == OL_I_ID_2 && OL_SUPPLY_W_ID_1 == OL_SUPPLY_W_ID_2 && OL_DELIVERY_DATE_1 == OL_DELIVERY_DATE_2 && OL_QUANTITY_1 == OL_QUANTITY_2 && OL_AMOUNT_1 == OL_AMOUNT_2 && OL_DIST_INTO_1 == OL_DIST_INTO_2)
);
function construct_Row_Item(I_ID: int, W_ID: int, I_IM_ID: int, I_NAME: String, I_PRICE: real, I_DATA: String): Row (Table Item);
axiom (forall
    I_ID_1: int, W_ID_1: int, I_IM_ID_1: int, I_NAME_1: String, I_PRICE_1: real, I_DATA_1: String,
    I_ID_2: int, W_ID_2: int, I_IM_ID_2: int, I_NAME_2: String, I_PRICE_2: real, I_DATA_2: String
    ::
    construct_Row_Item(I_ID_1, W_ID_1, I_IM_ID_1, I_NAME_1, I_PRICE_1, I_DATA_1) == construct_Row_Item(I_ID_2, W_ID_2, I_IM_ID_2, I_NAME_2, I_PRICE_2, I_DATA_2)
    <==>
    (I_ID_1 == I_ID_2 && W_ID_1 == W_ID_2 && I_IM_ID_1 == I_IM_ID_2 && I_NAME_1 == I_NAME_2 && I_PRICE_1 == I_PRICE_2 && I_DATA_1 == I_DATA_2)
);
function construct_Row_Stock(S_W_ID: int, S_I_ID: int, S_QUANTITY: int, S_YTD: real, S_ORDER_CNT: int, S_REMOTE_CNT: int, S_DATA: String): Row (Table Stock);
axiom (forall
    S_W_ID_1: int, S_I_ID_1: int, S_QUANTITY_1: int, S_YTD_1: real, S_ORDER_CNT_1: int, S_REMOTE_CNT_1: int, S_DATA_1: String,
    S_W_ID_2: int, S_I_ID_2: int, S_QUANTITY_2: int, S_YTD_2: real, S_ORDER_CNT_2: int, S_REMOTE_CNT_2: int, S_DATA_2: String
    ::
    construct_Row_Stock(S_W_ID_1, S_I_ID_1, S_QUANTITY_1, S_YTD_1, S_ORDER_CNT_1, S_REMOTE_CNT_1, S_DATA_1) == construct_Row_Stock(S_W_ID_2, S_I_ID_2, S_QUANTITY_2, S_YTD_2, S_ORDER_CNT_2, S_REMOTE_CNT_2, S_DATA_2)
    <==>
    (S_W_ID_1 == S_W_ID_2 && S_I_ID_1 == S_I_ID_2 && S_QUANTITY_1 == S_QUANTITY_2 && S_YTD_1 == S_YTD_2 && S_ORDER_CNT_1 == S_ORDER_CNT_2 && S_REMOTE_CNT_1 == S_REMOTE_CNT_2 && S_DATA_1 == S_DATA_2)
);
var Warehouse_W_YTD : [int]real;
var District_D_NAME : [int][int]String;
var District_D_NEXT_NO_ID : [int][int]int;
var Customer_C_LAST : [int][int][int]String;
var Customer_C_CREDIT_LIMIT : [int][int][int]real;
const TBL_New_Order : Table (New_Order);
var Order_Line_OL_I_ID : [int][int][int][int]int;
var Order_Line_OL_DELIVERY_DATE : [int][int][int][int]int;
var Warehouse_W_CITY : [int]String;
var Stock_S_W_ID : [int][int]int;
var Customer_C_BALANCE : [int][int][int]real;
var Stock_S_REMOTE_CNT : [int][int]int;
const TBL_Order : Table (Order);
var Customer_C_CITY : [int][int][int]String;
var Order_O_ALL_LOCAL : [int][int][int]int;
var Warehouse_W_STREET_1 : [int]String;
var New_Order_NO_O_ID : [int][int][int]int;
var Customer_C_W_ID : [int][int][int]int;
var Customer_C_ZIP : [int][int][int]String;
var Customer_C_YTD_PAYMENT : [int][int][int]real;
const __shards__ : int;
var Order_O_ENTRY_DATE : [int][int][int]int;
var Order_Line_OL_W_ID : [int][int][int][int]int;
var District_D_STATE : [int][int]String;
var Order_Line_OL_AMOUNT : [int][int][int][int]int;
var Item_I_ID : [int][int]int;
var Stock_S_I_ID : [int][int]int;
var Order_O_C_ID : [int][int][int]int;
var District_D_YTD : [int][int]real;
var Customer_C_FIRST : [int][int][int]String;
var Order_Line_OL_SUPPLY_W_ID : [int][int][int][int]int;
const TBL_Order_Line : Table (Order_Line);
const TBL_Warehouse : Table (Warehouse);
var Warehouse_W_TAX : [int]real;
var Customer_C_ID : [int][int][int]int;
var Stock_S_YTD : [int][int]real;
var Warehouse_W_NAME : [int]String;
const TBL_District : Table (District);
var New_Order_NO_D_ID : [int][int][int]int;
var Order_O_ID : [int][int][int]int;
var Order_Line_OL_QUANTITY : [int][int][int][int]int;
var Order_O_OL_CNT : [int][int][int]int;
const __slice__ : int;
var Item_I_IM_ID : [int][int]int;
var Customer_C_STREET_1 : [int][int][int]String;
var Item_I_PRICE : [int][int]real;
var Item_I_DATA : [int][int]String;
var Customer_C_DELIVERY_CNT : [int][int][int]real;
var Order_Line_OL_NUMBER : [int][int][int][int]int;
var District_D_W_ID : [int][int]int;
var District_D_ID : [int][int]int;
var District_D_STREET_1 : [int][int]String;
var Customer_C_STREET_2 : [int][int][int]String;
var Customer_C_STATE : [int][int][int]String;
var Stock_S_DATA : [int][int]String;
var District_D_TAX : [int][int]real;
const O_OL_CNT : int;
var Customer_C_DATA : [int][int][int]String;
var District_D_NEXT_O_ID : [int][int]int;
var District_D_CITY : [int][int]String;
var Customer_C_MIDDLE : [int][int][int]String;
var Customer_C_PHONE : [int][int][int]String;
const TBL_Item : Table (Item);
var Warehouse_W_ID : [int]int;
var District_D_ZIP : [int][int]String;
var Order_O_CARRIER_ID : [int][int][int]int;
var Item_I_NAME : [int][int]String;
var Stock_S_QUANTITY : [int][int]int;
var Customer_C_SINCE : [int][int][int]int;
const TBL_Stock : Table (Stock);
var Order_O_W_ID : [int][int][int]int;
var Warehouse_W_STREET_2 : [int]String;
var Customer_C_PAYMENT_CNT : [int][int][int]real;
var Customer_C_D_ID : [int][int][int]int;
var Order_Line_OL_D_ID : [int][int][int][int]int;
var New_Order_NO_W_ID : [int][int][int]int;
var Stock_S_ORDER_CNT : [int][int]int;
var Order_Line_OL_O_ID : [int][int][int][int]int;
var Order_Line_OL_DIST_INTO : [int][int][int][int]String;
const TBL_Customer : Table (Customer);
var Warehouse_W_ZIP : [int]String;
var Item_W_ID : [int][int]int;
var District_D_STREET_2 : [int][int]String;
var Warehouse_W_STATE : [int]String;
var Order_O_D_ID : [int][int][int]int;
var Customer_C_DISCOUNT : [int][int][int]real;
var Customer_C_CREDIT : [int][int][int]String;
procedure Check_SliceCommut_Hop17_vs_Hop17()
modifies Item_I_PRICE, Stock_S_DATA, Stock_S_I_ID, Stock_S_ORDER_CNT, Stock_S_QUANTITY, Stock_S_REMOTE_CNT, Stock_S_W_ID, Stock_S_YTD;
{
  var s0_w_id : int;
  var s0_d_id : int;
  var s0_c_id : int;
  var s0_o_all_local : int;
  var s0_date : int;
  var s0_itemIDs : List (int);
  var s0_supplierWarehouseIDs : List (int);
  var s0_orderQuantities : List (int);
  var s0_w_tax : real;
  var s0_prices : List (real);
  var s1_w_id : int;
  var s1_d_id : int;
  var s1_c_id : int;
  var s1_o_all_local : int;
  var s1_date : int;
  var s1_itemIDs : List (int);
  var s1_supplierWarehouseIDs : List (int);
  var s1_orderQuantities : List (int);
  var s1_w_tax : real;
  var s1_prices : List (real);
  var s0_active : bool;
  var s1_active : bool;
  var Item_I_PRICE_init : [int][int]real;
  var Stock_S_DATA_init : [int][int]String;
  var Stock_S_I_ID_init : [int][int]int;
  var Stock_S_ORDER_CNT_init : [int][int]int;
  var Stock_S_QUANTITY_init : [int][int]int;
  var Stock_S_REMOTE_CNT_init : [int][int]int;
  var Stock_S_W_ID_init : [int][int]int;
  var Stock_S_YTD_init : [int][int]real;
  var s0_w_id_init : int;
  var s0_d_id_init : int;
  var s0_c_id_init : int;
  var s0_o_all_local_init : int;
  var s0_date_init : int;
  var s0_itemIDs_init : List (int);
  var s0_supplierWarehouseIDs_init : List (int);
  var s0_orderQuantities_init : List (int);
  var s0_w_tax_init : real;
  var s0_prices_init : List (real);
  var s1_w_id_init : int;
  var s1_d_id_init : int;
  var s1_c_id_init : int;
  var s1_o_all_local_init : int;
  var s1_date_init : int;
  var s1_itemIDs_init : List (int);
  var s1_supplierWarehouseIDs_init : List (int);
  var s1_orderQuantities_init : List (int);
  var s1_w_tax_init : real;
  var s1_prices_init : List (real);
  var s0_#tmp64 : int;
  var s0_i_id : int;
  var s0_#tmp65 : int;
  var s0_sup_w_id : int;
  var s0_#tmp66 : int;
  var s0_qty : int;
  var s0_#tmp67 : bool;
  var s0_#tmp68 : bool;
  var s0_#tmp69 : bool;
  var s0_s#S_DATA : String;
  var s0_s#S_I_ID : int;
  var s0_s#S_ORDER_CNT : int;
  var s0_s#S_QUANTITY : int;
  var s0_s#S_REMOTE_CNT : int;
  var s0_s#S_W_ID : int;
  var s0_s#S_YTD : real;
  var s0_#tmp71 : real;
  var s0_price : real;
  var s0_#tmp72 : List (real);
  var s0_#tmp73 : int;
  var s0_#tmp74 : bool;
  var s0_#tmp75 : int;
  var s0_#tmp78 : bool;
  var s0_#tmp76 : int;
  var s0_#tmp77 : int;
  var s0_#tmp79 : int;
  var s0_#tmp80 : int;
  var s0_#tmp81 : real;
  var s0_#tmp82 : real;
  var s1_#tmp64 : int;
  var s1_i_id : int;
  var s1_#tmp65 : int;
  var s1_sup_w_id : int;
  var s1_#tmp66 : int;
  var s1_qty : int;
  var s1_#tmp67 : bool;
  var s1_#tmp68 : bool;
  var s1_#tmp69 : bool;
  var s1_s#S_DATA : String;
  var s1_s#S_I_ID : int;
  var s1_s#S_ORDER_CNT : int;
  var s1_s#S_QUANTITY : int;
  var s1_s#S_REMOTE_CNT : int;
  var s1_s#S_W_ID : int;
  var s1_s#S_YTD : real;
  var s1_#tmp71 : real;
  var s1_price : real;
  var s1_#tmp72 : List (real);
  var s1_#tmp73 : int;
  var s1_#tmp74 : bool;
  var s1_#tmp75 : int;
  var s1_#tmp78 : bool;
  var s1_#tmp76 : int;
  var s1_#tmp77 : int;
  var s1_#tmp79 : int;
  var s1_#tmp80 : int;
  var s1_#tmp81 : real;
  var s1_#tmp82 : real;
  var Stock_S_DATA_a_then_b : [int][int]String;
  var Stock_S_I_ID_a_then_b : [int][int]int;
  var Stock_S_ORDER_CNT_a_then_b : [int][int]int;
  var Stock_S_QUANTITY_a_then_b : [int][int]int;
  var Stock_S_REMOTE_CNT_a_then_b : [int][int]int;
  var Stock_S_W_ID_a_then_b : [int][int]int;
  var Stock_S_YTD_a_then_b : [int][int]real;
  var s0_w_id_a_then_b : int;
  var s0_d_id_a_then_b : int;
  var s0_c_id_a_then_b : int;
  var s0_o_all_local_a_then_b : int;
  var s0_date_a_then_b : int;
  var s0_itemIDs_a_then_b : List (int);
  var s0_supplierWarehouseIDs_a_then_b : List (int);
  var s0_orderQuantities_a_then_b : List (int);
  var s0_w_tax_a_then_b : real;
  var s0_prices_a_then_b : List (real);
  var s1_w_id_a_then_b : int;
  var s1_d_id_a_then_b : int;
  var s1_c_id_a_then_b : int;
  var s1_o_all_local_a_then_b : int;
  var s1_date_a_then_b : int;
  var s1_itemIDs_a_then_b : List (int);
  var s1_supplierWarehouseIDs_a_then_b : List (int);
  var s1_orderQuantities_a_then_b : List (int);
  var s1_w_tax_a_then_b : real;
  var s1_prices_a_then_b : List (real);
  var Stock_S_DATA_b_then_a : [int][int]String;
  var Stock_S_I_ID_b_then_a : [int][int]int;
  var Stock_S_ORDER_CNT_b_then_a : [int][int]int;
  var Stock_S_QUANTITY_b_then_a : [int][int]int;
  var Stock_S_REMOTE_CNT_b_then_a : [int][int]int;
  var Stock_S_W_ID_b_then_a : [int][int]int;
  var Stock_S_YTD_b_then_a : [int][int]real;
  var s0_w_id_b_then_a : int;
  var s0_d_id_b_then_a : int;
  var s0_c_id_b_then_a : int;
  var s0_o_all_local_b_then_a : int;
  var s0_date_b_then_a : int;
  var s0_itemIDs_b_then_a : List (int);
  var s0_supplierWarehouseIDs_b_then_a : List (int);
  var s0_orderQuantities_b_then_a : List (int);
  var s0_w_tax_b_then_a : real;
  var s0_prices_b_then_a : List (real);
  var s1_w_id_b_then_a : int;
  var s1_d_id_b_then_a : int;
  var s1_c_id_b_then_a : int;
  var s1_o_all_local_b_then_a : int;
  var s1_date_b_then_a : int;
  var s1_itemIDs_b_then_a : List (int);
  var s1_supplierWarehouseIDs_b_then_a : List (int);
  var s1_orderQuantities_b_then_a : List (int);
  var s1_w_tax_b_then_a : real;
  var s1_prices_b_then_a : List (real);

  // Slice commutativity verification: hop 17 vs hop 17
  // --- Step 1: Havoc initial state ---
    havoc Item_I_PRICE;
    havoc Stock_S_DATA;
    havoc Stock_S_I_ID;
    havoc Stock_S_ORDER_CNT;
    havoc Stock_S_QUANTITY;
    havoc Stock_S_REMOTE_CNT;
    havoc Stock_S_W_ID;
    havoc Stock_S_YTD;
    havoc s0_w_id;
    havoc s0_d_id;
    havoc s0_c_id;
    havoc s0_o_all_local;
    havoc s0_date;
    havoc s0_itemIDs;
    havoc s0_supplierWarehouseIDs;
    havoc s0_orderQuantities;
    havoc s0_w_tax;
    havoc s0_prices;
    havoc s1_w_id;
    havoc s1_d_id;
    havoc s1_c_id;
    havoc s1_o_all_local;
    havoc s1_date;
    havoc s1_itemIDs;
    havoc s1_supplierWarehouseIDs;
    havoc s1_orderQuantities;
    havoc s1_w_tax;
    havoc s1_prices;
    s0_active := true;
    s1_active := true;
    assume ((length(s0_itemIDs)) == O_OL_CNT);
    assume ((length(s0_supplierWarehouseIDs)) == O_OL_CNT);
    assume ((length(s0_orderQuantities)) == O_OL_CNT);
    assume (((get(s0_orderQuantities, 0)) >= 0) && ((get(s0_orderQuantities, 0)) <= 10));
    assume (((get(s0_orderQuantities, 1)) >= 0) && ((get(s0_orderQuantities, 1)) <= 10));
    assume (((get(s0_orderQuantities, 2)) >= 0) && ((get(s0_orderQuantities, 2)) <= 10));
    assume (((get(s0_orderQuantities, 3)) >= 0) && ((get(s0_orderQuantities, 3)) <= 10));
    assume (((get(s0_orderQuantities, 4)) >= 0) && ((get(s0_orderQuantities, 4)) <= 10));
    assume (((get(s0_orderQuantities, 5)) >= 0) && ((get(s0_orderQuantities, 5)) <= 10));
    assume (((get(s0_orderQuantities, 6)) >= 0) && ((get(s0_orderQuantities, 6)) <= 10));
    assume (((get(s0_orderQuantities, 7)) >= 0) && ((get(s0_orderQuantities, 7)) <= 10));
    assume (((get(s0_orderQuantities, 8)) >= 0) && ((get(s0_orderQuantities, 8)) <= 10));
    assume (((get(s0_orderQuantities, 9)) >= 0) && ((get(s0_orderQuantities, 9)) <= 10));
    assume ((length(s1_itemIDs)) == O_OL_CNT);
    assume ((length(s1_supplierWarehouseIDs)) == O_OL_CNT);
    assume ((length(s1_orderQuantities)) == O_OL_CNT);
    assume (((get(s1_orderQuantities, 0)) >= 0) && ((get(s1_orderQuantities, 0)) <= 10));
    assume (((get(s1_orderQuantities, 1)) >= 0) && ((get(s1_orderQuantities, 1)) <= 10));
    assume (((get(s1_orderQuantities, 2)) >= 0) && ((get(s1_orderQuantities, 2)) <= 10));
    assume (((get(s1_orderQuantities, 3)) >= 0) && ((get(s1_orderQuantities, 3)) <= 10));
    assume (((get(s1_orderQuantities, 4)) >= 0) && ((get(s1_orderQuantities, 4)) <= 10));
    assume (((get(s1_orderQuantities, 5)) >= 0) && ((get(s1_orderQuantities, 5)) <= 10));
    assume (((get(s1_orderQuantities, 6)) >= 0) && ((get(s1_orderQuantities, 6)) <= 10));
    assume (((get(s1_orderQuantities, 7)) >= 0) && ((get(s1_orderQuantities, 7)) <= 10));
    assume (((get(s1_orderQuantities, 8)) >= 0) && ((get(s1_orderQuantities, 8)) <= 10));
    assume (((get(s1_orderQuantities, 9)) >= 0) && ((get(s1_orderQuantities, 9)) <= 10));
  // --- Step 2: Save initial state ---
    Item_I_PRICE_init := Item_I_PRICE;
    Stock_S_DATA_init := Stock_S_DATA;
    Stock_S_I_ID_init := Stock_S_I_ID;
    Stock_S_ORDER_CNT_init := Stock_S_ORDER_CNT;
    Stock_S_QUANTITY_init := Stock_S_QUANTITY;
    Stock_S_REMOTE_CNT_init := Stock_S_REMOTE_CNT;
    Stock_S_W_ID_init := Stock_S_W_ID;
    Stock_S_YTD_init := Stock_S_YTD;
    s0_w_id_init := s0_w_id;
    s0_d_id_init := s0_d_id;
    s0_c_id_init := s0_c_id;
    s0_o_all_local_init := s0_o_all_local;
    s0_date_init := s0_date;
    s0_itemIDs_init := s0_itemIDs;
    s0_supplierWarehouseIDs_init := s0_supplierWarehouseIDs;
    s0_orderQuantities_init := s0_orderQuantities;
    s0_w_tax_init := s0_w_tax;
    s0_prices_init := s0_prices;
    s1_w_id_init := s1_w_id;
    s1_d_id_init := s1_d_id;
    s1_c_id_init := s1_c_id;
    s1_o_all_local_init := s1_o_all_local;
    s1_date_init := s1_date;
    s1_itemIDs_init := s1_itemIDs;
    s1_supplierWarehouseIDs_init := s1_supplierWarehouseIDs;
    s1_orderQuantities_init := s1_orderQuantities;
    s1_w_tax_init := s1_w_tax;
    s1_prices_init := s1_prices;
  // --- Step 3: Execute special interleavings ---
  // Executing A then B:
    if (s0_active) {
    s0_block17__ab:
      s0_#tmp64 := get(s0_itemIDs, 0);
      s0_i_id := s0_#tmp64;
      s0_#tmp65 := get(s0_supplierWarehouseIDs, 0);
      s0_sup_w_id := s0_#tmp65;
      s0_#tmp66 := get(s0_orderQuantities, 0);
      s0_qty := s0_#tmp66;
      s0_#tmp67 := s0_qty >= 0;
      s0_#tmp68 := s0_qty <= 10;
      s0_#tmp69 := s0_#tmp67 && s0_#tmp68;
      s0_s#S_DATA := Stock_S_DATA[s0_sup_w_id][s0_i_id];
      s0_s#S_I_ID := Stock_S_I_ID[s0_sup_w_id][s0_i_id];
      s0_s#S_ORDER_CNT := Stock_S_ORDER_CNT[s0_sup_w_id][s0_i_id];
      s0_s#S_QUANTITY := Stock_S_QUANTITY[s0_sup_w_id][s0_i_id];
      s0_s#S_REMOTE_CNT := Stock_S_REMOTE_CNT[s0_sup_w_id][s0_i_id];
      s0_s#S_W_ID := Stock_S_W_ID[s0_sup_w_id][s0_i_id];
      s0_s#S_YTD := Stock_S_YTD[s0_sup_w_id][s0_i_id];
      s0_#tmp71 := Item_I_PRICE[s0_i_id][s0_sup_w_id];
      s0_price := s0_#tmp71;
      s0_#tmp72 := append(s0_prices, s0_price);
      s0_prices := s0_#tmp72;
      s0_#tmp73 := s0_s#S_QUANTITY - s0_qty;
      s0_#tmp74 := s0_#tmp73 >= 10;
      if (s0_#tmp74) {
      goto s0_block18__ab;
    } else {
      goto s0_block20__ab;
    }
    s0_block18__ab:
      s0_#tmp75 := s0_s#S_QUANTITY - s0_qty;
      s0_s#S_QUANTITY := s0_#tmp75;
      goto s0_block19__ab;
    s0_block19__ab:
      s0_#tmp78 := s0_sup_w_id != s0_w_id;
      if (s0_#tmp78) {
      goto s0_block21__ab;
    } else {
      goto s0_block22__ab;
    }
    s0_block20__ab:
      s0_#tmp76 := s0_s#S_QUANTITY + 91;
      s0_#tmp77 := s0_#tmp76 - s0_qty;
      s0_s#S_QUANTITY := s0_#tmp77;
      goto s0_block19__ab;
    s0_block21__ab:
      s0_#tmp79 := s0_s#S_REMOTE_CNT + 1;
      s0_s#S_REMOTE_CNT := s0_#tmp79;
      goto s0_block22__ab;
    s0_block22__ab:
      s0_#tmp80 := s0_s#S_ORDER_CNT + 1;
      s0_s#S_ORDER_CNT := s0_#tmp80;
      s0_#tmp81 := real(s0_qty);
      s0_#tmp82 := s0_s#S_YTD + s0_#tmp81;
      s0_s#S_YTD := s0_#tmp82;
      Stock_S_DATA := Stock_S_DATA[s0_sup_w_id := Stock_S_DATA[s0_sup_w_id][s0_i_id := s0_s#S_DATA]];
      Stock_S_I_ID := Stock_S_I_ID[s0_sup_w_id := Stock_S_I_ID[s0_sup_w_id][s0_i_id := s0_s#S_I_ID]];
      Stock_S_ORDER_CNT := Stock_S_ORDER_CNT[s0_sup_w_id := Stock_S_ORDER_CNT[s0_sup_w_id][s0_i_id := s0_s#S_ORDER_CNT]];
      Stock_S_QUANTITY := Stock_S_QUANTITY[s0_sup_w_id := Stock_S_QUANTITY[s0_sup_w_id][s0_i_id := s0_s#S_QUANTITY]];
      Stock_S_REMOTE_CNT := Stock_S_REMOTE_CNT[s0_sup_w_id := Stock_S_REMOTE_CNT[s0_sup_w_id][s0_i_id := s0_s#S_REMOTE_CNT]];
      Stock_S_W_ID := Stock_S_W_ID[s0_sup_w_id := Stock_S_W_ID[s0_sup_w_id][s0_i_id := s0_s#S_W_ID]];
      Stock_S_YTD := Stock_S_YTD[s0_sup_w_id := Stock_S_YTD[s0_sup_w_id][s0_i_id := s0_s#S_YTD]];
      goto s0_hop_exit__ab;
    s0_hop_exit__ab:
    }
    if (s1_active) {
    s1_block17__ab:
      s1_#tmp64 := get(s1_itemIDs, 0);
      s1_i_id := s1_#tmp64;
      s1_#tmp65 := get(s1_supplierWarehouseIDs, 0);
      s1_sup_w_id := s1_#tmp65;
      s1_#tmp66 := get(s1_orderQuantities, 0);
      s1_qty := s1_#tmp66;
      s1_#tmp67 := s1_qty >= 0;
      s1_#tmp68 := s1_qty <= 10;
      s1_#tmp69 := s1_#tmp67 && s1_#tmp68;
      s1_s#S_DATA := Stock_S_DATA[s1_sup_w_id][s1_i_id];
      s1_s#S_I_ID := Stock_S_I_ID[s1_sup_w_id][s1_i_id];
      s1_s#S_ORDER_CNT := Stock_S_ORDER_CNT[s1_sup_w_id][s1_i_id];
      s1_s#S_QUANTITY := Stock_S_QUANTITY[s1_sup_w_id][s1_i_id];
      s1_s#S_REMOTE_CNT := Stock_S_REMOTE_CNT[s1_sup_w_id][s1_i_id];
      s1_s#S_W_ID := Stock_S_W_ID[s1_sup_w_id][s1_i_id];
      s1_s#S_YTD := Stock_S_YTD[s1_sup_w_id][s1_i_id];
      s1_#tmp71 := Item_I_PRICE[s1_i_id][s1_sup_w_id];
      s1_price := s1_#tmp71;
      s1_#tmp72 := append(s1_prices, s1_price);
      s1_prices := s1_#tmp72;
      s1_#tmp73 := s1_s#S_QUANTITY - s1_qty;
      s1_#tmp74 := s1_#tmp73 >= 10;
      if (s1_#tmp74) {
      goto s1_block18__ab;
    } else {
      goto s1_block20__ab;
    }
    s1_block18__ab:
      s1_#tmp75 := s1_s#S_QUANTITY - s1_qty;
      s1_s#S_QUANTITY := s1_#tmp75;
      goto s1_block19__ab;
    s1_block19__ab:
      s1_#tmp78 := s1_sup_w_id != s1_w_id;
      if (s1_#tmp78) {
      goto s1_block21__ab;
    } else {
      goto s1_block22__ab;
    }
    s1_block20__ab:
      s1_#tmp76 := s1_s#S_QUANTITY + 91;
      s1_#tmp77 := s1_#tmp76 - s1_qty;
      s1_s#S_QUANTITY := s1_#tmp77;
      goto s1_block19__ab;
    s1_block21__ab:
      s1_#tmp79 := s1_s#S_REMOTE_CNT + 1;
      s1_s#S_REMOTE_CNT := s1_#tmp79;
      goto s1_block22__ab;
    s1_block22__ab:
      s1_#tmp80 := s1_s#S_ORDER_CNT + 1;
      s1_s#S_ORDER_CNT := s1_#tmp80;
      s1_#tmp81 := real(s1_qty);
      s1_#tmp82 := s1_s#S_YTD + s1_#tmp81;
      s1_s#S_YTD := s1_#tmp82;
      Stock_S_DATA := Stock_S_DATA[s1_sup_w_id := Stock_S_DATA[s1_sup_w_id][s1_i_id := s1_s#S_DATA]];
      Stock_S_I_ID := Stock_S_I_ID[s1_sup_w_id := Stock_S_I_ID[s1_sup_w_id][s1_i_id := s1_s#S_I_ID]];
      Stock_S_ORDER_CNT := Stock_S_ORDER_CNT[s1_sup_w_id := Stock_S_ORDER_CNT[s1_sup_w_id][s1_i_id := s1_s#S_ORDER_CNT]];
      Stock_S_QUANTITY := Stock_S_QUANTITY[s1_sup_w_id := Stock_S_QUANTITY[s1_sup_w_id][s1_i_id := s1_s#S_QUANTITY]];
      Stock_S_REMOTE_CNT := Stock_S_REMOTE_CNT[s1_sup_w_id := Stock_S_REMOTE_CNT[s1_sup_w_id][s1_i_id := s1_s#S_REMOTE_CNT]];
      Stock_S_W_ID := Stock_S_W_ID[s1_sup_w_id := Stock_S_W_ID[s1_sup_w_id][s1_i_id := s1_s#S_W_ID]];
      Stock_S_YTD := Stock_S_YTD[s1_sup_w_id := Stock_S_YTD[s1_sup_w_id][s1_i_id := s1_s#S_YTD]];
      goto s1_hop_exit__ab;
    s1_hop_exit__ab:
    }
  // Snapshotting final state for a_then_b
    Stock_S_DATA_a_then_b := Stock_S_DATA;
    Stock_S_I_ID_a_then_b := Stock_S_I_ID;
    Stock_S_ORDER_CNT_a_then_b := Stock_S_ORDER_CNT;
    Stock_S_QUANTITY_a_then_b := Stock_S_QUANTITY;
    Stock_S_REMOTE_CNT_a_then_b := Stock_S_REMOTE_CNT;
    Stock_S_W_ID_a_then_b := Stock_S_W_ID;
    Stock_S_YTD_a_then_b := Stock_S_YTD;
    s0_w_id_a_then_b := s0_w_id;
    s0_d_id_a_then_b := s0_d_id;
    s0_c_id_a_then_b := s0_c_id;
    s0_o_all_local_a_then_b := s0_o_all_local;
    s0_date_a_then_b := s0_date;
    s0_itemIDs_a_then_b := s0_itemIDs;
    s0_supplierWarehouseIDs_a_then_b := s0_supplierWarehouseIDs;
    s0_orderQuantities_a_then_b := s0_orderQuantities;
    s0_w_tax_a_then_b := s0_w_tax;
    s0_prices_a_then_b := s0_prices;
    s1_w_id_a_then_b := s1_w_id;
    s1_d_id_a_then_b := s1_d_id;
    s1_c_id_a_then_b := s1_c_id;
    s1_o_all_local_a_then_b := s1_o_all_local;
    s1_date_a_then_b := s1_date;
    s1_itemIDs_a_then_b := s1_itemIDs;
    s1_supplierWarehouseIDs_a_then_b := s1_supplierWarehouseIDs;
    s1_orderQuantities_a_then_b := s1_orderQuantities;
    s1_w_tax_a_then_b := s1_w_tax;
    s1_prices_a_then_b := s1_prices;
  // Restoring initial state:
    Item_I_PRICE := Item_I_PRICE_init;
    Stock_S_DATA := Stock_S_DATA_init;
    Stock_S_I_ID := Stock_S_I_ID_init;
    Stock_S_ORDER_CNT := Stock_S_ORDER_CNT_init;
    Stock_S_QUANTITY := Stock_S_QUANTITY_init;
    Stock_S_REMOTE_CNT := Stock_S_REMOTE_CNT_init;
    Stock_S_W_ID := Stock_S_W_ID_init;
    Stock_S_YTD := Stock_S_YTD_init;
    s0_w_id := s0_w_id_init;
    s0_d_id := s0_d_id_init;
    s0_c_id := s0_c_id_init;
    s0_o_all_local := s0_o_all_local_init;
    s0_date := s0_date_init;
    s0_itemIDs := s0_itemIDs_init;
    s0_supplierWarehouseIDs := s0_supplierWarehouseIDs_init;
    s0_orderQuantities := s0_orderQuantities_init;
    s0_w_tax := s0_w_tax_init;
    s0_prices := s0_prices_init;
    s1_w_id := s1_w_id_init;
    s1_d_id := s1_d_id_init;
    s1_c_id := s1_c_id_init;
    s1_o_all_local := s1_o_all_local_init;
    s1_date := s1_date_init;
    s1_itemIDs := s1_itemIDs_init;
    s1_supplierWarehouseIDs := s1_supplierWarehouseIDs_init;
    s1_orderQuantities := s1_orderQuantities_init;
    s1_w_tax := s1_w_tax_init;
    s1_prices := s1_prices_init;
    s0_active := true;
    s1_active := true;
  // Executing B then A:
    if (s1_active) {
    s1_block17__ba:
      s1_#tmp64 := get(s1_itemIDs, 0);
      s1_i_id := s1_#tmp64;
      s1_#tmp65 := get(s1_supplierWarehouseIDs, 0);
      s1_sup_w_id := s1_#tmp65;
      s1_#tmp66 := get(s1_orderQuantities, 0);
      s1_qty := s1_#tmp66;
      s1_#tmp67 := s1_qty >= 0;
      s1_#tmp68 := s1_qty <= 10;
      s1_#tmp69 := s1_#tmp67 && s1_#tmp68;
      s1_s#S_DATA := Stock_S_DATA[s1_sup_w_id][s1_i_id];
      s1_s#S_I_ID := Stock_S_I_ID[s1_sup_w_id][s1_i_id];
      s1_s#S_ORDER_CNT := Stock_S_ORDER_CNT[s1_sup_w_id][s1_i_id];
      s1_s#S_QUANTITY := Stock_S_QUANTITY[s1_sup_w_id][s1_i_id];
      s1_s#S_REMOTE_CNT := Stock_S_REMOTE_CNT[s1_sup_w_id][s1_i_id];
      s1_s#S_W_ID := Stock_S_W_ID[s1_sup_w_id][s1_i_id];
      s1_s#S_YTD := Stock_S_YTD[s1_sup_w_id][s1_i_id];
      s1_#tmp71 := Item_I_PRICE[s1_i_id][s1_sup_w_id];
      s1_price := s1_#tmp71;
      s1_#tmp72 := append(s1_prices, s1_price);
      s1_prices := s1_#tmp72;
      s1_#tmp73 := s1_s#S_QUANTITY - s1_qty;
      s1_#tmp74 := s1_#tmp73 >= 10;
      if (s1_#tmp74) {
      goto s1_block18__ba;
    } else {
      goto s1_block20__ba;
    }
    s1_block18__ba:
      s1_#tmp75 := s1_s#S_QUANTITY - s1_qty;
      s1_s#S_QUANTITY := s1_#tmp75;
      goto s1_block19__ba;
    s1_block19__ba:
      s1_#tmp78 := s1_sup_w_id != s1_w_id;
      if (s1_#tmp78) {
      goto s1_block21__ba;
    } else {
      goto s1_block22__ba;
    }
    s1_block20__ba:
      s1_#tmp76 := s1_s#S_QUANTITY + 91;
      s1_#tmp77 := s1_#tmp76 - s1_qty;
      s1_s#S_QUANTITY := s1_#tmp77;
      goto s1_block19__ba;
    s1_block21__ba:
      s1_#tmp79 := s1_s#S_REMOTE_CNT + 1;
      s1_s#S_REMOTE_CNT := s1_#tmp79;
      goto s1_block22__ba;
    s1_block22__ba:
      s1_#tmp80 := s1_s#S_ORDER_CNT + 1;
      s1_s#S_ORDER_CNT := s1_#tmp80;
      s1_#tmp81 := real(s1_qty);
      s1_#tmp82 := s1_s#S_YTD + s1_#tmp81;
      s1_s#S_YTD := s1_#tmp82;
      Stock_S_DATA := Stock_S_DATA[s1_sup_w_id := Stock_S_DATA[s1_sup_w_id][s1_i_id := s1_s#S_DATA]];
      Stock_S_I_ID := Stock_S_I_ID[s1_sup_w_id := Stock_S_I_ID[s1_sup_w_id][s1_i_id := s1_s#S_I_ID]];
      Stock_S_ORDER_CNT := Stock_S_ORDER_CNT[s1_sup_w_id := Stock_S_ORDER_CNT[s1_sup_w_id][s1_i_id := s1_s#S_ORDER_CNT]];
      Stock_S_QUANTITY := Stock_S_QUANTITY[s1_sup_w_id := Stock_S_QUANTITY[s1_sup_w_id][s1_i_id := s1_s#S_QUANTITY]];
      Stock_S_REMOTE_CNT := Stock_S_REMOTE_CNT[s1_sup_w_id := Stock_S_REMOTE_CNT[s1_sup_w_id][s1_i_id := s1_s#S_REMOTE_CNT]];
      Stock_S_W_ID := Stock_S_W_ID[s1_sup_w_id := Stock_S_W_ID[s1_sup_w_id][s1_i_id := s1_s#S_W_ID]];
      Stock_S_YTD := Stock_S_YTD[s1_sup_w_id := Stock_S_YTD[s1_sup_w_id][s1_i_id := s1_s#S_YTD]];
      goto s1_hop_exit__ba;
    s1_hop_exit__ba:
    }
    if (s0_active) {
    s0_block17__ba:
      s0_#tmp64 := get(s0_itemIDs, 0);
      s0_i_id := s0_#tmp64;
      s0_#tmp65 := get(s0_supplierWarehouseIDs, 0);
      s0_sup_w_id := s0_#tmp65;
      s0_#tmp66 := get(s0_orderQuantities, 0);
      s0_qty := s0_#tmp66;
      s0_#tmp67 := s0_qty >= 0;
      s0_#tmp68 := s0_qty <= 10;
      s0_#tmp69 := s0_#tmp67 && s0_#tmp68;
      s0_s#S_DATA := Stock_S_DATA[s0_sup_w_id][s0_i_id];
      s0_s#S_I_ID := Stock_S_I_ID[s0_sup_w_id][s0_i_id];
      s0_s#S_ORDER_CNT := Stock_S_ORDER_CNT[s0_sup_w_id][s0_i_id];
      s0_s#S_QUANTITY := Stock_S_QUANTITY[s0_sup_w_id][s0_i_id];
      s0_s#S_REMOTE_CNT := Stock_S_REMOTE_CNT[s0_sup_w_id][s0_i_id];
      s0_s#S_W_ID := Stock_S_W_ID[s0_sup_w_id][s0_i_id];
      s0_s#S_YTD := Stock_S_YTD[s0_sup_w_id][s0_i_id];
      s0_#tmp71 := Item_I_PRICE[s0_i_id][s0_sup_w_id];
      s0_price := s0_#tmp71;
      s0_#tmp72 := append(s0_prices, s0_price);
      s0_prices := s0_#tmp72;
      s0_#tmp73 := s0_s#S_QUANTITY - s0_qty;
      s0_#tmp74 := s0_#tmp73 >= 10;
      if (s0_#tmp74) {
      goto s0_block18__ba;
    } else {
      goto s0_block20__ba;
    }
    s0_block18__ba:
      s0_#tmp75 := s0_s#S_QUANTITY - s0_qty;
      s0_s#S_QUANTITY := s0_#tmp75;
      goto s0_block19__ba;
    s0_block19__ba:
      s0_#tmp78 := s0_sup_w_id != s0_w_id;
      if (s0_#tmp78) {
      goto s0_block21__ba;
    } else {
      goto s0_block22__ba;
    }
    s0_block20__ba:
      s0_#tmp76 := s0_s#S_QUANTITY + 91;
      s0_#tmp77 := s0_#tmp76 - s0_qty;
      s0_s#S_QUANTITY := s0_#tmp77;
      goto s0_block19__ba;
    s0_block21__ba:
      s0_#tmp79 := s0_s#S_REMOTE_CNT + 1;
      s0_s#S_REMOTE_CNT := s0_#tmp79;
      goto s0_block22__ba;
    s0_block22__ba:
      s0_#tmp80 := s0_s#S_ORDER_CNT + 1;
      s0_s#S_ORDER_CNT := s0_#tmp80;
      s0_#tmp81 := real(s0_qty);
      s0_#tmp82 := s0_s#S_YTD + s0_#tmp81;
      s0_s#S_YTD := s0_#tmp82;
      Stock_S_DATA := Stock_S_DATA[s0_sup_w_id := Stock_S_DATA[s0_sup_w_id][s0_i_id := s0_s#S_DATA]];
      Stock_S_I_ID := Stock_S_I_ID[s0_sup_w_id := Stock_S_I_ID[s0_sup_w_id][s0_i_id := s0_s#S_I_ID]];
      Stock_S_ORDER_CNT := Stock_S_ORDER_CNT[s0_sup_w_id := Stock_S_ORDER_CNT[s0_sup_w_id][s0_i_id := s0_s#S_ORDER_CNT]];
      Stock_S_QUANTITY := Stock_S_QUANTITY[s0_sup_w_id := Stock_S_QUANTITY[s0_sup_w_id][s0_i_id := s0_s#S_QUANTITY]];
      Stock_S_REMOTE_CNT := Stock_S_REMOTE_CNT[s0_sup_w_id := Stock_S_REMOTE_CNT[s0_sup_w_id][s0_i_id := s0_s#S_REMOTE_CNT]];
      Stock_S_W_ID := Stock_S_W_ID[s0_sup_w_id := Stock_S_W_ID[s0_sup_w_id][s0_i_id := s0_s#S_W_ID]];
      Stock_S_YTD := Stock_S_YTD[s0_sup_w_id := Stock_S_YTD[s0_sup_w_id][s0_i_id := s0_s#S_YTD]];
      goto s0_hop_exit__ba;
    s0_hop_exit__ba:
    }
  // Snapshotting final state for b_then_a
    Stock_S_DATA_b_then_a := Stock_S_DATA;
    Stock_S_I_ID_b_then_a := Stock_S_I_ID;
    Stock_S_ORDER_CNT_b_then_a := Stock_S_ORDER_CNT;
    Stock_S_QUANTITY_b_then_a := Stock_S_QUANTITY;
    Stock_S_REMOTE_CNT_b_then_a := Stock_S_REMOTE_CNT;
    Stock_S_W_ID_b_then_a := Stock_S_W_ID;
    Stock_S_YTD_b_then_a := Stock_S_YTD;
    s0_w_id_b_then_a := s0_w_id;
    s0_d_id_b_then_a := s0_d_id;
    s0_c_id_b_then_a := s0_c_id;
    s0_o_all_local_b_then_a := s0_o_all_local;
    s0_date_b_then_a := s0_date;
    s0_itemIDs_b_then_a := s0_itemIDs;
    s0_supplierWarehouseIDs_b_then_a := s0_supplierWarehouseIDs;
    s0_orderQuantities_b_then_a := s0_orderQuantities;
    s0_w_tax_b_then_a := s0_w_tax;
    s0_prices_b_then_a := s0_prices;
    s1_w_id_b_then_a := s1_w_id;
    s1_d_id_b_then_a := s1_d_id;
    s1_c_id_b_then_a := s1_c_id;
    s1_o_all_local_b_then_a := s1_o_all_local;
    s1_date_b_then_a := s1_date;
    s1_itemIDs_b_then_a := s1_itemIDs;
    s1_supplierWarehouseIDs_b_then_a := s1_supplierWarehouseIDs;
    s1_orderQuantities_b_then_a := s1_orderQuantities;
    s1_w_tax_b_then_a := s1_w_tax;
    s1_prices_b_then_a := s1_prices;
  // --- Step 4: Verify A→B ≡ B→A (Special interleavings equivalence) ---
  // Verifying A->B === B->A equivalence:
    assert {:msg "(SpecialInterleavingNonEquivalence (node_1 (function_id . 31) (instance . 0) (hop_id . 17)) (node_2 (function_id . 31) (instance . 1) (hop_id . 17)))"} (((((((((((((((((((((((((((Stock_S_DATA_a_then_b == Stock_S_DATA_b_then_a) && (Stock_S_I_ID_a_then_b == Stock_S_I_ID_b_then_a)) && (Stock_S_ORDER_CNT_a_then_b == Stock_S_ORDER_CNT_b_then_a)) && (Stock_S_QUANTITY_a_then_b == Stock_S_QUANTITY_b_then_a)) && (Stock_S_REMOTE_CNT_a_then_b == Stock_S_REMOTE_CNT_b_then_a)) && (Stock_S_W_ID_a_then_b == Stock_S_W_ID_b_then_a)) && (Stock_S_YTD_a_then_b == Stock_S_YTD_b_then_a)) && (s0_w_id_a_then_b == s0_w_id_b_then_a)) && (s0_d_id_a_then_b == s0_d_id_b_then_a)) && (s0_c_id_a_then_b == s0_c_id_b_then_a)) && (s0_o_all_local_a_then_b == s0_o_all_local_b_then_a)) && (s0_date_a_then_b == s0_date_b_then_a)) && (s0_itemIDs_a_then_b == s0_itemIDs_b_then_a)) && (s0_supplierWarehouseIDs_a_then_b == s0_supplierWarehouseIDs_b_then_a)) && (s0_orderQuantities_a_then_b == s0_orderQuantities_b_then_a)) && (s0_w_tax_a_then_b == s0_w_tax_b_then_a)) && (s0_prices_a_then_b == s0_prices_b_then_a)) && (s1_w_id_a_then_b == s1_w_id_b_then_a)) && (s1_d_id_a_then_b == s1_d_id_b_then_a)) && (s1_c_id_a_then_b == s1_c_id_b_then_a)) && (s1_o_all_local_a_then_b == s1_o_all_local_b_then_a)) && (s1_date_a_then_b == s1_date_b_then_a)) && (s1_itemIDs_a_then_b == s1_itemIDs_b_then_a)) && (s1_supplierWarehouseIDs_a_then_b == s1_supplierWarehouseIDs_b_then_a)) && (s1_orderQuantities_a_then_b == s1_orderQuantities_b_then_a)) && (s1_w_tax_a_then_b == s1_w_tax_b_then_a)) && (s1_prices_a_then_b == s1_prices_b_then_a));
}

