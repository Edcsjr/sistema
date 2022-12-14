<?php
/***************************************************************************
*                                                                          *
*   (c) 2004 Vladimir V. Kalynyak, Alexey V. Vinokurov, Ilya M. Shalnev    *
*                                                                          *
* This  is  commercial  software,  only  users  who have purchased a valid *
* license  and  accept  to the terms of the  License Agreement can install *
* and use this program.                                                    *
*                                                                          *
****************************************************************************
* PLEASE READ THE FULL TEXT  OF THE SOFTWARE  LICENSE   AGREEMENT  IN  THE *
* "copyright.txt" FILE PROVIDED WITH THIS DISTRIBUTION PACKAGE.            *
****************************************************************************/

if (!defined('BOOTSTRAP')) { die('Access denied'); }

fn_define('SEO_FILENAME_EXTENSION', '.html');
fn_define('SEO_RUNTIME_CACHE_COUNT', 10000);

fn_register_hooks(
    'url_post',
    'get_route',
    'init_language_post',
    'compare_dispatch',

    'update_category_post',
    'get_category_data',
    'get_category_data_post',
    'get_categories',
    'get_categories_post',
    'delete_category_before',
    'delete_category_after',
    'update_category_parent_pre',
    'update_category_parent_post',

    'update_product_post',
    'additional_fields_in_search',
    'load_products_extra_data',
    'load_products_extra_data_post',
    'get_product_data',
    'get_product_data_post',
    'delete_product_post',
    'update_product_categories_post',

    'update_page_post',
    'get_pages',
    'pre_get_page_data',
    'get_page_data',
    'post_get_pages',
    'delete_page',
    'update_page_parent_pre',
    'update_page_parent_post',

    'get_product_feature_variants',
    'get_product_feature_variants_post',
    'update_product_feature_post',
    'delete_product_feature_variants_post',

    'delete_languages_post',
    'update_language_post',

    'dispatch_before_display',

    'varnish_generate_vcl_pre',

    'exim_set_product_categories_post',
    'import_product_descr_post',
    'ajax_destruct_before_response'
);

if (fn_allowed_for('ULTIMATE')) {
    fn_register_hooks(
        'ult_delete_company',
        'check_and_update_product_sharing'
    );
}
if (fn_allowed_for('MULTIVENDOR')) {
    fn_register_hooks(
        'update_company',
        'get_companies',
        'get_company_data',
        'get_company_data_post',
        'delete_company'
    );
}

fn_init_stack(array('fn_seo_check_dispatch', &$_REQUEST));
