puts "じゃんけんからのあっち向いてホイゲームで勝負します。"
puts "--------------------------------------"
def janken
  puts "じゃんけん..."
  puts "0(グー),1(チョキ),2(パー),3(戦わない)"
  puts "--------------------------------------"

  my_hand = gets.to_i 
  puts "#{my_hand}を入力しました"
  puts "ホイ！"

  #入力が3や3以上だった場合
  if my_hand == 3  
  puts "じゃんけんが無効になりました、やり直します"
  puts "--------------------------------------"
  janken
  elsif my_hand > 3
  puts "0〜3の数字を入力して下さい、やり直します"
  puts "--------------------------------------"
  janken
  end
  
  player_hand = rand(3)
  #擬似乱数を生成してくれるメソッド
  hands = ["グー","チョキ","パー"]
 
  puts "--------------------------------------"
  puts "あなた:#{hands[my_hand]}を出しました"  
  puts "相手:#{hands[player_hand]}を出しました"  
  puts "--------------------------------------" 
  
  if my_hand == player_hand #あいこの場合
  puts "あいこで"
  janken
  elsif (my_hand == 0 && player_hand == 1) || (my_hand == 1 && player_hand == 2) || (my_hand == 2 && player_hand == 0) #自分が勝ちの場合
  $result = "win"
  puts "--じゃんけんに勝ったのであっち向いてホイに移行します--"
  puts "----------------------------------------------------------------"
  attimuite
  elsif (my_hand == 0 && player_hand == 2) || (my_hand == 1 && player_hand == 0) || (my_hand == 2 && player_hand == 1) #自分が負けの場合
  $result = "lose"
  puts "--じゃんけんに負けたので相手主導のあっち向いてホイに移行します--"
  puts "----------------------------------------------------------------"
  attimuite
  end
end

def attimuite
  puts "あっち向いて"
  puts "0(上),1(下),2(左),3(右)"
  
  my_action = gets.to_i
  puts "-#{my_action}-を入力しました"
  puts "ホイ！"
  puts "--------------------------------------"

  player_action = rand(4)
  actions = ["上","下","左","右"]

  puts "あなた:#{actions[my_action]}です"
  puts "相手:#{actions[player_action]}でした"
  puts "--------------------------------------"

  if ($result == "win") && (my_action == player_action) 
  puts "あなたの勝ちです"
  puts "もう一度やります"
  janken
  elsif ($result == "lose") && (my_action == player_action)
  puts "あなたの負けです"
  puts "もう一度やります"   
  janken
  else 
  puts "勝負が付きませんでした、もう一度やります"
  janken
  end
end
janken
