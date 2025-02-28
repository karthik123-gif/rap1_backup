CLASS zmst1009_webapi DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    INTERFACES if_rap_query_provider .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmst1009_webapi IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*
  ENDMETHOD.


  METHOD if_rap_query_provider~select.
*
DATA:
  lt_business_data TYPE TABLE OF zweb_api=>tys_sepmra_i_product_etype,
  lo_http_client   TYPE REF TO if_web_http_client,
  lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
  lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
  lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

DATA(top)     = io_request->get_paging( )->get_page_size( ).
    DATA(skip)    = io_request->get_paging( )->get_offset( ).
    DATA(requested_fields)  = io_request->get_requested_elements( ).
    DATA(sort_order)    = io_request->get_sort_elements( ).

     TRY.
     DATA(lo_http_dest) = cl_http_destination_provider=>create_by_url( i_url = 'https://sapes5.sapdevcenter.com' ).
 lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_http_dest ).
     lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
       EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZWEB_API'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/zpdcds_srv' ).

     ASSERT lo_http_client IS BOUND.


" Navigate to the resource and create a request for the read operation
lo_request = lo_client_proxy->create_resource_for_entity_set( 'SEPMRA_I_PRODUCT_E' )->create_request_for_read( ).

if io_request->is_data_requested(  ) = abap_true.
  lo_request->set_skip( CONV i( skip ) ).
  if top > 0.
  lo_request->set_skip( CONV i( skip ) ).
  ENDIF.
 ENDIF.
if io_request->is_total_numb_of_rec_requested( ) = abap_true.
lo_request->request_count(  ).
ENDIF.

lo_request->set_top( 20 )->set_skip( 0 ).

" Execute the request and retrieve the business data
lo_response = lo_request->execute( ).
lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

if io_request->is_total_numb_of_rec_requested( ).
io_response->set_total_number_of_records(  lo_response->get_count(  ) ).
ENDIF.

if io_request->is_data_requested( ).
io_response->set_data(  lt_business_data ).
ENDIF.

CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
" Handle remote Exception
" It contains details about the problems of your http(s) connection

CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
" Handle Exception

CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
" Handle Exception
RAISE SHORTDUMP lx_web_http_client_error.


  CATCH cx_http_dest_provider_error.
    "handle exception
ENDTRY.

  ENDMETHOD.

ENDCLASS.
