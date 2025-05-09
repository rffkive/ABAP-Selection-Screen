# SAP ABAP Naming Conventions

This document defines the naming conventions used in the Sales Order Report project.

---

## Object Naming

| Object Type           | Format                  | Example                          |
|-----------------------|-------------------------|----------------------------------|
| Package               | ZPKG_<name>             | ZPKG_SALES_REPORTING             |
| Program               | ZPRG_<name>             | ZPRG_SALES_ORDER_REPORT          |
| Include               | ZIN_<name>              | ZIN_SALES_ORDER_HELPER           |
| Smartform             | ZSF_<name>              | ZSF_SALES_ORDER                  |
| Smartstyle            | ZSS_<name>              | ZSS_STANDARD_STYLE               |
| Adobe Form            | ZSFP_<name>             | ZSFP_SALES_ORDER                 |
| Transaction Code      | ZTC_<name>              | ZTC_SALES_REPORT                 |
| Message Class         | ZMSG_<name>             | ZMSG_SALES_ORDER                 |
| Function Group        | ZFG_<name>              | ZFG_SALES_UTILS                  |
| Function Module       | ZFM_<name>              | ZFM_GET_SALES_DATA               |
| Class                 | ZCL_<name>              | ZCL_SALES_ORDER_HELPER           |
| Interface             | ZIF_<name>              | ZIF_SALES_HANDLER                |
| Structure             | ZSTR_<name>             | ZSTR_SALES_OUTPUT                |
| Table Type            | ZTT_<name>              | ZTT_SALES_VBELN                  |
| Table                 | ZT<name>                | ZTSALES                          |

---

## Variable Naming

| Type           | Prefix        | Example               |
|----------------|---------------|-----------------------|
| Parameters     | P_            | P_START_DATE          |
| Select-Options | S_            | S_USER_NAME           |
| Internal Table | LT_           | LT_VBAK               |
| Work Area      | LWA_          | LWA_VBAP              |
| Variables      | LV_           | LV_COUNT              |
| Object Ref     | LO_           | LO_FORM_HELPER        |

---

By following this standard, code remains maintainable, readable, and SAP-aligned.
