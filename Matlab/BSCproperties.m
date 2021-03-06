function [G10, G01, G20, G02, G11p, G11m, L20, L02, L11p, L11m,...
    G30, G03, G21p, G21m, G12p, G12m,...
    L30, L03, L21p, L21m, L12p, L12m, L130, L103]...
    = BSCproperties(a1, a2, Us, Om, k1, k2, sigma01, sigma02, g, h);



G10 = (sigma01/k1)/sinh(k1*h);
G01 = (sigma02/k2)/sinh(k2*h);

G20 = Gamma2(k1, k1, sigma01, sigma01, g, h, Om);
G02 = Gamma2(k2, k2, sigma02, sigma02, g, h, Om);
G11p = Gamma2(k1, k2, sigma01, sigma02, g, h, Om);
G11m = Gamma2(k1, -k2, sigma01, -sigma02, g, h, Om);

L20 = Lambda2(k1, k1, sigma01, sigma01, g, h, Om);
L02 = Lambda2(k2, k2, sigma02, sigma02, g, h, Om);
L11p = Lambda2(k1, k2, sigma01, sigma02, g, h, Om);
L11m = Lambda2(k1, -k2, sigma01, -sigma02, g, h, Om);

G21p = Gamma3(2, 1, k1, k2, sigma01, sigma02, g, h, Om);
G21m = Gamma3(2, 1, k1, -k2, sigma01, -sigma02, g, h, Om);
G12p = Gamma3(1, 2, k1, k2, sigma01, sigma02, g, h, Om);
G12m = Gamma3(1, 2, k1, -k2, sigma01, -sigma02, g, h, Om);

L21p = Lambda3(2, 1, k1, k2, sigma01, sigma02, g, h, Om);
L21m = Lambda3(2, 1, k1, -k2, sigma01, -sigma02, g, h, Om);
L12p = Lambda3(1, 2, k1, k2, sigma01, sigma02, g, h, Om);
L12m = Lambda3(1, 2, k1, -k2, sigma01, -sigma02, g, h, Om);

G30 = (G20*k1*(-3*g*k1*cosh(2*k1*h)+6*sigma01^2*sinh(2*k1*h)-...
    3*sigma01^2*coth(k1*h))...
    +L20*sigma01*(-1.5*g*k1*coth(k1*h)+1.5*sigma01^2)-1.5*g*L20*k1*Om...
    +k1*sigma01*(-(3/4)*g*k1+(3/4)*sigma01^2*coth(k1*h)-(3/4)*sigma01*Om))...
 /(3*g*k1*sinh(3*k1*h)-9*sigma01^2*cosh(3*k1*h)-3*sigma01*Om*sinh(3*k1*h));
L30 = (1/(3*sigma01))*...
    (G30*3*k1*sinh(3*k1*h)+G20*k1^2*3*cosh(2*k1*h)+0.5*L20*k1*...
    (3*sigma01*coth(k1*h)+3*Om)+(3/4)*k1^2*sigma01);

G03 = (G02*k2*(-3*g*k2*cosh(2*k2*h)+6*sigma02^2*sinh(2*k2*h)-...
    3*sigma02^2*coth(k2*h))...
    +L02*sigma02*(-1.5*g*k2*coth(k2*h)+1.5*sigma02^2)-1.5*g*L02*k2*Om...
    +k2*sigma02*(-(3/4)*g*k2+(3/4)*sigma02^2*coth(k2*h)-(3/4)*sigma02*Om))...
 /(3*g*k2*sinh(3*k2*h)-9*sigma02^2*cosh(3*k2*h)-3*sigma02*Om*sinh(3*k2*h));
L03 = (1/(3*sigma02))*...
    (G03*3*k2*sinh(3*k2*h)+G02*k2^2*3*cosh(2*k2*h)+0.5*L02*k2*...
    (3*sigma02*coth(k2*h)+3*Om)+(3/4)*k2^2*sigma02);

sigma21=a1^2*k1^2*tanh(k1*h)/(sigma01*(2*sigma01+Om*tanh(k1*h)))*(...
    G20*((g*k1+sigma01*Om)*cosh(2*k1*h)+sigma01^2*(cosh(3*k1*h)/sinh(k1*h)-2*sinh(2*k1*h))+0.5*Om*(sigma01+Om*sinh(2*k1*h)))...
   +L20/k1*sigma01*0.25*((sigma01^2-Om^2)-(g*k1+sigma01*Om)*coth(k1*h))...
   +sigma01^2*(sigma01*(coth(k1*h)+(coth(k1*h))^3-1.5*coth(k1*h)/(sinh(k1*h))^2)+Om*(2.5-0.5*(coth(k1*h))^2)))...
+a2^2*k1*tanh(k1*h)/(sigma01*(2*sigma01+Om*tanh(k1*h)))*(...
    G11p*(k1+k2)*((0.5*g*(k1+k2)+0.5*(sigma01+sigma02)*Om)*cosh((k1+k2)*h)+(0.5*Om^2-0.5*(sigma01+sigma02)^2)*sinh((k1+k2)*h)...
    +sigma02*(sigma01*cosh((k1+2*k2)*h/sinh(k2*h))+0.5*Om*sinh(k1*h)/sinh(k2*h)))...
   +G11m*(k1-k2)*((0.5*g*(k1-k2)+0.5*(sigma01-sigma02)*Om)*cosh((k1-k2)*h)+(0.5*Om^2-0.5*(sigma01-sigma02)^2)*sinh((k1-k2)*h)...
    +sigma02*(sigma01*cosh((k1-2*k2)*h/sinh(k2*h))+0.5*Om*sinh(k1*h)/sinh(k2*h)))...
   +(L11p-L11m)*sigma02*(0.5*(sigma02^2-Om^2)-0.5*(g*k2+sigma02*Om)*coth(k2*h))...
   +sigma01*(0.75*k1*sigma01*Om+coth(k1*h)*(sigma02*(k1+k2)*(sigma01+Us*k1-sigma02-Us*k2)-0.25*k1*sigma01^2)...
   +coth(k2*h)*(sigma02*(k1+k2)*(sigma01-sigma02))...
   -coth(k1*h)*coth(k2*h)*0.5*k1*Om*sigma02+0.25*g*k1^2+1.5*k2*Om*sigma02...
   +sigma02^2*(-0.5*k1*coth(k1*h)/(sinh(k2*h))^2+k2*(coth(k2*h)+(cosh(k1*h))^3/(sinh(k1*h)*(sinh(k2*h))^2)-coth(k1*h)/(sinh(k2*h))^2))));

sigma22=a2^2*k2^2*tanh(k2*h)/(sigma02*(2*sigma02+Om*tanh(k2*h)))*(...
    G02*((g*k2+sigma02*Om)*cosh(2*k2*h)+sigma02^2*(cosh(3*k2*h)/sinh(k2*h)-2*sinh(2*k2*h))+0.5*Om*(sigma02+Om*sinh(2*k2*h)))...
    +L02/k2*sigma02*0.25*((sigma02^2-Om^2)-(g*k2+sigma02*Om)*coth(k2*h))...
    +sigma02^2*(sigma02*(coth(k2*h)+(coth(k2*h))^3-1.5*coth(k2*h)/(sinh(k2*h))^2)+Om*(2.5-0.5*(coth(k2*h))^2)))...
 +a1^2*k2*tanh(k2*h)/(sigma02*(2*sigma02+Om*tanh(k2*h)))*(...
    G11p*(k1+k2)*((0.5*g*(k1+k2)+0.5*(sigma01+sigma02)*Om)*cosh((k1+k2)*h)+(0.5*Om^2-0.5*(sigma01+sigma02)^2)*sinh((k1+k2)*h)...
    +sigma01*(sigma02*cosh((2*k1+k2)*h/sinh(k1*h))+0.5*Om*sinh(k2*h)/sinh(k1*h)))...
   +G11m*(k1-k2)*(-(0.5*g*(k1-k2)-0.5*(sigma01-sigma02)*Om)*cosh((k1-k2)*h)-(0.5*Om^2-0.5*(sigma01-sigma02)^2)*sinh((k1-k2)*h)...
    +sigma01*(sigma02*cosh((2*k1-k2)*h/sinh(k2*h))+0.5*Om*sinh(k2*h)/sinh(k1*h)))...
   +(L11p-L11m)*sigma01*(0.5*(sigma01^2-Om^2)-0.5*(g*k1+sigma01*Om)*coth(k1*h))...
   +sigma02*(0.75*k2*sigma02*Om+coth(k2*h)*(sigma01*(k1+k2)*(sigma02+Us*k2-sigma01-Us*k1)-0.25*k2*sigma02^2)...
   +coth(k1*h)*(sigma01*(k1+k2)*(sigma02-sigma01))...
   -coth(k1*h)*coth(k2*h)*0.5*k2*Om*sigma01+0.25*g*k2^2+1.5*k1*Om*sigma01...
   +sigma01^2*(-0.5*k2*coth(k2*h)/(sinh(k1*h))^2+k1*(coth(k1*h)+(cosh(k2*h))^3/(sinh(k2*h)*(sinh(k1*h))^2)-coth(k2*h)/(sinh(k1*h))^2))));

L130 = (1/g)*((1/k1)*sigma01^2*sigma21*coth(k1*h)...
    +a1^2*sigma01*(k1*G20*(0.5*sinh(2*k1*h)-0.5*coth(k1*h)*cosh(2*k1*h))+0.25*sigma01*L20-(5/8)*k1*sigma01*coth(k1*h)-(3/8)*k1*Om)...
    +a2^2*((k1+k2)*G11p*(0.5*sigma01*sinh((k1+k2)*h)-0.5*sigma02*coth(k2*h)*cosh((k1+k2)*h))...
    +(k1-k2)*G11m*(0.5*sigma01*sinh((k1-k2)*h)-0.5*sigma02*coth(k2*h)*cosh((k1-k2)*h))...
    +0.5*sigma02^2*(L11p-L11m)...
    +(0.25*sigma01*coth(k1*h)*(k1*sigma01-2*k2*sigma02)-0.5*sigma02*coth(k2*h)*(k1*sigma01+k2*sigma02))...
    -(0.25*Om*(k1*sigma01+2*k2*sigma02))));
L103 = (1/g)*((1/k2)*sigma02^2*sigma22*coth(k2*h)...
    +a2^2*sigma02*(k2*G02*(0.5*sinh(2*k2*h)-0.5*coth(k2*h)*cosh(2*k2*h))+0.25*sigma02*L02-(5/8)*k2*sigma02*coth(k2*h)-(3/8)*k2*Om)...
    +a1^2*((k1+k2)*G11p*(0.5*sigma02*sinh((k1+k2)*h)-0.5*sigma01*coth(k1*h)*cosh((k1+k2)*h))...
    +(k1-k2)*G11m*(-0.5*sigma02*sinh((k1-k2)*h)-0.5*sigma01*coth(k1*h)*cosh((k1-k2)*h))...
    +0.5*sigma01^2*(L11p-L11m)...
    +(0.25*sigma02*coth(k2*h)*(k2*sigma02-2*k1*sigma01)-0.5*sigma01*coth(k1*h)*(k2*sigma02+k1*sigma01))...
    -(0.25*Om*(k2*sigma02+2*k1*sigma01))));