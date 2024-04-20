# Simple Spelling Bee Quizzer for Mac


## What and Why

Last Feb 2023, our school held our yearly 'Literary Month' where we would have a spelling bee! 

And the problem was, I couldn't really find someone to help review with me. (I had this vision of a tool that could speak out the spelling words for me to practice in random order, and I'd write it down and practice.)

I came across Tom White's GitHub program and thought that it was perfect — but the thing is, it didn't support Mac. 

So, I forked the program, and with a bit of help from trusty old ChatGPT, I modified the program to work on Mac using the native "speak" command. **I also added support for Mandarin Chinese!** (Because in our school, which is an international school, we also have Spelling Bee for Chinese too!)


### The result was a simple yet powerful Spelling Bee Quizzer that leverages the native commands on your Mac: _without any reliance on external APIs or the internet!_


*And...actually, I got first place for that year's Spelling Bee!



 
## How to Use

1. Simply download the zip file and open it!

   

<img width="784" alt="Screenshot 2024-04-20 at 9 27 29 PM" src="https://github.com/hdavidviloria/spelling-bee-mac/assets/94162758/22459121-6372-4fe2-b3a4-a5907c349bfc">






2. Navigate to the folder and edit the text files```words_cn.txt``` and ```words_en.txt```, replacing it with your actual words.


```words_en.txt``` should contain all the English vocabulary words that you are reviewing, ```words_cn.txt``` should contain all the Chinese vocabulary words. 



> [!NOTE]  
> If you only want to review English words, just go to the ```words_cn.txt``` file and DELETE all the words there.





3. Open the Terminal application on your Mac and run the program!



- First, navigate to the project directory

```
cd /directorywherethefolderyoudownloadedis
```

For me, it's 
```
cd /users/david/Downloads/spelling-bee-mac-master
```

- Then, run the program using the command 
```
sh bee.sh
```
<img width="636" alt="Screenshot 2024-04-20 at 9 40 28 PM" src="https://github.com/hdavidviloria/spelling-bee-mac/assets/94162758/eea74643-7e04-4714-8daa-2e0cd85a4cdb">





### And that's it! Happy reviewing! Hope this project inspired you or helped in you in some sort of way!

