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

## 4. Create Function Module

- Transaction: SE37
- Program Name: ZFM_sALESORDER
- Description: Function Module for Sales order Display

 Import:

| ERDAT | TYPE | ZTT_ERDAT |
| ERNAM | TYPE | ZTT_ERNAM | *get the table type for both erdat and erdat. if it doesnt exist. create the structure and the table type.

Output:

- Create an output structure that will contain all column of the output, ZSTR_OUTPUT.

|VBELN|VBELN_VA|
|POSNR|POSNR_VA|
|MATNR|MANTR|
|MAKTX|MAKTX|
|KWMENG|KWMENG| *don't forget to ref table: ZSTR_OUTPUT ref field: VRKME
|VRPKME|VRKME|

- Create a table type for Output, ZTT_OUTPUT

  Line Type: ZSTR_OUTPUT

  - Lastly put in output section in FM_SALESORDER
 
| ZT_OUTPUT | TYPE | ZTT_OUTPUT |
