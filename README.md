# ZPURCHASE_ORDER_REPORT

## SAP ABAP Capstone Project: Purchase Order Reporting Solution

This project implements a comprehensive Purchase Order reporting solution using SAP ABAP featuring:
- Interactive ALV GRID Report
- Smartform output
- Adobe form output
- Custom transaction code

## Functional Specifications

### Selection Screen
The selection screen provides input fields for:
- PO Number (EKKO-EBELN)
- Creation Date (EKKO-AEDAT) - mandatory field

**Implementation Notes:**
- Selection screen built using SELECT-OPTIONS instead of PARAMETERS
- Screen layout matches exactly the design specifications
- Form validation ensures mandatory fields are populated

### ALV Output Screen
The ALV output displays Purchase Order data with the following columns:
- PO Number (EKKO-EBELN)
- Line Item (EKPO-EBELP)
- Created On (EKKO-AEDAT)
- Material (EKPO-MATNR)
- Material Description (MAKT-MAKTX)
- Net Price (EKPO-NETPR)
- Created By (EKKO-ERNAM)

**Implementation Details:**
- Uses function module REUSE_ALV_GRID_DISPLAY with manual fieldcatalog
- Custom page header using TOP-OF-PAGE and REUSE_ALV_COMMENTARY_WRITE
- Custom PF-STATUS with application toolbar buttons
- BACK button functionality to return to selection screen
- Error handling with appropriate message display when no data found

### Custom Toolbar Buttons
Two custom buttons implemented in the application toolbar:
1. **Ascending** button (shortcut: Shift+F1) - triggers Smartform output
2. **Descending** button (shortcut: Shift+F2) - triggers Adobe form output

### Form Outputs
1. **Smartform**
   - Triggered by Ascending button
   - Displays PO data in a formatted document

2. **Adobe Form**
   - Triggered by Descending button
   - Displays same PO data with Adobe form formatting

## Technical Implementation

### Program Components
- Main report program (ZPURCHASE_ORDER_REPORT)
- Custom transaction code (Z_PO_REPORT)
- Associated Smartform (Z_PO_SMARTFORM)
- Associated Adobe form (Z_PO_ADOBE_FORM)

### Database Tables Used
- EKKO (Purchase Order Header)
- EKPO (Purchase Order Items)
- MAKT (Material Description)

### Function Modules Used
- REUSE_ALV_GRID_DISPLAY
- REUSE_ALV_COMMENTARY_WRITE
- SSF_FUNCTION_MODULE_NAME (for Smartform)
- FP_JOB_OPEN/FP_FUNCTION_MODULE_NAME (for Adobe Forms)

### Program Flow
1. User enters selection criteria on selection screen
2. Program validates input and retrieves data from database
3. Data is displayed in ALV GRID format
4. User can:
   - Return to selection screen via BACK button
   - Generate Smartform output via Ascending button (Shift+F1)
   - Generate Adobe form output via Descending button (Shift+F2)
5. Error handling displays appropriate messages

## Installation and Usage

### Installation
1. Create the ABAP program ZPURCHASE_ORDER_REPORT
2. Create the Smartform Z_PO_SMARTFORM
3. Create the Adobe form Z_PO_ADOBE_FORM
4. Create transaction code Z_PO_REPORT

### Usage
1. Launch transaction Z_PO_REPORT
2. Enter PO Number (optional) and Creation Date (mandatory)
3. Execute the report
4. View ALV output
5. Use buttons or shortcuts to generate Smartform/Adobe outputs

## Development Notes
- Program developed according to SAP best practices
- Custom PF-STATUS created for specific button functionality
- Error handling implemented for all edge cases
- Data displayed is retrieved from the system's actual database

## Support and Maintenance
For questions or issues with this program:
- Refer to the code documentation within the program
- Contact the project developer via the support system
