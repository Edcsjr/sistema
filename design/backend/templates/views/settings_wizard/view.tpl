{if !"AJAX_REQUEST"|defined}{capture name="mainbox"}{/if}

<form name="settings_wizard_form" method="post" action="{""|fn_url}" class="cm-ajax cm-ajax-force form-edit form-setting" data-ca-target-id="settings_wizard">
    <input type="hidden" name="return_url" value="{$return_url}">

    <div id="settings_wizard">
        <input type="hidden" name="current_step" value="{$current_step}">

        <div class="form-horizontal">
            {$_settings = []}
            {foreach from=$step_data.items item="item"}
                {if $item.type == "header"}
                    <h4>{__($item.text, $item.placeholders)}</h4>

                {elseif $item.type == "text"}
                    <p>{__($item.text, $item.placeholders)}</p>

                {elseif $item.type == "template"}
                    <p>{include file=$item.template}</p>

                {elseif $item.type == "setting"}
                    {$_settings.{$item.setting_data.object_id} = $item.setting_data}
                {elseif $item.type == "addon"}
                    {$addon=$wizard_addons[$item.addon_name]}
                    <div class="table-responsive-wrapper">
                    <table class="table table-addons table-wizard table--relative table-responsive table-responsive-w-titles">
                        <tr>
                            <td class="addon-icon" data-th="&nbsp;">
                                <div class="bg-icon">
                                    {if $addon.has_icon}
                                        <img src="{$images_dir}/addons/{$item.addon_name}/icon.png" width="38" height="38" border="0" alt="{$addon.name}" title="{$addon.name}" >
                                    {/if}
                                </div>
                            </td>
                            <td width="95%" data-th="&nbsp;">
                                <div class="object-group-link-wrap">
                                    <span class="unedited-element block">{$addon.name}</span><br>
                                    <span class="row-status object-group-details">{$addon.description}</span>
                                </div>
                            </td>
                            <td width="5%" data-th="&nbsp;">
                                <input type="hidden" name="addons[{$item.addon_name}]" value="N">
                                <label for="addon_{$item.addon_name}" class="checkbox">
                                    <input id="addon_{$item.addon_name}" type="checkbox" name="addons[{$item.addon_name}]" value="Y" checked="checked">
                                    {__("install")}
                                </label>
                            </td>
                        </tr>
                    </table>
                {/if}
            {/foreach}
            {component
                name="settings.settings_section"
                subsection=$_settings
                section="wizard"
                html_id_prefix="field_"
                html_name="settings"
                class="setting-wide"
            }{/component}
        </div>

        <script>
            {if !$step_data.next_step}
                Tygh.$('#settings_wizard_next_step').hide();
                Tygh.$('#settings_wizard_finish').addClass('btn-primary');
            {else}
                Tygh.$('#settings_wizard_next_step').show();
                Tygh.$('#settings_wizard_finish').removeClass('btn-primary');
            {/if}

            Tygh.$('#settings_wizard').appear(function(){$ldelim}Tygh.$.ceDialog('get_last').ceDialog('change_title', '{$popup_title}'){$rdelim});
        </script>
    <!--settings_wizard--></div>

    {if !"AJAX_REQUEST"|defined}
        {capture name="buttons"}
    {/if}

    {if "AJAX_REQUEST"|defined}
        <div class="buttons-container">
        <a class="btn pull-left cm-dialog-closer cm-tooltip" title="{__("settings_wizard_close_tooltip")}">{__("close")}</a>
    {/if}

    {include file="buttons/button.tpl" but_id="settings_wizard_finish" but_text=__("finish") but_name="dispatch[settings_wizard.next_step.finish]" but_role="action" but_meta="cm-no-ajax cm-submit" but_target_form="settings_wizard_form"}

    {include file="buttons/button.tpl" but_id="settings_wizard_next_step" but_text=__("next_step") but_name="dispatch[settings_wizard.next_step]" but_role="submit-link" but_target_form="settings_wizard_form" but_meta="btn btn-primary"}

    {if "AJAX_REQUEST"|defined}
        </div>
    {/if}
    {if !"AJAX_REQUEST"|defined}
        {/capture}
    {/if}
</form>

{if !"AJAX_REQUEST"|defined}
    {/capture}
    {include file="common/mainbox.tpl" title=__("settings_wizard") content=$smarty.capture.mainbox buttons=$smarty.capture.buttons sidebar_position="left"}
{/if}
