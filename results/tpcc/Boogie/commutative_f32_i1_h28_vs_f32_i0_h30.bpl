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
var Item_I_NAME : [int][int]String;
var Stock_S_YTD : [int][int]real;
var New_Order_NO_O_ID : [int][int][int]int;
var Warehouse_W_YTD : [int]real;
var District_D_STATE : [int][int]String;
var Order_Line_OL_I_ID : [int][int][int][int]int;
var Item_I_PRICE : [int][int]real;
var Stock_S_QUANTITY : [int][int]int;
var Warehouse_W_STATE : [int]String;
const TBL_New_Order : Table (New_Order);
var Warehouse_W_STREET_2 : [int]String;
var Stock_S_REMOTE_CNT : [int][int]int;
var Customer_C_ID : [int][int][int]int;
var Stock_S_W_ID : [int][int]int;
var District_D_YTD : [int][int]real;
var Order_Line_OL_DELIVERY_DATE : [int][int][int][int]int;
var Order_Line_OL_W_ID : [int][int][int][int]int;
var Order_O_D_ID : [int][int][int]int;
var District_D_NEXT_NO_ID : [int][int]int;
var District_D_CITY : [int][int]String;
const TBL_Order : Table (Order);
var Warehouse_W_ZIP : [int]String;
var Order_Line_OL_NUMBER : [int][int][int][int]int;
var Warehouse_W_CITY : [int]String;
var District_D_W_ID : [int][int]int;
var Warehouse_W_ID : [int]int;
var New_Order_NO_D_ID : [int][int][int]int;
const TBL_Order_Line : Table (Order_Line);
var Customer_C_PAYMENT_CNT : [int][int][int]real;
const __slice__ : int;
var Order_O_CARRIER_ID : [int][int][int]int;
const TBL_District : Table (District);
var Customer_C_FIRST : [int][int][int]String;
var Order_O_ALL_LOCAL : [int][int][int]int;
var Customer_C_DATA : [int][int][int]String;
var Order_Line_OL_O_ID : [int][int][int][int]int;
var District_D_NEXT_O_ID : [int][int]int;
var Order_O_C_ID : [int][int][int]int;
var Customer_C_LAST : [int][int][int]String;
var Order_Line_OL_SUPPLY_W_ID : [int][int][int][int]int;
var New_Order_NO_W_ID : [int][int][int]int;
var District_D_ZIP : [int][int]String;
var Customer_C_W_ID : [int][int][int]int;
var Customer_C_CREDIT : [int][int][int]String;
var Customer_C_CITY : [int][int][int]String;
var Customer_C_CREDIT_LIMIT : [int][int][int]real;
var Customer_C_SINCE : [int][int][int]int;
var Warehouse_W_NAME : [int]String;
var Order_O_ID : [int][int][int]int;
var Stock_S_ORDER_CNT : [int][int]int;
var Warehouse_W_TAX : [int]real;
var District_D_ID : [int][int]int;
var Customer_C_YTD_PAYMENT : [int][int][int]real;
var Item_W_ID : [int][int]int;
var Customer_C_STATE : [int][int][int]String;
var Order_Line_OL_D_ID : [int][int][int][int]int;
var District_D_NAME : [int][int]String;
var Customer_C_PHONE : [int][int][int]String;
var Stock_S_I_ID : [int][int]int;
const O_OL_CNT : int;
var Warehouse_W_STREET_1 : [int]String;
var District_D_STREET_2 : [int][int]String;
var Order_O_ENTRY_DATE : [int][int][int]int;
var Customer_C_DISCOUNT : [int][int][int]real;
var Customer_C_BALANCE : [int][int][int]real;
var District_D_STREET_1 : [int][int]String;
const TBL_Warehouse : Table (Warehouse);
var Customer_C_ZIP : [int][int][int]String;
var Customer_C_D_ID : [int][int][int]int;
var Item_I_IM_ID : [int][int]int;
var Order_Line_OL_AMOUNT : [int][int][int][int]int;
var Order_Line_OL_DIST_INTO : [int][int][int][int]String;
var Stock_S_DATA : [int][int]String;
var District_D_TAX : [int][int]real;
const __shards__ : int;
var Order_O_OL_CNT : [int][int][int]int;
var Order_Line_OL_QUANTITY : [int][int][int][int]int;
var Item_I_ID : [int][int]int;
var Customer_C_STREET_1 : [int][int][int]String;
var Order_O_W_ID : [int][int][int]int;
var Customer_C_STREET_2 : [int][int][int]String;
var Customer_C_DELIVERY_CNT : [int][int][int]real;
var Customer_C_MIDDLE : [int][int][int]String;
var Item_I_DATA : [int][int]String;
const TBL_Stock : Table (Stock);
const TBL_Customer : Table (Customer);
const TBL_Item : Table (Item);
procedure Check_SliceCommut_Hop28_vs_Hop30()
modifies Customer_C_BALANCE, Customer_C_DELIVERY_CNT, District_D_NEXT_NO_ID, Order_Line_OL_AMOUNT, Order_Line_OL_DELIVERY_DATE, Order_O_CARRIER_ID, Order_O_C_ID;
{
  var s0_w_id : int;
  var s0_o_carrier_id : int;
  var s0_date : int;
  var s1_w_id : int;
  var s1_o_carrier_id : int;
  var s1_date : int;
  var s0_active : bool;
  var s1_active : bool;
  var Customer_C_BALANCE_init : [int][int][int]real;
  var Customer_C_DELIVERY_CNT_init : [int][int][int]real;
  var District_D_NEXT_NO_ID_init : [int][int]int;
  var Order_Line_OL_AMOUNT_init : [int][int][int][int]int;
  var Order_Line_OL_DELIVERY_DATE_init : [int][int][int][int]int;
  var Order_O_CARRIER_ID_init : [int][int][int]int;
  var Order_O_C_ID_init : [int][int][int]int;
  var s0_w_id_init : int;
  var s0_o_carrier_id_init : int;
  var s0_date_init : int;
  var s1_w_id_init : int;
  var s1_o_carrier_id_init : int;
  var s1_date_init : int;
  var s0_#tmp267 : int;
  var s0_no_o_id : int;
  var s0_#tmp268 : int;
  var s0_#tmp269 : int;
  var s0_c_id : int;
  var s0_#tmp271 : bool;
  var s0_ol_number : int;
  var s0_#tmp272 : int;
  var s0_#tmp273 : real;
  var s0_#tmp274 : real;
  var s0_ol_total : real;
  var s0_#tmp276 : real;
  var s0_#tmp277 : real;
  var s0_#tmp278 : real;
  var s0_#tmp279 : real;
  var s1_#tmp293 : int;
  var s1_no_o_id : int;
  var s1_#tmp294 : int;
  var s1_#tmp295 : int;
  var s1_c_id : int;
  var s1_#tmp297 : bool;
  var s1_ol_number : int;
  var s1_#tmp298 : int;
  var s1_#tmp299 : real;
  var s1_#tmp300 : real;
  var s1_ol_total : real;
  var s1_#tmp302 : real;
  var s1_#tmp303 : real;
  var s1_#tmp304 : real;
  var s1_#tmp305 : real;
  var Customer_C_BALANCE_a_then_b : [int][int][int]real;
  var Customer_C_DELIVERY_CNT_a_then_b : [int][int][int]real;
  var District_D_NEXT_NO_ID_a_then_b : [int][int]int;
  var Order_Line_OL_DELIVERY_DATE_a_then_b : [int][int][int][int]int;
  var Order_O_CARRIER_ID_a_then_b : [int][int][int]int;
  var s0_w_id_a_then_b : int;
  var s0_o_carrier_id_a_then_b : int;
  var s0_date_a_then_b : int;
  var s1_w_id_a_then_b : int;
  var s1_o_carrier_id_a_then_b : int;
  var s1_date_a_then_b : int;
  var Customer_C_BALANCE_b_then_a : [int][int][int]real;
  var Customer_C_DELIVERY_CNT_b_then_a : [int][int][int]real;
  var District_D_NEXT_NO_ID_b_then_a : [int][int]int;
  var Order_Line_OL_DELIVERY_DATE_b_then_a : [int][int][int][int]int;
  var Order_O_CARRIER_ID_b_then_a : [int][int][int]int;
  var s0_w_id_b_then_a : int;
  var s0_o_carrier_id_b_then_a : int;
  var s0_date_b_then_a : int;
  var s1_w_id_b_then_a : int;
  var s1_o_carrier_id_b_then_a : int;
  var s1_date_b_then_a : int;

  // Slice commutativity verification: hop 28 vs hop 30
  // --- Step 1: Havoc initial state ---
    havoc Customer_C_BALANCE;
    havoc Customer_C_DELIVERY_CNT;
    havoc District_D_NEXT_NO_ID;
    havoc Order_Line_OL_AMOUNT;
    havoc Order_Line_OL_DELIVERY_DATE;
    havoc Order_O_CARRIER_ID;
    havoc Order_O_C_ID;
    havoc s0_w_id;
    havoc s0_o_carrier_id;
    havoc s0_date;
    havoc s1_w_id;
    havoc s1_o_carrier_id;
    havoc s1_date;
    s0_active := true;
    s1_active := true;
  // --- Step 2: Save initial state ---
    Customer_C_BALANCE_init := Customer_C_BALANCE;
    Customer_C_DELIVERY_CNT_init := Customer_C_DELIVERY_CNT;
    District_D_NEXT_NO_ID_init := District_D_NEXT_NO_ID;
    Order_Line_OL_AMOUNT_init := Order_Line_OL_AMOUNT;
    Order_Line_OL_DELIVERY_DATE_init := Order_Line_OL_DELIVERY_DATE;
    Order_O_CARRIER_ID_init := Order_O_CARRIER_ID;
    Order_O_C_ID_init := Order_O_C_ID;
    s0_w_id_init := s0_w_id;
    s0_o_carrier_id_init := s0_o_carrier_id;
    s0_date_init := s0_date;
    s1_w_id_init := s1_w_id;
    s1_o_carrier_id_init := s1_o_carrier_id;
    s1_date_init := s1_date;
  // --- Step 3: Execute special interleavings ---
  // Executing A then B:
    if (s0_active) {
    s0_block82__ab:
      s0_#tmp267 := District_D_NEXT_NO_ID[s0_w_id][0];
      s0_no_o_id := s0_#tmp267;
      s0_#tmp268 := s0_no_o_id + 1;
      District_D_NEXT_NO_ID := District_D_NEXT_NO_ID[s0_w_id := District_D_NEXT_NO_ID[s0_w_id][0 := s0_#tmp268]];
      s0_#tmp269 := Order_O_C_ID[s0_w_id][0][s0_no_o_id];
      s0_c_id := s0_#tmp269;
      Order_O_CARRIER_ID := Order_O_CARRIER_ID[s0_w_id := Order_O_CARRIER_ID[s0_w_id][0 := Order_O_CARRIER_ID[s0_w_id][0][s0_no_o_id := s0_o_carrier_id]]];
      goto s0_block84__ab;
    s0_block83__ab:
      s0_#tmp271 := s0_ol_number < O_OL_CNT;
      if (s0_#tmp271) {
      goto s0_block84__ab;
    } else {
      goto s0_block86__ab;
    }
    s0_block84__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][0 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][0];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := 0.0000000 + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block157__ab;
    s0_block86__ab:
      s0_#tmp276 := Customer_C_BALANCE[s0_w_id][0][s0_c_id];
      s0_#tmp277 := s0_#tmp276 + s0_ol_total;
      Customer_C_BALANCE := Customer_C_BALANCE[s0_w_id := Customer_C_BALANCE[s0_w_id][0 := Customer_C_BALANCE[s0_w_id][0][s0_c_id := s0_#tmp277]]];
      s0_#tmp278 := Customer_C_DELIVERY_CNT[s0_w_id][0][s0_c_id];
      s0_#tmp279 := s0_#tmp278 + 1.0000000;
      Customer_C_DELIVERY_CNT := Customer_C_DELIVERY_CNT[s0_w_id := Customer_C_DELIVERY_CNT[s0_w_id][0 := Customer_C_DELIVERY_CNT[s0_w_id][0][s0_c_id := s0_#tmp279]]];
      goto s0_hop_exit__ab;
    s0_block157__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][1 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][1];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block158__ab;
    s0_block158__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][2 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][2];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block159__ab;
    s0_block159__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][3 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][3];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block160__ab;
    s0_block160__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][4 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][4];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block161__ab;
    s0_block161__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][5 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][5];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block162__ab;
    s0_block162__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][6 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][6];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block163__ab;
    s0_block163__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][7 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][7];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block164__ab;
    s0_block164__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][8 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][8];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block165__ab;
    s0_block165__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][9 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][9];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block86__ab;
    s0_hop_exit__ab:
    }
    if (s1_active) {
    s1_block92__ab:
      s1_#tmp293 := District_D_NEXT_NO_ID[s1_w_id][2];
      s1_no_o_id := s1_#tmp293;
      s1_#tmp294 := s1_no_o_id + 1;
      District_D_NEXT_NO_ID := District_D_NEXT_NO_ID[s1_w_id := District_D_NEXT_NO_ID[s1_w_id][2 := s1_#tmp294]];
      s1_#tmp295 := Order_O_C_ID[s1_w_id][2][s1_no_o_id];
      s1_c_id := s1_#tmp295;
      Order_O_CARRIER_ID := Order_O_CARRIER_ID[s1_w_id := Order_O_CARRIER_ID[s1_w_id][2 := Order_O_CARRIER_ID[s1_w_id][2][s1_no_o_id := s1_o_carrier_id]]];
      goto s1_block94__ab;
    s1_block93__ab:
      s1_#tmp297 := s1_ol_number < O_OL_CNT;
      if (s1_#tmp297) {
      goto s1_block94__ab;
    } else {
      goto s1_block96__ab;
    }
    s1_block94__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][0 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][0];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := 0.0000000 + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block175__ab;
    s1_block96__ab:
      s1_#tmp302 := Customer_C_BALANCE[s1_w_id][2][s1_c_id];
      s1_#tmp303 := s1_#tmp302 + s1_ol_total;
      Customer_C_BALANCE := Customer_C_BALANCE[s1_w_id := Customer_C_BALANCE[s1_w_id][2 := Customer_C_BALANCE[s1_w_id][2][s1_c_id := s1_#tmp303]]];
      s1_#tmp304 := Customer_C_DELIVERY_CNT[s1_w_id][2][s1_c_id];
      s1_#tmp305 := s1_#tmp304 + 1.0000000;
      Customer_C_DELIVERY_CNT := Customer_C_DELIVERY_CNT[s1_w_id := Customer_C_DELIVERY_CNT[s1_w_id][2 := Customer_C_DELIVERY_CNT[s1_w_id][2][s1_c_id := s1_#tmp305]]];
      goto s1_hop_exit__ab;
    s1_block175__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][1 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][1];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block176__ab;
    s1_block176__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][2 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][2];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block177__ab;
    s1_block177__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][3 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][3];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block178__ab;
    s1_block178__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][4 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][4];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block179__ab;
    s1_block179__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][5 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][5];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block180__ab;
    s1_block180__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][6 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][6];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block181__ab;
    s1_block181__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][7 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][7];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block182__ab;
    s1_block182__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][8 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][8];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block183__ab;
    s1_block183__ab:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][9 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][9];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block96__ab;
    s1_hop_exit__ab:
    }
  // Snapshotting final state for a_then_b
    Customer_C_BALANCE_a_then_b := Customer_C_BALANCE;
    Customer_C_DELIVERY_CNT_a_then_b := Customer_C_DELIVERY_CNT;
    District_D_NEXT_NO_ID_a_then_b := District_D_NEXT_NO_ID;
    Order_Line_OL_DELIVERY_DATE_a_then_b := Order_Line_OL_DELIVERY_DATE;
    Order_O_CARRIER_ID_a_then_b := Order_O_CARRIER_ID;
    s0_w_id_a_then_b := s0_w_id;
    s0_o_carrier_id_a_then_b := s0_o_carrier_id;
    s0_date_a_then_b := s0_date;
    s1_w_id_a_then_b := s1_w_id;
    s1_o_carrier_id_a_then_b := s1_o_carrier_id;
    s1_date_a_then_b := s1_date;
  // Restoring initial state:
    Customer_C_BALANCE := Customer_C_BALANCE_init;
    Customer_C_DELIVERY_CNT := Customer_C_DELIVERY_CNT_init;
    District_D_NEXT_NO_ID := District_D_NEXT_NO_ID_init;
    Order_Line_OL_AMOUNT := Order_Line_OL_AMOUNT_init;
    Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE_init;
    Order_O_CARRIER_ID := Order_O_CARRIER_ID_init;
    Order_O_C_ID := Order_O_C_ID_init;
    s0_w_id := s0_w_id_init;
    s0_o_carrier_id := s0_o_carrier_id_init;
    s0_date := s0_date_init;
    s1_w_id := s1_w_id_init;
    s1_o_carrier_id := s1_o_carrier_id_init;
    s1_date := s1_date_init;
    s0_active := true;
    s1_active := true;
  // Executing B then A:
    if (s1_active) {
    s1_block92__ba:
      s1_#tmp293 := District_D_NEXT_NO_ID[s1_w_id][2];
      s1_no_o_id := s1_#tmp293;
      s1_#tmp294 := s1_no_o_id + 1;
      District_D_NEXT_NO_ID := District_D_NEXT_NO_ID[s1_w_id := District_D_NEXT_NO_ID[s1_w_id][2 := s1_#tmp294]];
      s1_#tmp295 := Order_O_C_ID[s1_w_id][2][s1_no_o_id];
      s1_c_id := s1_#tmp295;
      Order_O_CARRIER_ID := Order_O_CARRIER_ID[s1_w_id := Order_O_CARRIER_ID[s1_w_id][2 := Order_O_CARRIER_ID[s1_w_id][2][s1_no_o_id := s1_o_carrier_id]]];
      goto s1_block94__ba;
    s1_block93__ba:
      s1_#tmp297 := s1_ol_number < O_OL_CNT;
      if (s1_#tmp297) {
      goto s1_block94__ba;
    } else {
      goto s1_block96__ba;
    }
    s1_block94__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][0 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][0];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := 0.0000000 + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block175__ba;
    s1_block96__ba:
      s1_#tmp302 := Customer_C_BALANCE[s1_w_id][2][s1_c_id];
      s1_#tmp303 := s1_#tmp302 + s1_ol_total;
      Customer_C_BALANCE := Customer_C_BALANCE[s1_w_id := Customer_C_BALANCE[s1_w_id][2 := Customer_C_BALANCE[s1_w_id][2][s1_c_id := s1_#tmp303]]];
      s1_#tmp304 := Customer_C_DELIVERY_CNT[s1_w_id][2][s1_c_id];
      s1_#tmp305 := s1_#tmp304 + 1.0000000;
      Customer_C_DELIVERY_CNT := Customer_C_DELIVERY_CNT[s1_w_id := Customer_C_DELIVERY_CNT[s1_w_id][2 := Customer_C_DELIVERY_CNT[s1_w_id][2][s1_c_id := s1_#tmp305]]];
      goto s1_hop_exit__ba;
    s1_block175__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][1 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][1];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block176__ba;
    s1_block176__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][2 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][2];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block177__ba;
    s1_block177__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][3 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][3];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block178__ba;
    s1_block178__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][4 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][4];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block179__ba;
    s1_block179__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][5 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][5];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block180__ba;
    s1_block180__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][6 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][6];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block181__ba;
    s1_block181__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][7 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][7];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block182__ba;
    s1_block182__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][8 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][8];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block183__ba;
    s1_block183__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s1_w_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2 := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id := Order_Line_OL_DELIVERY_DATE[s1_w_id][2][s1_no_o_id][9 := s1_date]]]];
      s1_#tmp298 := Order_Line_OL_AMOUNT[s1_w_id][2][s1_no_o_id][9];
      s1_#tmp299 := real(s1_#tmp298);
      s1_#tmp300 := s1_ol_total + s1_#tmp299;
      s1_ol_total := s1_#tmp300;
      goto s1_block96__ba;
    s1_hop_exit__ba:
    }
    if (s0_active) {
    s0_block82__ba:
      s0_#tmp267 := District_D_NEXT_NO_ID[s0_w_id][0];
      s0_no_o_id := s0_#tmp267;
      s0_#tmp268 := s0_no_o_id + 1;
      District_D_NEXT_NO_ID := District_D_NEXT_NO_ID[s0_w_id := District_D_NEXT_NO_ID[s0_w_id][0 := s0_#tmp268]];
      s0_#tmp269 := Order_O_C_ID[s0_w_id][0][s0_no_o_id];
      s0_c_id := s0_#tmp269;
      Order_O_CARRIER_ID := Order_O_CARRIER_ID[s0_w_id := Order_O_CARRIER_ID[s0_w_id][0 := Order_O_CARRIER_ID[s0_w_id][0][s0_no_o_id := s0_o_carrier_id]]];
      goto s0_block84__ba;
    s0_block83__ba:
      s0_#tmp271 := s0_ol_number < O_OL_CNT;
      if (s0_#tmp271) {
      goto s0_block84__ba;
    } else {
      goto s0_block86__ba;
    }
    s0_block84__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][0 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][0];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := 0.0000000 + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block157__ba;
    s0_block86__ba:
      s0_#tmp276 := Customer_C_BALANCE[s0_w_id][0][s0_c_id];
      s0_#tmp277 := s0_#tmp276 + s0_ol_total;
      Customer_C_BALANCE := Customer_C_BALANCE[s0_w_id := Customer_C_BALANCE[s0_w_id][0 := Customer_C_BALANCE[s0_w_id][0][s0_c_id := s0_#tmp277]]];
      s0_#tmp278 := Customer_C_DELIVERY_CNT[s0_w_id][0][s0_c_id];
      s0_#tmp279 := s0_#tmp278 + 1.0000000;
      Customer_C_DELIVERY_CNT := Customer_C_DELIVERY_CNT[s0_w_id := Customer_C_DELIVERY_CNT[s0_w_id][0 := Customer_C_DELIVERY_CNT[s0_w_id][0][s0_c_id := s0_#tmp279]]];
      goto s0_hop_exit__ba;
    s0_block157__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][1 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][1];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block158__ba;
    s0_block158__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][2 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][2];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block159__ba;
    s0_block159__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][3 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][3];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block160__ba;
    s0_block160__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][4 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][4];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block161__ba;
    s0_block161__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][5 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][5];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block162__ba;
    s0_block162__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][6 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][6];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block163__ba;
    s0_block163__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][7 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][7];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block164__ba;
    s0_block164__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][8 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][8];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block165__ba;
    s0_block165__ba:
      Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE[s0_w_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0 := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id := Order_Line_OL_DELIVERY_DATE[s0_w_id][0][s0_no_o_id][9 := s0_date]]]];
      s0_#tmp272 := Order_Line_OL_AMOUNT[s0_w_id][0][s0_no_o_id][9];
      s0_#tmp273 := real(s0_#tmp272);
      s0_#tmp274 := s0_ol_total + s0_#tmp273;
      s0_ol_total := s0_#tmp274;
      goto s0_block86__ba;
    s0_hop_exit__ba:
    }
  // Snapshotting final state for b_then_a
    Customer_C_BALANCE_b_then_a := Customer_C_BALANCE;
    Customer_C_DELIVERY_CNT_b_then_a := Customer_C_DELIVERY_CNT;
    District_D_NEXT_NO_ID_b_then_a := District_D_NEXT_NO_ID;
    Order_Line_OL_DELIVERY_DATE_b_then_a := Order_Line_OL_DELIVERY_DATE;
    Order_O_CARRIER_ID_b_then_a := Order_O_CARRIER_ID;
    s0_w_id_b_then_a := s0_w_id;
    s0_o_carrier_id_b_then_a := s0_o_carrier_id;
    s0_date_b_then_a := s0_date;
    s1_w_id_b_then_a := s1_w_id;
    s1_o_carrier_id_b_then_a := s1_o_carrier_id;
    s1_date_b_then_a := s1_date;
  // --- Step 4: Verify A→B ≡ B→A (Special interleavings equivalence) ---
  // Verifying A->B === B->A equivalence:
    assert {:msg "(SpecialInterleavingNonEquivalence (node_1 (function_id . 32) (instance . 1) (hop_id . 28)) (node_2 (function_id . 32) (instance . 0) (hop_id . 30)))"} (((((((((((Customer_C_BALANCE_a_then_b == Customer_C_BALANCE_b_then_a) && (Customer_C_DELIVERY_CNT_a_then_b == Customer_C_DELIVERY_CNT_b_then_a)) && (District_D_NEXT_NO_ID_a_then_b == District_D_NEXT_NO_ID_b_then_a)) && (Order_Line_OL_DELIVERY_DATE_a_then_b == Order_Line_OL_DELIVERY_DATE_b_then_a)) && (Order_O_CARRIER_ID_a_then_b == Order_O_CARRIER_ID_b_then_a)) && (s0_w_id_a_then_b == s0_w_id_b_then_a)) && (s0_o_carrier_id_a_then_b == s0_o_carrier_id_b_then_a)) && (s0_date_a_then_b == s0_date_b_then_a)) && (s1_w_id_a_then_b == s1_w_id_b_then_a)) && (s1_o_carrier_id_a_then_b == s1_o_carrier_id_b_then_a)) && (s1_date_a_then_b == s1_date_b_then_a));
}

