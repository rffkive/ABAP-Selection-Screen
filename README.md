# ABAP Sales Order Report – ZPRG_SALESORDER

This ABAP report displays Sales Orders based on creation date and username, supports ALV grid output, and integrates Smartform and Adobe form for print preview.

## 🚀 Features

- ALV Report (REUSE_ALV_GRID_DISPLAY)
- Filter by creation date and username
- Smartform and Adobe Form integration
- Custom PF-STATUS with toolbar buttons
- Message class support

## 📂 Object Overview

| Object Type    | Name             |
|----------------|------------------|
| Program        | ZPRG_XXXX        |
| Package        | ZPKG_XXXX        |
| Transaction    | ZTC_XXXX         |
| Smartform      | ZSF_XXXX         |
| Adobe Form     | ZSFP_XXXX        |
| Message Class  | ZMSG_XXXX        |

## 🧠 Logic

1. Fetch VBELN from VBAK using ERDAT and ERNAM
2. Join with VBAP to get POSNR, MATNR, KWMENG, VRKME
3. Join with MAKT to get MAKTX
4. Display in ALV
5. Add two buttons in ALV for Smartform & Adobe form output
6. Integrate form calls and message handling

## 📝 Naming Conventions

Refer to [naming-convention.md](naming-convention.md)

## 📄 Business Requirement

Detailed requirement in [`docs/business-requirement.md`](docs/business-requirement.md)

## Support and Maintenance
For questions or issues with this program:
- Refer to the code documentation within the program
- Contact the project developer via the support system
