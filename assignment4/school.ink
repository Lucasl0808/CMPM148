=== Scene1 ===
Your school is notorious for having a bullying problem and having many gangs of bullies all over your campus.

While you aren't a bully necessarily, you have an extreme dedication to one specific hobby that scares (or attracts) some people. (you cannot change this decision)...

    * [Going to the Gym (Strength)]
        You chose Strength as your characteristic.
        ~strength = true
        ~current = "strength"
        ->continue1
    * [Reading books (Intelligence)]
        You chose Intelligence as your characteristic.
        ~intelligence = true
        ~current = "intelligence"
        ->continue1

    * [Exploring new places (Courage)]
        You chose Courage as your characteristic.
        ~courage = true
        ~current = "courage"
        ->continue1

    * [Public Speaking (Charisma)]
        You chose Charisma as your characteristic.
        ~charisma = true
        ~current = "charisma"
        ->continue1

    * [Establishing Connections (Leader)]
        You chose Leader as your characteristic.
        ~leader = true
        ~current = "leadership"
        ->continue1
        
= continue1
Now it is time to start your school day...#Part1

You arrive at the entrance to your school. You see one of the bullying gangs waiting at the school gate.
{leader:
    They greet you and you can walk past without causing any trouble (leader)
    ->continue2
    - else:
        Thug 1: Hey loser! Come over here we need to talk. 
        Thug 2: Yeah, today ain't your lucky day.
        -> bullyConfront
}

= continue2
    {leader == false:
        The bullies run off somewhere into the school.
    }
    You enter the school and start your day.
    
    Your friend Kevin sneaks up on you and grabs you from behind.
    
    Kevin: Yo whats up! I saw a bunch of guys harassing you at the front, whats up with that?
    
    *"whats up Kev, it was nothing much"
        Kevin: as chill about this as ever.
    *"damn it Kev, you scared me"
        Kevin: haha, my bad but still I wanna know what happened.
    
    -Kevin: those guys ran off pretty quick.
    {strength:
        Kevin: all those muscles u got from your time in the gym must've scared them off.
    }
    {intelligence:
        Kevin: prob scared them off with your creepy ass book talk again huh?
    }
    {courage:
        Kevin: you probably just chad walked over to them and scared them off huh. Your confidence really scares me.
    }
    {charisma:
        Kevin: your way with words is something else... you charm them or something?
    }
    {leader:
        Kevin: those guys treat you like some friends. Are you secretly some popular dude?
    }
    
    - anyways, we should probably get to class, we gonna be late. Don't get into any more trouble. Knowing you thats probably not gonna happen though.
    
    *"shut up man I'll see you later"
        Kevin: yeah see you.
    *"you know me too well"
        Kevin: you know it, seeya after class
    -after a hectic morning, you decide to go to class after Kevin runs off. Its finally time to start your school day.#Part2
->Scene2

= bullyConfront
    {strength:
    Thug 1: wait that guy looks scary strong.
    Thug 2: Yeah i haven't seen him around.
    Thug 1: we might've picked the wrong fight, lets scram.
    ->continue2
    }
    * {courage}"You sure you want me to?"
            Thug 1: Yeah, we do.
            Thug 2: Give us your lunch money loser. Or else.
            Thug 2 proceeds to shove you back
            
            Teacher: Hey you three get to class or I'm writing you all up!
            Thugs: Oh shit its a teach! lets get outta here!
            ->continue2
    *{courage}[*glare at them and crack your knuckles]
            Thug 1: Yo this guy looks like he means business
            Thug 2: no way man he's just bluffing
            
            **[*slowly walk towards them]
                Thug 1: oh man I think he really wants this, lets get outta here
                ->continue2
    *{intelligence}"You guys know that a teacher always walks by here right?"
            Thug 1: no way, I don't see no one around right now. 
            Thug 2: yeah give us your cash or you'll regret it.
            ** "if I don't hit back then only you two'll be in trouble you know"
                Thug 1: maaaan this guy is boring lets get out of here.
                Thug 2: yeah I think I see a teacher walking over anyways lets scram.
                ->continue2
    *{charisma}"actually, it is my lucky day"
        Thug 1: huh? lucky you gonna get your ass beat by the two of us?
        Thug 2: lucky for us that we get to have our fun with you 
        **"actually, lucky that I got a teacher looking at us from around that corner right now"
            You: theres no need for me to do anything since you guys are the instigators
            Thug 1: shit he's right, we got some people watching us 
            Thug 2: lets get out of here man.
            Thug 1: you lucky that you got a teach watching your ass.
            
            ***"thats what I was saying man..."
                ->continue2
    *{charisma}"listen guys, I got a meeting with the principal right now, you don't want me to rat you guys out right.."
        Thug 1: listen man, this don't gotta be ugly, just hand us your cash and we'll be on our way 
        Thug 2: c'mon man, no one needs to get in trouble here 
        **"WE don't have to do anything here, its up to you guys if u want trouble or not"
            Thug 1: tsk, fine. Its too early for this anyways, lets leave.
            Thug 2: just like that? You sure you want to leave him alone?
            Thug 1: c'mon... its not worth it anymore 
            -> continue2
->END

