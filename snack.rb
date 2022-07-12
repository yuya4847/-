# 仕様
# 西暦・月・日付から決済日を入力できる
# 初回発送日は、翌日
# ２回目は、決済日の2週間後日付の近くで発送
# 3回目は、決済日の4週間後日付の近くで発送
# 土曜日・日曜日と被った場合、次の月曜に発送

require "date"
WEEK_DAYS = ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"].freeze
FIRST_SEND_DATE_SPAN = 1.freeze
SECOND_SEND_DATE_SPAN = 14.freeze
THIRD_SEND_DATE_SPAN = 28.freeze

puts "決済日の入力を始めます。西暦を入力してください"
year = gets
puts "月を入力してください"
month = gets
puts "日を入力してください"
date = gets

settlement_date = Date.new(year.to_i, month.to_i, date.to_i)
puts "決済日は、#{settlement_date}・#{WEEK_DAYS[settlement_date.wday]}です"

first_send_date = settlement_date + FIRST_SEND_DATE_SPAN
case WEEK_DAYS[first_send_date.wday]
when "土曜日" then
  first_send_date += 2
when "日曜日" then
  first_send_date += 1
end
puts "初回発送日は、#{first_send_date}・#{WEEK_DAYS[first_send_date.wday]}です"

second_send_date = settlement_date + SECOND_SEND_DATE_SPAN + rand(-3..3)
case WEEK_DAYS[second_send_date.wday]
when "土曜日" then
  second_send_date += 2
when "日曜日" then
  second_send_date += 1
end
puts "2回目発送日は、#{second_send_date}・#{WEEK_DAYS[second_send_date.wday]}です"

third_send_date = settlement_date + THIRD_SEND_DATE_SPAN + rand(-3..3)
case WEEK_DAYS[third_send_date.wday]
when "土曜日" then
  third_send_date += 2
when "日曜日" then
  third_send_date += 1
end
puts "3回目発送日は、#{third_send_date}・#{WEEK_DAYS[third_send_date.wday]}です"
