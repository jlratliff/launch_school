
mailing_campaign_leads = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]

# 1
# mailing_campaign_leads.map do |lead|
#   lead[:name].capitalize!
# end

# mailing_campaign_leads.select! do |lead|
#   lead[:days_since_login] < 60 && lead[:mailing_list]
# end

# p mailing_campaign_leads

# 2

# mailing_campaign_leads.each do |lead|
#   names = lead[:name].split
#   names.map! { |name| name.capitalize }
#   lead[:name] = names.join(' ')
# end

# usable_leads = mailing_campaign_leads.keep_if do |lead|
#   lead[:days_since_login] <= 60 && lead[:mailing_list]
# end

# p usable_leads

# 3

# mailing_campaign_leads.each do |lead|
#   names = lead[:name].split
#   lead[:name] = names.map { |name| name.capitalize }.join(' ')
# end

# usable_leads = mailing_campaign_leads.reject do |lead|
#   last_login = lead[:days_since_login]
#   subscribed_to_list = lead[:mailing_list]
#   last_login > 59 && !subscribed_to_list
# end

# p usable_leads

# 4

mailing_campaign_leads.each do |lead|
  names = lead[:name].split
  names.map! { |name| name.capitalize }
  lead[:name] = names.join(' ')
end

usable_leads = mailing_campaign_leads.select do |lead|
  lead[:days_since_login] < 60 && lead[:mailing_list]
end

p usable_leads