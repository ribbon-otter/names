Text::Names generates American English names.

I wrote this project as a way of learning perl6 so the code may not be fully idiomatic perl6. 

#Usage

```
get-full() # generates a random name with a first name and last name 
get-full("male") # generates a random male full name 
get-full("female") # generates a random female full name 
get-male() # generates just a male first name
get-female() # generates just a female first name
get-last() # generates just a last name 
```

#Known Issues
The current algorithm is slower than it needs to be. Some speed increases can be implemented likely by indexing the source file instead of reading though the entire name database every time a rare name is generated.
