#!/usr/local/bin/perl -sw 
$;=$/;seek+DATA,!++$/,!$s;$_=<DATA>;$s&&print||$g&&do{$y=($x||=20)*($y||8);sub 
i{sleep&f}sub'p{print$;x$=,join$;,$b=~/.{$x}/g}$j=$j;sub'f{pop}sub 
n{substr($b,&f%$y,3)=~tr,O,O,}sub'g{$f=&f-1;($w,$w,substr($b,&f,1),O)[n($f-$x)+ 
n($x+$f)-(substr($b,&f,1)eq+O)+n$f]||$w}$w="\40";$b=join'',@ARGV?<>:$_,$w 
x$y;$b=~s).)$&=~/\w/?O:$w)ge;substr($b,$y)=q++;$g='$i=0;$i?$b:$c=$b; 
substr+$c,$i,1,g$i;$g=~s?\d+?($&+1)%$y?e;$i-$y+1?eval$g:do{$i=-1;$b=$c;p;i 
1}';sub'e{eval$g;&e}e}||eval||die+No.$; 
__DATA__ 
if($j){{$^W=$|;*_=sub{$=+s=#([A-z])(.*)#=#$+$1#=g}} 
@s=(q[$_=sprintf+pop@s,@s],q[ 
if($j){{$^W=$|;*_=sub{$=+s=#([A-z])(.*)#=#$+$1#=g}}     #_The_Perl_Journal_# 
@s=(q[%s],q[%s])x2;%s;print"\n"x&_,$_;i$j;eval} 
])x2;$_=sprintf+pop@s,@s;print"\n"x&_,$_;i$j;eval}$/=$y;$"=",";print 
q<#!/usr/local/bin/perl -sw 
if(!$s){>.($_=<>).q<}else{@s=(q[printf+pop@s,@s],q[#!/usr/local/bin/perl -sw 
if(!$s){>.(s$%$%%$g,tr=[=[===tr=]=]=||&d,$_).q<}else{@s=(q[%s],q[%s])x2;%s} 
])x2;printf+pop@s,@s} 
>

