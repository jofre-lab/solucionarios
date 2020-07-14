# LaTeX2HTML 2018 (Released Feb 1, 2018)
# Associate images original text with physical files.


$key = q/A,B,C;MSF=1.6;AAT/;
$cached_env_img{$key} = q|<IMG
 WIDTH="55" HEIGHT="30" ALIGN="MIDDLE" BORDER="0"
 SRC="|."$dir".q|img1.png"
 ALT="$A,B,C$">|; 

$key = q/{displaymath}Pleft(bigcup_{n=1}^{infty}A_{n}right)leqsum_{n=1}^{infty}Pleft(A_{n}right){displaymath};MSF=1.6;AAT/;
$cached_env_img{$key} = q|<IMG
 WIDTH="182" HEIGHT="55" BORDER="0"
 SRC="|."$dir".q|img2.png"
 ALT="\begin{displaymath}
P\left(\bigcup_{n=1}^{\infty}A_{n}\right)\leq\sum_{n=1}^{\infty}P\left(A_{n}\right)
\end{displaymath}">|; 

1;

