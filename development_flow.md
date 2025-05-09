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
