# This file contains Ruby code that creates records for the application to work from scratch.

# Example:
#
# stuff1 = Card.create({:stuff => "Stuff"})
# stuff1.answers.create({...}) or Answer.create({:card_id => card1.id})

card_num = 1

card1 = Card.create({:location => "/images/momandchild.jpg", :card_id => card_num.to_i})
Answer.create({:text => "On my moma", :cards_id => card_num.to_i, :correct_answer => 1})
Answer.create({:text => "Sittin' with moms", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Chillin' with moms", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Moma seatah", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "On my guardian", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Lapster mom", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Gone' head mom", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Moma and baby", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Own my mom", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Mommah", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Muh-tha", :cards_id => card_num.to_i, :correct_answer => 0})



card_num += 1

card2 = Card.create({:location => "/images/space-shuttle-discovery-begins-liftoff-at-the-start-of-sts-120.jpg", :card_id => card_num.to_i})
answer2 = Answer.create({:text => "Straight up", :cards_id => card_num.to_i, :correct_answer => 1})
Answer.create({:text => "Upfront", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Hashtag spacecraft", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Top of the flight", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Taken off", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "#Spaceship", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "On cloud spacecraft", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Spacing outt", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "I'm a rocket ship", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Rocket ship don't stop it", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Gettin' my NASA own", :cards_id => card_num.to_i, :correct_answer => 0})

card_num += 1

card3 = Card.create({:location => "/images/summer-rain.jpg", :card_id => card_num.to_i})
answer3 = Answer.create({:text => "What it do?", :cards_id => card_num.to_i, :correct_answer => 1})
Answer.create({:text => "Dew what it dew", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "That's my dewty", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Watch me dew me", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Mountain Dew", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "What dewing?", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "How you dewing?", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Dew you wanna go out?", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Dewing the most", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Don't dew that!", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Dew why did he?", :cards_id => card_num.to_i, :correct_answer => 0})

card_num += 1

card4 = Card.create({:location => "/images/Seamen_Dig_For_Victory._1940,_at_An_Establishment_Taken_Over_by_the_Royal_Navy_As_a_Training_Establishment,_Which_Is_Well_Supplied_With_Vegetable_Plots_Which_Are_Worked_by_Seamen_Under_Training._A2244.jpg", :card_id => card_num.to_i})
answer4 = Answer.create({:text => "I can dig it", :cards_id => card_num.to_i, :correct_answer => 1})
Answer.create({:text => "Diggy Simmons", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "No diggity no dought", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Dig deep, dig deeper!", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Diggin' good", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "I dig ress", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Dig or be dug", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Readers digest", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Dig it al", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Digital Underground", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "I can't dig it", :cards_id => card_num.to_i, :correct_answer => 0})

card_num += 1

card5 = Card.create({:location => "/images/enhanced-31681-1399330712-11.jpg", :card_id => card_num.to_i})
answer5 = Answer.create({:text => "He got game!", :cards_id => card_num.to_i, :correct_answer => 1})
Answer.create({:text => "He's got the game", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Game up", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Games will be played", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Don't play those games", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Yo games is lame", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Game Stop", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Games exchange", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Jordan got game", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Game day!", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "I got no time for no games?", :cards_id => card_num.to_i, :correct_answer => 0})

card_num += 1

card6 = Card.create({:location => "/images/aram-bartholl-dropping-the-internet-small.jpg", :card_id => card_num.to_i})
answer6 = Answer.create({:text => "Drop it like it's hot", :cards_id => card_num.to_i, :correct_answer => 1})
Answer.create({:text => "Web droppings", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Drip drop this is how we rock", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Droppin dymez", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Droppin' it like it's so hot", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Droppin' like it's not", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "It's getting hot in here.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Drop it now", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Drop the treble!", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Drop that base", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Too hot to handel", :cards_id => card_num.to_i, :correct_answer => 0})

card_num += 1

card7 = Card.create({:location => "/images/Playing_The_Lying_Down_Game_at_the_geohash.jpg", :card_id => card_num.to_i})
answer7 = Answer.create({:text => "Layin' low", :cards_id => card_num.to_i, :correct_answer => 1})
Answer.create({:text => "Lay lo", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => ". Plankin'", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Planks", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Laying in the grass.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Lie down", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Laying down.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Lying it down.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Laying there.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Planking in the grass.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Lay low and stitch.", :cards_id => card_num.to_i, :correct_answer => 0})

card_num += 1

card8 = Card.create({:location => "/images/1077_32_1_web.jpg", :card_id => card_num.to_i})
answer8 = Answer.create({:text => "Gettin' it in.", :cards_id => card_num.to_i, :correct_answer => 1})
Answer.create({:text => "Git inn where you fit inn.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Get inn there.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Hotel, motel, holiday in.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Inn my opinnion...", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Pinnterest it!", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "It all deepinns", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Gettin' it inn.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Gettinn' it in.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Gettin' inn.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Get itt inn.", :cards_id => card_num.to_i, :correct_answer => 0})

card_num += 1

card9 = Card.create({:location => "/images/chili.jpg", :card_id => card_num.to_i})
answer9 = Answer.create({:text => "Chillin'", :cards_id => card_num.to_i, :correct_answer => 1})
Answer.create({:text => "It's chilly.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "It's chilli.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "It's rather chilly.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Chi chi chi chilli!", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Let's chill, and settle down.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "I got 3 chillrens.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Take a chilli pill.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Chilly dog.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Chillupa supreme.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Chilling.", :cards_id => card_num.to_i, :correct_answer => 0})

card_num += 1

card10 = Card.create({:location => "/images/massage_therapy1.jpg", :card_id => card_num.to_i})
answer10 = Answer.create({:text => "I feel you.", :cards_id => card_num.to_i, :correct_answer => 1})
Answer.create({:text => "I felt you.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "I feel something.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "I've got a feeling. (woo hoo!)", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "I felt that!", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Message therapy", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Feel what I'm saying.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "Feel what I'm not saying.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "You feel m e?", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "F eel m e.", :cards_id => card_num.to_i, :correct_answer => 0})
Answer.create({:text => "I feel you're pain.", :cards_id => card_num.to_i, :correct_answer => 0})