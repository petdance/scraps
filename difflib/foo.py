import difflib
 

#str1 = 'Here is a diff( of strings )'
#str2 = 'Here is   a diff(    of strings   )    '

str1 = 'my $x = Foo->new(this=>"that looks nice"),'
str2 = 'my $x = Foo->new(   this  => "that was nice" ),'
 
match_seq = difflib.SequenceMatcher(a=str1, b=str2)
match = match_seq.find_longest_match(alo=0,ahi=len(str1),blo=0,bhi=len(str2))
 
for match in match_seq.get_matching_blocks():
    print(f"Match object:{match}")
    print(f"Matching sequence str1: [{str1[match.a:match.a+match.size]}]")
    print(f"Matching sequence str2: [{str2[match.b:match.b+match.size]}]")
    print()
