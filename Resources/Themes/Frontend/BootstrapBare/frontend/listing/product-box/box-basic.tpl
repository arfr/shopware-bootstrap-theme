{namespace name="frontend/listing/box_article"}

{block name="frontend_listing_box_article"}
    {if $productBoxLayout eq 'list'}
        {assign "boxSize" "col-xs-12"}
    {elseif $size}
        {assign "boxSize" $size}
    {else}
        {assign var="boxSize" value="col-lg-`$theme['articles-col-width-lg']` col-md-`$theme['articles-col-width-md']` col-hd-`$theme['articles-col-width-hd']` col-sm-`$theme['articles-col-width-sm']` col-xs-`$theme['articles-col-width-xs']`"}
    {/if}
    {block name='frontend_listing_box_article_item_start'}
        <li class="{$boxSize} mbl product-box box-{$productBoxLayout} sw5-plugin"
            data-page-index="{$pageIndex}"
            data-ordernumber="{$sArticle.ordernumber}">
            <div class="thumbnail pam">
    {/block}
    {block name='frontend_listing_box_article_item_wrapper'}
        <div class="item-wrapper" data-equal="item">
            {block name='frontend_listing_box_article_content'}
                {block name='frontend_listing_box_article_info_container'}
                    {if $productBoxLayout eq 'list'}
                        <div class="row">
                        <div class="col-md-4">
                    {/if}

                    {* Product image + badge *}
                    {block name='frontend_listing_box_article_picture'}
                        {include file="frontend/listing/product-box/product-image.tpl"}
                    {/block}
                    {* Product box badges - highlight, newcomer, ESD product and discount *}
                    {block name='frontend_listing_box_article_badges'}
                        {include file="frontend/listing/product-box/product-badges.tpl"}
                    {/block}

                {if $productBoxLayout eq 'list'}
                    </div>
                    <div class="col-md-4">
                {/if}

                    {* Article name *}
                    {block name='frontend_listing_box_article_name'}
                        <div class="title-wrapper mts" data-equal="title">
                            {block name='frontend_listing_box_article_name_inner'}
                                <h4>
                                    <a class="" href="{$sArticle.linkDetails}" title="{$sArticle.articleName|escapeHtml}">{$sArticle.articleName|escapeHtml}</a>
                                </h4>
                            {/block}
                        </div>
                    {/block}

                    {* Description *}
                    {block name='frontend_listing_box_article_description'}
                        <div class="desc-wrapper mbs" data-equal="desc">
                            {block name='frontend_listing_box_article_description_inner'}
                                {* Customer rating for the product *}
                                {block name='frontend_listing_box_article_rating'}
                                    {if !{config name=VoteDisable}}
                                        {if $sArticle.sVoteAverage.average}
                                            <div class="mvs">
                                                {include file='frontend/_includes/rating.tpl' points=$sArticle.sVoteAverage.average type="aggregated" count=$sArticle.sVoteAverage.count}
                                            </div>
                                        {/if}
                                    {/if}
                                {/block}

                                <small>
                                    {if $productBoxLayout != 'listing'}
                                        {$sArticle.description_long|strip_tags|truncate:80}
                                    {/if}
                                </small>
                            {/block}
                        </div>
                    {/block}

                {if $productBoxLayout eq 'list'}
                    </div>
                    <div class="col-md-4">
                {/if}

                    {block name='frontend_listing_box_article_price_info'}
                        {* Product price - Default and discount price *}
                        {block name='frontend_listing_box_article_price'}
                            {include file="frontend/listing/product-box/product-price.tpl"}
                        {/block}

                        {* Product price - Unit price *}
                        {block name='frontend_listing_box_article_unit'}
                            {include file="frontend/listing/product-box/product-price-unit.tpl"}
                        {/block}
                    {/block}

                    {block name="frontend_listing_box_article_buy"}
                        {if {config name="displayListingBuyButton"}}
                            <div class="product-btn-container">
                                {if $sArticle.allowBuyInListing}
                                    {include file="frontend/listing/product-box/button-buy.tpl"}
                                {else}
                                    {include file="frontend/listing/product-box/button-detail.tpl"}
                                {/if}
                            </div>
                        {/if}
                    {/block}

                    {* Product actions - Compare product, more information *}
                    {block name='frontend_listing_box_article_actions'}
                        {include file="frontend/listing/product-box/product-actions.tpl"}
                    {/block}

                    {if $productBoxLayout eq 'list'}
                        </div>
                        </div>
                    {/if}
                {/block}
            {/block}
        </div>
    {/block}
    {block name='frontend_listing_box_article_item_end'}
            </div>
        </li>
    {/block}
{/block}
