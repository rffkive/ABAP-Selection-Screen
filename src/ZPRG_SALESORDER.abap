*&---------------------------------------------------------------------*
*& Report ZPRG_SALESORDER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZPRG_SALESORDER.

DATA: lv_erdat TYPE erdat,
      lv_ernam TYPE ernam.


SELECTION-SCREEN: BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-000. "never hard code text symbol by writing the text. use code: text-000 so it can be used for other language as well and best practice.
  SELECT-OPTIONS: s_erdat FOR lv_Erdat NO-EXTENSION.
  SELECT-OPTIONS: s_ernam FOR lv_ernam NO INTERVALS NO-EXTENSION.
SELECTION-SCREEN: END OF BLOCK b1.
