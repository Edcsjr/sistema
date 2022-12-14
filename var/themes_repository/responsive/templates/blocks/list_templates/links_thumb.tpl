<div class="ty-thumbnail-list">
    {foreach from=$products item="product" name="products"}
        {assign var="obj_id" value=$product.product_id}
        {assign var="obj_id_prefix" value="`$obj_prefix``$product.product_id`"}
        {include file="common/product_data.tpl" product=$product}
        {hook name="products:product_thumbnail_list"}
        <div class="ty-thumbnail-list__item">
            {assign var="form_open" value="form_open_`$obj_id`"}
            {$smarty.capture.$form_open nofilter}
            <a class="ty-thumbnail-list__img-block" href="{"products.view?product_id=`$product.product_id`"|fn_url}">{include file="common/image.tpl" image_width="70" image_height="70" images=$product.main_pair obj_id=$obj_id_prefix no_ids=true class="ty-thumbnail-list__img"}</a>
            <div class="ty-thumbnail-list__name">{if $block.properties.item_number == "Y"}{$smarty.foreach.products.iteration}.&nbsp;{/if}
            {assign var="name" value="name_$obj_id"}<bdi>{$smarty.capture.$name nofilter}</bdi></div>

            {assign var="old_price" value="old_price_`$obj_id`"}
            {if $smarty.capture.$old_price|trim}{$smarty.capture.$old_price nofilter}&nbsp;{/if}
            
            {assign var="price" value="price_`$obj_id`"}
            {$smarty.capture.$price nofilter}

            {if $show_add_to_cart}
                <div class="ty-thumbnail-list__butons">
                    {assign var="add_to_cart" value="add_to_cart_`$obj_id`"}
                    {$smarty.capture.$add_to_cart nofilter}
                </div>
            {/if}

            {hook name="products:product_list_form_close_tag"}
                {$form_close="form_close_`$obj_id`"}
                {$smarty.capture.$form_close nofilter}
            {/hook}
        </div>
        {/hook}
    {/foreach}
</div>