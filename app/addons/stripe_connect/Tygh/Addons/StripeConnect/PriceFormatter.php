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

namespace Tygh\Addons\StripeConnect;

use Tygh\Registry;
use Tygh\Tools\Formatter;

/**
 * Class PriceFormatter formats prices for Stripe payments.
 *
 * @package Tygh\Addons\StripeConnect
 */
class PriceFormatter
{
    /**
     * @var \Tygh\Tools\Formatter
     */
    protected $formatter;

    public function __construct(Formatter $formatter)
    {
        $this->formatter = $formatter;
    }

    /**
     * Formats payment amount by currency.
     *
     * @param float  $amount   Payment amount
     * @param string $currency Currency code
     *
     * @return int
     */
    public function asCents($amount, $currency)
    {
        $amount = $this->formatter->asPrice($amount, $currency, false, false);

        return $this->convertToCents($amount, $currency);
    }

    /**
     * Converts amount to smallest currency unit.
     *
     * @param float  $amount        Monetary amount
     * @param string $currency_code Currency code
     *
     * @return int Amount in cents
     */
    protected function convertToCents($amount, $currency_code = null)
    {
        $amount = $this->convertToTwoDecimals($amount, $currency_code);

        $amount = preg_replace('/\D/', '', $amount);

        return (int) ltrim($amount, '0');
    }

    /**
     * Converts amount to smallest currency unit.
     *
     * @param float  $amount        Monetary amount
     * @param string $currency_code Currency code
     *
     * @return string|float Amount in cents
     */
    protected function convertToTwoDecimals($amount, $currency_code = null)
    {
        if ($currency_code) {
            $currency = Registry::get('currencies.' . $currency_code);

            if ((int) $currency['decimals'] < 2) {
                $amount .= (2 - (int) $currency['decimals'] === 1) ? '0' : '00';
            }
        }

        return $amount;
    }
}
