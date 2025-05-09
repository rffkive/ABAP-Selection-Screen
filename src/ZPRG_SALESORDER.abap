*&---------------------------------------------------------------------*
*& Report ZPRG_SALESORDER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZPRG_SALESORDER.

DATA: lv_erdat TYPE erdat,
      lv_ernam TYPE ernam.


SELECT-OPTIONS: s_erdat FOR lv_Erdat.
SELECT-OPTIONS: s_ernam FOR lv_ernam.
