class Player
  def hand
    puts ["数字を入力してください","0:グー","1:チョキ","2:パー"]
    @input_hand = gets.chomp
    until @input_hand == "0" || @input_hand == "1" || @input_hand == "2"
    puts ["正しい数字を入力してください","0:グー","1:チョキ","2:パー"]
    @input_hand = gets.chomp
    end
    if @input_hand == "0"
      @input_hand  = 0
    elsif @input_hand  == "1"
      @input_hand  = 1
    elsif @input_hand  == "2"
      @input_hand  = 2
    end
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    @e_hand = rand(0..2)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    if enemy_hand == 0
      hantei = "グー"
    elsif enemy_hand == 1
      hantei = "チョキ"
    elsif enemy_hand == 2
      hantei = "パー"
    end
    
    case (player_hand-enemy_hand+3)%3
      when 2
        puts "相手の手は#{hantei}です。あなたの勝ちです"
      when 1
        puts "相手の手は#{hantei}です。あなたの負けです"
      when 0
        puts "相手の手は#{hantei}です。あいこです、"
        player = Player.new
        enemy = Enemy.new
        janken = Janken.new
        
        janken.pon(player.hand, enemy.hand)
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)