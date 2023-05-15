VAR counter = 0
VAR badAction = 0
VAR skipWork = false
VAR playing = false
VAR hints = 0

->Beginning

=== Beginning ===
You open your eyes and wake up to the noise of the annoying kid that always bangs on your door to wake you up.

Without fail, at the same time every day, this child, Carlos walks across the street to ask you to play basketball.

{counter >0: you feel like you've lived through this moment {counter} times}

{hints == 3: You remember all of the things you saw around the hoop from when you got back from work. It seems like Carlos could be in danger}
Carlos: "Hello mister!? You want to play ball again?!"

 * Ignore him
    "Hellooo??? I know you're in there!"
    Carlos: "Pleeeaassee? there's no one else who wants to play with me. Besides, I like you mister! You are funny"
    ~badAction = 0
 * ["I'm busy"]
    "Carlos man I'm busy today go find someone else"
    Carlos: "Pleeeaassee? there's no one else who wants to play with me. Besides, I like you mister! You are funny"
    ~badAction = 0
 * ["I'll play with you later"]
    "Hey I have work right now I'll play with you when I get back"
    Carlos: "Ok sure! I'll be playing here when you get back like usual!"
    ~badAction = 0
 * ["Get outta here"]
    "Can you PLEASE stop doing that man, I need my sleep. Get outta here"
    ~badAction = badAction + 1
    Maybe that was too rude, I shouldn't say this next time
    Carlos: "Pleeeaassee? there's no one else who wants to play with me. Besides, I like you mister! You are funny"
 +{counter >= 4} I can spare a few minutes...
    Something seems off with how Carlos was never around. Maybe playing with him will give some insight...
    "Sure man I can play for a little, I gotta head to work soon though

-You check your clock and you see the time is 8:55AM, and your work starts in 5 mins.

{counter == 0: You probably shouldn't be late to work} 
+Head outside and go to work
    You open the door and see Carlos shooting hoops on the street with his signature red basketball. He waves you down to play but you get in your car and drive to work.
    ->work
+{counter >= 4}Go play with Carlos for a bit
    You decide to shoot some hoops with Carlos and strike up a small conversation.
    "Why don't you find other people to play with you"
    Carlos: "no one else talks to me, they just ignore me and they are no fun. I also don't have a mom or dad to play with."
    ~playing = true
    ->playWithCarlos
*{counter >= 5}Skip work to play and monitor Carlos
    You decide to skip work to make sure Carlos is safe.
    ~skipWork = true
    ->playWithCarlos
-> END

=== work ===

{badAction == 1:
    That interaction with Carlos in the morning exhausted your patience and your shift felt a lot longer than it normally does.
    You feel exhausted from work and go home to rest after your shift.
    *make a late night snack
        You decide to cook up a late night meal to recover some of your energy, however you feel very tired and dizzy while cooking
        ->sleep 
    *go to bed
        you decide to go to bed to rest for the next day.
        ->sleep
    
}

{badAction == 0:
It's a boring day as usual at work, and your shift goes by in a flash. You come back home after a long day at work, and Carlos is surprisingly not playing outside.
    You notice a slightly concerning sight however...
    Normally, Carlo would be playing ball still.

    {counter < 3:
        Maybe you should investigate...
        
        *look around the hoop 
            You look around the hoop and you see Carlo's red basketball. He normally never leaves it behind.
            ~hints = hints + 1
            ->finishInvestigating
        *walk around the street
            You walk around the street and see one of Carlo's shoes near the sidewalk...
            ~hints = hints + 1
            ->finishInvestigating
        *look for street clues
            You check the street and you see tire skid marks near the basketball hoop...
            ~hints = hints + 1
            ->finishInvestigating
    -else: 
        You have investigated all of the clues to Carlo's wherabouts with the given information, you return home exhausted from work and go to sleep
        ~counter = counter + 1
        ->Beginning
    }
    
}


= finishInvestigating
    You feel tired after checking the area and go back home to rest.
-> sleep

= sleep
Your eyes slowly close..
~counter = counter + 1
-> Beginning

->END

=== playWithCarlos ===
You play with Carlos for a couple minutes and try to strike up conversation.
+Do you know anyone else that would play with you?
    Carlos: "Not really, I only feel comfortable with you, besides, not many cars pass by this area and our neighbors are rarely home."
*{playing}What are you gonna be doing when I finish work?
    Carlos: "I should be still playing ball when you get back. We can play again later!"
-"Don't you have work mister?"

+Thats right, I do, stay safe Carlos
    "Yeah I do, thanks for reminding me. Stay safe Carlos. If you need anything let me know"
    Carlos: "see you later mister!"
    You decide to head to work
    ->work
*{skipWork}No its ok, I'll play with you for however long you want
    "I called out of work today to play with you man. We can play until you want to stop."
    Carlos: "oh really?! Thank you mister! we can play for the whole day!"
    **"Anything you want little man"
        You play with Carlos for what seems like hours.
        After a couple hours pass, a run-down white van slowly drives past.
        The driver glares at you and drives away.
        ***Invite Carlos in for dinner
            "Hey what do you say you come in and eat dinner with me, I wouldn't want you eating alone"
            Carlos: "Wow really? That would be awesome! thank you so much!"
            ->Endgame

    
= Endgame
You are finally able to take Carlos in and protect him from kidnappers for the day
-> END

-> END

