fileID = 1;

fprintf(fileID , '%s\n' , "Sprawdzenie wpływu rozmiaru n na dokładność");
fprintf(fileID , '%s\n' , "obliczeń dla kilku wybranych funkcji");
fprintf(fileID , '%s\n' , "poprzez policzenie błędu globalnego");
fprintf(fileID , '%s\n' , "przy użyciu metody Rungego-Kutty (kor = -1)");
fprintf(fileID , '%s\n' , "liczony jest również rząd metody ");
fprintf(fileID , '%s\n\n' , "czyli logarytm o podstawie z 4 z ilorazu dwóch kolejnych błędów globalnych");

pause;

fprintf(fileID , '%s\n' , "równanie 1");
ex=(3^(2/3) - 1)*3;
fprintf(fileID , '%s\n' , "równanie: @(x) 5*x^2*y''(x) - 5*x*y'(x) + 5*y(x) = 0");
fprintf(fileID , '%s\n' , "Warunki początkowe: y(1) = 0 , y'(1) = 2/3");
fprintf(fileID , '%s\n' , "rozwiązanie równania y(x) = (x^(2/3) - 1)*x");
fprintf(fileID , '%s %f\n' , "Obliczana wartośc: y(3) =" , ex);


[x , y1 , dy , ddy]=P1Z12_IST_prekor(@(x)5 , @(x) - 5*x , @(x)3*x^2 , @(x)0 , 0 , 2/3 , 1 , 3 , 4 , -1);
[x , y2 , dy , ddy]=P1Z12_IST_prekor(@(x)5 , @(x) - 5*x , @(x)3*x^2 , @(x)0 , 0 , 2/3 , 1 , 3 , 4^2 , -1);
[x , y3 , dy , ddy]=P1Z12_IST_prekor(@(x)5 , @(x) - 5*x , @(x)3*x^2 , @(x)0 , 0 , 2/3 , 1 , 3 , 4^3 , -1);
[x , y4 , dy , ddy]=P1Z12_IST_prekor(@(x)5 , @(x) - 5*x , @(x)3*x^2 , @(x)0 , 0 , 2/3 , 1 , 3 , 4^4 , -1);
[x , y5 , dy , ddy]=P1Z12_IST_prekor(@(x)5 , @(x) - 5*x , @(x)3*x^2 , @(x)0 , 0 , 2/3 , 1 , 3 , 4^5 , -1);
[x , y6 , dy , ddy]=P1Z12_IST_prekor(@(x)5 , @(x) - 5*x , @(x)3*x^2 , @(x)0 , 0 , 2/3 , 1 , 3 , 4^6 , -1);
[x , y7 , dy , ddy]=P1Z12_IST_prekor(@(x)5 , @(x) - 5*x , @(x)3*x^2 , @(x)0 , 0 , 2/3 , 1 , 3 , 4^7 , -1);
[x , y8 , dy , ddy]=P1Z12_IST_prekor(@(x)5 , @(x) - 5*x , @(x)3*x^2 , @(x)0 , 0 , 2/3 , 1 , 3 , 4^8 , -1);
[x , y9 , dy , ddy]=P1Z12_IST_prekor(@(x)5 , @(x) - 5*x , @(x)3*x^2 , @(x)0 , 0 , 2/3 , 1 , 3 , 4^9 , -1);

erG1=abs(ex - y1(4+1));
erG2=abs(ex - y2(4^2+1));
erG3=abs(ex - y3(4^3+1));
erG4=abs(ex - y4(4^4+1));
erG5=abs(ex - y5(4^5+1));
erG6=abs(ex - y6(4^6+1));
erG7=abs(ex - y7(4^7+1));
erG8=abs(ex - y8(4^8+1));
erG9=abs(ex - y9(4^9+1));

fprintf(fileID , '\t%6s %8s\t  %13s\n' , "n" , "błąd" , "rząd metody");
fprintf(fileID , '\t%7s\t %1.3e  %s\n' , "4^1" , erG1 , "---------");
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^2" , erG2 , log(erG1/erG2)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^3" , erG3 , log(erG2/erG3)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^4" , erG4 , log(erG3/erG4)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^5" , erG5 , log(erG4/erG5)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^6" , erG6 , log(erG5/erG6)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^7" , erG7 , log(erG6/erG7)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^8" , erG8 , log(erG7/erG8)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n\n' , "4^9" , erG9 , log(erG8/erG9)/log(4));

pause;

fprintf(fileID , '%s\n' , "równanie 2");
ex=125;
fprintf(fileID , '%s\n' , "równanie: @(x) x*y''(x) + (x^3 - 8)*y(x)");
fprintf(fileID , '%s\n' ,   "- (x^2 + 3)*y(x) = 6*x^2 - (x^2 + 3) *x^3 + 3*(x^3 - 8)*x^2");
fprintf(fileID , '%s\n' , "Warunki początkowe: y(2) = 8 , y'(2) = 12");
fprintf(fileID , '%s\n' , "rozwiązanie równania y(x) = x^3");
fprintf(fileID , '%s\n' , "Obliczana wartośc: y(5) = 125");

[x , y1 , dy , ddy]=P1Z12_IST_prekor(@(x) - x^2 - 3 , @(x)x^3 - 8 , @(x)x , @(x)6*x^2 - (x^2 + 3) *x^3 + 3*(x^3 - 8)*x^2 , 8 , 12 , 2 , 5 , 4 , -1);
[x , y2 , dy , ddy]=P1Z12_IST_prekor(@(x) - x^2 - 3 , @(x)x^3 - 8 , @(x)x , @(x)6*x^2 - (x^2 + 3) *x^3 + 3*(x^3 - 8)*x^2 , 8 , 12 , 2 , 5 , 4^2 , -1);
[x , y3 , dy , ddy]=P1Z12_IST_prekor(@(x) - x^2 - 3 , @(x)x^3 - 8 , @(x)x , @(x)6*x^2 - (x^2 + 3) *x^3 + 3*(x^3 - 8)*x^2 , 8 , 12 , 2 , 5 , 4^3 , -1);
[x , y4 , dy , ddy]=P1Z12_IST_prekor(@(x) - x^2 - 3 , @(x)x^3 - 8 , @(x)x , @(x)6*x^2 - (x^2 + 3) *x^3 + 3*(x^3 - 8)*x^2 , 8 , 12 , 2 , 5 , 4^4 , -1);
[x , y5 , dy , ddy]=P1Z12_IST_prekor(@(x) - x^2 - 3 , @(x)x^3 - 8 , @(x)x , @(x)6*x^2 - (x^2 + 3) *x^3 + 3*(x^3 - 8)*x^2 , 8 , 12 , 2 , 5 , 4^5 , -1);
[x , y6 , dy , ddy]=P1Z12_IST_prekor(@(x) - x^2 - 3 , @(x)x^3 - 8 , @(x)x , @(x)6*x^2 - (x^2 + 3) *x^3 + 3*(x^3 - 8)*x^2 , 8 , 12 , 2 , 5 , 4^6 , -1);
[x , y7 , dy , ddy]=P1Z12_IST_prekor(@(x) - x^2 - 3 , @(x)x^3 - 8 , @(x)x , @(x)6*x^2 - (x^2 + 3) *x^3 + 3*(x^3 - 8)*x^2 , 8 , 12 , 2 , 5 , 4^7 , -1);
[x , y8 , dy , ddy]=P1Z12_IST_prekor(@(x) - x^2 - 3 , @(x)x^3 - 8 , @(x)x , @(x)6*x^2 - (x^2 + 3) *x^3 + 3*(x^3 - 8)*x^2 , 8 , 12 , 2 , 5 , 4^8 , -1);
[x , y9 , dy , ddy]=P1Z12_IST_prekor(@(x) - x^2 - 3 , @(x)x^3 - 8 , @(x)x , @(x)6*x^2 - (x^2 + 3) *x^3 + 3*(x^3 - 8)*x^2 , 8 , 12 , 2 , 5 , 4^9 , -1);

erG1=abs(ex - y1(4+1));
erG2=abs(ex - y2(4^2+1));
erG3=abs(ex - y3(4^3+1));
erG4=abs(ex - y4(4^4+1));
erG5=abs(ex - y5(4^5+1));
erG6=abs(ex - y6(4^6+1));
erG7=abs(ex - y7(4^7+1));
erG8=abs(ex - y8(4^8+1));
erG9=abs(ex - y9(4^9+1));

fprintf(fileID , '\t%6s %8s\t  %13s\n' , "n" , "błąd" , "rząd metody");
fprintf(fileID , '\t%7s\t %1.3e  %s\n' , "4^1" , erG1 , "---------");
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^2" , erG2 , log(erG1/erG2)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^3" , erG3 , log(erG2/erG3)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^4" , erG4 , log(erG3/erG4)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^5" , erG5 , log(erG4/erG5)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^6" , erG6 , log(erG5/erG6)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^7" , erG7 , log(erG6/erG7)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^8" , erG8 , log(erG7/erG8)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n\n' , "4^9" , erG9 , log(erG8/erG9)/log(4));

pause;

fprintf(fileID , '%s\n' , "równanie 3");
ex=3^5;
fprintf(fileID , '%s\n' , "równanie: @(x) x^(1/2)*y''(x) - (2/x)*y'(x) + x^2*y(x)");
fprintf(fileID , '%s\n' , " = x^4 - 5*x^2 + 2/x - 4");
fprintf(fileID , '%s\n' , "Warunki początkowe: y(1) = -4 , y'(1) = 3*log(3)");
fprintf(fileID , '%s\n' , "rozwiązanie równania y(x) = 3^x");
fprintf(fileID , '%s %f\n' , "Obliczana wartośc: y(5) = " ,ex);

[x , y1 , dy , ddy]=P1Z12_IST_prekor(@(x)x^2 , @(x)-2/x , @(x)x^(1/2) , @(x)(-(2/x)*log(3) + x^(1/2)*log(3)^2 + x^2)*3^x , 3 , 3*log(3) , 1 , 5 , 4 , -1);
[x , y2 , dy , ddy]=P1Z12_IST_prekor(@(x)x^2 , @(x)-2/x , @(x)x^(1/2) , @(x)(-(2/x)*log(3) + x^(1/2)*log(3)^2 + x^2)*3^x , 3 , 3*log(3) , 1 , 5 , 4^2 , -1);
[x , y3 , dy , ddy]=P1Z12_IST_prekor(@(x)x^2 , @(x)-2/x , @(x)x^(1/2) , @(x)(-(2/x)*log(3) + x^(1/2)*log(3)^2 + x^2)*3^x , 3 , 3*log(3) , 1 , 5 , 4^3 , -1);
[x , y4 , dy , ddy]=P1Z12_IST_prekor(@(x)x^2 , @(x)-2/x , @(x)x^(1/2) , @(x)(-(2/x)*log(3) + x^(1/2)*log(3)^2 + x^2)*3^x , 3 , 3*log(3) , 1 , 5 , 4^4 , -1);
[x , y5 , dy , ddy]=P1Z12_IST_prekor(@(x)x^2 , @(x)-2/x , @(x)x^(1/2) , @(x)(-(2/x)*log(3) + x^(1/2)*log(3)^2 + x^2)*3^x , 3 , 3*log(3) , 1 , 5 , 4^5 , -1);
[x , y6 , dy , ddy]=P1Z12_IST_prekor(@(x)x^2 , @(x)-2/x , @(x)x^(1/2) , @(x)(-(2/x)*log(3) + x^(1/2)*log(3)^2 + x^2)*3^x , 3 , 3*log(3) , 1 , 5 , 4^6 , -1);
[x , y7 , dy , ddy]=P1Z12_IST_prekor(@(x)x^2 , @(x)-2/x , @(x)x^(1/2) , @(x)(-(2/x)*log(3) + x^(1/2)*log(3)^2 + x^2)*3^x , 3 , 3*log(3) , 1 , 5 , 4^7 , -1);
[x , y8 , dy , ddy]=P1Z12_IST_prekor(@(x)x^2 , @(x)-2/x , @(x)x^(1/2) , @(x)(-(2/x)*log(3) + x^(1/2)*log(3)^2 + x^2)*3^x , 3 , 3*log(3) , 1 , 5 , 4^8 , -1);
[x , y9 , dy , ddy]=P1Z12_IST_prekor(@(x)x^2 , @(x)-2/x , @(x)x^(1/2) , @(x)(-(2/x)*log(3) + x^(1/2)*log(3)^2 + x^2)*3^x , 3 , 3*log(3) , 1 , 5 , 4^9 , -1);


erG1=abs(ex - y1(4+1));
erG2=abs(ex - y2(4^2+1));
erG3=abs(ex - y3(4^3+1));
erG4=abs(ex - y4(4^4+1));
erG5=abs(ex - y5(4^5+1));
erG6=abs(ex - y6(4^6+1));
erG7=abs(ex - y7(4^7+1));
erG8=abs(ex - y8(4^8+1));
erG9=abs(ex - y9(4^9+1));

fprintf(fileID , '\t%6s %8s\t  %13s\n' , "n" , "błąd" , "rząd metody");
fprintf(fileID , '\t%7s\t %1.3e  %s\n' , "4^1" , erG1 , "---------");
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^2" , erG2 , log(erG1/erG2)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^3" , erG3 , log(erG2/erG3)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^4" , erG4 , log(erG3/erG4)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^5" , erG5 , log(erG4/erG5)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^6" , erG6 , log(erG5/erG6)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^7" , erG7 , log(erG6/erG7)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^8" , erG8 , log(erG7/erG8)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n\n' , "4^9" , erG9 , log(erG8/erG9)/log(4));

pause;

fprintf(fileID , '%s\n' , "równanie 4");
ex=sin(2*pi);
fprintf(fileID , '%s\n' , "równanie: @(x) x^3*y''(x) +x^2*y'(x) + x*y(x) =");
fprintf(fileID , '%s\n' , " = x^2*cos(x) - x^3*sin(x) + x*sin(x)");
fprintf(fileID , '%s\n' , "Warunki początkowe: y(pi/4) = (2^(1/2))/2 , y'(pi/4) = (2^(1/2))/2");
fprintf(fileID , '%s\n' , "rozwiązanie równania y(x) = sin(x)");
fprintf(fileID , '%s %f\n' , "Obliczana wartośc: y(2*pi) =" , ex);


[x1 , y1 , dy , ddy]=P1Z12_IST_prekor(@(x)x , @(x)x^2 , @(x)x^3 , @(x)x^2*cos(x) - x^3*sin(x) + x*sin(x) , (2^(1/2))/2 , (2^(1/2))/2 , pi/4 , 2*pi , 4 , -1);
[x2 , y2 , dy , ddy]=P1Z12_IST_prekor(@(x)x , @(x)x^2 , @(x)x^3 , @(x)x^2*cos(x) - x^3*sin(x) + x*sin(x) , (2^(1/2))/2 , (2^(1/2))/2 , pi/4 , 2*pi , 4^2 , -1);
[x3 , y3 , dy , ddy]=P1Z12_IST_prekor(@(x)x , @(x)x^2 , @(x)x^3 , @(x)x^2*cos(x) - x^3*sin(x) + x*sin(x) , (2^(1/2))/2 , (2^(1/2))/2 , pi/4 , 2*pi , 4^3 , -1);
[x4 , y4 , dy , ddy]=P1Z12_IST_prekor(@(x)x , @(x)x^2 , @(x)x^3 , @(x)x^2*cos(x) - x^3*sin(x) + x*sin(x) , (2^(1/2))/2 , (2^(1/2))/2 , pi/4 , 2*pi , 4^4 , -1);
[x5 , y5 , dy , ddy]=P1Z12_IST_prekor(@(x)x , @(x)x^2 , @(x)x^3 , @(x)x^2*cos(x) - x^3*sin(x) + x*sin(x) , (2^(1/2))/2 , (2^(1/2))/2 , pi/4 , 2*pi , 4^5 , -1);
[x6 , y6 , dy , ddy]=P1Z12_IST_prekor(@(x)x , @(x)x^2 , @(x)x^3 , @(x)x^2*cos(x) - x^3*sin(x) + x*sin(x) , (2^(1/2))/2 , (2^(1/2))/2 , pi/4 , 2*pi , 4^6 , -1);
[x7 , y7 , dy , ddy]=P1Z12_IST_prekor(@(x)x , @(x)x^2 , @(x)x^3 , @(x)x^2*cos(x) - x^3*sin(x) + x*sin(x) , (2^(1/2))/2 , (2^(1/2))/2 , pi/4 , 2*pi , 4^7 , -1);
[x8 , y8 , dy , ddy]=P1Z12_IST_prekor(@(x)x , @(x)x^2 , @(x)x^3 , @(x)x^2*cos(x) - x^3*sin(x) + x*sin(x) , (2^(1/2))/2 , (2^(1/2))/2 , pi/4 , 2*pi , 4^8 , -1);
[x9 , y9 , dy , ddy]=P1Z12_IST_prekor(@(x)x , @(x)x^2 , @(x)x^3 , @(x)x^2*cos(x) - x^3*sin(x) + x*sin(x) , (2^(1/2))/2 , (2^(1/2))/2 , pi/4 , 2*pi , 4^9 , -1);

erG1=abs(ex - y1(4+1));
erG2=abs(ex - y2(4^2+1));
erG3=abs(ex - y3(4^3+1));
erG4=abs(ex - y4(4^4+1));
erG5=abs(ex - y5(4^5+1));
erG6=abs(ex - y6(4^6+1));
erG7=abs(ex - y7(4^7+1));
erG8=abs(ex - y8(4^8+1));
erG9=abs(ex - y9(4^9+1));

fprintf(fileID , '\t%6s %8s\t  %13s\n' , "n" , "błąd" , "rząd metody");
fprintf(fileID , '\t%7s\t %1.3e  %s\n' , "4^1" , erG1 , "---------");
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^2" , erG2 , log(erG1/erG2)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^3" , erG3 , log(erG2/erG3)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^4" , erG4 , log(erG3/erG4)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^5" , erG5 , log(erG4/erG5)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^6" , erG6 , log(erG5/erG6)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^7" , erG7 , log(erG6/erG7)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^8" , erG8 , log(erG7/erG8)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n\n' , "4^9" , erG9 , log(erG8/erG9)/log(4));

pause;

fprintf(fileID , '%s\n' , "równanie 5");
ex=log(5);
fprintf(fileID , '%s\n' , "równanie: @(x) x^(1/2)*y''(x) +x^(1/3)*y'(x) + x^(1/4)*y(x) =");
fprintf(fileID , '%s\n' , " = -x^-(3/2) + x^-(2/3) + x^(1/4)*log(x)");
fprintf(fileID , '%s\n' , "Warunki początkowe: y(1) = 0 , y'(1) = 1)");
fprintf(fileID , '%s\n' , "rozwiązanie równania y(x) = log(x)");
fprintf(fileID , '%s %f\n' , "Obliczana wartośc: y(5) = " ,ex);

[x , y1 , dy , ddy]=P1Z12_IST_prekor(@(x)x^(1/4) , @(x)x^(1/3) , @(x)x^(1/2) , @(x)-x^-(3/2) + x^-(2/3) + x^(1/4)*log(x) , 0 , 1 , 1 , 5 , 4 , -1);
[x , y2 , dy , ddy]=P1Z12_IST_prekor(@(x)x^(1/4) , @(x)x^(1/3) , @(x)x^(1/2) , @(x)-x^-(3/2) + x^-(2/3) + x^(1/4)*log(x) , 0 , 1 , 1 , 5 , 4^2 , -1);
[x , y3 , dy , ddy]=P1Z12_IST_prekor(@(x)x^(1/4) , @(x)x^(1/3) , @(x)x^(1/2) , @(x)-x^-(3/2) + x^-(2/3) + x^(1/4)*log(x) , 0 , 1 , 1 , 5 , 4^3 , -1);
[x , y4 , dy , ddy]=P1Z12_IST_prekor(@(x)x^(1/4) , @(x)x^(1/3) , @(x)x^(1/2) , @(x)-x^-(3/2) + x^-(2/3) + x^(1/4)*log(x) , 0 , 1 , 1 , 5 , 4^4 , -1);
[x , y5 , dy , ddy]=P1Z12_IST_prekor(@(x)x^(1/4) , @(x)x^(1/3) , @(x)x^(1/2) , @(x)-x^-(3/2) + x^-(2/3) + x^(1/4)*log(x) , 0 , 1 , 1 , 5 , 4^5 , -1);
[x , y6 , dy , ddy]=P1Z12_IST_prekor(@(x)x^(1/4) , @(x)x^(1/3) , @(x)x^(1/2) , @(x)-x^-(3/2) + x^-(2/3) + x^(1/4)*log(x) , 0 , 1 , 1 , 5 , 4^6 , -1);
[x , y7 , dy , ddy]=P1Z12_IST_prekor(@(x)x^(1/4) , @(x)x^(1/3) , @(x)x^(1/2) , @(x)-x^-(3/2) + x^-(2/3) + x^(1/4)*log(x) , 0 , 1 , 1 , 5 , 4^7 , -1);
[x , y8 , dy , ddy]=P1Z12_IST_prekor(@(x)x^(1/4) , @(x)x^(1/3) , @(x)x^(1/2) , @(x)-x^-(3/2) + x^-(2/3) + x^(1/4)*log(x) , 0 , 1 , 1 , 5 , 4^8 , -1);
[x , y9 , dy , ddy]=P1Z12_IST_prekor(@(x)x^(1/4) , @(x)x^(1/3) , @(x)x^(1/2) , @(x)-x^-(3/2) + x^-(2/3) + x^(1/4)*log(x) , 0 , 1 , 1 , 5 , 4^9 , -1);

erG1=abs(ex - y1(4+1));
erG2=abs(ex - y2(4^2+1));
erG3=abs(ex - y3(4^3+1));
erG4=abs(ex - y4(4^4+1));
erG5=abs(ex - y5(4^5+1));
erG6=abs(ex - y6(4^6+1));
erG7=abs(ex - y7(4^7+1));
erG8=abs(ex - y8(4^8+1));
erG9=abs(ex - y9(4^9+1));

fprintf(fileID , '\t%6s %8s\t  %13s\n' , "n" , "błąd" , "rząd metody");
fprintf(fileID , '\t%7s\t %1.3e  %s\n' , "4^1" , erG1 , "---------");
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^2" , erG2 , log(erG1/erG2)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^3" , erG3 , log(erG2/erG3)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^4" , erG4 , log(erG3/erG4)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^5" , erG5 , log(erG4/erG5)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^6" , erG6 , log(erG5/erG6)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^7" , erG7 , log(erG6/erG7)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n' , "4^8" , erG8 , log(erG7/erG8)/log(4));
fprintf(fileID , '\t%7s\t %1.3e  %4f\n\n' , "4^9" , erG9 , log(erG8/erG9)/log(4));
