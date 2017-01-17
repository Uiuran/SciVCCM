// Scilab Voltage Clamped Conductive Membrane rotines package 
//    Copyleft (C) 2012 &o00oo00o&
//                         P
//                       _/\/\_
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//   (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//    Sourceforge: https://sourceforge.net/p/scivccm


//** V-clamp data for Squid Axon**//

param.E_Na = 55; // Na Nernst potential
param.E_Kp= -72;// K Nernst potential
param.E_L= -49.4;// Leaky potential
param.E_Ks= -72 // K slow Nernst

// Parametros fitados do gate m
param.mc(1)=0.1;
param.mc(2)=25;
param.mc(3)=25;
param.mc(4)=10;
param.mo(1)=4;
param.mo(2)=18;

// Parametros fitados do gate h
param.hc(1)=0.07;
param.hc(2)=20;
param.ho(1)=30;
param.ho(2)=10;

// Parametros fitados do gate n
param.nc(1)=0.01;
param.nc(2)=10;
param.nc(3)=10;
param.nc(4)=10;
param.no(1)=0.126;
param.no(2)=80;

// Slow (K) n tests

param.snc(1) = 10.0;
param.snc(2) =10;
param.snc(3) =10;
param.snc(4) = 10;
param.sno(1) = 10.26;
param.sno(2) = 80;


//Non-inactivation gate for K
Vpar = 10;
param.ks(1)=5;
param.ks(2)=-20;
param.T_ks = 20;//20

//Non-inactivation gate for K
param.nc_Na(1)= 500;
param.nc_Na(2)=0.0325;
param.TNa = 0.0405;

//cubic nonlinear amplitude of Na current

param.Na_amp(1) = -150;
param.Na_amp(2) = 0.0305;

// Capacitancias máximas, em nS, para cada canal

param.g_Na=120;//120
param.g_Na_Num=1//2;
param.g_Kp = 8;//36 H-H original // 9 H-H com corrente K rapida modulada por K lenta
param.g_Ks = 5;
param.g_Kp_Num=1;
param.g_L=0.3;//0.3

x0 = [-65;0.3;0.2;0.35];
t = linspace(0,1000,200000);
// Capacitancia da membrana porosa dielétrica e potencial de repouso
param.C = 1;
param.vrest=-60;

// x0 = [-40;0.5;0.7;0.9]; pulsando  ~ 6.5 s de mesmo tipo de pulso, gates também pulsando
//x0 = [30;0.5;0.7;0.7]; pulsando  ~ 5 s de mesmo tipo de pulso, gates também pulsando
