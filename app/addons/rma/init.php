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

Tygh::$app->register(new \Tygh\Addons\Rma\ServiceProvider());

fn_register_hooks(
    'delete_gift_certificate',
    'get_order_info',
    'change_order_status',
    'get_product_data',
    'add_to_cart',
    'get_status_params_definition',
    'delete_order',
    'paypal_get_ipn_order_ids',
    'reorder_product',
    'form_cart_pre_fill',
    'is_cart_empty',
    'update_product_pre'
);
