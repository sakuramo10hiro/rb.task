require "csv"
#csvの読み込み、csv.openコードが使用できる

puts "1(新規でメモを作成) 2(既存のメモを編集する)"
input_type = gets.to_i
#キーボードから入力された値を数値で返すメソッド
#gets.to_sなら文字列で

if input_type == 1
 puts "拡張子を除いたファイル名を入力して下さい。"
 file_name = gets.chomp.to_s
 #文字列の末尾から改行コードを取り除いた文字列を返す
 puts "メモの内容を記入して下さい。"
 puts "入力が完了したらCtrl + Dで保存します。"
 memo = STDIN.read
 #複数行を文字列として取得
 CSV.open("#{file_name}.csv","w") do |file_name|
 #csvファイルの書き込み、読み込み用のメソッド(wの部分で書き込みの命令)
 #(aだった場合は追記モードで既存データに書き込みがされる↓)
 file_name << [memo]
 #memoの内容をcsvに書き込み 
  end

 elsif input_type == 2
  puts "編集したいファイルを選んで下さい。"
  updatefile_name = gets.chomp.to_s

  CSV.open("#{updatefile_name}.csv","r") do |updatefile_name|
  puts updatefile_name.read
  end
  #データの読み込み

  puts "メモを編集する"
  puts "入力が完了したらCtrl + Dで保存します。"
  memo = STDIN.read

  CSV.open("#{updatefile_name}.csv","a") do |updatefile_name|
  updatefile_name << [memo]
  end

 else
  puts "1か2を入力して下さい。"
end