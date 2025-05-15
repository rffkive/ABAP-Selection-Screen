# Development Flow – Sales Order Report

This document outlines the step-by-step technical flow for creating the custom Sales Order Report in SAP ABAP.

---

## 1. Create Transport Request

- Transaction: SE09
- Type: Workbench Request
- Description: Sales Order Report Development
- Request Number: S4AK900514

---

## 2. Create Package

- Transaction: SE80
- Package Name: ZPKG_SALESORDER
- Purpose: To group all related development objects (report, forms, function modules, etc.)

---

## 3. Create Program

- Transaction: SE38 (or SE80 > Program)
- Program Name: ZPRG_SALESORDER
- Package Assignment: ZPKG_SALESORDER
- Description: Custom ABAP Report to Display Sales Orders

---

## 4. Create Function Module

- Transaction: SE37
- Program Name: ZFM_sALESORDER
- Description: Function Module for Sales order Display

#### 📥 Import Parameters

| Name   | Type        | Description                      |
|--------|-------------|----------------------------------|
| SERDAT  | `ZTT_ERDAT` | Creation Dates (table type)      |
| SERNAM  | `ZTT_ERNAM` | Created by Users (table type)    |

> 🧩 *Note:*  
> If the table types `ZTT_ERDAT` and `ZTT_ERNAM` do not exist:  
> - Create structures `ZSTR_ERDAT`, `ZSTR_ERNAM`  
> - Create table types `ZTT_ERDAT`, `ZTT_ERNAM` referencing those structures

#### 📤 Output Structure

- **Structure Name:** `ZSTR_OUTPUT`

| Field     | Reference Table | Description               |
|-----------|------------------|---------------------------|
| VBELN     | `VBELN_VA`       | Sales Document Number     |
| POSNR     | `POSNR_VA`       | Item Number               |
| MATNR     | `MATNR`          | Material Number           |
| MAKTX     | `MAKTX`          | Material Description      |
| KWMENG    | `KWMENG`         | Order Quantity            |
| VRKME     | `VRKME`          | Sales Unit                |

- notes: Be sure to reference the **table** `ZSTR_OUTPUT` and the **field** `KWMENG` during structure creation to ensure domain consistency and unit integration with `VRKME`.
  
#### 📋 Table Type

- **Table Type Name:** `ZTT_OUTPUT`
- - **Line Type:** `ZSTR_OUTPUT`

#### 🔁 Function Module Output

| Name       | Type        | Description                          |
|------------|-------------|--------------------------------------|
| ZT_OUTPUT  | `ZTT_OUTPUT`| Output table of Sales Order results  |

#### Logic [Source Code]: 

```abap
FUNCTION zfm_salesorder.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(SERDAT) TYPE  ZTT_ERDAT
*"     REFERENCE(SERNAM) TYPE  ZTT_ERNAM
*"  EXPORTING
*"     REFERENCE(LT_OUTPUT) TYPE  ZTT_OUTPUT
*"----------------------------------------------------------------------
  TYPES : BEGIN OF lty_vbak,
            vbeln TYPE vbeln_va,
          END OF lty_vbak.

  DATA : lt_vbak TYPE TABLE OF lty_vbak.
  DATA : lwa_vbak TYPE lty_vbak.

  TYPES: BEGIN OF lty_vbap,
          vbeln TYPE vbeln_va,
          posnr TYPE posnr_va,
          matnr TYPE matnr,
          kwmeng TYPE kwmeng,
          vrkme TYPE vrkme,
         END OF lty_vbap.

  DATA: lt_vbap TYPE TABLE OF lty_vbap,
        lt_temp_vbap TYPE TABLE OF lty_vbap,
        lw_vbap TYPE lty_vbap.

  TYPES: BEGIN OF lty_makt,
          matnr TYPE matnr,
          maktx TYPE maktx,
         END OF lty_makt.

  DATA: lt_makt TYPE TABLE OF lty_makt,
        lwa_makt TYPE lty_makt.

  SELECT vbeln
    FROM vbak
    INTO TABLE @lt_vbak
    WHERE erdat IN @serdat
    AND ernam IN @sernam.

  IF lt_vbak IS NOT INITIAL.
    SELECT vbeln,
            posnr,
            matnr,
            kwmeng,
            vrkme
      FROM vbap INTO TABLE @lt_vbap
      FOR ALL ENTRIES IN @lt_vbak "don't use JOIN
      WHERE vbeln = @lt_vbak-vbeln.
  ENDIF.

  IF lt_vbap IS NOT INITIAL.
    lt_temp_vbap = lt_vbap.
    SORT lt_temp_vbap BY MATNR. "create temporary table for it vbap and delete duplicates of matnr to improve performance
    DELETE ADJACENT DUPLICATES FROM lt_temp_vbap COMPARING matnr.
      SELECT matnr, maktx
        FROM makt
        INTO TABLE @lt_makt
        FOR ALL ENTRIES IN @lt_temp_vbap
        WHERE matnr = @lt_temp_vbap-matnr.
  ENDIF.
ENDFUNCTION.
```

---

## 5. add language for others through mm02.

- Transaction: mm02.
- choose material (Example 42 for Iron) > go to additional data > add the language depending on your clients.

for example: 
|material|description|
|--------|-----------|
|EN|Iron|
|DE|Eisen|

adjust the logic to make sure that the entries will only chosen based on the language of the system.

```abap
 TYPES: BEGIN OF lty_makt,
           matnr TYPE matnr,
           spras TYPE spras, "new addition for language
           maktx TYPE maktx,
         END OF lty_makt.
```

```abap
IF lt_vbap IS NOT INITIAL.
    lt_temp_vbap = lt_vbap.
    SORT lt_temp_vbap BY matnr. "create temporary table for it vbap and delete duplicates of matnr to improve performance
    DELETE ADJACENT DUPLICATES FROM lt_temp_vbap COMPARING matnr.
    SELECT matnr, spras, maktx "new addition to select language from the logic
      FROM makt
      INTO TABLE @lt_makt
      FOR ALL ENTRIES IN @lt_temp_vbap
      WHERE matnr = @lt_temp_vbap-matnr
      AND spras = sy-langu. "new addition to select only the language based on the system's default languag
  ENDIF.
```

---

## 6. add logic to read the program.

```abap
FUNCTION ZFM_SALESORDER.
--rest of the program.

ENDIF.

  SORT it_makt BY matnr. "pre-requisite before using binary search 
  
  LOOP AT lt_vbak INTO lwa_vbak. "first records will use loop
    LOOP AT lt_vbap INTO lwa_vbap WHERE vbeln = lwa_vbak-vbeln. "multiple items in the table require loop 
      READ TABLE it_makt INTO lwa_makt WITH KEY matnr = lwa_vbap-matnr BINARY SEARCH. "only one record better use read table instead of loop to avoid nested loop
      IF SY-SUBRC = 0.
        ENDIF.
      ENDLOOP.
    ENDLOOP.

ENDFUNCTION
```
