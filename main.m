%Fig2 curveA
gK0 = 0.09;
gK00 = 7.06; %gK00 means gK-infinite
tn = 0.75;
t = 0:0.1:5;
gK= (gK00.^(0.25)-(gK00.^(0.25)-gK0.^(0.25))*exp(-t/tn)).^4;
plot(t,gK);
%%
%Fig2 curveB
gK00 = 0.09;
gK0 = 7.06; %gK00 means gK-infinite
tn = 1.1;
t = 0:0.1:5;
gK= (gK00.^(0.25)-(gK00.^(0.25)-gK0.^(0.25))*exp(-t/tn)).^4;
plot(t,gK);
%%
%Fig 3
gK0 = 0.24;
gK00 = [20.70 20.00 18.60 17.00 15.70 13.27 10.29 8.62 6.84 5.00 1.47 0.98]; %gK00 means gK-infinite
tn = [1.05 1.10 1.25 1.50 1.70 2.05 2.60 3.20 3.80 4.50 5.25 5.25];
t = 0:0.1:12;
for i=1:12   
    gK= (gK00(i).^(0.25)-(gK00(i).^(0.25)-gK0.^(0.25))*exp(-t/tn(i))).^4;
    plot(t,gK);
    hold on;
end
%%
%fig6
gNa0 = [40.3 42.6 46.8 39.5 38.2 30.7 20.0 15.3 7.90 1.44 0.13 0.046];% gNa'
tm = [0.140 0.160 0.200 0.189 0.252 0.318 0.382 0.520 0.600 0.400 0.220 0.200];
th = [0.67 0.67 0.67 0.84 0.84 1.06 1.27 1.33 1.50 2.30 5.52 6.73];
t = 0:0.1:12;
for i=1:12   
    gNa = gNa0(i)*((1-exp(-t/tm(i))).^3).*exp(-t/th(i));
    plot(t,gNa);
    hold on;
end
%%
%fig11
V = [-5 -10 -20 -30 -40 -60 -80 -100 -115 -130];% gNa'
gK = 36;
gNa = 120;
gl = 0.3;
VK = 12;
VNa = -115;
Vl = -10.613;

n0 = 0.5;
m0 = 0.5;
h0 = 0.5;

t = 0:0.1:10;
for i=1:10 
    
    alpha_n = 0.01*(V(i)+10)/(exp((V(i)+10)/10)-1);
    beta_n = 0.125*exp(V(i)/80);
    alpha_m = 0.1*(V(i)+25)/(exp((V(i)+25)/10)-1);
    beta_m = 4*exp(V(i)/18);
    alpha_h = 0.07*exp(V(i)/20);
    beta_h = 1/(exp((V(i)+30)/10)+1);
    
    n00 = alpha_n/(alpha_n+beta_n);
    tn = 1/(alpha_n+beta_n);
    m00 = alpha_m/(alpha_m+beta_m);
    tm = 1/(alpha_m+beta_m);
    h00 = alpha_h/(alpha_h+beta_h);
    th = 1/(alpha_h+beta_h);
    
    n = n00-(n00-n0)*exp(-t/tn);
    m = m00-(m00-m0)*exp(-t/tm);
    h = h00-(h00-h0)*exp(-t/th);
    
    I = gK*(n.^4).*(V(i)-VK)+gNa*(m.^3).*h.*(V(i)-VNa)+gl*(V(i)-Vl);
    plot(t,I);
    hold on;
end
%%






