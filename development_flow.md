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

#### 📥 Import Parameters

| Name   | Type        | Description                      |
|--------|-------------|----------------------------------|
| ERDAT  | `ZTT_ERDAT` | Creation Dates (table type)      |
| ERNAM  | `ZTT_ERNAM` | Created by Users (table type)    |

> 🧩 *Note:*  
> If the table types `ZTT_ERDAT` and `ZTT_ERNAM` do not exist:  
> - Create structures `ZSTR_ERDAT`, `ZSTR_ERNAM`  
> - Create table types `ZTT_ERDAT`, `ZTT_ERNAM` referencing those structures

---

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
---

#### 📋 Table Type

- **Table Type Name:** `ZTT_OUTPUT`
- - **Line Type:** `ZSTR_OUTPUT`

---

#### 🔁 Function Module Output

| Name       | Type        | Description                          |
|------------|-------------|--------------------------------------|
| ZT_OUTPUT  | `ZTT_OUTPUT`| Output table of Sales Order results  |
