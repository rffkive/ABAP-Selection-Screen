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
| ERDAT  | `ZTT_ERDAT` | Creation Dates (table type)      |
| ERNAM  | `ZTT_ERNAM` | Created by Users (table type)    |

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

Logic: Source Code: 

```abap
FUNCTION zfm_salesorder.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(ERDAT) TYPE  ZTT_ERDAT
*"     REFERENCE(ERNAM) TYPE  ZTT_ERNAM
*"  EXPORTING
*"     REFERENCE(LT_OUTPUT) TYPE  ZTT_OUTPUT
*"----------------------------------------------------------------------
  TYPES : BEGIN OF lty_vbak, "table declaration for vbak.
            vbeln TYPE vbeln_va,
          END OF lty_vbak.

  DATA : lt_vbak TYPE TABLE OF lty_vbak. "local internal table for vbak
  DATA : lwa_vbak TYPE lty_vbak. "local work area for vbak

  TYPES: BEGIN OF lty_vbap, "same with vbak.
          vbeln TYPE vbeln_va,
          posnr TYPE posnr_va,
          matnr TYPE matnr,
          kwmeng TYPE kwmeng,
          vrkme TYPE vrkme,
         END OF lty_vbap.

  DATA: lt_vbap TYPE TABLE OF lty_vbap,
        lw_vbap TYPE lty_vbap.

  TYPES: BEGIN OF lty_maktx, "same with vbak
          matnr TYPE matnr,
          maktx TYPE maktx,
         END OF lty_maktx.

  DATA: lt_maktx TYPE TABLE OF lty_maktx,
        lwa_maktx TYPE lty_maktx.

ENDFUNCTION.
```
