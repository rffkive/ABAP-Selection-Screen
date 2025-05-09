# Business Requirement Document – Sales Order Report

## Objective

Develop an ABAP Report to display Sales Orders based on Creation Date and Username, with capabilities to preview the report using both Smartforms and Adobe Forms.

---

## Functional Requirements

- Filter sales orders by Creation Date (ERDAT) and Created By (ERNAM).
- Display report output in ALV format using FM: `REUSE_ALV_GRID_DISPLAY`.
- Add 2 custom buttons in the ALV toolbar:
  - One to generate output in Smartform.
  - One to generate output in Adobe Form.
- Enable Print Preview functionality via Smartform and Adobe Form.

---

## Technical Overview

| Item                          | Description                          |
|-------------------------------|--------------------------------------|
| Object Type                   | Report                               |
| Object Name                   | ZPRG_SALES_ORDER_REPORT              |
| Package Name                  | ZPKG_SALES_REPORTING                 |
| Transaction Code              | ZTC_SALES_REPORT                     |
| Type of Requirement           | New                                  |
| Development Priority          | Medium                               |
| Functional Consultant         | <Name of the Functional Consultant>  |
| Developer                     | rffkive                              |

---

## Program Logic

1. Fetch Sales Document Numbers (VBELN) from table VBAK based on ERDAT and ERNAM.
2. Join VBAP on VBELN to retrieve:
   - POSNR (Line Item)
   - MATNR (Material Number)
   - KWMENG (Order Quantity)
   - VRKME (UoM)
3. Join MAKT on MATNR to get MAKTX (Material Description).
4. Display the output in ALV Grid.
5. Implement PF-STATUS with 2 buttons:
   - Button 1: Call Smartform
   - Button 2: Call Adobe Form
6. Pass report data to both Smartform and Adobe Form.
7. Create a message class for system/user messages.

---

## Output Format

The report output will be in ALV with buttons to preview in:
- 📄 Smartform
- 🧾 Adobe Form

---

## To Be Developed

- ABAP Report: ZPRG_SALES_ORDER_REPORT
- Smartform: ZSF_SALES_ORDER
- Adobe Form: ZSFP_SALES_ORDER
- PF-STATUS for buttons
- Message Class: ZMSG_SALES_ORDER

