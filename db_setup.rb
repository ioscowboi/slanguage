
                  
unless ActiveRecord::Base.connection.table_exists?(:cards)
  ActiveRecord::Base.connection.create_table :cards do |t|
    t.text      :location
    t.integer   :card_id
  end 
end

unless ActiveRecord::Base.connection.table_exists?(:answers)
  ActiveRecord::Base.connection.create_table :answers do |t|
    t.text    :text
    t.integer :cards_id
    t.integer :correct_answer
  end 
end

unless ActiveRecord::Base.connection.table_exists?(:players)
  ActiveRecord::Base.connection.create_table :players do |t|
    t.text    :name
    t.integer :age
    t.text    :phone
    t.text    :email
    t.text    :username
    t.text    :password
    t.integer :correct_answers
  end 
end

unless ActiveRecord::Base.connection.table_exists?(:choices)
  ActiveRecord::Base.connection.create_table :choices do |t|
    t.integer :player_id
    t.integer :answer_id
  end 
end