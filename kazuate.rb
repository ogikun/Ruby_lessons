nums = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"].shuffle

def border
  puts "-----------------------------------------"
end

def difficulty_setting(count, keys)
  @count = count
  @keys = keys
end

def check_answer(ans, key)
  if (ans == key)
    @match += 1
  elsif (@keys.include?(ans))
    @touch += 1
  end
end

border
puts "指定された回数の宣言で答えの数列を当てるゲームです。"
puts "・数列は0から始まる可能性があります。"
puts "・同じ数字は使われません。"
puts "・宣言後、答えとの一致率がわかります。"
border
puts "難易度を選択してください。(1~3)"
puts "[1] standard [2] hard [3] 1/3628800"
difficulty = gets.chomp.to_s
while (@keys.nil?) do
  if (difficulty == "1")
    difficulty_setting(10, nums.slice(0, 3))
  elsif (difficulty == "2")
    difficulty_setting(10, nums.slice(0, 4))
  elsif (difficulty == "3")
    difficulty_setting(1, nums)
  else
    puts "無効な値です。"
    difficulty = gets.chomp.to_s
  end
end
border

while (@count > 0) do
  puts "#{@keys.count}桁の数字を入力してください。（残り回数：#{@count})"
  correct = 0
  while (correct == 0) do
    ans = gets.chomp.to_s.split("")
    if ans.join == "こたえおしえて"
      puts "答えは#{@keys.join}です"
    else
      if (ans.count != @keys.count)
        puts "無効な文字数です。"
      elsif (ans.any?{|v| nums.none?(v)})
        puts "数字以外の文字が含まれています。"
      elsif (ans.count(ans.max_by{|v| ans.count(v)}) > 1)
        puts "同じ数字は使えません。"
      else
        correct = 1
      end
    end
  end

  border
  puts "あなたの答え #{ans.join}"

  @match = 0
  @touch = 0

  @keys.each_with_index do |key, i|
    check_answer(ans[i], key)
  end

  if @match == @keys.count
    border
    puts "おめでとうございます。正解は#{ans.join}でした。"
    border
    exit
  else
    puts "あなたの選んだ数字のうち、"
    puts "・#{@match}個が一致しています"
    puts "・#{@touch}個が存在していますが位置が違います"
    @count -= 1
    border
  end
end

puts "残念でした。正解は#{@keys.join}でした。"
border

