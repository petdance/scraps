Captured from [archive of the original](https://web.archive.org/web/20110213093451/http://xoa.petdance.com/Coding_horrors).  Thanks, Wayback Machine!

---

I've been doing some work on a not-very-clean codebase. It's in PHP, but it's not PHP's fault that it's bad. Here are some of the gems from it:

    $spaces="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";

I wonder how many there are there. Who wants to count?

---

Apparently there was a problem with unescaped ampersands, so here's the fix:

    if ($category == "R&D (Research & Development")
        $category = "R&amp;D (Research &amp; Development";

That's it. One instance of escaping the &. No generalized solution for the next time a variable has an ampersand in it.

---

Don't you hate it when you get a message like "You have 1 item(s) in your cart"? Me, too, but this isn't the way around it.

    if ($n > 1)
        echo "   * - These items will incur a Special Cost of $5.95 (1 item), $8.95 (2 items), or $10.95 (3 or more items) per item<p>";
    else
        echo "   * - This item will incur a Special Cost of $5.95 (1 item), $8.95 (2 items), or $10.95 (3 or more items) per item<p>";

---

Mattoon is a city in downstate Illinois, and one of our customers is there. Never mind that each special customer gets their own variable flag, like `$mattoon`, `$poughkeepsie`, etc. Never mind that `$mattoon` is a global. They're just always out of luck here:

    $mattoon=0;
    if(strtolower($state)=="il" && strtolower(substr($cust_name,0,7)) == "mattoon")
    {
        $mattoon=1;
    }
    $mattoon=0;

---

I've written before that the world's worst variable name is $data and $data2, but intentional misspellings to differentiate variables might be up there:

    $agencee=$agency;
    if ($agencee == "")
        $agencee = $agencyid;

---

Truncate the string first, then `strcat` to the end of it.

    UserList[0]='\0';
    strcat(UserList, userinfo);

Most of us call that `strcpy`.

---

About the only thing worse than intentionally misspelling identifiers to differentiate between similar ones is differentiating by an embedded underline:

    sort infile.txt -oin_file.txt +1 -10

---

Apparently there was some concern that the string might lengthen in midloop in this chunk of C code?

    for (z=0;z<strlen(xtitle);z++)
        xtitle[z]=toupper(xtitle[z]);

---

I guess that C's built-in memset() didn't fit the bill:

    memcpy(ptr,"\0\0\0\0\0\0\0\0\0\0",10);

---

To add a salesperson to the system, you have to create records in two auxiliary tables. I asked the programmer what had to be done to get this to happen, or if there was a script to do it. His reply:

> This is not automated. The SQL commands would be different for each sales rep unless they happened to have the same name and territory.

---

I asked the programmer about how an update process runs:

> Why are the update programs run as root? Was there a permissions problem that you had to get around?

His answer:

> When running with root permissions, there are no permission problems. That is why it is run that way.

Jeff Goff notes in IRC: "No permission problems and all permission problems at the same time. It's kind of like Zen."

Liz Cortell points out that "That's the Unix equivalent of 'I have no drinking problem. I drink. I get drunk. I fall down. No problem'"

---

The HTML is atrocious, of course. Lots of unnecessary tables.

Best of all, he omits tags that aren't strictly necessary to browser rendering, such as `</td>` tags in tables, and `</font>` tags inside those cells.

---

Here's some creative indentation. Read carefully!

    if ( $condition ) ; else {
        do_something();
    }

---

If you need to add commas to a long number, and it's never occurred to you to use the built-in PHP function `number_format`, go ahead and write your own. No need for a generic algorithm, though!

    function comedit($fld) {
        $fld=(float)$fld;    $vao=sprintf("%d",$fld);
        $sl=strlen($vao);
        if ($sl == 9)
            $vao=substr($vao,0,3) . "," . substr($vao,3,3) . "," . substr($vao,6);
        elseif ($sl == 8)        $vao=substr($vao,0,2) . "," . substr($vao,2,3) . "," . substr($vao,5);
        elseif ($sl == 7)
            $vao=substr($vao,0,1) . "," . substr($vao,1,3) . "," . substr($vao,4);
        elseif ($sl == 6)
            $vao=substr($vao,0,3) . "," . substr($vao,3);
        elseif ($sl == 5)        $vao=substr($vao,0,2) . "," . substr($vao,2);
        elseif ($sl == 4)
            $vao=substr($vao,0,1) . "," . substr($vao,1);
        return($vao);
    }

---

So many choices about how to set the background color!

    if ($bgct == 2) {
        $bgct=0;
        $bgcolor="#D7D7D7";
    }
    else
        $bgcolor="#FFFFFF";
    $bgcolor="#FFFFFF";
    $bgcolor="#FCF5E4";

---

For God's sake, don't use any more variables than absolutely necessary!

    if ($uselc > 'A')
        printf("<input TYPE=\"radio\" onclick=\"arrows2(%d);document.simsearch.searchwords.focus()\" NAME=\"sorder\" value=\"4\" $schk4> </td>\n<td><font face=\"arial\" size=\"-1\">LC Call, Author, Title</td>",$imageval+8+$imageadd);
    else
        printf("<input TYPE=\"radio\" onclick=\"arrows2(%d);document.simsearch.searchwords.focus()\" NAME=\"sorder\" value=\"4\" $schk4> </td>\n<td><font face=\"arial\" size=\"-1\">Dewey, Author, Title</td>",$imageval+8+$imageadd);

---

This determination of odd numbers, it is too baffling!

    for ($x=1;$x<13;$x++) {
        if (($x == 1) || ($x == 3) || ($x == 5) || ($x == 7) || ($x == 9) || ($x == 11)) {
            ....
    }

---

Here's another way of distinguishing similar variables: Capitalize them!

    if ($pages > 0)
        $Pages=", $pages" . "p";
    else
        $Pages="";

---

This just sort of sums it up:

    if ( $month < 1 || $month > 12 ) {
        die( "Month must be between 1 and 12\n" );
    }
    --$month; // Just because that's the way it's always been

---

A simple || would make this simpler. Instead, we have false laziness.

    if ($pubmonth == "")
        $pubmonth = 0;
    if ($pubmonth == 0)
        $pubmonth = 1;

---

Who needs arrays?

    $s0=$s1=$s2=$s3=$s4=$s5=$s6=$s7=$s8=$s9=$s10=$s11=$s12=$s13=$s14=$s15=$s16=$s17=$s18=$s19=$s20=$s21=$s22=$s23=$s24="";

---

Optimizing cut & pasted code to remove the variable that will always be 10 is a good start, but why only go halfway there?

    <textarea name="text1" readonly style="overflow: hidden"  rows="<?php print 10 ?>" cols="34" wrap="soft">

---

One of the biggest problems programmers seem to have is expecting that others know what they're thinking.

    $dformat='l';         // changed on 9-6-01

Changed how? What was `$dformat` before? WHY was it changed?

---

C programming can be so difficult; for example, to open a file with a constant name:

    char    BookName[50],Review[50];
    /* later */
    sprintf(Review,"/web/flr.data/fixedbook.idx");
    if((Rev=fopen(Review,"a")) == NULL) {
    /* ... */

---

If only there was a way to say, "do this, else do that"...

    <?
    if ($subuser != 'Y') : ?><a href="...">...</a><?
    endif;
    if ($subuser == 'Y') : ?><img
    src="..."><?
    endif;
    ?>

Bonus: PHP's awful `if (condition) : statements; endif;` syntax!

---

Make sure that this 100-hyphen line is left-justified in a 100-column space!

    printf("%-100s\n",str_repeat("-",100));

---

Just to be extra sure...

    if ($totqty == 0)
    $totqty=0;
    if ($totprice == 0)
    $totprice = 0;
    if ($totdisc == 0)
    $totdisc = 0;

---

What's our record number?

    rn=1;
    rn = (rn - 1) * rl + lh;

Never mind the reuse of `rn` as a variable name, that reduces to:

    rn = lh;

---

I guess he didn't know that `sprintf` can handle more than one variable.

    $xxx=sprintf("%02d",$gridrows);
    $yyy=sprintf("%02d",$gridcols);
    $gridrepeat=$xxx . $yyy;

---

If you've had problems with memory overruns, the answer is to solve the problem, not throw in arbitrarily huge memory buffers that are actually buffers against slop.

    char crazeee1 [100000];
    PGresult *lres;
    char crazee1 [100000];
    PGresult *res2;
    char crazee [100000];
    PGresult *resthree;
    char crazee2 [100000];
    PGresult *res4;

---

When erasing disk drives, you want to write out one pattern on the drive, then write a different pattern over that. But you don't have to do that with variables.

    $isbns="";
    $isbns=array();

---

I've never liked the removal of vowels as a method to shorten variables, such as the common exercise here of the results of a query being called `$rslt`. But what if you need another one? You call it `$rlst`!

Pete Krawczyk, coworker at the time, counted all the variations in the codebase:

       4 $r1lt
       4 $r2lt
      18 $r9lt
       3 $ralt
      94 $rblt
      33 $rclt
      29 $rdlt
       6 $rest
     161 $revt
      50 $rflt
     608 $rglt
      36 $rhlt
      20 $rilt
      46 $rjlt
     188 $rklt
       4 $rllt
       7 $rlst
      53 $rplt
     507 $rqlt
      66 $rrlt
    7345 $rslt
      94 $rtlt
      32 $rult
     169 $rvlt
     114 $rwlt
    1962 $rxlt
       4 $rylt
     744 $rzlt
