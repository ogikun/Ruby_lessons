border = "---------------------"

#コメント

=begin
  コメント
  コメント

print "hello world"
puts "hello world" #改行
p "hello world" #デバッグ

puts border

#変数
#- 英小文字、アンダーバー

msg = "hello world"
puts msg

msg = "hello world again"
puts msg

puts border

#定数
# - 英大文字

VERSION = 1.1
puts VERSION

VERSION = 1.2
puts VERSION

puts border
# 数値

p 4.8.class 
p 4.8.methods

# + - * / % **

p 10 + 3
p 10 * 3
p 2.4 * 3
p 10 / 3
p 10 % 3
p 10.0 / 3
p Rational(2, 5) + Rational(3, 4)
p 2/5r + 3/4r

puts border
p 52.6.round
p 52.6.floor
p 52.6.ceil

=end

