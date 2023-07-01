CLASS z2ui5_cl_demo_mustache DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES z2ui5_if_app.

    TYPES:
      BEGIN OF ty_S_button,
        text  TYPE string,
        ucomm TYPE string,
      END OF ty_S_button.
    TYPES ty_T_button TYPE STANDARD TABLE OF ty_S_button WITH EMPTY KEY.

    TYPES:
      BEGIN OF ty_S_table,
        name     TYPE string,
        icon     TYPE string,
        progress TYPE string,
        state    TYPE string,
        descr    TYPE string,
      END OF ty_S_table.
    TYPES ty_T_table TYPE STANDARD TABLE OF ty_S_table WITH EMPTY KEY.

    TYPES:
      BEGIN OF ty_s_view,
        title     TYPE string,
        t_header  TYPE ty_t_button,
        title_tab TYPE string,
        t_table   TYPE ty_t_table,
        t_footer  TYPE ty_t_button,
      END OF ty_s_view.

  PRIVATE SECTION.
ENDCLASS.



CLASS z2ui5_cl_demo_mustache IMPLEMENTATION.

  METHOD z2ui5_if_app~main.

    CASE client->get( )-event.
      WHEN `INFO`.
        client->message_box_display( `Information` ).
      WHEN `USER`.
        client->message_box_display( `User` ).
      WHEN `POST`.
        client->message_box_display( `Post sent to the server` ).
    ENDCASE.


    DATA(ls_view) = VALUE ty_s_view(
        title = `UI5 View created with Mustache`
        t_header = VALUE #(
           ( text = `User` ucomm = client->_event( `USER` ) )
           ( text = `Info` ucomm = client->_event( `INFO` ) )
        )
        title_tab = `List Control`
        t_table = VALUE #(
           ( name = `Theo`  state = `Success` progress = `90` icon = `sap-icon://accelerated` descr = `Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed...` )
           ( name = `Sarah` state = `None`    progress = `40` icon = `sap-icon://account`     descr = `Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed...` )
        )
        t_footer = VALUE #(
           ( text = `Cancel` ucomm = client->_event( `CANCEL` ) )
           ( text = `Post`   ucomm = client->_event( `POST` ) )
        )
        ).

    DATA(lo_mustache) = zcl_mustache=>create(
        `<mvc:View controllerName="z2ui5_controller" xmlns="sap.m" xmlns:mvc="sap.ui.core.mvc" xmlns:core="sap.ui.core" >` &&
        `<Shell><Page title="{{title}}">` &&
        `<headerContent>{{#t_header}}<Button text="{{text}}" press="{{ucomm}}"/>{{/t_header}}</headerContent>` &&
        `<content><List headerText="{{title_tab}}">{{#t_table}}<CustomListItem>` &&
            `<core:Icon size="2rem" src="{{icon}}" class="sapUiSmallMarginBegin sapUiSmallMarginTopBottom" />` &&
            `<Title text="{{name}}" class="sapUiSmallMarginBegin sapUiSmallMarginTopBottom" />` &&
            `<ProgressIndicator class="sapUiSmallMarginBegin sapUiSmallMarginTopBottom" percentValue="{{progress}}" showValue="true" state="{{state}}" />` &&
            `<Text text="{{descr}}" class="sapUiSmallMarginBegin sapUiSmallMarginTopBottom" />` &&
        `</CustomListItem>{{/t_table}}</List></content>` &&
        `<footer><OverflowToolbar><ToolbarSpacer/>{{#t_footer}}<Button text="{{text}}" press="{{ucomm}}"/>{{/t_footer}}</OverflowToolbar></footer>` &&
        `</Page></Shell></mvc:View>`
     ).

    client->view_display( lo_mustache->render( ls_view ) ).

  ENDMETHOD.

ENDCLASS.
