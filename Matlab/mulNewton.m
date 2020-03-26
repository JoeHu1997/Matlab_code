
% x0������ܼƪ��_�l��,funcMat�O��Ӥ�{,var����Ӥ�{������ܼ�,eps������
% ���y���N�k�ѤG���D�u�ʤ�{��

a1=0.45;
a2=0.2;
sigma1=2*pi()*0.4;
sigma2=2*pi()*0.3;
Um=-0.35;
Om=0.14;
h=5;
g=9.8066;

Us=Um+0.5*Om*h;

syms k1 k2
sigma01=g*k1*tanh(k1*h)/(sigma1-Us*k1+Om*tanh(k1*h));
sigma02=g*k2*tanh(k2*h)/(sigma2-Us*k2+Om*tanh(k2*h));
G20 = Gamma2(k1, k1, sigma01, sigma01, g, h, Om);
G02 = Gamma2(k2, k2, sigma02, sigma02, g, h, Om);
G11p = Gamma2(k1, k2, sigma01, sigma02, g, h, Om);
G11m = Gamma2(k1, -k2, sigma01, -sigma02, g, h, Om);
L20 = Lambda2(k1, k1, sigma01, sigma01, g, h, Om);
L02 = Lambda2(k2, k2, sigma02, sigma02, g, h, Om);
L11p = Lambda2(k1, k2, sigma01, sigma02, g, h, Om);
L11m = Lambda2(k1, -k2, sigma01, -sigma02, g, h, Om);

DR1=-sigma1+Us*k1+sigma01+...
    a1^2*k1^2*tanh(k1*h)/(sigma01*(2*sigma01+Om*tanh(k1*h)))*(...
    G20*((g*k1+sigma01*Om)*cosh(2*k1*h)+sigma01^2*(cosh(3*k1*h)/sinh(k1*h)-2*sinh(2*k1*h))+0.5*Om*(sigma01+Om*sinh(2*k1*h)))...
   +L20/k1*sigma01*0.25*((sigma01^2-Om^2)-(g*k1+sigma01*Om)*coth(k1*h))...
   +2*sigma01*(sigma01^2*(0.5*coth(k1*h)+0.5*(coth(k1*h))^3-0.75*coth(k1*h)/(sinh(k1*h))^2)+Om*(1.25-0.25*(coth(k1*h))^2)))...
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
DR2=-sigma2+Us*k2+sigma02+...
    a2^2*k2^2*tanh(k2*h)/(sigma02*(2*sigma02+Om*tanh(k2*h)))*(...
    G02*((g*k2+sigma02*Om)*cosh(2*k2*h)+sigma02^2*(cosh(3*k2*h)/sinh(k2*h)-2*sinh(2*k2*h))+0.5*Om*(sigma02+Om*sinh(2*k2*h)))...
    +L02/k2*sigma02*0.25*((sigma02^2-Om^2)-(g*k2+sigma02*Om)*coth(k2*h))...
    +2*sigma02*(sigma02^2*(0.5*coth(k2*h)+0.5*(coth(k2*h))^3-0.75*coth(k2*h)/(sinh(k2*h))^2)+Om*(1.25-0.25*(coth(k2*h))^2)))...
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

 x0 = [-0.5 0.4];
 funcMat=[DR1 DR2];
      
 var=[sym('k1') sym('k2')];
 eps=1.0e-4;

n_Var = size(var,2);%�ܼƪ��Ӽ�
n_Func = size(funcMat,2);%�禡���Ӽ�
n_X = size(x0,2);%�ܼƪ��Ӽ�

if n_X ~= n_Var && n_X ~= n_Func
    fprintf('Expression Error!\n');
    exit(0);
end

myfd=myf(x0, funcMat, var);
dmyfd=dmyf(x0, funcMat, var);

r=x0-myfd*inv(dmyfd);
n=0;
tol=1;
while tol>=eps
    x0=r;
    myfd=myf(x0, funcMat, var);
    dmyfd=dmyf(x0, funcMat, var);
    r=x0-myfd*inv(dmyfd);
    tol=norm(r-x0);
    n=n+1;
    if(n>100000)
        disp('���N�B�ƤӦh�A��{�i�ण����');
        return;
    end
end
[r,n]