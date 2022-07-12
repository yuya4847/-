# 仕様
# 西暦・月・日付から2回目の発送日を入力できる
# 決済日は出力される

require "date"
WEEK_DAYS = ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"].freeze
WEEK_SPAN = 6

puts "2回目の発送日の入力を始めます。西暦を入力してください"
year = gets
puts "月を入力してください"
month = gets
puts "日を入力してください"
date = gets

send_date = Date.new(year.to_i, month.to_i, date.to_i)
puts "発送日は、#{send_date}・#{WEEK_DAYS[send_date.wday]}です"

settlement_date = send_date - ( WEEK_SPAN + send_date.wday )
puts "決済日は、#{settlement_date}・#{WEEK_DAYS[settlement_date.wday]}です"
