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
var Item_I_PRICE : [int][int]real;
var Order_Line_OL_D_ID : [int][int][int][int]int;
var Order_Line_OL_AMOUNT : [int][int][int][int]int;
var Order_O_ALL_LOCAL : [int][int][int]int;
const TBL_Stock : Table (Stock);
var Order_Line_OL_SUPPLY_W_ID : [int][int][int][int]int;
var District_D_CITY : [int][int]String;
var Stock_S_DATA : [int][int]String;
var Customer_C_PHONE : [int][int][int]String;
var Customer_C_ZIP : [int][int][int]String;
const TBL_Order_Line : Table (Order_Line);
var Order_Line_OL_DIST_INTO : [int][int][int][int]String;
var Customer_C_MIDDLE : [int][int][int]String;
var Order_O_CARRIER_ID : [int][int][int]int;
const TBL_Item : Table (Item);
var Item_I_NAME : [int][int]String;
var Customer_C_DISCOUNT : [int][int][int]real;
const TBL_New_Order : Table (New_Order);
var New_Order_NO_O_ID : [int][int][int]int;
var Stock_S_ORDER_CNT : [int][int]int;
var Order_O_ENTRY_DATE : [int][int][int]int;
var Customer_C_YTD_PAYMENT : [int][int][int]real;
var Order_O_ID : [int][int][int]int;
var District_D_YTD : [int][int]real;
var Customer_C_DATA : [int][int][int]String;
var Item_I_ID : [int][int]int;
var Item_I_DATA : [int][int]String;
var Customer_C_CREDIT : [int][int][int]String;
var Warehouse_W_STREET_1 : [int]String;
var Stock_S_W_ID : [int][int]int;
var Order_O_C_ID : [int][int][int]int;
var Order_Line_OL_QUANTITY : [int][int][int][int]int;
var Warehouse_W_ID : [int]int;
const __slice__ : int;
var District_D_ZIP : [int][int]String;
var Customer_C_FIRST : [int][int][int]String;
const O_OL_CNT : int;
const TBL_District : Table (District);
var District_D_W_ID : [int][int]int;
var Order_Line_OL_NUMBER : [int][int][int][int]int;
var Customer_C_STREET_2 : [int][int][int]String;
var Customer_C_DELIVERY_CNT : [int][int][int]real;
var Warehouse_W_NAME : [int]String;
var District_D_NEXT_NO_ID : [int][int]int;
var Customer_C_ID : [int][int][int]int;
var Customer_C_SINCE : [int][int][int]int;
var District_D_STREET_2 : [int][int]String;
var District_D_STATE : [int][int]String;
var Warehouse_W_CITY : [int]String;
const TBL_Order : Table (Order);
var New_Order_NO_D_ID : [int][int][int]int;
var Order_Line_OL_I_ID : [int][int][int][int]int;
var District_D_NEXT_O_ID : [int][int]int;
var District_D_STREET_1 : [int][int]String;
var Warehouse_W_ZIP : [int]String;
var Customer_C_STREET_1 : [int][int][int]String;
var Order_O_W_ID : [int][int][int]int;
var Order_O_D_ID : [int][int][int]int;
var Order_Line_OL_DELIVERY_DATE : [int][int][int][int]int;
var Customer_C_CITY : [int][int][int]String;
var Stock_S_I_ID : [int][int]int;
var District_D_NAME : [int][int]String;
var Customer_C_CREDIT_LIMIT : [int][int][int]real;
var Order_O_OL_CNT : [int][int][int]int;
const TBL_Warehouse : Table (Warehouse);
var District_D_ID : [int][int]int;
var District_D_TAX : [int][int]real;
const __shards__ : int;
var Warehouse_W_STREET_2 : [int]String;
var Order_Line_OL_W_ID : [int][int][int][int]int;
var Warehouse_W_STATE : [int]String;
var Customer_C_PAYMENT_CNT : [int][int][int]real;
var Warehouse_W_YTD : [int]real;
var Warehouse_W_TAX : [int]real;
var Stock_S_REMOTE_CNT : [int][int]int;
var New_Order_NO_W_ID : [int][int][int]int;
var Customer_C_D_ID : [int][int][int]int;
var Customer_C_W_ID : [int][int][int]int;
var Customer_C_STATE : [int][int][int]String;
var Item_W_ID : [int][int]int;
var Customer_C_BALANCE : [int][int][int]real;
const TBL_Customer : Table (Customer);
var Item_I_IM_ID : [int][int]int;
var Stock_S_QUANTITY : [int][int]int;
var Stock_S_YTD : [int][int]real;
var Customer_C_LAST : [int][int][int]String;
var Order_Line_OL_O_ID : [int][int][int][int]int;
procedure verify_hop_partitions_newOrder(w_id: int, d_id: int, c_id: int, o_all_local: int, date: int, itemIDs: List (int), supplierWarehouseIDs: List (int), orderQuantities: List (int))
modifies District_D_NEXT_O_ID, Order_Line_OL_AMOUNT, Order_Line_OL_I_ID, Order_Line_OL_QUANTITY, Order_Line_OL_SUPPLY_W_ID, Order_O_ALL_LOCAL, Order_O_C_ID, Order_O_ENTRY_DATE, Order_O_OL_CNT, Stock_S_DATA, Stock_S_I_ID, Stock_S_ORDER_CNT, Stock_S_QUANTITY, Stock_S_REMOTE_CNT, Stock_S_W_ID, Stock_S_YTD;
{
  var s16_#tmp62 : real;
  var s16_w_id : int;
  var s16_w_tax : real;
  var __dummy_witness_16 : real;
  var s16_#tmp63 : List (real);
  var s16_prices : List (real);
  var s17_itemIDs : List (int);
  var s17_#tmp64 : int;
  var s17_i_id : int;
  var s17_supplierWarehouseIDs : List (int);
  var s17_#tmp65 : int;
  var s17_sup_w_id : int;
  var s17_orderQuantities : List (int);
  var s17_#tmp66 : int;
  var s17_qty : int;
  var s17_#tmp67 : bool;
  var s17_#tmp68 : bool;
  var s17_#tmp69 : bool;
  var s17_s#S_DATA : String;
  var s17_s#S_I_ID : int;
  var s17_s#S_ORDER_CNT : int;
  var s17_s#S_QUANTITY : int;
  var s17_s#S_REMOTE_CNT : int;
  var s17_s#S_W_ID : int;
  var s17_s#S_YTD : real;
  var s17_#tmp71 : real;
  var s17_price : real;
  var s17_prices : List (real);
  var s17_#tmp72 : List (real);
  var s17_#tmp73 : int;
  var s17_#tmp74 : bool;
  var s17_#tmp75 : int;
  var s17_#tmp78 : bool;
  var s17_w_id : int;
  var s17_#tmp76 : int;
  var s17_#tmp77 : int;
  var s17_#tmp79 : int;
  var s17_#tmp80 : int;
  var s17_#tmp81 : real;
  var s17_#tmp82 : real;
  var s18_itemIDs : List (int);
  var s18_#tmp83 : int;
  var s18_i_id : int;
  var s18_supplierWarehouseIDs : List (int);
  var s18_#tmp84 : int;
  var s18_sup_w_id : int;
  var s18_orderQuantities : List (int);
  var s18_#tmp85 : int;
  var s18_qty : int;
  var s18_#tmp86 : bool;
  var s18_#tmp87 : bool;
  var s18_#tmp88 : bool;
  var s18_s#S_DATA : String;
  var s18_s#S_I_ID : int;
  var s18_s#S_ORDER_CNT : int;
  var s18_s#S_QUANTITY : int;
  var s18_s#S_REMOTE_CNT : int;
  var s18_s#S_W_ID : int;
  var s18_s#S_YTD : real;
  var s18_#tmp90 : real;
  var s18_price : real;
  var s18_prices : List (real);
  var s18_#tmp91 : List (real);
  var s18_#tmp92 : int;
  var s18_#tmp93 : bool;
  var s18_#tmp94 : int;
  var s18_#tmp97 : bool;
  var s18_w_id : int;
  var s18_#tmp95 : int;
  var s18_#tmp96 : int;
  var s18_#tmp98 : int;
  var s18_#tmp99 : int;
  var s18_#tmp100 : real;
  var s18_#tmp101 : real;
  var s19_itemIDs : List (int);
  var s19_#tmp102 : int;
  var s19_i_id : int;
  var s19_supplierWarehouseIDs : List (int);
  var s19_#tmp103 : int;
  var s19_sup_w_id : int;
  var s19_orderQuantities : List (int);
  var s19_#tmp104 : int;
  var s19_qty : int;
  var s19_#tmp105 : bool;
  var s19_#tmp106 : bool;
  var s19_#tmp107 : bool;
  var s19_s#S_DATA : String;
  var s19_s#S_I_ID : int;
  var s19_s#S_ORDER_CNT : int;
  var s19_s#S_QUANTITY : int;
  var s19_s#S_REMOTE_CNT : int;
  var s19_s#S_W_ID : int;
  var s19_s#S_YTD : real;
  var s19_#tmp109 : real;
  var s19_price : real;
  var s19_prices : List (real);
  var s19_#tmp110 : List (real);
  var s19_#tmp111 : int;
  var s19_#tmp112 : bool;
  var s19_#tmp113 : int;
  var s19_#tmp116 : bool;
  var s19_w_id : int;
  var s19_#tmp114 : int;
  var s19_#tmp115 : int;
  var s19_#tmp117 : int;
  var s19_#tmp118 : int;
  var s19_#tmp119 : real;
  var s19_#tmp120 : real;
  var s20_itemIDs : List (int);
  var s20_#tmp121 : int;
  var s20_i_id : int;
  var s20_supplierWarehouseIDs : List (int);
  var s20_#tmp122 : int;
  var s20_sup_w_id : int;
  var s20_orderQuantities : List (int);
  var s20_#tmp123 : int;
  var s20_qty : int;
  var s20_#tmp124 : bool;
  var s20_#tmp125 : bool;
  var s20_#tmp126 : bool;
  var s20_s#S_DATA : String;
  var s20_s#S_I_ID : int;
  var s20_s#S_ORDER_CNT : int;
  var s20_s#S_QUANTITY : int;
  var s20_s#S_REMOTE_CNT : int;
  var s20_s#S_W_ID : int;
  var s20_s#S_YTD : real;
  var s20_#tmp128 : real;
  var s20_price : real;
  var s20_prices : List (real);
  var s20_#tmp129 : List (real);
  var s20_#tmp130 : int;
  var s20_#tmp131 : bool;
  var s20_#tmp132 : int;
  var s20_#tmp135 : bool;
  var s20_w_id : int;
  var s20_#tmp133 : int;
  var s20_#tmp134 : int;
  var s20_#tmp136 : int;
  var s20_#tmp137 : int;
  var s20_#tmp138 : real;
  var s20_#tmp139 : real;
  var s21_itemIDs : List (int);
  var s21_#tmp140 : int;
  var s21_i_id : int;
  var s21_supplierWarehouseIDs : List (int);
  var s21_#tmp141 : int;
  var s21_sup_w_id : int;
  var s21_orderQuantities : List (int);
  var s21_#tmp142 : int;
  var s21_qty : int;
  var s21_#tmp143 : bool;
  var s21_#tmp144 : bool;
  var s21_#tmp145 : bool;
  var s21_s#S_DATA : String;
  var s21_s#S_I_ID : int;
  var s21_s#S_ORDER_CNT : int;
  var s21_s#S_QUANTITY : int;
  var s21_s#S_REMOTE_CNT : int;
  var s21_s#S_W_ID : int;
  var s21_s#S_YTD : real;
  var s21_#tmp147 : real;
  var s21_price : real;
  var s21_prices : List (real);
  var s21_#tmp148 : List (real);
  var s21_#tmp149 : int;
  var s21_#tmp150 : bool;
  var s21_#tmp151 : int;
  var s21_#tmp154 : bool;
  var s21_w_id : int;
  var s21_#tmp152 : int;
  var s21_#tmp153 : int;
  var s21_#tmp155 : int;
  var s21_#tmp156 : int;
  var s21_#tmp157 : real;
  var s21_#tmp158 : real;
  var s22_itemIDs : List (int);
  var s22_#tmp159 : int;
  var s22_i_id : int;
  var s22_supplierWarehouseIDs : List (int);
  var s22_#tmp160 : int;
  var s22_sup_w_id : int;
  var s22_orderQuantities : List (int);
  var s22_#tmp161 : int;
  var s22_qty : int;
  var s22_#tmp162 : bool;
  var s22_#tmp163 : bool;
  var s22_#tmp164 : bool;
  var s22_s#S_DATA : String;
  var s22_s#S_I_ID : int;
  var s22_s#S_ORDER_CNT : int;
  var s22_s#S_QUANTITY : int;
  var s22_s#S_REMOTE_CNT : int;
  var s22_s#S_W_ID : int;
  var s22_s#S_YTD : real;
  var s22_#tmp166 : real;
  var s22_price : real;
  var s22_prices : List (real);
  var s22_#tmp167 : List (real);
  var s22_#tmp168 : int;
  var s22_#tmp169 : bool;
  var s22_#tmp170 : int;
  var s22_#tmp173 : bool;
  var s22_w_id : int;
  var s22_#tmp171 : int;
  var s22_#tmp172 : int;
  var s22_#tmp174 : int;
  var s22_#tmp175 : int;
  var s22_#tmp176 : real;
  var s22_#tmp177 : real;
  var s23_itemIDs : List (int);
  var s23_#tmp178 : int;
  var s23_i_id : int;
  var s23_supplierWarehouseIDs : List (int);
  var s23_#tmp179 : int;
  var s23_sup_w_id : int;
  var s23_orderQuantities : List (int);
  var s23_#tmp180 : int;
  var s23_qty : int;
  var s23_#tmp181 : bool;
  var s23_#tmp182 : bool;
  var s23_#tmp183 : bool;
  var s23_s#S_DATA : String;
  var s23_s#S_I_ID : int;
  var s23_s#S_ORDER_CNT : int;
  var s23_s#S_QUANTITY : int;
  var s23_s#S_REMOTE_CNT : int;
  var s23_s#S_W_ID : int;
  var s23_s#S_YTD : real;
  var s23_#tmp185 : real;
  var s23_price : real;
  var s23_prices : List (real);
  var s23_#tmp186 : List (real);
  var s23_#tmp187 : int;
  var s23_#tmp188 : bool;
  var s23_#tmp189 : int;
  var s23_#tmp192 : bool;
  var s23_w_id : int;
  var s23_#tmp190 : int;
  var s23_#tmp191 : int;
  var s23_#tmp193 : int;
  var s23_#tmp194 : int;
  var s23_#tmp195 : real;
  var s23_#tmp196 : real;
  var s24_itemIDs : List (int);
  var s24_#tmp197 : int;
  var s24_i_id : int;
  var s24_supplierWarehouseIDs : List (int);
  var s24_#tmp198 : int;
  var s24_sup_w_id : int;
  var s24_orderQuantities : List (int);
  var s24_#tmp199 : int;
  var s24_qty : int;
  var s24_#tmp200 : bool;
  var s24_#tmp201 : bool;
  var s24_#tmp202 : bool;
  var s24_s#S_DATA : String;
  var s24_s#S_I_ID : int;
  var s24_s#S_ORDER_CNT : int;
  var s24_s#S_QUANTITY : int;
  var s24_s#S_REMOTE_CNT : int;
  var s24_s#S_W_ID : int;
  var s24_s#S_YTD : real;
  var s24_#tmp204 : real;
  var s24_price : real;
  var s24_prices : List (real);
  var s24_#tmp205 : List (real);
  var s24_#tmp206 : int;
  var s24_#tmp207 : bool;
  var s24_#tmp208 : int;
  var s24_#tmp211 : bool;
  var s24_w_id : int;
  var s24_#tmp209 : int;
  var s24_#tmp210 : int;
  var s24_#tmp212 : int;
  var s24_#tmp213 : int;
  var s24_#tmp214 : real;
  var s24_#tmp215 : real;
  var s25_itemIDs : List (int);
  var s25_#tmp216 : int;
  var s25_i_id : int;
  var s25_supplierWarehouseIDs : List (int);
  var s25_#tmp217 : int;
  var s25_sup_w_id : int;
  var s25_orderQuantities : List (int);
  var s25_#tmp218 : int;
  var s25_qty : int;
  var s25_#tmp219 : bool;
  var s25_#tmp220 : bool;
  var s25_#tmp221 : bool;
  var s25_s#S_DATA : String;
  var s25_s#S_I_ID : int;
  var s25_s#S_ORDER_CNT : int;
  var s25_s#S_QUANTITY : int;
  var s25_s#S_REMOTE_CNT : int;
  var s25_s#S_W_ID : int;
  var s25_s#S_YTD : real;
  var s25_#tmp223 : real;
  var s25_price : real;
  var s25_prices : List (real);
  var s25_#tmp224 : List (real);
  var s25_#tmp225 : int;
  var s25_#tmp226 : bool;
  var s25_#tmp227 : int;
  var s25_#tmp230 : bool;
  var s25_w_id : int;
  var s25_#tmp228 : int;
  var s25_#tmp229 : int;
  var s25_#tmp231 : int;
  var s25_#tmp232 : int;
  var s25_#tmp233 : real;
  var s25_#tmp234 : real;
  var s26_itemIDs : List (int);
  var s26_#tmp235 : int;
  var s26_i_id : int;
  var s26_supplierWarehouseIDs : List (int);
  var s26_#tmp236 : int;
  var s26_sup_w_id : int;
  var s26_orderQuantities : List (int);
  var s26_#tmp237 : int;
  var s26_qty : int;
  var s26_#tmp238 : bool;
  var s26_#tmp239 : bool;
  var s26_#tmp240 : bool;
  var s26_s#S_DATA : String;
  var s26_s#S_I_ID : int;
  var s26_s#S_ORDER_CNT : int;
  var s26_s#S_QUANTITY : int;
  var s26_s#S_REMOTE_CNT : int;
  var s26_s#S_W_ID : int;
  var s26_s#S_YTD : real;
  var s26_#tmp242 : real;
  var s26_price : real;
  var s26_prices : List (real);
  var s26_#tmp243 : List (real);
  var s26_#tmp244 : int;
  var s26_#tmp245 : bool;
  var s26_#tmp246 : int;
  var s26_#tmp249 : bool;
  var s26_w_id : int;
  var s26_#tmp247 : int;
  var s26_#tmp248 : int;
  var s26_#tmp250 : int;
  var s26_#tmp251 : int;
  var s26_#tmp252 : real;
  var s26_#tmp253 : real;
  var s27_#tmp254 : int;
  var s27_w_id : int;
  var s27_d_id : int;
  var s27_d_next_oid : int;
  var s27_#tmp256 : int;
  var s27_c_id : int;
  var s27_date : int;
  var s27_o_all_local : int;
  var s27_#tmp257 : bool;
  var s27_ol_number : int;
  var s27_itemIDs : List (int);
  var s27_#tmp258 : int;
  var s27_i_id : int;
  var s27_supplierWarehouseIDs : List (int);
  var s27_#tmp259 : int;
  var s27_sup_w_id : int;
  var s27_orderQuantities : List (int);
  var s27_#tmp260 : int;
  var s27_qty : int;
  var s27_prices : List (real);
  var s27_#tmp261 : real;
  var s27_price : real;
  var s27_#tmp262 : real;
  var s27_#tmp263 : real;
  var s27_#tmp264 : int;
  var s27_w_tax : real;
  var s27_#tmp266 : unit;

  // Hop partition verification for function 'newOrder'
  s16_block16:
    s16_#tmp62 := Warehouse_W_TAX[s16_w_id];
    s16_w_tax := s16_#tmp62;
    s16_#tmp63 := emptyList(__dummy_witness_16);
    s16_prices := s16_#tmp63;
    goto s16_hop_exit;
  s16_hop_exit:
  s17_block17:
    s17_#tmp64 := get(s17_itemIDs, 0);
    s17_i_id := s17_#tmp64;
    s17_#tmp65 := get(s17_supplierWarehouseIDs, 0);
    s17_sup_w_id := s17_#tmp65;
    s17_#tmp66 := get(s17_orderQuantities, 0);
    s17_qty := s17_#tmp66;
    s17_#tmp67 := s17_qty >= 0;
    s17_#tmp68 := s17_qty <= 10;
    s17_#tmp69 := s17_#tmp67 && s17_#tmp68;
    s17_s#S_DATA := Stock_S_DATA[s17_sup_w_id][s17_i_id];
    s17_s#S_I_ID := Stock_S_I_ID[s17_sup_w_id][s17_i_id];
  // Partition check hop 17 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 17) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s17_sup_w_id == s17_sup_w_id) && (s17_i_id == s17_i_id));
    s17_s#S_ORDER_CNT := Stock_S_ORDER_CNT[s17_sup_w_id][s17_i_id];
  // Partition check hop 17 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 17) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s17_sup_w_id == s17_sup_w_id) && (s17_i_id == s17_i_id));
    s17_s#S_QUANTITY := Stock_S_QUANTITY[s17_sup_w_id][s17_i_id];
  // Partition check hop 17 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 17) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s17_sup_w_id == s17_sup_w_id) && (s17_i_id == s17_i_id));
    s17_s#S_REMOTE_CNT := Stock_S_REMOTE_CNT[s17_sup_w_id][s17_i_id];
  // Partition check hop 17 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 17) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s17_sup_w_id == s17_sup_w_id) && (s17_i_id == s17_i_id));
    s17_s#S_W_ID := Stock_S_W_ID[s17_sup_w_id][s17_i_id];
  // Partition check hop 17 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 17) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s17_sup_w_id == s17_sup_w_id) && (s17_i_id == s17_i_id));
    s17_s#S_YTD := Stock_S_YTD[s17_sup_w_id][s17_i_id];
  // Partition check hop 17 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 17) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s17_sup_w_id == s17_sup_w_id) && (s17_i_id == s17_i_id));
    s17_#tmp71 := Item_I_PRICE[s17_i_id][s17_sup_w_id];
  // Partition check hop 17 func 'h' tables 'Stock'=>'Item' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5217, end: 5257, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 17) (table_id . 6) (span ((start . 5217) (end . 5257) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s17_sup_w_id == s17_sup_w_id) && (s17_i_id == s17_i_id));
    s17_price := s17_#tmp71;
    s17_#tmp72 := append(s17_prices, s17_price);
    s17_prices := s17_#tmp72;
    s17_#tmp73 := s17_s#S_QUANTITY - s17_qty;
    s17_#tmp74 := s17_#tmp73 >= 10;
    if (s17_#tmp74) {
      goto s17_block18;
    } else {
      goto s17_block20;
    }
  s17_block18:
    s17_#tmp75 := s17_s#S_QUANTITY - s17_qty;
    s17_s#S_QUANTITY := s17_#tmp75;
    goto s17_block19;
  s17_block19:
    s17_#tmp78 := s17_sup_w_id != s17_w_id;
    if (s17_#tmp78) {
      goto s17_block21;
    } else {
      goto s17_block22;
    }
  s17_block20:
    s17_#tmp76 := s17_s#S_QUANTITY + 91;
    s17_#tmp77 := s17_#tmp76 - s17_qty;
    s17_s#S_QUANTITY := s17_#tmp77;
    goto s17_block19;
  s17_block21:
    s17_#tmp79 := s17_s#S_REMOTE_CNT + 1;
    s17_s#S_REMOTE_CNT := s17_#tmp79;
    goto s17_block22;
  s17_block22:
    s17_#tmp80 := s17_s#S_ORDER_CNT + 1;
    s17_s#S_ORDER_CNT := s17_#tmp80;
    s17_#tmp81 := real(s17_qty);
    s17_#tmp82 := s17_s#S_YTD + s17_#tmp81;
    s17_s#S_YTD := s17_#tmp82;
    Stock_S_DATA := Stock_S_DATA[s17_sup_w_id := Stock_S_DATA[s17_sup_w_id][s17_i_id := s17_s#S_DATA]];
  // Partition check hop 17 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 17) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s17_sup_w_id == s17_sup_w_id) && (s17_i_id == s17_i_id));
    Stock_S_I_ID := Stock_S_I_ID[s17_sup_w_id := Stock_S_I_ID[s17_sup_w_id][s17_i_id := s17_s#S_I_ID]];
  // Partition check hop 17 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 17) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s17_sup_w_id == s17_sup_w_id) && (s17_i_id == s17_i_id));
    Stock_S_ORDER_CNT := Stock_S_ORDER_CNT[s17_sup_w_id := Stock_S_ORDER_CNT[s17_sup_w_id][s17_i_id := s17_s#S_ORDER_CNT]];
  // Partition check hop 17 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 17) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s17_sup_w_id == s17_sup_w_id) && (s17_i_id == s17_i_id));
    Stock_S_QUANTITY := Stock_S_QUANTITY[s17_sup_w_id := Stock_S_QUANTITY[s17_sup_w_id][s17_i_id := s17_s#S_QUANTITY]];
  // Partition check hop 17 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 17) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s17_sup_w_id == s17_sup_w_id) && (s17_i_id == s17_i_id));
    Stock_S_REMOTE_CNT := Stock_S_REMOTE_CNT[s17_sup_w_id := Stock_S_REMOTE_CNT[s17_sup_w_id][s17_i_id := s17_s#S_REMOTE_CNT]];
  // Partition check hop 17 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 17) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s17_sup_w_id == s17_sup_w_id) && (s17_i_id == s17_i_id));
    Stock_S_W_ID := Stock_S_W_ID[s17_sup_w_id := Stock_S_W_ID[s17_sup_w_id][s17_i_id := s17_s#S_W_ID]];
  // Partition check hop 17 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 17) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s17_sup_w_id == s17_sup_w_id) && (s17_i_id == s17_i_id));
    Stock_S_YTD := Stock_S_YTD[s17_sup_w_id := Stock_S_YTD[s17_sup_w_id][s17_i_id := s17_s#S_YTD]];
  // Partition check hop 17 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 17) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s17_sup_w_id == s17_sup_w_id) && (s17_i_id == s17_i_id));
    goto s17_hop_exit;
  s17_hop_exit:
  s18_block23:
    s18_#tmp83 := get(s18_itemIDs, 1);
    s18_i_id := s18_#tmp83;
    s18_#tmp84 := get(s18_supplierWarehouseIDs, 1);
    s18_sup_w_id := s18_#tmp84;
    s18_#tmp85 := get(s18_orderQuantities, 1);
    s18_qty := s18_#tmp85;
    s18_#tmp86 := s18_qty >= 0;
    s18_#tmp87 := s18_qty <= 10;
    s18_#tmp88 := s18_#tmp86 && s18_#tmp87;
    s18_s#S_DATA := Stock_S_DATA[s18_sup_w_id][s18_i_id];
    s18_s#S_I_ID := Stock_S_I_ID[s18_sup_w_id][s18_i_id];
  // Partition check hop 18 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 18) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s18_sup_w_id == s18_sup_w_id) && (s18_i_id == s18_i_id));
    s18_s#S_ORDER_CNT := Stock_S_ORDER_CNT[s18_sup_w_id][s18_i_id];
  // Partition check hop 18 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 18) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s18_sup_w_id == s18_sup_w_id) && (s18_i_id == s18_i_id));
    s18_s#S_QUANTITY := Stock_S_QUANTITY[s18_sup_w_id][s18_i_id];
  // Partition check hop 18 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 18) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s18_sup_w_id == s18_sup_w_id) && (s18_i_id == s18_i_id));
    s18_s#S_REMOTE_CNT := Stock_S_REMOTE_CNT[s18_sup_w_id][s18_i_id];
  // Partition check hop 18 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 18) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s18_sup_w_id == s18_sup_w_id) && (s18_i_id == s18_i_id));
    s18_s#S_W_ID := Stock_S_W_ID[s18_sup_w_id][s18_i_id];
  // Partition check hop 18 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 18) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s18_sup_w_id == s18_sup_w_id) && (s18_i_id == s18_i_id));
    s18_s#S_YTD := Stock_S_YTD[s18_sup_w_id][s18_i_id];
  // Partition check hop 18 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 18) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s18_sup_w_id == s18_sup_w_id) && (s18_i_id == s18_i_id));
    s18_#tmp90 := Item_I_PRICE[s18_i_id][s18_sup_w_id];
  // Partition check hop 18 func 'h' tables 'Stock'=>'Item' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5217, end: 5257, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 18) (table_id . 6) (span ((start . 5217) (end . 5257) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s18_sup_w_id == s18_sup_w_id) && (s18_i_id == s18_i_id));
    s18_price := s18_#tmp90;
    s18_#tmp91 := append(s18_prices, s18_price);
    s18_prices := s18_#tmp91;
    s18_#tmp92 := s18_s#S_QUANTITY - s18_qty;
    s18_#tmp93 := s18_#tmp92 >= 10;
    if (s18_#tmp93) {
      goto s18_block24;
    } else {
      goto s18_block26;
    }
  s18_block24:
    s18_#tmp94 := s18_s#S_QUANTITY - s18_qty;
    s18_s#S_QUANTITY := s18_#tmp94;
    goto s18_block25;
  s18_block25:
    s18_#tmp97 := s18_sup_w_id != s18_w_id;
    if (s18_#tmp97) {
      goto s18_block27;
    } else {
      goto s18_block28;
    }
  s18_block26:
    s18_#tmp95 := s18_s#S_QUANTITY + 91;
    s18_#tmp96 := s18_#tmp95 - s18_qty;
    s18_s#S_QUANTITY := s18_#tmp96;
    goto s18_block25;
  s18_block27:
    s18_#tmp98 := s18_s#S_REMOTE_CNT + 1;
    s18_s#S_REMOTE_CNT := s18_#tmp98;
    goto s18_block28;
  s18_block28:
    s18_#tmp99 := s18_s#S_ORDER_CNT + 1;
    s18_s#S_ORDER_CNT := s18_#tmp99;
    s18_#tmp100 := real(s18_qty);
    s18_#tmp101 := s18_s#S_YTD + s18_#tmp100;
    s18_s#S_YTD := s18_#tmp101;
    Stock_S_DATA := Stock_S_DATA[s18_sup_w_id := Stock_S_DATA[s18_sup_w_id][s18_i_id := s18_s#S_DATA]];
  // Partition check hop 18 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 18) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s18_sup_w_id == s18_sup_w_id) && (s18_i_id == s18_i_id));
    Stock_S_I_ID := Stock_S_I_ID[s18_sup_w_id := Stock_S_I_ID[s18_sup_w_id][s18_i_id := s18_s#S_I_ID]];
  // Partition check hop 18 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 18) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s18_sup_w_id == s18_sup_w_id) && (s18_i_id == s18_i_id));
    Stock_S_ORDER_CNT := Stock_S_ORDER_CNT[s18_sup_w_id := Stock_S_ORDER_CNT[s18_sup_w_id][s18_i_id := s18_s#S_ORDER_CNT]];
  // Partition check hop 18 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 18) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s18_sup_w_id == s18_sup_w_id) && (s18_i_id == s18_i_id));
    Stock_S_QUANTITY := Stock_S_QUANTITY[s18_sup_w_id := Stock_S_QUANTITY[s18_sup_w_id][s18_i_id := s18_s#S_QUANTITY]];
  // Partition check hop 18 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 18) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s18_sup_w_id == s18_sup_w_id) && (s18_i_id == s18_i_id));
    Stock_S_REMOTE_CNT := Stock_S_REMOTE_CNT[s18_sup_w_id := Stock_S_REMOTE_CNT[s18_sup_w_id][s18_i_id := s18_s#S_REMOTE_CNT]];
  // Partition check hop 18 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 18) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s18_sup_w_id == s18_sup_w_id) && (s18_i_id == s18_i_id));
    Stock_S_W_ID := Stock_S_W_ID[s18_sup_w_id := Stock_S_W_ID[s18_sup_w_id][s18_i_id := s18_s#S_W_ID]];
  // Partition check hop 18 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 18) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s18_sup_w_id == s18_sup_w_id) && (s18_i_id == s18_i_id));
    Stock_S_YTD := Stock_S_YTD[s18_sup_w_id := Stock_S_YTD[s18_sup_w_id][s18_i_id := s18_s#S_YTD]];
  // Partition check hop 18 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 18) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s18_sup_w_id == s18_sup_w_id) && (s18_i_id == s18_i_id));
    goto s18_hop_exit;
  s18_hop_exit:
  s19_block29:
    s19_#tmp102 := get(s19_itemIDs, 2);
    s19_i_id := s19_#tmp102;
    s19_#tmp103 := get(s19_supplierWarehouseIDs, 2);
    s19_sup_w_id := s19_#tmp103;
    s19_#tmp104 := get(s19_orderQuantities, 2);
    s19_qty := s19_#tmp104;
    s19_#tmp105 := s19_qty >= 0;
    s19_#tmp106 := s19_qty <= 10;
    s19_#tmp107 := s19_#tmp105 && s19_#tmp106;
    s19_s#S_DATA := Stock_S_DATA[s19_sup_w_id][s19_i_id];
    s19_s#S_I_ID := Stock_S_I_ID[s19_sup_w_id][s19_i_id];
  // Partition check hop 19 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 19) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s19_sup_w_id == s19_sup_w_id) && (s19_i_id == s19_i_id));
    s19_s#S_ORDER_CNT := Stock_S_ORDER_CNT[s19_sup_w_id][s19_i_id];
  // Partition check hop 19 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 19) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s19_sup_w_id == s19_sup_w_id) && (s19_i_id == s19_i_id));
    s19_s#S_QUANTITY := Stock_S_QUANTITY[s19_sup_w_id][s19_i_id];
  // Partition check hop 19 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 19) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s19_sup_w_id == s19_sup_w_id) && (s19_i_id == s19_i_id));
    s19_s#S_REMOTE_CNT := Stock_S_REMOTE_CNT[s19_sup_w_id][s19_i_id];
  // Partition check hop 19 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 19) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s19_sup_w_id == s19_sup_w_id) && (s19_i_id == s19_i_id));
    s19_s#S_W_ID := Stock_S_W_ID[s19_sup_w_id][s19_i_id];
  // Partition check hop 19 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 19) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s19_sup_w_id == s19_sup_w_id) && (s19_i_id == s19_i_id));
    s19_s#S_YTD := Stock_S_YTD[s19_sup_w_id][s19_i_id];
  // Partition check hop 19 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 19) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s19_sup_w_id == s19_sup_w_id) && (s19_i_id == s19_i_id));
    s19_#tmp109 := Item_I_PRICE[s19_i_id][s19_sup_w_id];
  // Partition check hop 19 func 'h' tables 'Stock'=>'Item' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5217, end: 5257, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 19) (table_id . 6) (span ((start . 5217) (end . 5257) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s19_sup_w_id == s19_sup_w_id) && (s19_i_id == s19_i_id));
    s19_price := s19_#tmp109;
    s19_#tmp110 := append(s19_prices, s19_price);
    s19_prices := s19_#tmp110;
    s19_#tmp111 := s19_s#S_QUANTITY - s19_qty;
    s19_#tmp112 := s19_#tmp111 >= 10;
    if (s19_#tmp112) {
      goto s19_block30;
    } else {
      goto s19_block32;
    }
  s19_block30:
    s19_#tmp113 := s19_s#S_QUANTITY - s19_qty;
    s19_s#S_QUANTITY := s19_#tmp113;
    goto s19_block31;
  s19_block31:
    s19_#tmp116 := s19_sup_w_id != s19_w_id;
    if (s19_#tmp116) {
      goto s19_block33;
    } else {
      goto s19_block34;
    }
  s19_block32:
    s19_#tmp114 := s19_s#S_QUANTITY + 91;
    s19_#tmp115 := s19_#tmp114 - s19_qty;
    s19_s#S_QUANTITY := s19_#tmp115;
    goto s19_block31;
  s19_block33:
    s19_#tmp117 := s19_s#S_REMOTE_CNT + 1;
    s19_s#S_REMOTE_CNT := s19_#tmp117;
    goto s19_block34;
  s19_block34:
    s19_#tmp118 := s19_s#S_ORDER_CNT + 1;
    s19_s#S_ORDER_CNT := s19_#tmp118;
    s19_#tmp119 := real(s19_qty);
    s19_#tmp120 := s19_s#S_YTD + s19_#tmp119;
    s19_s#S_YTD := s19_#tmp120;
    Stock_S_DATA := Stock_S_DATA[s19_sup_w_id := Stock_S_DATA[s19_sup_w_id][s19_i_id := s19_s#S_DATA]];
  // Partition check hop 19 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 19) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s19_sup_w_id == s19_sup_w_id) && (s19_i_id == s19_i_id));
    Stock_S_I_ID := Stock_S_I_ID[s19_sup_w_id := Stock_S_I_ID[s19_sup_w_id][s19_i_id := s19_s#S_I_ID]];
  // Partition check hop 19 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 19) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s19_sup_w_id == s19_sup_w_id) && (s19_i_id == s19_i_id));
    Stock_S_ORDER_CNT := Stock_S_ORDER_CNT[s19_sup_w_id := Stock_S_ORDER_CNT[s19_sup_w_id][s19_i_id := s19_s#S_ORDER_CNT]];
  // Partition check hop 19 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 19) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s19_sup_w_id == s19_sup_w_id) && (s19_i_id == s19_i_id));
    Stock_S_QUANTITY := Stock_S_QUANTITY[s19_sup_w_id := Stock_S_QUANTITY[s19_sup_w_id][s19_i_id := s19_s#S_QUANTITY]];
  // Partition check hop 19 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 19) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s19_sup_w_id == s19_sup_w_id) && (s19_i_id == s19_i_id));
    Stock_S_REMOTE_CNT := Stock_S_REMOTE_CNT[s19_sup_w_id := Stock_S_REMOTE_CNT[s19_sup_w_id][s19_i_id := s19_s#S_REMOTE_CNT]];
  // Partition check hop 19 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 19) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s19_sup_w_id == s19_sup_w_id) && (s19_i_id == s19_i_id));
    Stock_S_W_ID := Stock_S_W_ID[s19_sup_w_id := Stock_S_W_ID[s19_sup_w_id][s19_i_id := s19_s#S_W_ID]];
  // Partition check hop 19 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 19) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s19_sup_w_id == s19_sup_w_id) && (s19_i_id == s19_i_id));
    Stock_S_YTD := Stock_S_YTD[s19_sup_w_id := Stock_S_YTD[s19_sup_w_id][s19_i_id := s19_s#S_YTD]];
  // Partition check hop 19 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 19) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s19_sup_w_id == s19_sup_w_id) && (s19_i_id == s19_i_id));
    goto s19_hop_exit;
  s19_hop_exit:
  s20_block35:
    s20_#tmp121 := get(s20_itemIDs, 3);
    s20_i_id := s20_#tmp121;
    s20_#tmp122 := get(s20_supplierWarehouseIDs, 3);
    s20_sup_w_id := s20_#tmp122;
    s20_#tmp123 := get(s20_orderQuantities, 3);
    s20_qty := s20_#tmp123;
    s20_#tmp124 := s20_qty >= 0;
    s20_#tmp125 := s20_qty <= 10;
    s20_#tmp126 := s20_#tmp124 && s20_#tmp125;
    s20_s#S_DATA := Stock_S_DATA[s20_sup_w_id][s20_i_id];
    s20_s#S_I_ID := Stock_S_I_ID[s20_sup_w_id][s20_i_id];
  // Partition check hop 20 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 20) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s20_sup_w_id == s20_sup_w_id) && (s20_i_id == s20_i_id));
    s20_s#S_ORDER_CNT := Stock_S_ORDER_CNT[s20_sup_w_id][s20_i_id];
  // Partition check hop 20 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 20) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s20_sup_w_id == s20_sup_w_id) && (s20_i_id == s20_i_id));
    s20_s#S_QUANTITY := Stock_S_QUANTITY[s20_sup_w_id][s20_i_id];
  // Partition check hop 20 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 20) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s20_sup_w_id == s20_sup_w_id) && (s20_i_id == s20_i_id));
    s20_s#S_REMOTE_CNT := Stock_S_REMOTE_CNT[s20_sup_w_id][s20_i_id];
  // Partition check hop 20 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 20) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s20_sup_w_id == s20_sup_w_id) && (s20_i_id == s20_i_id));
    s20_s#S_W_ID := Stock_S_W_ID[s20_sup_w_id][s20_i_id];
  // Partition check hop 20 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 20) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s20_sup_w_id == s20_sup_w_id) && (s20_i_id == s20_i_id));
    s20_s#S_YTD := Stock_S_YTD[s20_sup_w_id][s20_i_id];
  // Partition check hop 20 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 20) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s20_sup_w_id == s20_sup_w_id) && (s20_i_id == s20_i_id));
    s20_#tmp128 := Item_I_PRICE[s20_i_id][s20_sup_w_id];
  // Partition check hop 20 func 'h' tables 'Stock'=>'Item' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5217, end: 5257, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 20) (table_id . 6) (span ((start . 5217) (end . 5257) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s20_sup_w_id == s20_sup_w_id) && (s20_i_id == s20_i_id));
    s20_price := s20_#tmp128;
    s20_#tmp129 := append(s20_prices, s20_price);
    s20_prices := s20_#tmp129;
    s20_#tmp130 := s20_s#S_QUANTITY - s20_qty;
    s20_#tmp131 := s20_#tmp130 >= 10;
    if (s20_#tmp131) {
      goto s20_block36;
    } else {
      goto s20_block38;
    }
  s20_block36:
    s20_#tmp132 := s20_s#S_QUANTITY - s20_qty;
    s20_s#S_QUANTITY := s20_#tmp132;
    goto s20_block37;
  s20_block37:
    s20_#tmp135 := s20_sup_w_id != s20_w_id;
    if (s20_#tmp135) {
      goto s20_block39;
    } else {
      goto s20_block40;
    }
  s20_block38:
    s20_#tmp133 := s20_s#S_QUANTITY + 91;
    s20_#tmp134 := s20_#tmp133 - s20_qty;
    s20_s#S_QUANTITY := s20_#tmp134;
    goto s20_block37;
  s20_block39:
    s20_#tmp136 := s20_s#S_REMOTE_CNT + 1;
    s20_s#S_REMOTE_CNT := s20_#tmp136;
    goto s20_block40;
  s20_block40:
    s20_#tmp137 := s20_s#S_ORDER_CNT + 1;
    s20_s#S_ORDER_CNT := s20_#tmp137;
    s20_#tmp138 := real(s20_qty);
    s20_#tmp139 := s20_s#S_YTD + s20_#tmp138;
    s20_s#S_YTD := s20_#tmp139;
    Stock_S_DATA := Stock_S_DATA[s20_sup_w_id := Stock_S_DATA[s20_sup_w_id][s20_i_id := s20_s#S_DATA]];
  // Partition check hop 20 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 20) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s20_sup_w_id == s20_sup_w_id) && (s20_i_id == s20_i_id));
    Stock_S_I_ID := Stock_S_I_ID[s20_sup_w_id := Stock_S_I_ID[s20_sup_w_id][s20_i_id := s20_s#S_I_ID]];
  // Partition check hop 20 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 20) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s20_sup_w_id == s20_sup_w_id) && (s20_i_id == s20_i_id));
    Stock_S_ORDER_CNT := Stock_S_ORDER_CNT[s20_sup_w_id := Stock_S_ORDER_CNT[s20_sup_w_id][s20_i_id := s20_s#S_ORDER_CNT]];
  // Partition check hop 20 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 20) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s20_sup_w_id == s20_sup_w_id) && (s20_i_id == s20_i_id));
    Stock_S_QUANTITY := Stock_S_QUANTITY[s20_sup_w_id := Stock_S_QUANTITY[s20_sup_w_id][s20_i_id := s20_s#S_QUANTITY]];
  // Partition check hop 20 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 20) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s20_sup_w_id == s20_sup_w_id) && (s20_i_id == s20_i_id));
    Stock_S_REMOTE_CNT := Stock_S_REMOTE_CNT[s20_sup_w_id := Stock_S_REMOTE_CNT[s20_sup_w_id][s20_i_id := s20_s#S_REMOTE_CNT]];
  // Partition check hop 20 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 20) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s20_sup_w_id == s20_sup_w_id) && (s20_i_id == s20_i_id));
    Stock_S_W_ID := Stock_S_W_ID[s20_sup_w_id := Stock_S_W_ID[s20_sup_w_id][s20_i_id := s20_s#S_W_ID]];
  // Partition check hop 20 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 20) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s20_sup_w_id == s20_sup_w_id) && (s20_i_id == s20_i_id));
    Stock_S_YTD := Stock_S_YTD[s20_sup_w_id := Stock_S_YTD[s20_sup_w_id][s20_i_id := s20_s#S_YTD]];
  // Partition check hop 20 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 20) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s20_sup_w_id == s20_sup_w_id) && (s20_i_id == s20_i_id));
    goto s20_hop_exit;
  s20_hop_exit:
  s21_block41:
    s21_#tmp140 := get(s21_itemIDs, 4);
    s21_i_id := s21_#tmp140;
    s21_#tmp141 := get(s21_supplierWarehouseIDs, 4);
    s21_sup_w_id := s21_#tmp141;
    s21_#tmp142 := get(s21_orderQuantities, 4);
    s21_qty := s21_#tmp142;
    s21_#tmp143 := s21_qty >= 0;
    s21_#tmp144 := s21_qty <= 10;
    s21_#tmp145 := s21_#tmp143 && s21_#tmp144;
    s21_s#S_DATA := Stock_S_DATA[s21_sup_w_id][s21_i_id];
    s21_s#S_I_ID := Stock_S_I_ID[s21_sup_w_id][s21_i_id];
  // Partition check hop 21 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 21) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s21_sup_w_id == s21_sup_w_id) && (s21_i_id == s21_i_id));
    s21_s#S_ORDER_CNT := Stock_S_ORDER_CNT[s21_sup_w_id][s21_i_id];
  // Partition check hop 21 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 21) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s21_sup_w_id == s21_sup_w_id) && (s21_i_id == s21_i_id));
    s21_s#S_QUANTITY := Stock_S_QUANTITY[s21_sup_w_id][s21_i_id];
  // Partition check hop 21 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 21) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s21_sup_w_id == s21_sup_w_id) && (s21_i_id == s21_i_id));
    s21_s#S_REMOTE_CNT := Stock_S_REMOTE_CNT[s21_sup_w_id][s21_i_id];
  // Partition check hop 21 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 21) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s21_sup_w_id == s21_sup_w_id) && (s21_i_id == s21_i_id));
    s21_s#S_W_ID := Stock_S_W_ID[s21_sup_w_id][s21_i_id];
  // Partition check hop 21 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 21) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s21_sup_w_id == s21_sup_w_id) && (s21_i_id == s21_i_id));
    s21_s#S_YTD := Stock_S_YTD[s21_sup_w_id][s21_i_id];
  // Partition check hop 21 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 21) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s21_sup_w_id == s21_sup_w_id) && (s21_i_id == s21_i_id));
    s21_#tmp147 := Item_I_PRICE[s21_i_id][s21_sup_w_id];
  // Partition check hop 21 func 'h' tables 'Stock'=>'Item' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5217, end: 5257, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 21) (table_id . 6) (span ((start . 5217) (end . 5257) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s21_sup_w_id == s21_sup_w_id) && (s21_i_id == s21_i_id));
    s21_price := s21_#tmp147;
    s21_#tmp148 := append(s21_prices, s21_price);
    s21_prices := s21_#tmp148;
    s21_#tmp149 := s21_s#S_QUANTITY - s21_qty;
    s21_#tmp150 := s21_#tmp149 >= 10;
    if (s21_#tmp150) {
      goto s21_block42;
    } else {
      goto s21_block44;
    }
  s21_block42:
    s21_#tmp151 := s21_s#S_QUANTITY - s21_qty;
    s21_s#S_QUANTITY := s21_#tmp151;
    goto s21_block43;
  s21_block43:
    s21_#tmp154 := s21_sup_w_id != s21_w_id;
    if (s21_#tmp154) {
      goto s21_block45;
    } else {
      goto s21_block46;
    }
  s21_block44:
    s21_#tmp152 := s21_s#S_QUANTITY + 91;
    s21_#tmp153 := s21_#tmp152 - s21_qty;
    s21_s#S_QUANTITY := s21_#tmp153;
    goto s21_block43;
  s21_block45:
    s21_#tmp155 := s21_s#S_REMOTE_CNT + 1;
    s21_s#S_REMOTE_CNT := s21_#tmp155;
    goto s21_block46;
  s21_block46:
    s21_#tmp156 := s21_s#S_ORDER_CNT + 1;
    s21_s#S_ORDER_CNT := s21_#tmp156;
    s21_#tmp157 := real(s21_qty);
    s21_#tmp158 := s21_s#S_YTD + s21_#tmp157;
    s21_s#S_YTD := s21_#tmp158;
    Stock_S_DATA := Stock_S_DATA[s21_sup_w_id := Stock_S_DATA[s21_sup_w_id][s21_i_id := s21_s#S_DATA]];
  // Partition check hop 21 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 21) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s21_sup_w_id == s21_sup_w_id) && (s21_i_id == s21_i_id));
    Stock_S_I_ID := Stock_S_I_ID[s21_sup_w_id := Stock_S_I_ID[s21_sup_w_id][s21_i_id := s21_s#S_I_ID]];
  // Partition check hop 21 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 21) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s21_sup_w_id == s21_sup_w_id) && (s21_i_id == s21_i_id));
    Stock_S_ORDER_CNT := Stock_S_ORDER_CNT[s21_sup_w_id := Stock_S_ORDER_CNT[s21_sup_w_id][s21_i_id := s21_s#S_ORDER_CNT]];
  // Partition check hop 21 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 21) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s21_sup_w_id == s21_sup_w_id) && (s21_i_id == s21_i_id));
    Stock_S_QUANTITY := Stock_S_QUANTITY[s21_sup_w_id := Stock_S_QUANTITY[s21_sup_w_id][s21_i_id := s21_s#S_QUANTITY]];
  // Partition check hop 21 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 21) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s21_sup_w_id == s21_sup_w_id) && (s21_i_id == s21_i_id));
    Stock_S_REMOTE_CNT := Stock_S_REMOTE_CNT[s21_sup_w_id := Stock_S_REMOTE_CNT[s21_sup_w_id][s21_i_id := s21_s#S_REMOTE_CNT]];
  // Partition check hop 21 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 21) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s21_sup_w_id == s21_sup_w_id) && (s21_i_id == s21_i_id));
    Stock_S_W_ID := Stock_S_W_ID[s21_sup_w_id := Stock_S_W_ID[s21_sup_w_id][s21_i_id := s21_s#S_W_ID]];
  // Partition check hop 21 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 21) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s21_sup_w_id == s21_sup_w_id) && (s21_i_id == s21_i_id));
    Stock_S_YTD := Stock_S_YTD[s21_sup_w_id := Stock_S_YTD[s21_sup_w_id][s21_i_id := s21_s#S_YTD]];
  // Partition check hop 21 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 21) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s21_sup_w_id == s21_sup_w_id) && (s21_i_id == s21_i_id));
    goto s21_hop_exit;
  s21_hop_exit:
  s22_block47:
    s22_#tmp159 := get(s22_itemIDs, 5);
    s22_i_id := s22_#tmp159;
    s22_#tmp160 := get(s22_supplierWarehouseIDs, 5);
    s22_sup_w_id := s22_#tmp160;
    s22_#tmp161 := get(s22_orderQuantities, 5);
    s22_qty := s22_#tmp161;
    s22_#tmp162 := s22_qty >= 0;
    s22_#tmp163 := s22_qty <= 10;
    s22_#tmp164 := s22_#tmp162 && s22_#tmp163;
    s22_s#S_DATA := Stock_S_DATA[s22_sup_w_id][s22_i_id];
    s22_s#S_I_ID := Stock_S_I_ID[s22_sup_w_id][s22_i_id];
  // Partition check hop 22 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 22) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s22_sup_w_id == s22_sup_w_id) && (s22_i_id == s22_i_id));
    s22_s#S_ORDER_CNT := Stock_S_ORDER_CNT[s22_sup_w_id][s22_i_id];
  // Partition check hop 22 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 22) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s22_sup_w_id == s22_sup_w_id) && (s22_i_id == s22_i_id));
    s22_s#S_QUANTITY := Stock_S_QUANTITY[s22_sup_w_id][s22_i_id];
  // Partition check hop 22 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 22) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s22_sup_w_id == s22_sup_w_id) && (s22_i_id == s22_i_id));
    s22_s#S_REMOTE_CNT := Stock_S_REMOTE_CNT[s22_sup_w_id][s22_i_id];
  // Partition check hop 22 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 22) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s22_sup_w_id == s22_sup_w_id) && (s22_i_id == s22_i_id));
    s22_s#S_W_ID := Stock_S_W_ID[s22_sup_w_id][s22_i_id];
  // Partition check hop 22 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 22) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s22_sup_w_id == s22_sup_w_id) && (s22_i_id == s22_i_id));
    s22_s#S_YTD := Stock_S_YTD[s22_sup_w_id][s22_i_id];
  // Partition check hop 22 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 22) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s22_sup_w_id == s22_sup_w_id) && (s22_i_id == s22_i_id));
    s22_#tmp166 := Item_I_PRICE[s22_i_id][s22_sup_w_id];
  // Partition check hop 22 func 'h' tables 'Stock'=>'Item' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5217, end: 5257, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 22) (table_id . 6) (span ((start . 5217) (end . 5257) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s22_sup_w_id == s22_sup_w_id) && (s22_i_id == s22_i_id));
    s22_price := s22_#tmp166;
    s22_#tmp167 := append(s22_prices, s22_price);
    s22_prices := s22_#tmp167;
    s22_#tmp168 := s22_s#S_QUANTITY - s22_qty;
    s22_#tmp169 := s22_#tmp168 >= 10;
    if (s22_#tmp169) {
      goto s22_block48;
    } else {
      goto s22_block50;
    }
  s22_block48:
    s22_#tmp170 := s22_s#S_QUANTITY - s22_qty;
    s22_s#S_QUANTITY := s22_#tmp170;
    goto s22_block49;
  s22_block49:
    s22_#tmp173 := s22_sup_w_id != s22_w_id;
    if (s22_#tmp173) {
      goto s22_block51;
    } else {
      goto s22_block52;
    }
  s22_block50:
    s22_#tmp171 := s22_s#S_QUANTITY + 91;
    s22_#tmp172 := s22_#tmp171 - s22_qty;
    s22_s#S_QUANTITY := s22_#tmp172;
    goto s22_block49;
  s22_block51:
    s22_#tmp174 := s22_s#S_REMOTE_CNT + 1;
    s22_s#S_REMOTE_CNT := s22_#tmp174;
    goto s22_block52;
  s22_block52:
    s22_#tmp175 := s22_s#S_ORDER_CNT + 1;
    s22_s#S_ORDER_CNT := s22_#tmp175;
    s22_#tmp176 := real(s22_qty);
    s22_#tmp177 := s22_s#S_YTD + s22_#tmp176;
    s22_s#S_YTD := s22_#tmp177;
    Stock_S_DATA := Stock_S_DATA[s22_sup_w_id := Stock_S_DATA[s22_sup_w_id][s22_i_id := s22_s#S_DATA]];
  // Partition check hop 22 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 22) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s22_sup_w_id == s22_sup_w_id) && (s22_i_id == s22_i_id));
    Stock_S_I_ID := Stock_S_I_ID[s22_sup_w_id := Stock_S_I_ID[s22_sup_w_id][s22_i_id := s22_s#S_I_ID]];
  // Partition check hop 22 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 22) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s22_sup_w_id == s22_sup_w_id) && (s22_i_id == s22_i_id));
    Stock_S_ORDER_CNT := Stock_S_ORDER_CNT[s22_sup_w_id := Stock_S_ORDER_CNT[s22_sup_w_id][s22_i_id := s22_s#S_ORDER_CNT]];
  // Partition check hop 22 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 22) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s22_sup_w_id == s22_sup_w_id) && (s22_i_id == s22_i_id));
    Stock_S_QUANTITY := Stock_S_QUANTITY[s22_sup_w_id := Stock_S_QUANTITY[s22_sup_w_id][s22_i_id := s22_s#S_QUANTITY]];
  // Partition check hop 22 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 22) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s22_sup_w_id == s22_sup_w_id) && (s22_i_id == s22_i_id));
    Stock_S_REMOTE_CNT := Stock_S_REMOTE_CNT[s22_sup_w_id := Stock_S_REMOTE_CNT[s22_sup_w_id][s22_i_id := s22_s#S_REMOTE_CNT]];
  // Partition check hop 22 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 22) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s22_sup_w_id == s22_sup_w_id) && (s22_i_id == s22_i_id));
    Stock_S_W_ID := Stock_S_W_ID[s22_sup_w_id := Stock_S_W_ID[s22_sup_w_id][s22_i_id := s22_s#S_W_ID]];
  // Partition check hop 22 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 22) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s22_sup_w_id == s22_sup_w_id) && (s22_i_id == s22_i_id));
    Stock_S_YTD := Stock_S_YTD[s22_sup_w_id := Stock_S_YTD[s22_sup_w_id][s22_i_id := s22_s#S_YTD]];
  // Partition check hop 22 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 22) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s22_sup_w_id == s22_sup_w_id) && (s22_i_id == s22_i_id));
    goto s22_hop_exit;
  s22_hop_exit:
  s23_block53:
    s23_#tmp178 := get(s23_itemIDs, 6);
    s23_i_id := s23_#tmp178;
    s23_#tmp179 := get(s23_supplierWarehouseIDs, 6);
    s23_sup_w_id := s23_#tmp179;
    s23_#tmp180 := get(s23_orderQuantities, 6);
    s23_qty := s23_#tmp180;
    s23_#tmp181 := s23_qty >= 0;
    s23_#tmp182 := s23_qty <= 10;
    s23_#tmp183 := s23_#tmp181 && s23_#tmp182;
    s23_s#S_DATA := Stock_S_DATA[s23_sup_w_id][s23_i_id];
    s23_s#S_I_ID := Stock_S_I_ID[s23_sup_w_id][s23_i_id];
  // Partition check hop 23 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 23) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s23_sup_w_id == s23_sup_w_id) && (s23_i_id == s23_i_id));
    s23_s#S_ORDER_CNT := Stock_S_ORDER_CNT[s23_sup_w_id][s23_i_id];
  // Partition check hop 23 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 23) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s23_sup_w_id == s23_sup_w_id) && (s23_i_id == s23_i_id));
    s23_s#S_QUANTITY := Stock_S_QUANTITY[s23_sup_w_id][s23_i_id];
  // Partition check hop 23 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 23) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s23_sup_w_id == s23_sup_w_id) && (s23_i_id == s23_i_id));
    s23_s#S_REMOTE_CNT := Stock_S_REMOTE_CNT[s23_sup_w_id][s23_i_id];
  // Partition check hop 23 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 23) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s23_sup_w_id == s23_sup_w_id) && (s23_i_id == s23_i_id));
    s23_s#S_W_ID := Stock_S_W_ID[s23_sup_w_id][s23_i_id];
  // Partition check hop 23 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 23) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s23_sup_w_id == s23_sup_w_id) && (s23_i_id == s23_i_id));
    s23_s#S_YTD := Stock_S_YTD[s23_sup_w_id][s23_i_id];
  // Partition check hop 23 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 23) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s23_sup_w_id == s23_sup_w_id) && (s23_i_id == s23_i_id));
    s23_#tmp185 := Item_I_PRICE[s23_i_id][s23_sup_w_id];
  // Partition check hop 23 func 'h' tables 'Stock'=>'Item' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5217, end: 5257, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 23) (table_id . 6) (span ((start . 5217) (end . 5257) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s23_sup_w_id == s23_sup_w_id) && (s23_i_id == s23_i_id));
    s23_price := s23_#tmp185;
    s23_#tmp186 := append(s23_prices, s23_price);
    s23_prices := s23_#tmp186;
    s23_#tmp187 := s23_s#S_QUANTITY - s23_qty;
    s23_#tmp188 := s23_#tmp187 >= 10;
    if (s23_#tmp188) {
      goto s23_block54;
    } else {
      goto s23_block56;
    }
  s23_block54:
    s23_#tmp189 := s23_s#S_QUANTITY - s23_qty;
    s23_s#S_QUANTITY := s23_#tmp189;
    goto s23_block55;
  s23_block55:
    s23_#tmp192 := s23_sup_w_id != s23_w_id;
    if (s23_#tmp192) {
      goto s23_block57;
    } else {
      goto s23_block58;
    }
  s23_block56:
    s23_#tmp190 := s23_s#S_QUANTITY + 91;
    s23_#tmp191 := s23_#tmp190 - s23_qty;
    s23_s#S_QUANTITY := s23_#tmp191;
    goto s23_block55;
  s23_block57:
    s23_#tmp193 := s23_s#S_REMOTE_CNT + 1;
    s23_s#S_REMOTE_CNT := s23_#tmp193;
    goto s23_block58;
  s23_block58:
    s23_#tmp194 := s23_s#S_ORDER_CNT + 1;
    s23_s#S_ORDER_CNT := s23_#tmp194;
    s23_#tmp195 := real(s23_qty);
    s23_#tmp196 := s23_s#S_YTD + s23_#tmp195;
    s23_s#S_YTD := s23_#tmp196;
    Stock_S_DATA := Stock_S_DATA[s23_sup_w_id := Stock_S_DATA[s23_sup_w_id][s23_i_id := s23_s#S_DATA]];
  // Partition check hop 23 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 23) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s23_sup_w_id == s23_sup_w_id) && (s23_i_id == s23_i_id));
    Stock_S_I_ID := Stock_S_I_ID[s23_sup_w_id := Stock_S_I_ID[s23_sup_w_id][s23_i_id := s23_s#S_I_ID]];
  // Partition check hop 23 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 23) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s23_sup_w_id == s23_sup_w_id) && (s23_i_id == s23_i_id));
    Stock_S_ORDER_CNT := Stock_S_ORDER_CNT[s23_sup_w_id := Stock_S_ORDER_CNT[s23_sup_w_id][s23_i_id := s23_s#S_ORDER_CNT]];
  // Partition check hop 23 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 23) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s23_sup_w_id == s23_sup_w_id) && (s23_i_id == s23_i_id));
    Stock_S_QUANTITY := Stock_S_QUANTITY[s23_sup_w_id := Stock_S_QUANTITY[s23_sup_w_id][s23_i_id := s23_s#S_QUANTITY]];
  // Partition check hop 23 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 23) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s23_sup_w_id == s23_sup_w_id) && (s23_i_id == s23_i_id));
    Stock_S_REMOTE_CNT := Stock_S_REMOTE_CNT[s23_sup_w_id := Stock_S_REMOTE_CNT[s23_sup_w_id][s23_i_id := s23_s#S_REMOTE_CNT]];
  // Partition check hop 23 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 23) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s23_sup_w_id == s23_sup_w_id) && (s23_i_id == s23_i_id));
    Stock_S_W_ID := Stock_S_W_ID[s23_sup_w_id := Stock_S_W_ID[s23_sup_w_id][s23_i_id := s23_s#S_W_ID]];
  // Partition check hop 23 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 23) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s23_sup_w_id == s23_sup_w_id) && (s23_i_id == s23_i_id));
    Stock_S_YTD := Stock_S_YTD[s23_sup_w_id := Stock_S_YTD[s23_sup_w_id][s23_i_id := s23_s#S_YTD]];
  // Partition check hop 23 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 23) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s23_sup_w_id == s23_sup_w_id) && (s23_i_id == s23_i_id));
    goto s23_hop_exit;
  s23_hop_exit:
  s24_block59:
    s24_#tmp197 := get(s24_itemIDs, 7);
    s24_i_id := s24_#tmp197;
    s24_#tmp198 := get(s24_supplierWarehouseIDs, 7);
    s24_sup_w_id := s24_#tmp198;
    s24_#tmp199 := get(s24_orderQuantities, 7);
    s24_qty := s24_#tmp199;
    s24_#tmp200 := s24_qty >= 0;
    s24_#tmp201 := s24_qty <= 10;
    s24_#tmp202 := s24_#tmp200 && s24_#tmp201;
    s24_s#S_DATA := Stock_S_DATA[s24_sup_w_id][s24_i_id];
    s24_s#S_I_ID := Stock_S_I_ID[s24_sup_w_id][s24_i_id];
  // Partition check hop 24 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 24) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s24_sup_w_id == s24_sup_w_id) && (s24_i_id == s24_i_id));
    s24_s#S_ORDER_CNT := Stock_S_ORDER_CNT[s24_sup_w_id][s24_i_id];
  // Partition check hop 24 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 24) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s24_sup_w_id == s24_sup_w_id) && (s24_i_id == s24_i_id));
    s24_s#S_QUANTITY := Stock_S_QUANTITY[s24_sup_w_id][s24_i_id];
  // Partition check hop 24 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 24) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s24_sup_w_id == s24_sup_w_id) && (s24_i_id == s24_i_id));
    s24_s#S_REMOTE_CNT := Stock_S_REMOTE_CNT[s24_sup_w_id][s24_i_id];
  // Partition check hop 24 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 24) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s24_sup_w_id == s24_sup_w_id) && (s24_i_id == s24_i_id));
    s24_s#S_W_ID := Stock_S_W_ID[s24_sup_w_id][s24_i_id];
  // Partition check hop 24 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 24) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s24_sup_w_id == s24_sup_w_id) && (s24_i_id == s24_i_id));
    s24_s#S_YTD := Stock_S_YTD[s24_sup_w_id][s24_i_id];
  // Partition check hop 24 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 24) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s24_sup_w_id == s24_sup_w_id) && (s24_i_id == s24_i_id));
    s24_#tmp204 := Item_I_PRICE[s24_i_id][s24_sup_w_id];
  // Partition check hop 24 func 'h' tables 'Stock'=>'Item' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5217, end: 5257, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 24) (table_id . 6) (span ((start . 5217) (end . 5257) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s24_sup_w_id == s24_sup_w_id) && (s24_i_id == s24_i_id));
    s24_price := s24_#tmp204;
    s24_#tmp205 := append(s24_prices, s24_price);
    s24_prices := s24_#tmp205;
    s24_#tmp206 := s24_s#S_QUANTITY - s24_qty;
    s24_#tmp207 := s24_#tmp206 >= 10;
    if (s24_#tmp207) {
      goto s24_block60;
    } else {
      goto s24_block62;
    }
  s24_block60:
    s24_#tmp208 := s24_s#S_QUANTITY - s24_qty;
    s24_s#S_QUANTITY := s24_#tmp208;
    goto s24_block61;
  s24_block61:
    s24_#tmp211 := s24_sup_w_id != s24_w_id;
    if (s24_#tmp211) {
      goto s24_block63;
    } else {
      goto s24_block64;
    }
  s24_block62:
    s24_#tmp209 := s24_s#S_QUANTITY + 91;
    s24_#tmp210 := s24_#tmp209 - s24_qty;
    s24_s#S_QUANTITY := s24_#tmp210;
    goto s24_block61;
  s24_block63:
    s24_#tmp212 := s24_s#S_REMOTE_CNT + 1;
    s24_s#S_REMOTE_CNT := s24_#tmp212;
    goto s24_block64;
  s24_block64:
    s24_#tmp213 := s24_s#S_ORDER_CNT + 1;
    s24_s#S_ORDER_CNT := s24_#tmp213;
    s24_#tmp214 := real(s24_qty);
    s24_#tmp215 := s24_s#S_YTD + s24_#tmp214;
    s24_s#S_YTD := s24_#tmp215;
    Stock_S_DATA := Stock_S_DATA[s24_sup_w_id := Stock_S_DATA[s24_sup_w_id][s24_i_id := s24_s#S_DATA]];
  // Partition check hop 24 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 24) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s24_sup_w_id == s24_sup_w_id) && (s24_i_id == s24_i_id));
    Stock_S_I_ID := Stock_S_I_ID[s24_sup_w_id := Stock_S_I_ID[s24_sup_w_id][s24_i_id := s24_s#S_I_ID]];
  // Partition check hop 24 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 24) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s24_sup_w_id == s24_sup_w_id) && (s24_i_id == s24_i_id));
    Stock_S_ORDER_CNT := Stock_S_ORDER_CNT[s24_sup_w_id := Stock_S_ORDER_CNT[s24_sup_w_id][s24_i_id := s24_s#S_ORDER_CNT]];
  // Partition check hop 24 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 24) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s24_sup_w_id == s24_sup_w_id) && (s24_i_id == s24_i_id));
    Stock_S_QUANTITY := Stock_S_QUANTITY[s24_sup_w_id := Stock_S_QUANTITY[s24_sup_w_id][s24_i_id := s24_s#S_QUANTITY]];
  // Partition check hop 24 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 24) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s24_sup_w_id == s24_sup_w_id) && (s24_i_id == s24_i_id));
    Stock_S_REMOTE_CNT := Stock_S_REMOTE_CNT[s24_sup_w_id := Stock_S_REMOTE_CNT[s24_sup_w_id][s24_i_id := s24_s#S_REMOTE_CNT]];
  // Partition check hop 24 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 24) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s24_sup_w_id == s24_sup_w_id) && (s24_i_id == s24_i_id));
    Stock_S_W_ID := Stock_S_W_ID[s24_sup_w_id := Stock_S_W_ID[s24_sup_w_id][s24_i_id := s24_s#S_W_ID]];
  // Partition check hop 24 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 24) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s24_sup_w_id == s24_sup_w_id) && (s24_i_id == s24_i_id));
    Stock_S_YTD := Stock_S_YTD[s24_sup_w_id := Stock_S_YTD[s24_sup_w_id][s24_i_id := s24_s#S_YTD]];
  // Partition check hop 24 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 24) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s24_sup_w_id == s24_sup_w_id) && (s24_i_id == s24_i_id));
    goto s24_hop_exit;
  s24_hop_exit:
  s25_block65:
    s25_#tmp216 := get(s25_itemIDs, 8);
    s25_i_id := s25_#tmp216;
    s25_#tmp217 := get(s25_supplierWarehouseIDs, 8);
    s25_sup_w_id := s25_#tmp217;
    s25_#tmp218 := get(s25_orderQuantities, 8);
    s25_qty := s25_#tmp218;
    s25_#tmp219 := s25_qty >= 0;
    s25_#tmp220 := s25_qty <= 10;
    s25_#tmp221 := s25_#tmp219 && s25_#tmp220;
    s25_s#S_DATA := Stock_S_DATA[s25_sup_w_id][s25_i_id];
    s25_s#S_I_ID := Stock_S_I_ID[s25_sup_w_id][s25_i_id];
  // Partition check hop 25 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 25) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s25_sup_w_id == s25_sup_w_id) && (s25_i_id == s25_i_id));
    s25_s#S_ORDER_CNT := Stock_S_ORDER_CNT[s25_sup_w_id][s25_i_id];
  // Partition check hop 25 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 25) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s25_sup_w_id == s25_sup_w_id) && (s25_i_id == s25_i_id));
    s25_s#S_QUANTITY := Stock_S_QUANTITY[s25_sup_w_id][s25_i_id];
  // Partition check hop 25 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 25) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s25_sup_w_id == s25_sup_w_id) && (s25_i_id == s25_i_id));
    s25_s#S_REMOTE_CNT := Stock_S_REMOTE_CNT[s25_sup_w_id][s25_i_id];
  // Partition check hop 25 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 25) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s25_sup_w_id == s25_sup_w_id) && (s25_i_id == s25_i_id));
    s25_s#S_W_ID := Stock_S_W_ID[s25_sup_w_id][s25_i_id];
  // Partition check hop 25 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 25) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s25_sup_w_id == s25_sup_w_id) && (s25_i_id == s25_i_id));
    s25_s#S_YTD := Stock_S_YTD[s25_sup_w_id][s25_i_id];
  // Partition check hop 25 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 25) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s25_sup_w_id == s25_sup_w_id) && (s25_i_id == s25_i_id));
    s25_#tmp223 := Item_I_PRICE[s25_i_id][s25_sup_w_id];
  // Partition check hop 25 func 'h' tables 'Stock'=>'Item' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5217, end: 5257, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 25) (table_id . 6) (span ((start . 5217) (end . 5257) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s25_sup_w_id == s25_sup_w_id) && (s25_i_id == s25_i_id));
    s25_price := s25_#tmp223;
    s25_#tmp224 := append(s25_prices, s25_price);
    s25_prices := s25_#tmp224;
    s25_#tmp225 := s25_s#S_QUANTITY - s25_qty;
    s25_#tmp226 := s25_#tmp225 >= 10;
    if (s25_#tmp226) {
      goto s25_block66;
    } else {
      goto s25_block68;
    }
  s25_block66:
    s25_#tmp227 := s25_s#S_QUANTITY - s25_qty;
    s25_s#S_QUANTITY := s25_#tmp227;
    goto s25_block67;
  s25_block67:
    s25_#tmp230 := s25_sup_w_id != s25_w_id;
    if (s25_#tmp230) {
      goto s25_block69;
    } else {
      goto s25_block70;
    }
  s25_block68:
    s25_#tmp228 := s25_s#S_QUANTITY + 91;
    s25_#tmp229 := s25_#tmp228 - s25_qty;
    s25_s#S_QUANTITY := s25_#tmp229;
    goto s25_block67;
  s25_block69:
    s25_#tmp231 := s25_s#S_REMOTE_CNT + 1;
    s25_s#S_REMOTE_CNT := s25_#tmp231;
    goto s25_block70;
  s25_block70:
    s25_#tmp232 := s25_s#S_ORDER_CNT + 1;
    s25_s#S_ORDER_CNT := s25_#tmp232;
    s25_#tmp233 := real(s25_qty);
    s25_#tmp234 := s25_s#S_YTD + s25_#tmp233;
    s25_s#S_YTD := s25_#tmp234;
    Stock_S_DATA := Stock_S_DATA[s25_sup_w_id := Stock_S_DATA[s25_sup_w_id][s25_i_id := s25_s#S_DATA]];
  // Partition check hop 25 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 25) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s25_sup_w_id == s25_sup_w_id) && (s25_i_id == s25_i_id));
    Stock_S_I_ID := Stock_S_I_ID[s25_sup_w_id := Stock_S_I_ID[s25_sup_w_id][s25_i_id := s25_s#S_I_ID]];
  // Partition check hop 25 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 25) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s25_sup_w_id == s25_sup_w_id) && (s25_i_id == s25_i_id));
    Stock_S_ORDER_CNT := Stock_S_ORDER_CNT[s25_sup_w_id := Stock_S_ORDER_CNT[s25_sup_w_id][s25_i_id := s25_s#S_ORDER_CNT]];
  // Partition check hop 25 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 25) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s25_sup_w_id == s25_sup_w_id) && (s25_i_id == s25_i_id));
    Stock_S_QUANTITY := Stock_S_QUANTITY[s25_sup_w_id := Stock_S_QUANTITY[s25_sup_w_id][s25_i_id := s25_s#S_QUANTITY]];
  // Partition check hop 25 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 25) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s25_sup_w_id == s25_sup_w_id) && (s25_i_id == s25_i_id));
    Stock_S_REMOTE_CNT := Stock_S_REMOTE_CNT[s25_sup_w_id := Stock_S_REMOTE_CNT[s25_sup_w_id][s25_i_id := s25_s#S_REMOTE_CNT]];
  // Partition check hop 25 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 25) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s25_sup_w_id == s25_sup_w_id) && (s25_i_id == s25_i_id));
    Stock_S_W_ID := Stock_S_W_ID[s25_sup_w_id := Stock_S_W_ID[s25_sup_w_id][s25_i_id := s25_s#S_W_ID]];
  // Partition check hop 25 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 25) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s25_sup_w_id == s25_sup_w_id) && (s25_i_id == s25_i_id));
    Stock_S_YTD := Stock_S_YTD[s25_sup_w_id := Stock_S_YTD[s25_sup_w_id][s25_i_id := s25_s#S_YTD]];
  // Partition check hop 25 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 25) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s25_sup_w_id == s25_sup_w_id) && (s25_i_id == s25_i_id));
    goto s25_hop_exit;
  s25_hop_exit:
  s26_block71:
    s26_#tmp235 := get(s26_itemIDs, 9);
    s26_i_id := s26_#tmp235;
    s26_#tmp236 := get(s26_supplierWarehouseIDs, 9);
    s26_sup_w_id := s26_#tmp236;
    s26_#tmp237 := get(s26_orderQuantities, 9);
    s26_qty := s26_#tmp237;
    s26_#tmp238 := s26_qty >= 0;
    s26_#tmp239 := s26_qty <= 10;
    s26_#tmp240 := s26_#tmp238 && s26_#tmp239;
    s26_s#S_DATA := Stock_S_DATA[s26_sup_w_id][s26_i_id];
    s26_s#S_I_ID := Stock_S_I_ID[s26_sup_w_id][s26_i_id];
  // Partition check hop 26 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 26) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s26_sup_w_id == s26_sup_w_id) && (s26_i_id == s26_i_id));
    s26_s#S_ORDER_CNT := Stock_S_ORDER_CNT[s26_sup_w_id][s26_i_id];
  // Partition check hop 26 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 26) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s26_sup_w_id == s26_sup_w_id) && (s26_i_id == s26_i_id));
    s26_s#S_QUANTITY := Stock_S_QUANTITY[s26_sup_w_id][s26_i_id];
  // Partition check hop 26 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 26) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s26_sup_w_id == s26_sup_w_id) && (s26_i_id == s26_i_id));
    s26_s#S_REMOTE_CNT := Stock_S_REMOTE_CNT[s26_sup_w_id][s26_i_id];
  // Partition check hop 26 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 26) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s26_sup_w_id == s26_sup_w_id) && (s26_i_id == s26_i_id));
    s26_s#S_W_ID := Stock_S_W_ID[s26_sup_w_id][s26_i_id];
  // Partition check hop 26 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 26) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s26_sup_w_id == s26_sup_w_id) && (s26_i_id == s26_i_id));
    s26_s#S_YTD := Stock_S_YTD[s26_sup_w_id][s26_i_id];
  // Partition check hop 26 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 26) (table_id . 7) (span ((start . 5151) (end . 5188) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s26_sup_w_id == s26_sup_w_id) && (s26_i_id == s26_i_id));
    s26_#tmp242 := Item_I_PRICE[s26_i_id][s26_sup_w_id];
  // Partition check hop 26 func 'h' tables 'Stock'=>'Item' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5217, end: 5257, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 26) (table_id . 6) (span ((start . 5217) (end . 5257) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s26_sup_w_id == s26_sup_w_id) && (s26_i_id == s26_i_id));
    s26_price := s26_#tmp242;
    s26_#tmp243 := append(s26_prices, s26_price);
    s26_prices := s26_#tmp243;
    s26_#tmp244 := s26_s#S_QUANTITY - s26_qty;
    s26_#tmp245 := s26_#tmp244 >= 10;
    if (s26_#tmp245) {
      goto s26_block72;
    } else {
      goto s26_block74;
    }
  s26_block72:
    s26_#tmp246 := s26_s#S_QUANTITY - s26_qty;
    s26_s#S_QUANTITY := s26_#tmp246;
    goto s26_block73;
  s26_block73:
    s26_#tmp249 := s26_sup_w_id != s26_w_id;
    if (s26_#tmp249) {
      goto s26_block75;
    } else {
      goto s26_block76;
    }
  s26_block74:
    s26_#tmp247 := s26_s#S_QUANTITY + 91;
    s26_#tmp248 := s26_#tmp247 - s26_qty;
    s26_s#S_QUANTITY := s26_#tmp248;
    goto s26_block73;
  s26_block75:
    s26_#tmp250 := s26_s#S_REMOTE_CNT + 1;
    s26_s#S_REMOTE_CNT := s26_#tmp250;
    goto s26_block76;
  s26_block76:
    s26_#tmp251 := s26_s#S_ORDER_CNT + 1;
    s26_s#S_ORDER_CNT := s26_#tmp251;
    s26_#tmp252 := real(s26_qty);
    s26_#tmp253 := s26_s#S_YTD + s26_#tmp252;
    s26_s#S_YTD := s26_#tmp253;
    Stock_S_DATA := Stock_S_DATA[s26_sup_w_id := Stock_S_DATA[s26_sup_w_id][s26_i_id := s26_s#S_DATA]];
  // Partition check hop 26 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 26) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s26_sup_w_id == s26_sup_w_id) && (s26_i_id == s26_i_id));
    Stock_S_I_ID := Stock_S_I_ID[s26_sup_w_id := Stock_S_I_ID[s26_sup_w_id][s26_i_id := s26_s#S_I_ID]];
  // Partition check hop 26 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 26) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s26_sup_w_id == s26_sup_w_id) && (s26_i_id == s26_i_id));
    Stock_S_ORDER_CNT := Stock_S_ORDER_CNT[s26_sup_w_id := Stock_S_ORDER_CNT[s26_sup_w_id][s26_i_id := s26_s#S_ORDER_CNT]];
  // Partition check hop 26 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 26) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s26_sup_w_id == s26_sup_w_id) && (s26_i_id == s26_i_id));
    Stock_S_QUANTITY := Stock_S_QUANTITY[s26_sup_w_id := Stock_S_QUANTITY[s26_sup_w_id][s26_i_id := s26_s#S_QUANTITY]];
  // Partition check hop 26 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 26) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s26_sup_w_id == s26_sup_w_id) && (s26_i_id == s26_i_id));
    Stock_S_REMOTE_CNT := Stock_S_REMOTE_CNT[s26_sup_w_id := Stock_S_REMOTE_CNT[s26_sup_w_id][s26_i_id := s26_s#S_REMOTE_CNT]];
  // Partition check hop 26 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 26) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s26_sup_w_id == s26_sup_w_id) && (s26_i_id == s26_i_id));
    Stock_S_W_ID := Stock_S_W_ID[s26_sup_w_id := Stock_S_W_ID[s26_sup_w_id][s26_i_id := s26_s#S_W_ID]];
  // Partition check hop 26 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 26) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s26_sup_w_id == s26_sup_w_id) && (s26_i_id == s26_i_id));
    Stock_S_YTD := Stock_S_YTD[s26_sup_w_id := Stock_S_YTD[s26_sup_w_id][s26_i_id := s26_s#S_YTD]];
  // Partition check hop 26 func 'h' tables 'Stock'=>'Stock' keys [k0=sup_w_id, k1=i_id] first_span Span { start: 5151, end: 5188, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 5684, end: 5725, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 17) (function_id . 31) (hop_id . 26) (table_id . 7) (span ((start . 5684) (end . 5725) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s26_sup_w_id == s26_sup_w_id) && (s26_i_id == s26_i_id));
    goto s26_hop_exit;
  s26_hop_exit:
  s27_block77:
    s27_#tmp254 := District_D_NEXT_O_ID[s27_w_id][s27_d_id];
    s27_d_next_oid := s27_#tmp254;
    s27_#tmp256 := s27_d_next_oid + 1;
    District_D_NEXT_O_ID := District_D_NEXT_O_ID[s27_w_id := District_D_NEXT_O_ID[s27_w_id][s27_d_id := s27_#tmp256]];
  // Partition check hop 27 func 'g' tables 'District'=>'District' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6005, end: 6068, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 1) (span ((start . 6005) (end . 6068) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_O_C_ID := Order_O_C_ID[s27_w_id := Order_O_C_ID[s27_w_id][s27_d_id := Order_O_C_ID[s27_w_id][s27_d_id][s27_d_next_oid := s27_c_id]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6103, end: 6295, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 4) (span ((start . 6103) (end . 6295) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_O_ENTRY_DATE := Order_O_ENTRY_DATE[s27_w_id := Order_O_ENTRY_DATE[s27_w_id][s27_d_id := Order_O_ENTRY_DATE[s27_w_id][s27_d_id][s27_d_next_oid := s27_date]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6103, end: 6295, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 4) (span ((start . 6103) (end . 6295) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_O_OL_CNT := Order_O_OL_CNT[s27_w_id := Order_O_OL_CNT[s27_w_id][s27_d_id := Order_O_OL_CNT[s27_w_id][s27_d_id][s27_d_next_oid := O_OL_CNT]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6103, end: 6295, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 4) (span ((start . 6103) (end . 6295) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_O_ALL_LOCAL := Order_O_ALL_LOCAL[s27_w_id := Order_O_ALL_LOCAL[s27_w_id][s27_d_id := Order_O_ALL_LOCAL[s27_w_id][s27_d_id][s27_d_next_oid := s27_o_all_local]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6103, end: 6295, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 4) (span ((start . 6103) (end . 6295) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    goto s27_block79;
  s27_block78:
    s27_#tmp257 := s27_ol_number < O_OL_CNT;
    if (s27_#tmp257) {
      goto s27_block79;
    } else {
      goto s27_block81;
    }
  s27_block79:
    s27_#tmp258 := get(s27_itemIDs, 0);
    s27_i_id := s27_#tmp258;
    s27_#tmp259 := get(s27_supplierWarehouseIDs, 0);
    s27_sup_w_id := s27_#tmp259;
    s27_#tmp260 := get(s27_orderQuantities, 0);
    s27_qty := s27_#tmp260;
    s27_#tmp261 := get(s27_prices, 0);
    s27_price := s27_#tmp261;
    Order_Line_OL_I_ID := Order_Line_OL_I_ID[s27_w_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid][0 := s27_i_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_SUPPLY_W_ID := Order_Line_OL_SUPPLY_W_ID[s27_w_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid][0 := s27_sup_w_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_QUANTITY := Order_Line_OL_QUANTITY[s27_w_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid][0 := s27_qty]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    s27_#tmp262 := real(s27_qty);
    s27_#tmp263 := s27_price * s27_#tmp262;
    s27_#tmp264 := int(s27_#tmp263);
    Order_Line_OL_AMOUNT := Order_Line_OL_AMOUNT[s27_w_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid][0 := s27_#tmp264]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    goto s27_block148;
  s27_block81:
    s27_#tmp266 := to_unit(s27_w_tax);
    goto s27_epilogue;
  s27_block148:
    s27_#tmp258 := get(s27_itemIDs, 1);
    s27_i_id := s27_#tmp258;
    s27_#tmp259 := get(s27_supplierWarehouseIDs, 1);
    s27_sup_w_id := s27_#tmp259;
    s27_#tmp260 := get(s27_orderQuantities, 1);
    s27_qty := s27_#tmp260;
    s27_#tmp261 := get(s27_prices, 1);
    s27_price := s27_#tmp261;
    Order_Line_OL_I_ID := Order_Line_OL_I_ID[s27_w_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid][1 := s27_i_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_SUPPLY_W_ID := Order_Line_OL_SUPPLY_W_ID[s27_w_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid][1 := s27_sup_w_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_QUANTITY := Order_Line_OL_QUANTITY[s27_w_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid][1 := s27_qty]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    s27_#tmp262 := real(s27_qty);
    s27_#tmp263 := s27_price * s27_#tmp262;
    s27_#tmp264 := int(s27_#tmp263);
    Order_Line_OL_AMOUNT := Order_Line_OL_AMOUNT[s27_w_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid][1 := s27_#tmp264]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    goto s27_block149;
  s27_block149:
    s27_#tmp258 := get(s27_itemIDs, 2);
    s27_i_id := s27_#tmp258;
    s27_#tmp259 := get(s27_supplierWarehouseIDs, 2);
    s27_sup_w_id := s27_#tmp259;
    s27_#tmp260 := get(s27_orderQuantities, 2);
    s27_qty := s27_#tmp260;
    s27_#tmp261 := get(s27_prices, 2);
    s27_price := s27_#tmp261;
    Order_Line_OL_I_ID := Order_Line_OL_I_ID[s27_w_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid][2 := s27_i_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_SUPPLY_W_ID := Order_Line_OL_SUPPLY_W_ID[s27_w_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid][2 := s27_sup_w_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_QUANTITY := Order_Line_OL_QUANTITY[s27_w_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid][2 := s27_qty]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    s27_#tmp262 := real(s27_qty);
    s27_#tmp263 := s27_price * s27_#tmp262;
    s27_#tmp264 := int(s27_#tmp263);
    Order_Line_OL_AMOUNT := Order_Line_OL_AMOUNT[s27_w_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid][2 := s27_#tmp264]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    goto s27_block150;
  s27_block150:
    s27_#tmp258 := get(s27_itemIDs, 3);
    s27_i_id := s27_#tmp258;
    s27_#tmp259 := get(s27_supplierWarehouseIDs, 3);
    s27_sup_w_id := s27_#tmp259;
    s27_#tmp260 := get(s27_orderQuantities, 3);
    s27_qty := s27_#tmp260;
    s27_#tmp261 := get(s27_prices, 3);
    s27_price := s27_#tmp261;
    Order_Line_OL_I_ID := Order_Line_OL_I_ID[s27_w_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid][3 := s27_i_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_SUPPLY_W_ID := Order_Line_OL_SUPPLY_W_ID[s27_w_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid][3 := s27_sup_w_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_QUANTITY := Order_Line_OL_QUANTITY[s27_w_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid][3 := s27_qty]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    s27_#tmp262 := real(s27_qty);
    s27_#tmp263 := s27_price * s27_#tmp262;
    s27_#tmp264 := int(s27_#tmp263);
    Order_Line_OL_AMOUNT := Order_Line_OL_AMOUNT[s27_w_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid][3 := s27_#tmp264]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    goto s27_block151;
  s27_block151:
    s27_#tmp258 := get(s27_itemIDs, 4);
    s27_i_id := s27_#tmp258;
    s27_#tmp259 := get(s27_supplierWarehouseIDs, 4);
    s27_sup_w_id := s27_#tmp259;
    s27_#tmp260 := get(s27_orderQuantities, 4);
    s27_qty := s27_#tmp260;
    s27_#tmp261 := get(s27_prices, 4);
    s27_price := s27_#tmp261;
    Order_Line_OL_I_ID := Order_Line_OL_I_ID[s27_w_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid][4 := s27_i_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_SUPPLY_W_ID := Order_Line_OL_SUPPLY_W_ID[s27_w_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid][4 := s27_sup_w_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_QUANTITY := Order_Line_OL_QUANTITY[s27_w_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid][4 := s27_qty]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    s27_#tmp262 := real(s27_qty);
    s27_#tmp263 := s27_price * s27_#tmp262;
    s27_#tmp264 := int(s27_#tmp263);
    Order_Line_OL_AMOUNT := Order_Line_OL_AMOUNT[s27_w_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid][4 := s27_#tmp264]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    goto s27_block152;
  s27_block152:
    s27_#tmp258 := get(s27_itemIDs, 5);
    s27_i_id := s27_#tmp258;
    s27_#tmp259 := get(s27_supplierWarehouseIDs, 5);
    s27_sup_w_id := s27_#tmp259;
    s27_#tmp260 := get(s27_orderQuantities, 5);
    s27_qty := s27_#tmp260;
    s27_#tmp261 := get(s27_prices, 5);
    s27_price := s27_#tmp261;
    Order_Line_OL_I_ID := Order_Line_OL_I_ID[s27_w_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid][5 := s27_i_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_SUPPLY_W_ID := Order_Line_OL_SUPPLY_W_ID[s27_w_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid][5 := s27_sup_w_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_QUANTITY := Order_Line_OL_QUANTITY[s27_w_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid][5 := s27_qty]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    s27_#tmp262 := real(s27_qty);
    s27_#tmp263 := s27_price * s27_#tmp262;
    s27_#tmp264 := int(s27_#tmp263);
    Order_Line_OL_AMOUNT := Order_Line_OL_AMOUNT[s27_w_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid][5 := s27_#tmp264]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    goto s27_block153;
  s27_block153:
    s27_#tmp258 := get(s27_itemIDs, 6);
    s27_i_id := s27_#tmp258;
    s27_#tmp259 := get(s27_supplierWarehouseIDs, 6);
    s27_sup_w_id := s27_#tmp259;
    s27_#tmp260 := get(s27_orderQuantities, 6);
    s27_qty := s27_#tmp260;
    s27_#tmp261 := get(s27_prices, 6);
    s27_price := s27_#tmp261;
    Order_Line_OL_I_ID := Order_Line_OL_I_ID[s27_w_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid][6 := s27_i_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_SUPPLY_W_ID := Order_Line_OL_SUPPLY_W_ID[s27_w_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid][6 := s27_sup_w_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_QUANTITY := Order_Line_OL_QUANTITY[s27_w_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid][6 := s27_qty]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    s27_#tmp262 := real(s27_qty);
    s27_#tmp263 := s27_price * s27_#tmp262;
    s27_#tmp264 := int(s27_#tmp263);
    Order_Line_OL_AMOUNT := Order_Line_OL_AMOUNT[s27_w_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid][6 := s27_#tmp264]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    goto s27_block154;
  s27_block154:
    s27_#tmp258 := get(s27_itemIDs, 7);
    s27_i_id := s27_#tmp258;
    s27_#tmp259 := get(s27_supplierWarehouseIDs, 7);
    s27_sup_w_id := s27_#tmp259;
    s27_#tmp260 := get(s27_orderQuantities, 7);
    s27_qty := s27_#tmp260;
    s27_#tmp261 := get(s27_prices, 7);
    s27_price := s27_#tmp261;
    Order_Line_OL_I_ID := Order_Line_OL_I_ID[s27_w_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid][7 := s27_i_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_SUPPLY_W_ID := Order_Line_OL_SUPPLY_W_ID[s27_w_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid][7 := s27_sup_w_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_QUANTITY := Order_Line_OL_QUANTITY[s27_w_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid][7 := s27_qty]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    s27_#tmp262 := real(s27_qty);
    s27_#tmp263 := s27_price * s27_#tmp262;
    s27_#tmp264 := int(s27_#tmp263);
    Order_Line_OL_AMOUNT := Order_Line_OL_AMOUNT[s27_w_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid][7 := s27_#tmp264]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    goto s27_block155;
  s27_block155:
    s27_#tmp258 := get(s27_itemIDs, 8);
    s27_i_id := s27_#tmp258;
    s27_#tmp259 := get(s27_supplierWarehouseIDs, 8);
    s27_sup_w_id := s27_#tmp259;
    s27_#tmp260 := get(s27_orderQuantities, 8);
    s27_qty := s27_#tmp260;
    s27_#tmp261 := get(s27_prices, 8);
    s27_price := s27_#tmp261;
    Order_Line_OL_I_ID := Order_Line_OL_I_ID[s27_w_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid][8 := s27_i_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_SUPPLY_W_ID := Order_Line_OL_SUPPLY_W_ID[s27_w_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid][8 := s27_sup_w_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_QUANTITY := Order_Line_OL_QUANTITY[s27_w_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid][8 := s27_qty]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    s27_#tmp262 := real(s27_qty);
    s27_#tmp263 := s27_price * s27_#tmp262;
    s27_#tmp264 := int(s27_#tmp263);
    Order_Line_OL_AMOUNT := Order_Line_OL_AMOUNT[s27_w_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid][8 := s27_#tmp264]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    goto s27_block156;
  s27_block156:
    s27_#tmp258 := get(s27_itemIDs, 9);
    s27_i_id := s27_#tmp258;
    s27_#tmp259 := get(s27_supplierWarehouseIDs, 9);
    s27_sup_w_id := s27_#tmp259;
    s27_#tmp260 := get(s27_orderQuantities, 9);
    s27_qty := s27_#tmp260;
    s27_#tmp261 := get(s27_prices, 9);
    s27_price := s27_#tmp261;
    Order_Line_OL_I_ID := Order_Line_OL_I_ID[s27_w_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_I_ID[s27_w_id][s27_d_id][s27_d_next_oid][9 := s27_i_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_SUPPLY_W_ID := Order_Line_OL_SUPPLY_W_ID[s27_w_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_SUPPLY_W_ID[s27_w_id][s27_d_id][s27_d_next_oid][9 := s27_sup_w_id]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    Order_Line_OL_QUANTITY := Order_Line_OL_QUANTITY[s27_w_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_QUANTITY[s27_w_id][s27_d_id][s27_d_next_oid][9 := s27_qty]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    s27_#tmp262 := real(s27_qty);
    s27_#tmp263 := s27_price * s27_#tmp262;
    s27_#tmp264 := int(s27_#tmp263);
    Order_Line_OL_AMOUNT := Order_Line_OL_AMOUNT[s27_w_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid := Order_Line_OL_AMOUNT[s27_w_id][s27_d_id][s27_d_next_oid][9 := s27_#tmp264]]]];
  // Partition check hop 27 func 'g' tables 'District'=>'Order_Line' keys [k0=w_id, k1=d_id] first_span Span { start: 5880, end: 5926, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" } current_span Span { start: 6930, end: 7207, filename: "/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact" }
    assert {:msg "(PartitionFunctionInconsistency (partition_function_id . 16) (function_id . 31) (hop_id . 27) (table_id . 5) (span ((start . 6930) (end . 7207) (filename . \"/Users/farzad/Desktop/Research/benchbase-transact/tpcc.transact\"))))"} ((s27_w_id == s27_w_id) && (s27_d_id == s27_d_id));
    goto s27_block81;
  s27_hop_exit:
  s16_epilogue:
  s17_epilogue:
  s18_epilogue:
  s19_epilogue:
  s20_epilogue:
  s21_epilogue:
  s22_epilogue:
  s23_epilogue:
  s24_epilogue:
  s25_epilogue:
  s26_epilogue:
  s27_epilogue:
}

