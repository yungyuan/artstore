Pay2go.setup do |pay2go|
	if Rails.env.development?
		pay2go.merchant_id = "12124829"  # 放測試站的 key


		pay2go.hash_key    = "rIL2SRZTu8w3ZVPIiUuFb7nqBihRp3TQ"
		pay2go.hash_iv     = "LETEwSx014410TKi"
		pay2go.service_url = "https://capi.pay2go.com/MPG/mpg_gateway"
	else
		pay2go.merchant_id = "1234567"  # 放正式站的 key


		pay2go.hash_key    = "xxxxxxxx"
		pay2go.hash_iv     = "xxxxxxxx"
		pay2go.service_url = "https://api.pay2go.com/MPG/mpg_gateway"
	end
end
