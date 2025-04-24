# encoding: utf-8

require_relative '../crawl_utils'

ROOT_URL = URI.parse 'https://www.v2ex.com'
MISSION_DAILY_URL = ROOT_URL + '/mission/daily'
BALANCE_URL = ROOT_URL + '/balance'

headers = {
  'Cookie' => File.read("#{__dir__}/session_cookie")
}

@httpclient.set_cookie_store('cookie.dat')
daily_res = @httpclient.get(MISSION_DAILY_URL, nil, headers)
daily_doc = Hpricot(daily_res.body)
redeem_url = ROOT_URL + (daily_doc/:input)[1].attributes['onclick'].split('\'')[1]

# 领取
puts "领取状态码: #{@httpclient.get(redeem_url, nil, headers).status}"

# 查询
balance_res = @httpclient.get(BALANCE_URL, nil, headers)
balance_doc = Hpricot(balance_res.body)
msg = ((balance_doc/:tr)[7]/:td)[4].to_s.rm_tag
puts msg

@httpclient.save_cookie_store
