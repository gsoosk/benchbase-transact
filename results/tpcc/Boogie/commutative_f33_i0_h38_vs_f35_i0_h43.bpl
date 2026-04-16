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
var Customer_C_MIDDLE : [int][int][int]String;
var Order_Line_OL_D_ID : [int][int][int][int]int;
var Order_Line_OL_SUPPLY_W_ID : [int][int][int][int]int;
var Order_Line_OL_DIST_INTO : [int][int][int][int]String;
var Order_O_D_ID : [int][int][int]int;
var Stock_S_I_ID : [int][int]int;
var Warehouse_W_ID : [int]int;
var Customer_C_W_ID : [int][int][int]int;
var Warehouse_W_CITY : [int]String;
const TBL_Customer : Table (Customer);
var District_D_CITY : [int][int]String;
var District_D_STATE : [int][int]String;
var District_D_NEXT_NO_ID : [int][int]int;
var Order_O_OL_CNT : [int][int][int]int;
var Item_W_ID : [int][int]int;
var Item_I_IM_ID : [int][int]int;
var Item_I_PRICE : [int][int]real;
var Customer_C_CREDIT : [int][int][int]String;
const TBL_New_Order : Table (New_Order);
var Stock_S_DATA : [int][int]String;
var Warehouse_W_STREET_2 : [int]String;
var Customer_C_SINCE : [int][int][int]int;
var District_D_NAME : [int][int]String;
var Order_O_CARRIER_ID : [int][int][int]int;
var Customer_C_PHONE : [int][int][int]String;
var Customer_C_DISCOUNT : [int][int][int]real;
var Item_I_ID : [int][int]int;
var Warehouse_W_NAME : [int]String;
var New_Order_NO_D_ID : [int][int][int]int;
var Order_Line_OL_AMOUNT : [int][int][int][int]int;
var District_D_ID : [int][int]int;
var District_D_YTD : [int][int]real;
var Item_I_NAME : [int][int]String;
var Warehouse_W_STREET_1 : [int]String;
var District_D_W_ID : [int][int]int;
var Order_O_ENTRY_DATE : [int][int][int]int;
var Order_Line_OL_DELIVERY_DATE : [int][int][int][int]int;
var Warehouse_W_STATE : [int]String;
const O_OL_CNT : int;
var Customer_C_FIRST : [int][int][int]String;
var Customer_C_BALANCE : [int][int][int]real;
const TBL_Order : Table (Order);
const TBL_Warehouse : Table (Warehouse);
var Stock_S_QUANTITY : [int][int]int;
var New_Order_NO_W_ID : [int][int][int]int;
var Stock_S_ORDER_CNT : [int][int]int;
var District_D_TAX : [int][int]real;
var District_D_NEXT_O_ID : [int][int]int;
var Warehouse_W_YTD : [int]real;
var Order_O_ID : [int][int][int]int;
var Item_I_DATA : [int][int]String;
var Order_Line_OL_O_ID : [int][int][int][int]int;
var Customer_C_D_ID : [int][int][int]int;
const __slice__ : int;
var Stock_S_REMOTE_CNT : [int][int]int;
var Warehouse_W_ZIP : [int]String;
const TBL_Item : Table (Item);
var Customer_C_CITY : [int][int][int]String;
var Customer_C_STATE : [int][int][int]String;
var Order_O_W_ID : [int][int][int]int;
var Order_Line_OL_I_ID : [int][int][int][int]int;
const __shards__ : int;
var Order_Line_OL_QUANTITY : [int][int][int][int]int;
var Order_O_ALL_LOCAL : [int][int][int]int;
var Stock_S_YTD : [int][int]real;
var Customer_C_PAYMENT_CNT : [int][int][int]real;
var Order_O_C_ID : [int][int][int]int;
var Customer_C_ID : [int][int][int]int;
var Customer_C_DELIVERY_CNT : [int][int][int]real;
var Customer_C_DATA : [int][int][int]String;
var New_Order_NO_O_ID : [int][int][int]int;
const TBL_Stock : Table (Stock);
var Order_Line_OL_NUMBER : [int][int][int][int]int;
var Stock_S_W_ID : [int][int]int;
var Order_Line_OL_W_ID : [int][int][int][int]int;
var District_D_STREET_1 : [int][int]String;
var Customer_C_CREDIT_LIMIT : [int][int][int]real;
const TBL_District : Table (District);
var District_D_STREET_2 : [int][int]String;
var Customer_C_STREET_1 : [int][int][int]String;
var Customer_C_LAST : [int][int][int]String;
var Customer_C_YTD_PAYMENT : [int][int][int]real;
var Customer_C_STREET_2 : [int][int][int]String;
var Customer_C_ZIP : [int][int][int]String;
var Warehouse_W_TAX : [int]real;
var District_D_ZIP : [int][int]String;
const TBL_Order_Line : Table (Order_Line);
const L_BC : String;
const L_$u0020 : String;
const L_$u0020$u007C$u0020 : String;
procedure Check_SliceCommut_Hop38_vs_Hop43()
modifies Customer_C_BALANCE, Customer_C_CITY, Customer_C_CREDIT, Customer_C_CREDIT_LIMIT, Customer_C_DATA, Customer_C_DELIVERY_CNT, Customer_C_DISCOUNT, Customer_C_D_ID, Customer_C_FIRST, Customer_C_ID, Customer_C_LAST, Customer_C_MIDDLE, Customer_C_PAYMENT_CNT, Customer_C_PHONE, Customer_C_SINCE, Customer_C_STATE, Customer_C_STREET_1, Customer_C_STREET_2, Customer_C_W_ID, Customer_C_YTD_PAYMENT, Customer_C_ZIP, Order_Line_OL_AMOUNT, Order_Line_OL_DELIVERY_DATE, Order_Line_OL_DIST_INTO, Order_Line_OL_I_ID, Order_Line_OL_QUANTITY, Order_Line_OL_SUPPLY_W_ID, Order_O_ALL_LOCAL, Order_O_CARRIER_ID, Order_O_C_ID, Order_O_ENTRY_DATE, Order_O_OL_CNT;
{
  var s0_w_id : int;
  var s0_d_id : int;
  var s0_c_id : int;
  var s0_o_id : int;
  var s1_w_id : int;
  var s1_d_id : int;
  var s1_c_w_id : int;
  var s1_c_d_id : int;
  var s1_c_id : int;
  var s1_amount : real;
  var s0_active : bool;
  var s1_active : bool;
  var Customer_C_BALANCE_init : [int][int][int]real;
  var Customer_C_CITY_init : [int][int][int]String;
  var Customer_C_CREDIT_init : [int][int][int]String;
  var Customer_C_CREDIT_LIMIT_init : [int][int][int]real;
  var Customer_C_DATA_init : [int][int][int]String;
  var Customer_C_DELIVERY_CNT_init : [int][int][int]real;
  var Customer_C_DISCOUNT_init : [int][int][int]real;
  var Customer_C_D_ID_init : [int][int][int]int;
  var Customer_C_FIRST_init : [int][int][int]String;
  var Customer_C_ID_init : [int][int][int]int;
  var Customer_C_LAST_init : [int][int][int]String;
  var Customer_C_MIDDLE_init : [int][int][int]String;
  var Customer_C_PAYMENT_CNT_init : [int][int][int]real;
  var Customer_C_PHONE_init : [int][int][int]String;
  var Customer_C_SINCE_init : [int][int][int]int;
  var Customer_C_STATE_init : [int][int][int]String;
  var Customer_C_STREET_1_init : [int][int][int]String;
  var Customer_C_STREET_2_init : [int][int][int]String;
  var Customer_C_W_ID_init : [int][int][int]int;
  var Customer_C_YTD_PAYMENT_init : [int][int][int]real;
  var Customer_C_ZIP_init : [int][int][int]String;
  var Order_Line_OL_AMOUNT_init : [int][int][int][int]int;
  var Order_Line_OL_DELIVERY_DATE_init : [int][int][int][int]int;
  var Order_Line_OL_DIST_INTO_init : [int][int][int][int]String;
  var Order_Line_OL_I_ID_init : [int][int][int][int]int;
  var Order_Line_OL_QUANTITY_init : [int][int][int][int]int;
  var Order_Line_OL_SUPPLY_W_ID_init : [int][int][int][int]int;
  var Order_O_ALL_LOCAL_init : [int][int][int]int;
  var Order_O_CARRIER_ID_init : [int][int][int]int;
  var Order_O_C_ID_init : [int][int][int]int;
  var Order_O_ENTRY_DATE_init : [int][int][int]int;
  var Order_O_OL_CNT_init : [int][int][int]int;
  var s0_w_id_init : int;
  var s0_d_id_init : int;
  var s0_c_id_init : int;
  var s0_o_id_init : int;
  var s1_w_id_init : int;
  var s1_d_id_init : int;
  var s1_c_w_id_init : int;
  var s1_c_d_id_init : int;
  var s1_c_id_init : int;
  var s1_amount_init : real;
  var s0_#tmp407 : Row (Table (Customer));
  var s0_c : Row (Table (Customer));
  var s0_#tmp408 : unit;
  var s0_#tmp409 : Row (Table (Order));
  var s0_o : Row (Table (Order));
  var s0_#tmp410 : unit;
  var s0_#tmp411 : bool;
  var s0_ol_number : int;
  var s0_#tmp412 : Row (Table (Order_Line));
  var s0_ol : Row (Table (Order_Line));
  var s0_#tmp413 : unit;
  var s1_c#C_BALANCE : real;
  var s1_c#C_CITY : String;
  var s1_c#C_CREDIT : String;
  var s1_c#C_CREDIT_LIMIT : real;
  var s1_c#C_DATA : String;
  var s1_c#C_DELIVERY_CNT : real;
  var s1_c#C_DISCOUNT : real;
  var s1_c#C_D_ID : int;
  var s1_c#C_FIRST : String;
  var s1_c#C_ID : int;
  var s1_c#C_LAST : String;
  var s1_c#C_MIDDLE : String;
  var s1_c#C_PAYMENT_CNT : real;
  var s1_c#C_PHONE : String;
  var s1_c#C_SINCE : int;
  var s1_c#C_STATE : String;
  var s1_c#C_STREET_1 : String;
  var s1_c#C_STREET_2 : String;
  var s1_c#C_W_ID : int;
  var s1_c#C_YTD_PAYMENT : real;
  var s1_c#C_ZIP : String;
  var s1_#tmp428 : real;
  var s1_#tmp429 : real;
  var s1_#tmp430 : real;
  var s1_#tmp431 : bool;
  var s1_#tmp432 : String;
  var s1_#tmp433 : String;
  var s1_#tmp434 : String;
  var s1_#tmp435 : String;
  var s1_#tmp436 : String;
  var s1_#tmp437 : String;
  var s1_#tmp438 : String;
  var s1_#tmp439 : String;
  var s1_#tmp440 : String;
  var s1_#tmp441 : String;
  var s1_#tmp442 : String;
  var s1_#tmp443 : String;
  var s1_#tmp444 : String;
  var s1_#tmp445 : String;
  var s1_#tmp446 : String;
  var s1_#tmp447 : String;
  var s1_#tmp448 : String;
  var s1_#tmp449 : String;
  var Customer_C_BALANCE_a_then_b : [int][int][int]real;
  var Customer_C_CITY_a_then_b : [int][int][int]String;
  var Customer_C_CREDIT_a_then_b : [int][int][int]String;
  var Customer_C_CREDIT_LIMIT_a_then_b : [int][int][int]real;
  var Customer_C_DATA_a_then_b : [int][int][int]String;
  var Customer_C_DELIVERY_CNT_a_then_b : [int][int][int]real;
  var Customer_C_DISCOUNT_a_then_b : [int][int][int]real;
  var Customer_C_D_ID_a_then_b : [int][int][int]int;
  var Customer_C_FIRST_a_then_b : [int][int][int]String;
  var Customer_C_ID_a_then_b : [int][int][int]int;
  var Customer_C_LAST_a_then_b : [int][int][int]String;
  var Customer_C_MIDDLE_a_then_b : [int][int][int]String;
  var Customer_C_PAYMENT_CNT_a_then_b : [int][int][int]real;
  var Customer_C_PHONE_a_then_b : [int][int][int]String;
  var Customer_C_SINCE_a_then_b : [int][int][int]int;
  var Customer_C_STATE_a_then_b : [int][int][int]String;
  var Customer_C_STREET_1_a_then_b : [int][int][int]String;
  var Customer_C_STREET_2_a_then_b : [int][int][int]String;
  var Customer_C_W_ID_a_then_b : [int][int][int]int;
  var Customer_C_YTD_PAYMENT_a_then_b : [int][int][int]real;
  var Customer_C_ZIP_a_then_b : [int][int][int]String;
  var Customer_C_BALANCE_b_then_a : [int][int][int]real;
  var Customer_C_CITY_b_then_a : [int][int][int]String;
  var Customer_C_CREDIT_b_then_a : [int][int][int]String;
  var Customer_C_CREDIT_LIMIT_b_then_a : [int][int][int]real;
  var Customer_C_DATA_b_then_a : [int][int][int]String;
  var Customer_C_DELIVERY_CNT_b_then_a : [int][int][int]real;
  var Customer_C_DISCOUNT_b_then_a : [int][int][int]real;
  var Customer_C_D_ID_b_then_a : [int][int][int]int;
  var Customer_C_FIRST_b_then_a : [int][int][int]String;
  var Customer_C_ID_b_then_a : [int][int][int]int;
  var Customer_C_LAST_b_then_a : [int][int][int]String;
  var Customer_C_MIDDLE_b_then_a : [int][int][int]String;
  var Customer_C_PAYMENT_CNT_b_then_a : [int][int][int]real;
  var Customer_C_PHONE_b_then_a : [int][int][int]String;
  var Customer_C_SINCE_b_then_a : [int][int][int]int;
  var Customer_C_STATE_b_then_a : [int][int][int]String;
  var Customer_C_STREET_1_b_then_a : [int][int][int]String;
  var Customer_C_STREET_2_b_then_a : [int][int][int]String;
  var Customer_C_W_ID_b_then_a : [int][int][int]int;
  var Customer_C_YTD_PAYMENT_b_then_a : [int][int][int]real;
  var Customer_C_ZIP_b_then_a : [int][int][int]String;

  // Slice commutativity verification: hop 38 vs hop 43
  // --- Step 1: Havoc initial state ---
    havoc Customer_C_BALANCE;
    havoc Customer_C_CITY;
    havoc Customer_C_CREDIT;
    havoc Customer_C_CREDIT_LIMIT;
    havoc Customer_C_DATA;
    havoc Customer_C_DELIVERY_CNT;
    havoc Customer_C_DISCOUNT;
    havoc Customer_C_D_ID;
    havoc Customer_C_FIRST;
    havoc Customer_C_ID;
    havoc Customer_C_LAST;
    havoc Customer_C_MIDDLE;
    havoc Customer_C_PAYMENT_CNT;
    havoc Customer_C_PHONE;
    havoc Customer_C_SINCE;
    havoc Customer_C_STATE;
    havoc Customer_C_STREET_1;
    havoc Customer_C_STREET_2;
    havoc Customer_C_W_ID;
    havoc Customer_C_YTD_PAYMENT;
    havoc Customer_C_ZIP;
    havoc Order_Line_OL_AMOUNT;
    havoc Order_Line_OL_DELIVERY_DATE;
    havoc Order_Line_OL_DIST_INTO;
    havoc Order_Line_OL_I_ID;
    havoc Order_Line_OL_QUANTITY;
    havoc Order_Line_OL_SUPPLY_W_ID;
    havoc Order_O_ALL_LOCAL;
    havoc Order_O_CARRIER_ID;
    havoc Order_O_C_ID;
    havoc Order_O_ENTRY_DATE;
    havoc Order_O_OL_CNT;
    havoc s0_w_id;
    havoc s0_d_id;
    havoc s0_c_id;
    havoc s0_o_id;
    havoc s1_w_id;
    havoc s1_d_id;
    havoc s1_c_w_id;
    havoc s1_c_d_id;
    havoc s1_c_id;
    havoc s1_amount;
    s0_active := true;
    s1_active := true;
  // --- Step 2: Save initial state ---
    Customer_C_BALANCE_init := Customer_C_BALANCE;
    Customer_C_CITY_init := Customer_C_CITY;
    Customer_C_CREDIT_init := Customer_C_CREDIT;
    Customer_C_CREDIT_LIMIT_init := Customer_C_CREDIT_LIMIT;
    Customer_C_DATA_init := Customer_C_DATA;
    Customer_C_DELIVERY_CNT_init := Customer_C_DELIVERY_CNT;
    Customer_C_DISCOUNT_init := Customer_C_DISCOUNT;
    Customer_C_D_ID_init := Customer_C_D_ID;
    Customer_C_FIRST_init := Customer_C_FIRST;
    Customer_C_ID_init := Customer_C_ID;
    Customer_C_LAST_init := Customer_C_LAST;
    Customer_C_MIDDLE_init := Customer_C_MIDDLE;
    Customer_C_PAYMENT_CNT_init := Customer_C_PAYMENT_CNT;
    Customer_C_PHONE_init := Customer_C_PHONE;
    Customer_C_SINCE_init := Customer_C_SINCE;
    Customer_C_STATE_init := Customer_C_STATE;
    Customer_C_STREET_1_init := Customer_C_STREET_1;
    Customer_C_STREET_2_init := Customer_C_STREET_2;
    Customer_C_W_ID_init := Customer_C_W_ID;
    Customer_C_YTD_PAYMENT_init := Customer_C_YTD_PAYMENT;
    Customer_C_ZIP_init := Customer_C_ZIP;
    Order_Line_OL_AMOUNT_init := Order_Line_OL_AMOUNT;
    Order_Line_OL_DELIVERY_DATE_init := Order_Line_OL_DELIVERY_DATE;
    Order_Line_OL_DIST_INTO_init := Order_Line_OL_DIST_INTO;
    Order_Line_OL_I_ID_init := Order_Line_OL_I_ID;
    Order_Line_OL_QUANTITY_init := Order_Line_OL_QUANTITY;
    Order_Line_OL_SUPPLY_W_ID_init := Order_Line_OL_SUPPLY_W_ID;
    Order_O_ALL_LOCAL_init := Order_O_ALL_LOCAL;
    Order_O_CARRIER_ID_init := Order_O_CARRIER_ID;
    Order_O_C_ID_init := Order_O_C_ID;
    Order_O_ENTRY_DATE_init := Order_O_ENTRY_DATE;
    Order_O_OL_CNT_init := Order_O_OL_CNT;
    s0_w_id_init := s0_w_id;
    s0_d_id_init := s0_d_id;
    s0_c_id_init := s0_c_id;
    s0_o_id_init := s0_o_id;
    s1_w_id_init := s1_w_id;
    s1_d_id_init := s1_d_id;
    s1_c_w_id_init := s1_c_w_id;
    s1_c_d_id_init := s1_c_d_id;
    s1_c_id_init := s1_c_id;
    s1_amount_init := s1_amount;
  // --- Step 3: Execute special interleavings ---
  // Executing A then B:
    if (s0_active) {
    s0_block132__ab:
      s0_#tmp407 := construct_Row_Customer(Customer_C_W_ID[s0_w_id][s0_d_id][s0_c_id], Customer_C_D_ID[s0_w_id][s0_d_id][s0_c_id], Customer_C_ID[s0_w_id][s0_d_id][s0_c_id], Customer_C_FIRST[s0_w_id][s0_d_id][s0_c_id], Customer_C_MIDDLE[s0_w_id][s0_d_id][s0_c_id], Customer_C_LAST[s0_w_id][s0_d_id][s0_c_id], Customer_C_STREET_1[s0_w_id][s0_d_id][s0_c_id], Customer_C_STREET_2[s0_w_id][s0_d_id][s0_c_id], Customer_C_CITY[s0_w_id][s0_d_id][s0_c_id], Customer_C_STATE[s0_w_id][s0_d_id][s0_c_id], Customer_C_ZIP[s0_w_id][s0_d_id][s0_c_id], Customer_C_PHONE[s0_w_id][s0_d_id][s0_c_id], Customer_C_SINCE[s0_w_id][s0_d_id][s0_c_id], Customer_C_CREDIT[s0_w_id][s0_d_id][s0_c_id], Customer_C_CREDIT_LIMIT[s0_w_id][s0_d_id][s0_c_id], Customer_C_DISCOUNT[s0_w_id][s0_d_id][s0_c_id], Customer_C_BALANCE[s0_w_id][s0_d_id][s0_c_id], Customer_C_YTD_PAYMENT[s0_w_id][s0_d_id][s0_c_id], Customer_C_PAYMENT_CNT[s0_w_id][s0_d_id][s0_c_id], Customer_C_DELIVERY_CNT[s0_w_id][s0_d_id][s0_c_id], Customer_C_DATA[s0_w_id][s0_d_id][s0_c_id]);
      s0_c := s0_#tmp407;
      s0_#tmp408 := to_unit(s0_c);
      s0_#tmp409 := construct_Row_Order(Order_O_W_ID[s0_w_id][s0_d_id][s0_o_id], Order_O_D_ID[s0_w_id][s0_d_id][s0_o_id], Order_O_ID[s0_w_id][s0_d_id][s0_o_id], Order_O_C_ID[s0_w_id][s0_d_id][s0_o_id], Order_O_ENTRY_DATE[s0_w_id][s0_d_id][s0_o_id], Order_O_CARRIER_ID[s0_w_id][s0_d_id][s0_o_id], Order_O_OL_CNT[s0_w_id][s0_d_id][s0_o_id], Order_O_ALL_LOCAL[s0_w_id][s0_d_id][s0_o_id]);
      s0_o := s0_#tmp409;
      s0_#tmp410 := to_unit(s0_o);
      goto s0_block134__ab;
    s0_block133__ab:
      s0_#tmp411 := s0_ol_number < O_OL_CNT;
      if (s0_#tmp411) {
      goto s0_block134__ab;
    } else {
      goto s0_block136__ab;
    }
    s0_block134__ab:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][0]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block247__ab;
    s0_block136__ab:
      s0_active := false;
      goto s0_hop_exit__ab;
    s0_block247__ab:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][1]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block248__ab;
    s0_block248__ab:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][2]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block249__ab;
    s0_block249__ab:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][3]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block250__ab;
    s0_block250__ab:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][4]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block251__ab;
    s0_block251__ab:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][5]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block252__ab;
    s0_block252__ab:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][6]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block253__ab;
    s0_block253__ab:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][7]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block254__ab;
    s0_block254__ab:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][8]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block255__ab;
    s0_block255__ab:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][9]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block136__ab;
    s0_hop_exit__ab:
    }
    if (s1_active) {
    s1_block145__ab:
      s1_c#C_BALANCE := Customer_C_BALANCE[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_CITY := Customer_C_CITY[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_CREDIT := Customer_C_CREDIT[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_CREDIT_LIMIT := Customer_C_CREDIT_LIMIT[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_DATA := Customer_C_DATA[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_DELIVERY_CNT := Customer_C_DELIVERY_CNT[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_DISCOUNT := Customer_C_DISCOUNT[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_D_ID := Customer_C_D_ID[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_FIRST := Customer_C_FIRST[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_ID := Customer_C_ID[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_LAST := Customer_C_LAST[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_MIDDLE := Customer_C_MIDDLE[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_PAYMENT_CNT := Customer_C_PAYMENT_CNT[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_PHONE := Customer_C_PHONE[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_SINCE := Customer_C_SINCE[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_STATE := Customer_C_STATE[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_STREET_1 := Customer_C_STREET_1[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_STREET_2 := Customer_C_STREET_2[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_W_ID := Customer_C_W_ID[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_YTD_PAYMENT := Customer_C_YTD_PAYMENT[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_ZIP := Customer_C_ZIP[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_#tmp428 := s1_c#C_BALANCE - s1_amount;
      s1_c#C_BALANCE := s1_#tmp428;
      s1_#tmp429 := s1_c#C_YTD_PAYMENT + s1_amount;
      s1_c#C_YTD_PAYMENT := s1_#tmp429;
      s1_#tmp430 := s1_c#C_PAYMENT_CNT + 1.0000000;
      s1_c#C_PAYMENT_CNT := s1_#tmp430;
      s1_#tmp431 := s1_c#C_CREDIT == L_BC;
      if (s1_#tmp431) {
      goto s1_block146__ab;
    } else {
      goto s1_block147__ab;
    }
    s1_block146__ab:
      s1_#tmp432 := str(s1_c#C_ID);
      s1_#tmp433 := concat(s1_#tmp432, L_$u0020);
      s1_#tmp434 := str(s1_c#C_D_ID);
      s1_#tmp435 := concat(s1_#tmp433, s1_#tmp434);
      s1_#tmp436 := concat(s1_#tmp435, L_$u0020);
      s1_#tmp437 := str(s1_c#C_W_ID);
      s1_#tmp438 := concat(s1_#tmp436, s1_#tmp437);
      s1_#tmp439 := concat(s1_#tmp438, L_$u0020);
      s1_#tmp440 := str(s1_d_id);
      s1_#tmp441 := concat(s1_#tmp439, s1_#tmp440);
      s1_#tmp442 := concat(s1_#tmp441, L_$u0020);
      s1_#tmp443 := str(s1_w_id);
      s1_#tmp444 := concat(s1_#tmp442, s1_#tmp443);
      s1_#tmp445 := concat(s1_#tmp444, L_$u0020);
      s1_#tmp446 := str(s1_amount);
      s1_#tmp447 := concat(s1_#tmp445, s1_#tmp446);
      s1_#tmp448 := concat(s1_#tmp447, L_$u0020$u007C$u0020);
      s1_#tmp449 := concat(s1_#tmp448, s1_c#C_DATA);
      s1_c#C_DATA := s1_#tmp449;
      goto s1_block147__ab;
    s1_block147__ab:
      Customer_C_BALANCE := Customer_C_BALANCE[s1_c_w_id := Customer_C_BALANCE[s1_c_w_id][s1_c_d_id := Customer_C_BALANCE[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_BALANCE]]];
      Customer_C_CITY := Customer_C_CITY[s1_c_w_id := Customer_C_CITY[s1_c_w_id][s1_c_d_id := Customer_C_CITY[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_CITY]]];
      Customer_C_CREDIT := Customer_C_CREDIT[s1_c_w_id := Customer_C_CREDIT[s1_c_w_id][s1_c_d_id := Customer_C_CREDIT[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_CREDIT]]];
      Customer_C_CREDIT_LIMIT := Customer_C_CREDIT_LIMIT[s1_c_w_id := Customer_C_CREDIT_LIMIT[s1_c_w_id][s1_c_d_id := Customer_C_CREDIT_LIMIT[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_CREDIT_LIMIT]]];
      Customer_C_DATA := Customer_C_DATA[s1_c_w_id := Customer_C_DATA[s1_c_w_id][s1_c_d_id := Customer_C_DATA[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_DATA]]];
      Customer_C_DELIVERY_CNT := Customer_C_DELIVERY_CNT[s1_c_w_id := Customer_C_DELIVERY_CNT[s1_c_w_id][s1_c_d_id := Customer_C_DELIVERY_CNT[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_DELIVERY_CNT]]];
      Customer_C_DISCOUNT := Customer_C_DISCOUNT[s1_c_w_id := Customer_C_DISCOUNT[s1_c_w_id][s1_c_d_id := Customer_C_DISCOUNT[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_DISCOUNT]]];
      Customer_C_D_ID := Customer_C_D_ID[s1_c_w_id := Customer_C_D_ID[s1_c_w_id][s1_c_d_id := Customer_C_D_ID[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_D_ID]]];
      Customer_C_FIRST := Customer_C_FIRST[s1_c_w_id := Customer_C_FIRST[s1_c_w_id][s1_c_d_id := Customer_C_FIRST[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_FIRST]]];
      Customer_C_ID := Customer_C_ID[s1_c_w_id := Customer_C_ID[s1_c_w_id][s1_c_d_id := Customer_C_ID[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_ID]]];
      Customer_C_LAST := Customer_C_LAST[s1_c_w_id := Customer_C_LAST[s1_c_w_id][s1_c_d_id := Customer_C_LAST[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_LAST]]];
      Customer_C_MIDDLE := Customer_C_MIDDLE[s1_c_w_id := Customer_C_MIDDLE[s1_c_w_id][s1_c_d_id := Customer_C_MIDDLE[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_MIDDLE]]];
      Customer_C_PAYMENT_CNT := Customer_C_PAYMENT_CNT[s1_c_w_id := Customer_C_PAYMENT_CNT[s1_c_w_id][s1_c_d_id := Customer_C_PAYMENT_CNT[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_PAYMENT_CNT]]];
      Customer_C_PHONE := Customer_C_PHONE[s1_c_w_id := Customer_C_PHONE[s1_c_w_id][s1_c_d_id := Customer_C_PHONE[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_PHONE]]];
      Customer_C_SINCE := Customer_C_SINCE[s1_c_w_id := Customer_C_SINCE[s1_c_w_id][s1_c_d_id := Customer_C_SINCE[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_SINCE]]];
      Customer_C_STATE := Customer_C_STATE[s1_c_w_id := Customer_C_STATE[s1_c_w_id][s1_c_d_id := Customer_C_STATE[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_STATE]]];
      Customer_C_STREET_1 := Customer_C_STREET_1[s1_c_w_id := Customer_C_STREET_1[s1_c_w_id][s1_c_d_id := Customer_C_STREET_1[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_STREET_1]]];
      Customer_C_STREET_2 := Customer_C_STREET_2[s1_c_w_id := Customer_C_STREET_2[s1_c_w_id][s1_c_d_id := Customer_C_STREET_2[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_STREET_2]]];
      Customer_C_W_ID := Customer_C_W_ID[s1_c_w_id := Customer_C_W_ID[s1_c_w_id][s1_c_d_id := Customer_C_W_ID[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_W_ID]]];
      Customer_C_YTD_PAYMENT := Customer_C_YTD_PAYMENT[s1_c_w_id := Customer_C_YTD_PAYMENT[s1_c_w_id][s1_c_d_id := Customer_C_YTD_PAYMENT[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_YTD_PAYMENT]]];
      Customer_C_ZIP := Customer_C_ZIP[s1_c_w_id := Customer_C_ZIP[s1_c_w_id][s1_c_d_id := Customer_C_ZIP[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_ZIP]]];
      s1_active := false;
      goto s1_hop_exit__ab;
    s1_hop_exit__ab:
    }
  // Snapshotting final state for a_then_b
    Customer_C_BALANCE_a_then_b := Customer_C_BALANCE;
    Customer_C_CITY_a_then_b := Customer_C_CITY;
    Customer_C_CREDIT_a_then_b := Customer_C_CREDIT;
    Customer_C_CREDIT_LIMIT_a_then_b := Customer_C_CREDIT_LIMIT;
    Customer_C_DATA_a_then_b := Customer_C_DATA;
    Customer_C_DELIVERY_CNT_a_then_b := Customer_C_DELIVERY_CNT;
    Customer_C_DISCOUNT_a_then_b := Customer_C_DISCOUNT;
    Customer_C_D_ID_a_then_b := Customer_C_D_ID;
    Customer_C_FIRST_a_then_b := Customer_C_FIRST;
    Customer_C_ID_a_then_b := Customer_C_ID;
    Customer_C_LAST_a_then_b := Customer_C_LAST;
    Customer_C_MIDDLE_a_then_b := Customer_C_MIDDLE;
    Customer_C_PAYMENT_CNT_a_then_b := Customer_C_PAYMENT_CNT;
    Customer_C_PHONE_a_then_b := Customer_C_PHONE;
    Customer_C_SINCE_a_then_b := Customer_C_SINCE;
    Customer_C_STATE_a_then_b := Customer_C_STATE;
    Customer_C_STREET_1_a_then_b := Customer_C_STREET_1;
    Customer_C_STREET_2_a_then_b := Customer_C_STREET_2;
    Customer_C_W_ID_a_then_b := Customer_C_W_ID;
    Customer_C_YTD_PAYMENT_a_then_b := Customer_C_YTD_PAYMENT;
    Customer_C_ZIP_a_then_b := Customer_C_ZIP;
  // Restoring initial state:
    Customer_C_BALANCE := Customer_C_BALANCE_init;
    Customer_C_CITY := Customer_C_CITY_init;
    Customer_C_CREDIT := Customer_C_CREDIT_init;
    Customer_C_CREDIT_LIMIT := Customer_C_CREDIT_LIMIT_init;
    Customer_C_DATA := Customer_C_DATA_init;
    Customer_C_DELIVERY_CNT := Customer_C_DELIVERY_CNT_init;
    Customer_C_DISCOUNT := Customer_C_DISCOUNT_init;
    Customer_C_D_ID := Customer_C_D_ID_init;
    Customer_C_FIRST := Customer_C_FIRST_init;
    Customer_C_ID := Customer_C_ID_init;
    Customer_C_LAST := Customer_C_LAST_init;
    Customer_C_MIDDLE := Customer_C_MIDDLE_init;
    Customer_C_PAYMENT_CNT := Customer_C_PAYMENT_CNT_init;
    Customer_C_PHONE := Customer_C_PHONE_init;
    Customer_C_SINCE := Customer_C_SINCE_init;
    Customer_C_STATE := Customer_C_STATE_init;
    Customer_C_STREET_1 := Customer_C_STREET_1_init;
    Customer_C_STREET_2 := Customer_C_STREET_2_init;
    Customer_C_W_ID := Customer_C_W_ID_init;
    Customer_C_YTD_PAYMENT := Customer_C_YTD_PAYMENT_init;
    Customer_C_ZIP := Customer_C_ZIP_init;
    Order_Line_OL_AMOUNT := Order_Line_OL_AMOUNT_init;
    Order_Line_OL_DELIVERY_DATE := Order_Line_OL_DELIVERY_DATE_init;
    Order_Line_OL_DIST_INTO := Order_Line_OL_DIST_INTO_init;
    Order_Line_OL_I_ID := Order_Line_OL_I_ID_init;
    Order_Line_OL_QUANTITY := Order_Line_OL_QUANTITY_init;
    Order_Line_OL_SUPPLY_W_ID := Order_Line_OL_SUPPLY_W_ID_init;
    Order_O_ALL_LOCAL := Order_O_ALL_LOCAL_init;
    Order_O_CARRIER_ID := Order_O_CARRIER_ID_init;
    Order_O_C_ID := Order_O_C_ID_init;
    Order_O_ENTRY_DATE := Order_O_ENTRY_DATE_init;
    Order_O_OL_CNT := Order_O_OL_CNT_init;
    s0_w_id := s0_w_id_init;
    s0_d_id := s0_d_id_init;
    s0_c_id := s0_c_id_init;
    s0_o_id := s0_o_id_init;
    s1_w_id := s1_w_id_init;
    s1_d_id := s1_d_id_init;
    s1_c_w_id := s1_c_w_id_init;
    s1_c_d_id := s1_c_d_id_init;
    s1_c_id := s1_c_id_init;
    s1_amount := s1_amount_init;
    s0_active := true;
    s1_active := true;
  // Executing B then A:
    if (s1_active) {
    s1_block145__ba:
      s1_c#C_BALANCE := Customer_C_BALANCE[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_CITY := Customer_C_CITY[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_CREDIT := Customer_C_CREDIT[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_CREDIT_LIMIT := Customer_C_CREDIT_LIMIT[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_DATA := Customer_C_DATA[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_DELIVERY_CNT := Customer_C_DELIVERY_CNT[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_DISCOUNT := Customer_C_DISCOUNT[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_D_ID := Customer_C_D_ID[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_FIRST := Customer_C_FIRST[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_ID := Customer_C_ID[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_LAST := Customer_C_LAST[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_MIDDLE := Customer_C_MIDDLE[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_PAYMENT_CNT := Customer_C_PAYMENT_CNT[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_PHONE := Customer_C_PHONE[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_SINCE := Customer_C_SINCE[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_STATE := Customer_C_STATE[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_STREET_1 := Customer_C_STREET_1[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_STREET_2 := Customer_C_STREET_2[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_W_ID := Customer_C_W_ID[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_YTD_PAYMENT := Customer_C_YTD_PAYMENT[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_c#C_ZIP := Customer_C_ZIP[s1_c_w_id][s1_c_d_id][s1_c_id];
      s1_#tmp428 := s1_c#C_BALANCE - s1_amount;
      s1_c#C_BALANCE := s1_#tmp428;
      s1_#tmp429 := s1_c#C_YTD_PAYMENT + s1_amount;
      s1_c#C_YTD_PAYMENT := s1_#tmp429;
      s1_#tmp430 := s1_c#C_PAYMENT_CNT + 1.0000000;
      s1_c#C_PAYMENT_CNT := s1_#tmp430;
      s1_#tmp431 := s1_c#C_CREDIT == L_BC;
      if (s1_#tmp431) {
      goto s1_block146__ba;
    } else {
      goto s1_block147__ba;
    }
    s1_block146__ba:
      s1_#tmp432 := str(s1_c#C_ID);
      s1_#tmp433 := concat(s1_#tmp432, L_$u0020);
      s1_#tmp434 := str(s1_c#C_D_ID);
      s1_#tmp435 := concat(s1_#tmp433, s1_#tmp434);
      s1_#tmp436 := concat(s1_#tmp435, L_$u0020);
      s1_#tmp437 := str(s1_c#C_W_ID);
      s1_#tmp438 := concat(s1_#tmp436, s1_#tmp437);
      s1_#tmp439 := concat(s1_#tmp438, L_$u0020);
      s1_#tmp440 := str(s1_d_id);
      s1_#tmp441 := concat(s1_#tmp439, s1_#tmp440);
      s1_#tmp442 := concat(s1_#tmp441, L_$u0020);
      s1_#tmp443 := str(s1_w_id);
      s1_#tmp444 := concat(s1_#tmp442, s1_#tmp443);
      s1_#tmp445 := concat(s1_#tmp444, L_$u0020);
      s1_#tmp446 := str(s1_amount);
      s1_#tmp447 := concat(s1_#tmp445, s1_#tmp446);
      s1_#tmp448 := concat(s1_#tmp447, L_$u0020$u007C$u0020);
      s1_#tmp449 := concat(s1_#tmp448, s1_c#C_DATA);
      s1_c#C_DATA := s1_#tmp449;
      goto s1_block147__ba;
    s1_block147__ba:
      Customer_C_BALANCE := Customer_C_BALANCE[s1_c_w_id := Customer_C_BALANCE[s1_c_w_id][s1_c_d_id := Customer_C_BALANCE[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_BALANCE]]];
      Customer_C_CITY := Customer_C_CITY[s1_c_w_id := Customer_C_CITY[s1_c_w_id][s1_c_d_id := Customer_C_CITY[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_CITY]]];
      Customer_C_CREDIT := Customer_C_CREDIT[s1_c_w_id := Customer_C_CREDIT[s1_c_w_id][s1_c_d_id := Customer_C_CREDIT[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_CREDIT]]];
      Customer_C_CREDIT_LIMIT := Customer_C_CREDIT_LIMIT[s1_c_w_id := Customer_C_CREDIT_LIMIT[s1_c_w_id][s1_c_d_id := Customer_C_CREDIT_LIMIT[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_CREDIT_LIMIT]]];
      Customer_C_DATA := Customer_C_DATA[s1_c_w_id := Customer_C_DATA[s1_c_w_id][s1_c_d_id := Customer_C_DATA[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_DATA]]];
      Customer_C_DELIVERY_CNT := Customer_C_DELIVERY_CNT[s1_c_w_id := Customer_C_DELIVERY_CNT[s1_c_w_id][s1_c_d_id := Customer_C_DELIVERY_CNT[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_DELIVERY_CNT]]];
      Customer_C_DISCOUNT := Customer_C_DISCOUNT[s1_c_w_id := Customer_C_DISCOUNT[s1_c_w_id][s1_c_d_id := Customer_C_DISCOUNT[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_DISCOUNT]]];
      Customer_C_D_ID := Customer_C_D_ID[s1_c_w_id := Customer_C_D_ID[s1_c_w_id][s1_c_d_id := Customer_C_D_ID[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_D_ID]]];
      Customer_C_FIRST := Customer_C_FIRST[s1_c_w_id := Customer_C_FIRST[s1_c_w_id][s1_c_d_id := Customer_C_FIRST[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_FIRST]]];
      Customer_C_ID := Customer_C_ID[s1_c_w_id := Customer_C_ID[s1_c_w_id][s1_c_d_id := Customer_C_ID[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_ID]]];
      Customer_C_LAST := Customer_C_LAST[s1_c_w_id := Customer_C_LAST[s1_c_w_id][s1_c_d_id := Customer_C_LAST[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_LAST]]];
      Customer_C_MIDDLE := Customer_C_MIDDLE[s1_c_w_id := Customer_C_MIDDLE[s1_c_w_id][s1_c_d_id := Customer_C_MIDDLE[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_MIDDLE]]];
      Customer_C_PAYMENT_CNT := Customer_C_PAYMENT_CNT[s1_c_w_id := Customer_C_PAYMENT_CNT[s1_c_w_id][s1_c_d_id := Customer_C_PAYMENT_CNT[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_PAYMENT_CNT]]];
      Customer_C_PHONE := Customer_C_PHONE[s1_c_w_id := Customer_C_PHONE[s1_c_w_id][s1_c_d_id := Customer_C_PHONE[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_PHONE]]];
      Customer_C_SINCE := Customer_C_SINCE[s1_c_w_id := Customer_C_SINCE[s1_c_w_id][s1_c_d_id := Customer_C_SINCE[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_SINCE]]];
      Customer_C_STATE := Customer_C_STATE[s1_c_w_id := Customer_C_STATE[s1_c_w_id][s1_c_d_id := Customer_C_STATE[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_STATE]]];
      Customer_C_STREET_1 := Customer_C_STREET_1[s1_c_w_id := Customer_C_STREET_1[s1_c_w_id][s1_c_d_id := Customer_C_STREET_1[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_STREET_1]]];
      Customer_C_STREET_2 := Customer_C_STREET_2[s1_c_w_id := Customer_C_STREET_2[s1_c_w_id][s1_c_d_id := Customer_C_STREET_2[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_STREET_2]]];
      Customer_C_W_ID := Customer_C_W_ID[s1_c_w_id := Customer_C_W_ID[s1_c_w_id][s1_c_d_id := Customer_C_W_ID[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_W_ID]]];
      Customer_C_YTD_PAYMENT := Customer_C_YTD_PAYMENT[s1_c_w_id := Customer_C_YTD_PAYMENT[s1_c_w_id][s1_c_d_id := Customer_C_YTD_PAYMENT[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_YTD_PAYMENT]]];
      Customer_C_ZIP := Customer_C_ZIP[s1_c_w_id := Customer_C_ZIP[s1_c_w_id][s1_c_d_id := Customer_C_ZIP[s1_c_w_id][s1_c_d_id][s1_c_id := s1_c#C_ZIP]]];
      s1_active := false;
      goto s1_hop_exit__ba;
    s1_hop_exit__ba:
    }
    if (s0_active) {
    s0_block132__ba:
      s0_#tmp407 := construct_Row_Customer(Customer_C_W_ID[s0_w_id][s0_d_id][s0_c_id], Customer_C_D_ID[s0_w_id][s0_d_id][s0_c_id], Customer_C_ID[s0_w_id][s0_d_id][s0_c_id], Customer_C_FIRST[s0_w_id][s0_d_id][s0_c_id], Customer_C_MIDDLE[s0_w_id][s0_d_id][s0_c_id], Customer_C_LAST[s0_w_id][s0_d_id][s0_c_id], Customer_C_STREET_1[s0_w_id][s0_d_id][s0_c_id], Customer_C_STREET_2[s0_w_id][s0_d_id][s0_c_id], Customer_C_CITY[s0_w_id][s0_d_id][s0_c_id], Customer_C_STATE[s0_w_id][s0_d_id][s0_c_id], Customer_C_ZIP[s0_w_id][s0_d_id][s0_c_id], Customer_C_PHONE[s0_w_id][s0_d_id][s0_c_id], Customer_C_SINCE[s0_w_id][s0_d_id][s0_c_id], Customer_C_CREDIT[s0_w_id][s0_d_id][s0_c_id], Customer_C_CREDIT_LIMIT[s0_w_id][s0_d_id][s0_c_id], Customer_C_DISCOUNT[s0_w_id][s0_d_id][s0_c_id], Customer_C_BALANCE[s0_w_id][s0_d_id][s0_c_id], Customer_C_YTD_PAYMENT[s0_w_id][s0_d_id][s0_c_id], Customer_C_PAYMENT_CNT[s0_w_id][s0_d_id][s0_c_id], Customer_C_DELIVERY_CNT[s0_w_id][s0_d_id][s0_c_id], Customer_C_DATA[s0_w_id][s0_d_id][s0_c_id]);
      s0_c := s0_#tmp407;
      s0_#tmp408 := to_unit(s0_c);
      s0_#tmp409 := construct_Row_Order(Order_O_W_ID[s0_w_id][s0_d_id][s0_o_id], Order_O_D_ID[s0_w_id][s0_d_id][s0_o_id], Order_O_ID[s0_w_id][s0_d_id][s0_o_id], Order_O_C_ID[s0_w_id][s0_d_id][s0_o_id], Order_O_ENTRY_DATE[s0_w_id][s0_d_id][s0_o_id], Order_O_CARRIER_ID[s0_w_id][s0_d_id][s0_o_id], Order_O_OL_CNT[s0_w_id][s0_d_id][s0_o_id], Order_O_ALL_LOCAL[s0_w_id][s0_d_id][s0_o_id]);
      s0_o := s0_#tmp409;
      s0_#tmp410 := to_unit(s0_o);
      goto s0_block134__ba;
    s0_block133__ba:
      s0_#tmp411 := s0_ol_number < O_OL_CNT;
      if (s0_#tmp411) {
      goto s0_block134__ba;
    } else {
      goto s0_block136__ba;
    }
    s0_block134__ba:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][0], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][0]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block247__ba;
    s0_block136__ba:
      s0_active := false;
      goto s0_hop_exit__ba;
    s0_block247__ba:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][1], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][1]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block248__ba;
    s0_block248__ba:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][2], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][2]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block249__ba;
    s0_block249__ba:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][3], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][3]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block250__ba;
    s0_block250__ba:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][4], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][4]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block251__ba;
    s0_block251__ba:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][5], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][5]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block252__ba;
    s0_block252__ba:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][6], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][6]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block253__ba;
    s0_block253__ba:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][7], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][7]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block254__ba;
    s0_block254__ba:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][8], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][8]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block255__ba;
    s0_block255__ba:
      s0_#tmp412 := construct_Row_Order_Line(Order_Line_OL_W_ID[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_D_ID[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_O_ID[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_NUMBER[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_I_ID[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_SUPPLY_W_ID[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_DELIVERY_DATE[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_QUANTITY[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_AMOUNT[s0_w_id][s0_d_id][s0_o_id][9], Order_Line_OL_DIST_INTO[s0_w_id][s0_d_id][s0_o_id][9]);
      s0_ol := s0_#tmp412;
      s0_#tmp413 := to_unit(s0_ol);
      goto s0_block136__ba;
    s0_hop_exit__ba:
    }
  // Snapshotting final state for b_then_a
    Customer_C_BALANCE_b_then_a := Customer_C_BALANCE;
    Customer_C_CITY_b_then_a := Customer_C_CITY;
    Customer_C_CREDIT_b_then_a := Customer_C_CREDIT;
    Customer_C_CREDIT_LIMIT_b_then_a := Customer_C_CREDIT_LIMIT;
    Customer_C_DATA_b_then_a := Customer_C_DATA;
    Customer_C_DELIVERY_CNT_b_then_a := Customer_C_DELIVERY_CNT;
    Customer_C_DISCOUNT_b_then_a := Customer_C_DISCOUNT;
    Customer_C_D_ID_b_then_a := Customer_C_D_ID;
    Customer_C_FIRST_b_then_a := Customer_C_FIRST;
    Customer_C_ID_b_then_a := Customer_C_ID;
    Customer_C_LAST_b_then_a := Customer_C_LAST;
    Customer_C_MIDDLE_b_then_a := Customer_C_MIDDLE;
    Customer_C_PAYMENT_CNT_b_then_a := Customer_C_PAYMENT_CNT;
    Customer_C_PHONE_b_then_a := Customer_C_PHONE;
    Customer_C_SINCE_b_then_a := Customer_C_SINCE;
    Customer_C_STATE_b_then_a := Customer_C_STATE;
    Customer_C_STREET_1_b_then_a := Customer_C_STREET_1;
    Customer_C_STREET_2_b_then_a := Customer_C_STREET_2;
    Customer_C_W_ID_b_then_a := Customer_C_W_ID;
    Customer_C_YTD_PAYMENT_b_then_a := Customer_C_YTD_PAYMENT;
    Customer_C_ZIP_b_then_a := Customer_C_ZIP;
  // --- Step 4: Verify A→B ≡ B→A (Special interleavings equivalence) ---
  // Verifying A->B === B->A equivalence:
    assert {:msg "(SpecialInterleavingNonEquivalence (node_1 (function_id . 33) (instance . 0) (hop_id . 38)) (node_2 (function_id . 35) (instance . 0) (hop_id . 43)))"} (((((((((((((((((((((Customer_C_BALANCE_a_then_b == Customer_C_BALANCE_b_then_a) && (Customer_C_CITY_a_then_b == Customer_C_CITY_b_then_a)) && (Customer_C_CREDIT_a_then_b == Customer_C_CREDIT_b_then_a)) && (Customer_C_CREDIT_LIMIT_a_then_b == Customer_C_CREDIT_LIMIT_b_then_a)) && (Customer_C_DATA_a_then_b == Customer_C_DATA_b_then_a)) && (Customer_C_DELIVERY_CNT_a_then_b == Customer_C_DELIVERY_CNT_b_then_a)) && (Customer_C_DISCOUNT_a_then_b == Customer_C_DISCOUNT_b_then_a)) && (Customer_C_D_ID_a_then_b == Customer_C_D_ID_b_then_a)) && (Customer_C_FIRST_a_then_b == Customer_C_FIRST_b_then_a)) && (Customer_C_ID_a_then_b == Customer_C_ID_b_then_a)) && (Customer_C_LAST_a_then_b == Customer_C_LAST_b_then_a)) && (Customer_C_MIDDLE_a_then_b == Customer_C_MIDDLE_b_then_a)) && (Customer_C_PAYMENT_CNT_a_then_b == Customer_C_PAYMENT_CNT_b_then_a)) && (Customer_C_PHONE_a_then_b == Customer_C_PHONE_b_then_a)) && (Customer_C_SINCE_a_then_b == Customer_C_SINCE_b_then_a)) && (Customer_C_STATE_a_then_b == Customer_C_STATE_b_then_a)) && (Customer_C_STREET_1_a_then_b == Customer_C_STREET_1_b_then_a)) && (Customer_C_STREET_2_a_then_b == Customer_C_STREET_2_b_then_a)) && (Customer_C_W_ID_a_then_b == Customer_C_W_ID_b_then_a)) && (Customer_C_YTD_PAYMENT_a_then_b == Customer_C_YTD_PAYMENT_b_then_a)) && (Customer_C_ZIP_a_then_b == Customer_C_ZIP_b_then_a));
}

