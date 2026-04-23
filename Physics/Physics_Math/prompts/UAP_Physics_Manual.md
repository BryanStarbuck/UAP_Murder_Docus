ROOT_DIR dir is ~/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math

PROMPTS_DIR is dir {ROOT_DIR}/prompts

SKILL_WORK_DAY_PROMPT_FILE is file {PROMPTS_DIR}/skill_work_day.md

Any prompts this thing creates go under the directory down below. It's not allowed to create any skills or prompts anywhere else. 
NEW_PROMPTS_DIR is dir {PROMPTS_DIR}/other/


TRACK_OVERVIEW_YAML_FILE is file {ROOT_DIR}/Track_Overview.yaml
MANUAL_FILE is file {ROOT_DIR}/manual_UAP_Physics.mdx
OTHER_TRACK_DIR is dir {ROOT_DIR}/other



DAY_STATUS_FILE_TEMPLATE is file {OTHER_TRACK_DIR}/Day_Status_Template.mdx

ATTEMPT_NUMBER_DIR is dir {ROOT_DIR}/attempts/{ATTEMPT_NUMBER}
STATUS_ATTEMPT_NUMBER_FILE is file {ATTEMPT_NUMBER_DIR}/Attempt.yaml

DAY_DIR is dir {ROOT_DIR}/day/{WHICH_DAY}
DAY_STATUS_FILE is file {DAY_DIR}/Day_Status.mdt

PROMPTS_DIR is dir {ROOT_DIR}/prompts/


SIMULATION_DIR is dir {ROOT_DIR}/simulation
SIMULATION_NUMBER_DIR is dir {SIMULATION_DIR}/{WHICH_SIMULATION_SOFTWARE}
SIMULATION_NUMBER_SOFTWARE_DIR is dir {SIMULATION_DIR}/{WHICH_SIMULATION_SOFTWARE}/software


INPUT_DIR is dir {ROOT_DIR}/1_Track/video_transcriptions/

END_DIR is the end directory of this pattern:
{ROOT_DIR}/1_Track/Tweets_RedCollie1/tweets/{Dir_Level_1}/{Dir_Level_2}/


====================================================================
GOAL
====================================================================

Come up with one of the attempt directories that ends up being the winning one towards the goal. That's to create our own UAP or flying UFO. It'll fly. You'll use magnet-based ways to do it to fly. Get out, lift off the ground. Per portion system. 

We will kick off one skill. That will be a day skill. We will call this skill skill_work_day.md.   These kinds of skills and prompt files will go in the prompts directory./other. You can create more prompts. 

We're going to have different attempts, and these are different kinds of designs, so you can pursue one, and when you start to finish it, there might well be times to think of a different attempt or different approach, a different kind of design. These will be attempt directories, and they'll start with the first number and then go up. We can have an overview.yaml file in each one and a number of files at the top level of the approach, and you can choose to have subdirectories. 

MANUAL_FILE this is a file you will grow as you get ideas and learn things to do better. As you do that. 

====================================================================
SKILLS
====================================================================

This skill moves video transcription files out of INPUT_DIR and into

You create Python code or other code or skills, and they can run. As he was in the workday, you each line to get rid of that out. You might need to run a skill and put in progress into it. 


====================================================================
WORK DAY
====================================================================

{DAY_DIR} is the directory you store your files in from a workday.

DAY_STATUS_FILE this file can have a numbered checklist of things that can happen. It might take skills to get those things accomplished. You'll see the manual to understand that. Over time, your great manual might say it wants one more thing to be done in a workday. 


STATUS_ATTEMPT_NUMBER_FILE is file {ATTEMPT_NUMBER_DIR}/Attempt.yaml

----------
DAY_STATUS_FILE file example (but it will contain more)

DAY_STATUS_FILE:
WORK DAY NUMBER: {number of work day. It should match the number of the directory}
[ ] Plan for Day Completed {PLAN_FOR_THE_DAY_FILE}
[ ] Decide if working on one of the previous attempts or create a new attempt
[ ] Work on Theory
[ ] Map out the atttempts to make it better
[ ] PHYSICS files for this day. And improving or changing them in the attempt dir.  Do this work
[ ] MATH files for this day. And improving or changing them in the attempt dir.  Do this work
[ ] ENGINEERING files for this day. And improving or changing them in the attempt dir.  Do this work
[ ] "Applied Physics simulator files to run the experiments" files for this day. And improving or changing them in the attempt dir.  Do this work
SIMULATION_PASS:
    [ ] Create any code needed to run the simulator
    [ ] Run Tests in Online digitial simulator software
    [ ] Fix any code or anything to make the simulation tests for the day work
    [ ] Fix any code or anything to make the simulation tests for the day work
[ ] Completed simulation work. Make sure it didn't loop through SIMULATION_PASS more than 10 times. Stop if it finished 10. Only loop through if it failed to run (and yyou think you can fix it)
[ ] SIMULATION learned (do the learning and thinking now) for this days simulations. And improving or changing them in the attempt dir.  Do this work
[ ] REFLETION and Postmortum report. Create this report file in the DAY_DIR for this day. What did we learn. What should we think about working on in the future day? (REFLETION_and_Write_Reflection_Report)
[ ] Improve manual (if appropriate). Build more skills. Grow the DAY_STATUS_FILE_TEMPLATE.  
[ ] WORK_DAY_IS_NOW_FINISHED


====================================================================
TOP LEVEL OPERATION
====================================================================

This skill moves video transcription files out of INPUT_DIR and into

You create Python code or other code or skills, and they can run. As he was in the workday, you each line to get rid of that out. You might need to run a skill and put in progress into it. 

If you need to store knowledge above any one attempt or any one work, keep it in this other directory. That way the top-level directory does not get busy. You can create any files you need here or recursively underneath the other directory. 

OTHER_TRACK_DIR is dir {ROOT_DIR}/other

Following the YAML file, here is a track of certain values. Always be hierarchical. One of them can be the date number that you're on, and yet, whatever kind of numbers or parameters we want to save, we can save that in here. 

TRACK_OVERVIEW_YAML_FILE is file {ROOT_DIR}/Track_Overview.yaml
DAY_STATUS_FILE_TEMPLATE is file {OTHER_TRACK_DIR}/Day_Status_Template.mdx
ATTEMPT_NUMBER_DIR is dir {ROOT_DIR}/attempts/{ATTEMPT_NUMBER}
DAY_DIR is dir {ROOT_DIR}/day/{WHICH_DAY}

When you create a new day directory, copy from the template (DAY_STATUS_FILE_TEMPLATE) into that directory (DAY_DIR) that started off that date. That file for the new day should then be in:
DAY_STATUS_FILE is file {DAY_DIR}/status_day.mdx


This cannon will include which status you tend to work from top to bottom. Over time, you can improve the template, and so you can have more steps or remove steps. Generally, don't want to reduce more the steps that are in this plan here. 
DAY_STATUS_FILE is file {DAY_DIR}/status_day.mdx

Keep doing steps and check off the step in the day status file by putting a check inside the brackets when you completed that step. You tend to work top to bottom. You can go build a script file for each row to carry out, and you can learn and grow that skill file for each type of bullet row in the list. As you do learnings, you can grow the skills. You can grow the day template so that future days we can do more. 

This is one of the last steps of the day. This is when you should do reflection, review all the files of the day, and attempt. You might look at other attempt directories. You might look at the last 20 days and analyze if things are progressing or not. Should you make something radical, a different approach, or not? Should you add more to the manual? Reduce things from the manual. Should you change the day template? Are there times to update any of the yaml files or status files? Do you want to try a new simulation software. Do you want to for future attempts or future days? So, with this, you're going to be writing out these results from this reflection step into a file in the day directory. When you're doing the planning for the next day, you'll be learning from those reflection points for the last 10 days. You'll try to pay most attention to the more recent ones when you're creating your plan. 
{REFLETION_and_Write_Reflection_Report}



PLAN_FOR_THE_DAY_FILE is a file you create near the beginning of the day. You look at the reflection reports of the last 10 days and pay most attention to the more recent ones. Decide I'm going to try and work on a pre-existing attempt or create new attempts. What are you going to do? Put all the information down in the data entry on the files on what should be done there. You might add new steps to the list. 

The file {PLAN_FOR_THE_DAY_FILE}


The following is the main prompt that I will run. It should look at the Newest Oldest Day, the biggest day number, and see if that day is finished. If it's not finished, then it should continue. When it looks at the checklist, the space between brackets means it needs to be done. If it finds any that are not done, it should do them. When it's done with that step, mark it done and then continue the next step. It may call prompts or skills to carry that work out.

If you attempt to get through all the steps to the end of the day, but sometimes it can't and won't. This is when this is run. It'll find a day was half finished and it'll continue where it left off. If it finds the biggest numbered day is finished, then it'll create a new day and copy over the template and start processing on the new day. 
SKILL_WORK_DAY_PROMPT_FILE is file {PROMPTS_DIR}/skill_work_day.md



====================================================================
List of Files
====================================================================

In the manual, you should have a list of files you want to have in each day directory and then a list of files you want to have in each attempt directory. 

In the manual, you can also define when you give up on an attempt and try a new attempt, or when you choose to come back to an attempt and work on it some more. 

#1: Beyond_Nutonian_Physics.mdx: we want to have this in each attempt directory. This should be a matter of: we should be open to physics beyond Newtonian physics. We should be having empirical tests. We should have a number of contenders of things that will cause us to fly beyond the Newtonian physics. How do we test those, and how do we prove those? 


#2: Engineering_To_Build_It.mdx: the goal is towards building, having the engineering specifications to build the flying device, the UAP, the fly, and especially the propulsion system and then the physics of it all. How much does it weigh? What's the size of everything? What are all the parts? How are they all laid out together. What's the physics of everything? How does it operate? What moves? What pivots on what? What's the weight, made of what material? How does the electrical system flow? What makes it operate and lift off. 


#3: Unique_Attempt.mdx: this goes in every single attempt directory. We want to explain what our attempt is, unique and different from previous attempts. For attempt numbers that are lower, we don't need to worry about attempt numbers that are higher; they'll worry about that. We just have to make sure that when we're creating an attempt, we're describing why it is a different and unique attempt.

We might be a different attempt of a very different type of engineered vehicle. Maybe we're trying to explore a different area of a possible Newtonian physics. It might be that we're trying a different math approach. We might try different tests in the simulator. In all of those dimensions, all of them may match prior attempts. As long as one dimension of it is different, then it's okay to have a different, unique approach. I mentioned some of the dimensions you can have more in different dimensions. 


#4: Goal_Attempt.mdx: what's the goal of this attempt? Is it to make a better vehicle? Is it to explore a new area of physics? Is it to do more tests on simulations and try to prove something specific out? Define what the goal is. The attempt-level specific goal should be unique. 

#5: Goal_Day.mdx: this one is: what's the goal for the day. When we were doing the planning phase in the beginning, kind of map that out. What was the goal for the day? What do you want to definitely focus on what's the goal of this attempt? Is it to make a better vehicle? Is it to explore a new area of physics? Is it to do more tests on simulations and try to prove something specific out? Define what the goal is. The attempt-level specific goal should be unique. 


For the above files, we can always grow the manual to talk about what they should include or success, and then we want to have guidance on those. When they're created, what stage? When do we read them. 

Make sure the manual is read in the context window at the start of every prompt. That's important to have as one of the first things, steps to do in every single prompt. 

For every single skill or prompt, it should run in stages with staged numbers, so that way it's very clear in the processing and we are able to read it. We want to have a syntax of other prompts to be similar to the layout of this file without markdown. 


====================================================================
MANUAL POINTS
====================================================================

The manual file exists in here. Make it the same kind of syntax as this file here.  UAP_Physics_Manual.md. Not marked down. You can't put in tables with ASCII. 

The file exists in one place. This is your learnings on how you operate day to day and carry out work, day or learn or improve. 
MANUAL_FILE is file {ROOT_DIR}/manual_UAP_Physics.mdx


1. 


====================================================================
Simulation directory and software
====================================================================



SIMULATION_DIR is dir {ROOT_DIR}/simulation
SIMULATION_NUMBER_DIR is dir {SIMULATION_DIR}/{WHICH_SIMULATION_SOFTWARE}
SIMULATION_NUMBER_SOFTWARE_DIR is dir {SIMULATION_DIR}/{WHICH_SIMULATION_SOFTWARE}/software
