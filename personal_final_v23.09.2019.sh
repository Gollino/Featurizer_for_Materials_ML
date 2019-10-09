#!/bin/bash
echo 'Created by Felipe Gollino version 06.09.2019'
#Input:
#in 0.dat
#Formula   SG    nspecies   aurl   CLASS
#As_1_Ta_1 109   2          aflowlib.duke.edu/AFLOWDATA/ICSD_WEB/BCT/Ag1Ta1_ICSD_44068      TOP
#===================
#in list.dat
#material=$(echo ${arr[0]}) As_1_Ta_1
#space_group=$(echo ${arr[1]}) symmetry:SG_109
#nspecies=$(echo ${arr[2]}) 2
#code_icsd=$(echo ${arr[3]}) code:ICSD_44068
#go_url=$(echo ${arr[4]}) As_1_Ta_ICSD_44068
#class=$(echo ${arr[5]}) class.TOP
#As_1_Ta_1   symmetry:SG_109   2   code:ICSD_44068   As_1_Ta_ICSD_44068   TOP
#IMPORTANTE:
#Sem cabeçario no arquivo 0.dat
#Se modificar as features atomicos ajustar o dummy.dat e o header.tmp
#Need:
#-GFortran
#sudo apt install gfortran
#USE final.dat file
======= Colors ========
BOLD='\e[1m'
BLINK='\e[5m'
D_RED='\e[31m'
L_RED='\e[91m'
CYAN='\e[36m'
GREEN='\e[92m'
BLUE='\e[94m'
CYAN='\e[96m'
RESET='\e[0m'

clear
date
clock_0=0

scp * 0.dat

### code ICSD
#cat 0.dat | awk '{print $1"\tsymmetry:SG_"$2"\t"$3"\tcode:ICSD_"$4"\t"$1"_ICSD_"$4"\tclass."$5 }' > list.dat
#awk '{gsub("_ICSD_","@",$4)}1' list.dat | awk '{gsub("_","",$4)}1' | awk '{gsub("@","_ICSD_",$4)}1' > list.tmp

### prototype
cat 0.dat | awk '{print $1"\tsymmetry:SG_"$2"\t"$3"\t"$4"\tclass."$5 }' > list.dat

echo -ne ${L_RED}'Removing problematic atoms...'${RESET}
echo -e

sed -i '/H_/d'  list.dat # 01
sed -i '/Ne_/d' list.dat # 10
sed -i '/Ar_/d' list.dat # 18
sed -i '/Sc_/d' list.dat # 21
sed -i '/Ti_/d' list.dat # 22
sed -i '/Kr_/d' list.dat # 36
sed -i '/Tc_/d' list.dat # 43
sed -i '/Xe_/d' list.dat # 54
sed -i '/La_/d' list.dat # 57
sed -i '/Ce_/d' list.dat # 58
sed -i '/Pr_/d' list.dat # 59
sed -i '/Nd_/d' list.dat # 60
sed -i '/Pm_/d' list.dat # 61
sed -i '/Sm_/d' list.dat # 62
sed -i '/Eu_/d' list.dat # 63
sed -i '/Gd_/d' list.dat # 64
sed -i '/Tb_/d' list.dat # 65
sed -i '/Dy_/d' list.dat # 66
sed -i '/Ho_/d' list.dat # 67
sed -i '/Er_/d' list.dat # 68
sed -i '/Tm_/d' list.dat # 69
sed -i '/Yb_/d' list.dat # 70
sed -i '/Lu_/d' list.dat # 71
sed -i '/Po_/d' list.dat # 84
sed -i '/At_/d' list.dat # 85
sed -i '/Rn_/d' list.dat # 86
sed -i '/Fr_/d' list.dat # 87
sed -i '/Ra_/d' list.dat # 88
sed -i '/Ac_/d' list.dat # 89
sed -i '/Th_/d' list.dat # 90
sed -i '/Pa_/d' list.dat # 91
sed -i '/U_/d'  list.dat # 92

sed -i 's/aflowlib.duke.edu\/AFLOWDATA\/ICSD_WEB\/TRI\///g'  list.dat
sed -i 's/aflowlib.duke.edu\/AFLOWDATA\/ICSD_WEB\/MCL\///g'  list.dat
sed -i 's/aflowlib.duke.edu\/AFLOWDATA\/ICSD_WEB\/MCLC\///g' list.dat
sed -i 's/aflowlib.duke.edu\/AFLOWDATA\/ICSD_WEB\/ORC\///g'  list.dat
sed -i 's/aflowlib.duke.edu\/AFLOWDATA\/ICSD_WEB\/ORCC\///g' list.dat
sed -i 's/aflowlib.duke.edu\/AFLOWDATA\/ICSD_WEB\/ORCF\///g' list.dat
sed -i 's/aflowlib.duke.edu\/AFLOWDATA\/ICSD_WEB\/ORCI\///g' list.dat
sed -i 's/aflowlib.duke.edu\/AFLOWDATA\/ICSD_WEB\/TET\///g'  list.dat
sed -i 's/aflowlib.duke.edu\/AFLOWDATA\/ICSD_WEB\/BCT\///g'  list.dat
sed -i 's/aflowlib.duke.edu\/AFLOWDATA\/ICSD_WEB\/HEX\///g'  list.dat
sed -i 's/aflowlib.duke.edu\/AFLOWDATA\/ICSD_WEB\/RHL\///g'  list.dat
sed -i 's/aflowlib.duke.edu\/AFLOWDATA\/ICSD_WEB\/CUB\///g'  list.dat
sed -i 's/aflowlib.duke.edu\/AFLOWDATA\/ICSD_WEB\/FCC\///g'  list.dat
sed -i 's/aflowlib.duke.edu\/AFLOWDATA\/ICSD_WEB\/BCC\///g'  list.dat

echo -ne ${CYAN}
cat -n list.dat
echo -ne ${RESET}
nmaterials=$(wc -l list.dat | cut -d' ' -f1)                                                                                                             # ALTERNATIVE: show how many line in 0.dat, you must digit that number x+1 below

#echo 'PDF parameters: Write 'START[space]STEP[space]END' for radius (number with dot, like '1.0'), followed by [ENTER]:'
#read START STEP END

echo ''OK!!! Just one minute... We\'ll start soon...''

echo -ne ${L_RED}'#                                                                                                   (01%) \r'${RESET}
sleep 1

#Z atomic_mass HOMO LUMO First_Ionization Electroaffinity HOMO-SOC LUMO-SOC IP-SOC EA-SOC Parameter-SOC Electronegativity_Pauling Polarizability rs rp r_atomic r_valence r_covalent Group(1-18) Period valence_S valence_P valence_D valence_F Valence_Electron_SP Valence_Electrons Empty_states_S Empty_states_P Empty_states_D Empty_states_F Empty_states+ Empty_states 

H=$(echo	1	1.007940	-6.4925	0.7250	13.59844	0.754	-6.4925	0.7251	-12.6833	-1.5273	0.0000557932	2.2000	0.6670	---	---	0.2500	0.3865	0.3800	1	1	1	0	0	0	1	1	1	6	10	14	1	31	)
He=$(echo	2	4.002602	-15.7610	1.5714	24.58741	-0.500	-15.7640	1.5714	-26.7499	3.0204	0.0002802058	---	0.2050	0.2964	1.0292	0.3100	0.2964	0.3200	18	1	2	0	0	0	2	2	0	6	10	14	0	30	)
Li=$(echo	3	6.941000	-2.8744	-0.9074	5.39172	0.618	-2.8744	-0.9075	-5.3606	-0.5863	0.0007191123	0.9800	24.3350	1.6578	1.8874	1.4500	1.6578	1.3400	1	2	1	0	0	0	1	1	1	6	10	14	1	31	)
Be=$(echo	4	9.012182	-5.6097	-2.0104	9.32270	-0.500	-5.6097	-2.0109	-9.5006	0.7974	0.0014134276	1.5700	5.6000	1.0805	1.2128	1.0500	1.0805	0.9000	2	2	2	0	0	0	2	2	0	6	10	14	0	30	)
B=$(echo	5	10.811000	-3.6067	2.4547	8.29803	0.279	-3.6057	2.4537	-8.1249	0.0319	0.0023681111	2.0400	3.0300	0.8025	0.8348	0.8500	0.8348	0.8200	13	2	2	1	0	0	3	3	0	5	10	14	5	29	)
C=$(echo	6	12.010700	-5.2854	3.7464	11.26030	1.262	-5.2827	3.7441	-10.7378	-0.7084	0.0036327568	2.5500	1.6700	0.6418	0.6367	0.7000	0.6367	0.7700	14	2	2	2	0	0	4	4	0	4	10	14	4	28	)
N=$(echo	7	14.006700	-7.0898	4.1526	14.53414	-0.070	-7.0838	4.1488	-13.4588	-1.6717	0.0051949662	3.0400	1.1000	0.5361	0.5154	0.6500	0.5154	0.7500	15	2	2	3	0	0	5	5	0	3	10	14	3	27	)
O=$(echo	8	15.999400	-9.0305	4.2084	13.61806	1.461	-9.0190	3.0142	-16.2932	-2.8068	0.0070671378	3.4400	0.8020	0.4608	0.4333	0.6000	0.4333	0.7300	16	2	2	4	0	0	6	6	0	2	10	14	2	26	)
F=$(echo	9	18.9984032	-11.1140	1.7177	17.42282	3.401	-11.0912	1.7177	-19.2311	-4.0664	0.0092988655	3.9800	0.5570	0.4044	0.3740	0.5000	0.3740	0.7100	17	2	2	5	0	0	7	7	0	1	10	14	1	25	)
Ne=$(echo	10	20.1797000	-13.3330	2.7416	21.56460	-1.200	-13.3009	2.7411	-22.3140	5.0518	0.0119025479		0.3940	0.3604	0.3292	0.3800	0.3292	0.6900	18	2	2	6	0	0	8	8	0	0	10	14	0	24	)
Na=$(echo	11	22.9897693	-0.2186	0.9747	5.13908	0.547	-2.7439	-0.2261	-5.1426	-0.6355	0.0148781849	0.9300	24.1100	1.7586	2.2172	1.8000	1.7586	1.5400	1	3	1	0	0	0	1	1	1	6	10	14	1	31	)
Mg=$(echo	12	24.3050000	-4.7054	-1.0945	7.64624	-0.400	-4.7054	-1.1003	-7.9325	1.5413	0.0182257765	1.3100	10.7670	1.3518	1.6131	1.5000	1.3518	1.3000	2	3	2	0	0	0	2	2	0	6	10	14	0	30	)
Al=$(echo	13	26.9815386	-2.7120	3.1169	5.98577	0.432	-2.7067	3.1168	-5.7109	0.0405	0.0219453227	1.6100	6.8000	1.1043	1.3965	1.2500	1.3965	1.1800	13	3	2	1	0	0	3	3	0	5	10	14	5	29	)
Si=$(echo	14	28.0855000	-4.0809	3.7444	8.15169	1.389	-4.0707	3.7258	-7.6740	-0.7975	0.0261608084	1.9000	5.5300	0.9466	1.1405	1.1000	1.1405	1.1100	14	3	2	2	0	0	4	4	0	4	10	14	4	28	)
P=$(echo	15	30.9737620	-5.5066	4.1941	10.48669	0.746	-5.4891	4.1935	-9.6747	-1.5811	0.0306242638	2.1900	3.6300	0.8336	0.9712	1.0000	0.9712	1.0600	15	3	2	3	0	0	5	5	0	3	10	14	3	27	)
S=$(echo	16	32.0650000	-7.0084	4.6395	10.36001	2.077	-6.9810	4.6386	-11.6948	-2.5741	0.0357076437	2.5800	2.9000	0.7473	0.8493	1.0000	0.8493	1.0200	16	3	2	4	0	0	6	6	0	2	10	14	2	26	)
Cl=$(echo	17	35.4530000	-8.5947	4.9242	12.96764	3.612	-8.5540	4.9235	-13.7830	-3.6491	0.0410389932	3.1600	2.1800	0.6785	0.7567	1.0000	0.7567	0.9900	17	3	2	5	0	0	7	7	0	1	10	14	1	25	)
Ar=$(echo	18	39.9480000	-10.2690	4.0435	15.75962	-1.000	-10.2115	4.0019	-16.0170	4.4839	0.0468662823		1.6410	0.6222	0.6835	0.7100	0.6835	0.9700	18	3	2	6	0	0	8	8	0	0	10	14	0	24	)
K=$(echo	19	39.0983000	-2.3189	-0.4040	4.34066	0.501	-2.3189	-0.4180	-4.3142	-0.4514	0.0531895109	0.8200	43.2300	2.2049	0.9378	2.2000	2.2049	1.9600	1	4	1	0	0	0	1	1	1	6	10	14	1	31	)
Ca=$(echo	20	40.0780000	-3.7676	-1.9349	6.11316	0.024	-3.7676	-1.9441	-6.2818	1.1973	0.0600086789	1.0000	25.7330	1.7988	2.0269	1.8000	1.7988	1.7400	2	4	2	0	0	0	2	2	0	6	10	14	0	30	)
Sc=$(echo	21	44.9559120	-3.2357	-0.1844	6.56150	0.188	-3.2528	-3.2243	---	0.8477	0.0669518319	1.3600	17.8000	1.6506	1.6230	1.6000	0.5809	1.4400	3	4	2	0	1	0	2	3	0	6	9	14	9	29	)
Ti=$(echo	22	47.8670000	-4.2515	-0.1659	6.82810	0.075	-4.2877	-4.2440	---	-0.2661	0.0743909243	1.5400	14.6000	1.5455	1.5379	1.4000	0.5192	1.3600	4	4	2	0	2	0	2	4	0	6	8	14	8	28	)
V=$(echo	23	50.9415000	-4.4742	0.1316	6.74620	0.527	-4.5038	-4.4501	-7.2616	-0.2555	0.0830698655	1.6300	12.4000	1.5000	1.4672	1.3500	0.4753	1.2500	5	4	2	0	3	0	2	5	0	6	7	14	7	27	)
Cr=$(echo	24	51.9961000	-4.4654	0.4900	6.76650	0.675	-4.4334	0.4107	-7.3095	-0.7277	0.0917488066	1.6600	11.6000	1.4266	1.4063	1.4000	0.4392	1.2700	6	4	1	0	4	0	1	6	1	6	6	14	6	27	)
Mn=$(echo	25	54.9380450	-4.4043	1.8306	7.43402	-0.500	-4.3626	1.6932	-7.3826	-0.9773	0.1004277478	1.5500	9.4000	1.3699	1.2646	1.4000	0.4082	1.3900	7	4	2	0	5	0	2	7	0	6	5	14	5	25	)
Fe=$(echo	26	55.8450000	-4.4232	-0.5256	7.90240	0.153	-4.3732	-0.5555	-7.3738	-1.3882	0.1103465377	1.8300	8.4000	1.3369	1.7071	1.4000	0.3822	1.2500	8	4	2	0	6	0	2	8	0	6	4	14	4	24	)
Co=$(echo	27	58.9331950	-4.4102	0.2412	7.88100	0.662	-4.3548	0.2039	-7.4384	-1.3063	0.1202653276	1.9100	7.5000	1.2965	1.6081	1.3500	0.3590	1.2100	9	4	2	0	7	0	2	9	0	6	3	14	3	23	)
Ni=$(echo	28	58.6934000	-4.3916	0.5082	7.63980	1.157	-4.3304	0.4636	-7.5065	-1.2070	0.1314239663	1.8800	6.8000	1.2589	1.5700	1.3500	0.3377	1.2600	10	4	1	0	9	0	2	10	1	6	1	14	2	22	)
Cu=$(echo	29	63.5460000	-4.6082	1.3569	7.72638	1.235	-4.6082	1.2410	-8.2910	-1.3619	0.1425826049	1.9000	6.1500	1.2022	1.2492	1.3500	1.2022	1.3800	11	4	1	0	10	0	1	11	1	6	0	14	1	21	)
Zn=$(echo	30	65.3800000	-5.9772	-0.7858	9.39420	-0.600	-5.9772	-0.8596	-9.8943	1.9330	0.1537412436	1.6500	5.8170	1.1068	1.6435	1.3500	1.1068	1.3100	12	4	2	0	10	0	2	12	0	6	0	14	0	20	)
Ga=$(echo	31	69.7230000	-2.5791	3.2730	5.99930	0.430	-2.6553	-2.5397	-5.7265	0.0668	0.1661397310	1.8100	8.1200	1.0027	1.3440	1.3000	1.3440	1.2600	13	4	2	1	10	0	3	13	0	5	0	14	5	19	)
Ge=$(echo	32	72.6300000	-3.8948	3.4236	7.89940	1.232	-4.0179	-3.8308	-7.5349	-0.6580	0.1797780671	2.0100	5.8400	0.9220	1.1721	1.2500	1.1721	1.2200	14	4	2	2	10	0	4	14	0	4	0	14	4	18	)
As=$(echo	33	74.9216000	-5.1964	4.1976	9.78860	0.804	-5.1007	4.0412	-8.9924	-1.5202	0.1921765545	2.1800	4.3100	0.8558	1.0507	1.1500	1.0507	1.1900	15	4	2	3	10	0	5	15	0	3	0	14	3	17	)
Se=$(echo	34	78.9600000	-6.5105	4.7429	9.75238	2.020	-6.3811	4.5507	-10.6520	-2.4179	0.2070547393	2.5500	3.7700	0.7997	0.9578	1.1500	0.9578	1.1600	16	4	2	4	10	0	6	16	0	2	0	14	2	16	)
Br=$(echo	35	79.9040000	-7.8585	5.4193	11.81381	3.363	-7.6871	5.1846	-12.3191	-3.3579	0.2206930754	2.9600	3.0500	0.7514	0.8834	1.1500	0.8834	1.1400	17	4	2	5	10	0	7	17	0	1	0	14	1	15	)
Kr=$(echo	36	83.7980000	-9.2458	4.2123	13.99961	-1.000	-9.0251	4.1116	-14.0264	6.5768	0.2355712603	3.0000	2.4840	0.7093	0.8218	0.8800	0.8218	1.1000	18	4	2	6	10	0	8	18	0	0	0	14	0	14	)
Rb=$(echo	37	85.4678000	-2.2313	-0.1321	4.17713	0.485	-2.2313	-0.1760	-4.1437	-0.4859	0.2516892939	0.8200	47.2700	2.3142	2.5170	2.3500	2.3142	2.1100	1	5	1	0	0	0	1	1	1	6	10	14	1	31	)
Sr=$(echo	38	87.6200000	-3.5253	-1.1102	5.69490	0.052	-3.5253	-1.1550	-5.8607	0.8463	0.2678073275	0.9500	25.5500	1.9583	2.2671	2.0000	1.9583	1.9200	2	5	2	0	0	0	2	2	0	6	10	14	0	30	)
Y=$(echo	39	88.9058500	-2.5187	-0.9887	6.21710	0.307	-2.5699	-2.4846	-6.2318	0.6205	0.2839253611	1.2200	22.7000	1.7851	1.9482	1.8000	0.9426	1.6200	3	5	2	0	1	0	2	3	0	6	9	14	9	29	)
Zr=$(echo	40	91.2240000	-3.6022	-0.5279	6.63390	0.433	-3.6783	-3.5514	-7.5051	-0.0783	0.3012832434	1.3300	17.9000	1.6694	1.7575	1.5500	0.8444	1.4800	4	5	2	0	2	0	2	4	0	6	8	14	8	28	)
Nb=$(echo	41	92.9063800	-4.6186	-0.7269	6.75885	0.917	-4.6652	-4.5490	-7.1871	-0.9500	0.3198809745	1.6000	15.7000	1.5752	1.7332	1.4500	0.7728	1.3700	5	5	1	0	4	0	1	5	1	6	6	14	7	27	)
Mo=$(echo	42	95.9600000	-4.3183	-0.1345	7.09243	0.747	-4.3259	-4.2348	-6.8668	-1.4730	0.3384787056	2.1600	12.8000	1.5418	1.6626	1.4500	0.7271	1.4500	6	5	1	0	5	0	1	6	1	6	5	14	6	26	)
Tc=$(echo	43	98.0000000	-3.9595	0.4892	7.28000	0.550	-3.8698	0.2736	-6.7193	-1.2998	0.3570764367	1.9000	11.4000	1.5154	1.6015	---	0.6854	1.5600	7	5	2	0	5	0	1	7	0	6	5	14	5	25	)
Ru=$(echo	44	101.0700000	-3.5960	1.1132	7.36050	1.046	-3.5070	0.8730	-7.4421	-0.9531	0.3769140165	2.2000	9.6000	1.4868	1.5480	1.3000	0.6473	1.2600	8	5	1	0	7	0	1	8	1	6	3	14	4	24	)
Rh=$(echo	45	102.9055000	-3.5046	-3.3159	7.45890	1.142	-3.3619	-3.3159	-8.1602	-0.5498	0.3967515963	2.2800	8.6000	1.4607	1.5004	1.3500	0.6129	1.3500	9	5	1	0	8	0	1	9	1	6	2	14	3	23	)
Pd=$(echo	46	106.4200000	-4.1184	-3.4298	8.33690	0.562	-3.9450	-3.4298	-8.7865	-0.5361	0.4178290249	2.2000	4.8000	1.4218	1.4577	1.4000	0.5805	1.3100	10	5	0	0	10	0	0	10	2	6	0	14	0	22	)
Ag=$(echo	47	107.8682000	-4.4022	0.9657	7.57620	1.304	-4.4021	0.6701	-7.8182	-1.2720	0.4389064534	1.9300	6.9900	1.3241	1.4180	1.6000	1.3241	1.5300	11	5	1	0	10	0	1	11	1	6	0	14	1	21	)
Cd=$(echo	48	112.4110000	-5.6570	-0.9432	8.99380	-0.700	-5.6570	-1.1292	-9.2604	1.4516	0.4612237307	1.6900	7.3200	1.2355	1.8040	1.5500	1.2355	1.4800	12	5	2	0	10	0	2	12	0	6	0	14	0	20	)
In=$(echo	49	114.8180000	-2.5181	2.6968	5.78636	0.383	-2.7148	-2.4096	-5.5634	-0.1615	0.4835410080	1.7800	9.6500	1.1407	1.5133	1.5500	1.5133	1.4400	13	5	2	1	10	0	3	13	0	5	0	14	5	19	)
Sn=$(echo	50	118.7100000	-3.6934	2.8969	7.34390	1.112	-3.9778	-3.5282	-7.1531	-0.6953	0.5070981340	1.9600	7.0600	1.0660	1.3554	1.4500	1.3554	1.4100	14	5	2	2	10	0	4	14	0	4	0	14	4	18	)
Sb=$(echo	51	121.7600000	-4.8268	4.7346	8.60840	1.047	-4.6012	4.2760	-8.0367	-1.3698	0.5306552601	2.0500	6.6000	1.0035	1.2400	1.4500	1.2400	1.3800	15	5	2	3	10	0	5	15	0	3	0	14	3	17	)
Te=$(echo	52	127.6000000	-5.9517	3.9881	9.00960	1.970	-5.6565	3.4793	-9.3677	-2.1853	0.5554522348	2.1000	5.5000	0.9497	1.1492	1.4000	1.1492	1.3500	16	5	2	4	10	0	6	16	0	2	0	14	2	16	)
I=$(echo	53	126.9044700	-7.0839	4.2268	10.45126	3.059	-6.7057	3.8147	-10.6835	-2.9703	0.5814890583	2.6600	5.0250	0.9024	1.0749	1.4000	1.0749	1.3300	17	5	2	5	10	0	7	17	0	1	0	14	1	15	)
Xe=$(echo	54	131.2930000	-8.2320	1.2083	12.12980	-0.800	-7.7608	1.2082	-12.0439	3.6531	0.6062860331	2.6000	4.0440	0.8604	1.0121	1.0800	1.0121	1.3000	18	5	2	6	10	0	8	18	0	0	0	14	0	14	)
Cs=$(echo	55	132.9054519	-2.0859	-0.2279	3.89390	0.471	-2.0859	-0.3518	-3.8463	-0.5090	0.6323228566	0.7900	59.4200	2.5357	2.7555	2.6000	2.5357	2.2500	1	6	1	0	0	0	1	1	1	6	10	14	1	31	)
Ba=$(echo	56	137.3270000	-3.2293	-1.9206	5.21170	0.144	-3.2293	-2.0117	-5.3475	0.9655	0.6571198314	0.8900	39.7000	2.1967	2.3694	2.1500	2.1967	1.9800	2	6	2	0	0	0	2	2	0	6	10	14	0	30	)
Hf=$(echo	72	178.4900000	-2.6937	-0.4781	6.82507	0.178	-2.9625	-2.5081	-6.8024	0.5395	1.1902547889	1.3000	16.2000	1.5366	1.7316	1.5500	0.8951	1.5000	4	6	2	0	2	14	2	18	0	6	8	0	8	14	)
Ta=$(echo	73	180.9478800	-3.5963	-0.4436	7.54960	0.323	-3.9466	-3.3536	-8.0772	-0.1088	1.2274502511	1.5000	13.1000	1.4665	1.6644	1.4500	0.8370	1.3800	5	6	2	0	3	14	2	19	0	6	7	0	7	13	)
W=$(echo	74	183.8400000	-4.4864	-0.3665	7.86400	0.816	-4.9224	-4.1825	-9.3017	-0.1578	1.2646457132	2.3600	11.1000	1.4074	1.6061	1.3500	0.7906	1.4600	6	6	2	0	4	14	2	20	0	6	6	0	6	12	)
Re=$(echo	75	186.2070000	-5.3736	-0.2670	7.83350	0.060	-5.0047	-0.9744	-9.0242	-0.7127	1.3018411754	1.9000	9.7000	1.3561	1.5549	1.3500	0.7516	1.5900	7	6	2	0	5	14	2	21	0	6	5	0	5	11	)
Os=$(echo	76	190.2300000	-6.0059	-0.0685	8.43820	1.077	-5.5718	-0.8214	-8.6886	-1.4332	1.3514351249	2.2000	8.5000	1.3156	1.5096	1.3000	0.7190	1.2800	8	6	2	0	6	14	2	22	0	6	4	0	4	10	)
Ir=$(echo	77	192.2170000	-5.6901	0.5069	8.96700	1.564	-5.2161	-0.3228	-8.3704	-2.0583	1.3886305871	2.2000	7.6000	0.9966	1.4695	1.3500	0.6939	1.3700	9	6	2	0	7	14	2	23	0	6	3	0	3	9	)
Pt=$(echo	78	195.0840000	-5.3120	0.8213	8.95870	2.125	-4.8090	0.0291	-8.5748	-1.6898	1.4258260492	2.2800	6.5000	0.9879	1.4721	1.3500	0.6707	1.2800	10	6	1	0	9	14	1	24	1	6	1	0	2	8	)
Au=$(echo	79	196.9665690	-5.7531	0.7024	9.22550	2.308	-5.7531	-0.1251	-9.3841	-2.3142	1.4754199988	2.5400	5.8000	1.2274	1.4369	1.3500	1.2274	1.4400	11	6	1	0	10	14	1	25	1	6	0	0	1	7	)
Hg=$(echo	80	200.5900000	-6.8080	0.8594	10.43750	-0.500	-6.8080	-1.3690	-10.7190	1.2734	1.5126154609	2.0000	5.3600	1.1675	1.8734	1.5000	1.1675	1.4900	12	6	2	0	10	14	2	26	0	6	0	0	0	6	)
Tl=$(echo	81	204.3833000	-2.3692	2.6329	6.10820	0.377	-2.9548	-1.9101	-5.8428	-0.3652	1.5622094105	1.6200	7.5500	1.0974	1.5446	1.9000	1.5446	1.4800	13	6	2	1	10	14	3	27	0	5	0	0	5	5	)
Pb=$(echo	82	207.2000000	-3.4960	2.5655	7.41666	0.356	-4.3124	-2.8218	-7.4779	-0.1649	1.6118033600	2.3300	6.9950	1.0396	1.4049	1.8000	1.4049	1.4700	14	6	2	2	10	14	4	28	0	4	0	0	4	4	)
Bi=$(echo	83	208.9804000	-4.5686	2.1526	7.28560	0.942	-3.6061	2.1526	-6.7766	-0.6841	1.6489988221	2.0200	7.4000	0.9899	1.3017	1.6000	1.3017	1.4600	15	6	2	3	10	14	5	29	0	3	0	0	3	3	)

echo -ne ${L_RED}'##########                                                                                          (10%) \r'${RESET}
sleep 1

#	SG_	Order	C2	C3	C4	C6	(C3)2	(C4)3	(C6)5	dH	dV	dD	i	S2	S3	S4	S6
SG_1=$(echo	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_2=$(echo	2	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0 )
SG_3=$(echo	2	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_4=$(echo	2	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_5=$(echo	2	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_6=$(echo	2	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0 )
SG_7=$(echo	2	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0 )
SG_8=$(echo	2	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0 )
SG_9=$(echo	2	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0 )
SG_10=$(echo	4	1	0	0	0	0	0	0	1	0	0	1	0	0	0	0 )
SG_11=$(echo	4	1	0	0	0	0	0	0	1	0	0	1	0	0	0	0 )
SG_12=$(echo	4	1	0	0	0	0	0	0	1	0	0	1	0	0	0	0 )
SG_13=$(echo	4	1	0	0	0	0	0	0	1	0	0	1	0	0	0	0 )
SG_14=$(echo	4	1	0	0	0	0	0	0	1	0	0	1	0	0	0	0 )
SG_15=$(echo	4	1	0	0	0	0	0	0	1	0	0	1	0	0	0	0 )
SG_16=$(echo	4	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_17=$(echo	4	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_18=$(echo	4	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_19=$(echo	4	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_20=$(echo	4	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_21=$(echo	4	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_22=$(echo	4	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_23=$(echo	4	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_24=$(echo	4	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_25=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_26=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_27=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_28=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_29=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_30=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_31=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_32=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_33=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_34=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_35=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_36=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_37=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_38=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_39=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_40=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_41=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_42=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_43=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_44=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_45=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_46=$(echo	4	1	0	0	0	0	0	0	0	2	0	0	0	0	0	0 )
SG_47=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_48=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_49=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_50=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_51=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_52=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_53=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_54=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_55=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_56=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_57=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_58=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_59=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_60=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_61=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_62=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_63=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_64=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_65=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_66=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_67=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_68=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_69=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_70=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_71=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_72=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_73=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_74=$(echo	8	3	0	0	0	0	0	0	3	0	0	1	0	0	0	0 )
SG_75=$(echo	4	1	0	1	0	0	1	0	0	0	0	0	0	0	0	0 )
SG_76=$(echo	4	1	0	1	0	0	1	0	0	0	0	0	0	0	0	0 )
SG_77=$(echo	4	1	0	1	0	0	1	0	0	0	0	0	0	0	0	0 )
SG_78=$(echo	4	1	0	1	0	0	1	0	0	0	0	0	0	0	0	0 )
SG_79=$(echo	4	1	0	1	0	0	1	0	0	0	0	0	0	0	0	0 )
SG_80=$(echo	4	1	0	1	0	0	1	0	0	0	0	0	0	0	0	0 )
SG_81=$(echo	4	1	0	0	0	0	0	0	0	0	0	0	0	0	2	0 )
SG_82=$(echo	4	1	0	0	0	0	0	0	0	0	0	0	0	0	2	0 )
SG_83=$(echo	8	1	0	1	0	0	1	0	1	0	0	1	0	0	2	0 )
SG_84=$(echo	8	1	0	1	0	0	1	0	1	0	0	1	0	0	2	0 )
SG_85=$(echo	8	1	0	1	0	0	1	0	1	0	0	1	0	0	2	0 )
SG_86=$(echo	8	1	0	1	0	0	1	0	1	0	0	1	0	0	2	0 )
SG_87=$(echo	8	1	0	1	0	0	1	0	1	0	0	1	0	0	2	0 )
SG_88=$(echo	8	1	0	1	0	0	1	0	1	0	0	1	0	0	2	0 )
SG_89=$(echo	8	5	0	2	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_90=$(echo	8	5	0	2	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_91=$(echo	8	5	0	2	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_92=$(echo	8	5	0	2	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_93=$(echo	8	5	0	2	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_94=$(echo	8	5	0	2	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_95=$(echo	8	5	0	2	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_96=$(echo	8	5	0	2	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_97=$(echo	8	5	0	2	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_98=$(echo	8	5	0	2	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_99=$(echo	8	1	0	2	0	0	0	0	0	2	2	0	0	0	0	0 )
SG_100=$(echo	8	1	0	2	0	0	0	0	0	2	2	0	0	0	0	0 )
SG_101=$(echo	8	1	0	2	0	0	0	0	0	2	2	0	0	0	0	0 )
SG_102=$(echo	8	1	0	2	0	0	0	0	0	2	2	0	0	0	0	0 )
SG_103=$(echo	8	1	0	2	0	0	0	0	0	2	2	0	0	0	0	0 )
SG_104=$(echo	8	1	0	2	0	0	0	0	0	2	2	0	0	0	0	0 )
SG_105=$(echo	8	1	0	2	0	0	0	0	0	2	2	0	0	0	0	0 )
SG_106=$(echo	8	1	0	2	0	0	0	0	0	2	2	0	0	0	0	0 )
SG_107=$(echo	8	1	0	2	0	0	0	0	0	2	2	0	0	0	0	0 )
SG_108=$(echo	8	1	0	2	0	0	0	0	0	2	2	0	0	0	0	0 )
SG_109=$(echo	8	1	0	2	0	0	0	0	0	2	2	0	0	0	0	0 )
SG_110=$(echo	8	1	0	2	0	0	0	0	0	2	2	0	0	0	0	0 )
SG_111=$(echo	8	3	0	0	0	0	0	0	0	0	2	0	0	0	2	0 )
SG_112=$(echo	8	3	0	0	0	0	0	0	0	0	2	0	0	0	2	0 )
SG_113=$(echo	8	3	0	0	0	0	0	0	0	0	2	0	0	0	2	0 )
SG_114=$(echo	8	3	0	0	0	0	0	0	0	0	2	0	0	0	2	0 )
SG_115=$(echo	8	3	0	0	0	0	0	0	0	0	2	0	0	0	2	0 )
SG_116=$(echo	8	3	0	0	0	0	0	0	0	0	2	0	0	0	2	0 )
SG_117=$(echo	8	3	0	0	0	0	0	0	0	0	2	0	0	0	2	0 )
SG_118=$(echo	8	3	0	0	0	0	0	0	0	0	2	0	0	0	2	0 )
SG_119=$(echo	8	3	0	0	0	0	0	0	0	0	2	0	0	0	2	0 )
SG_120=$(echo	8	3	0	0	0	0	0	0	0	0	2	0	0	0	2	0 )
SG_121=$(echo	8	3	0	0	0	0	0	0	0	0	2	0	0	0	2	0 )
SG_122=$(echo	8	3	0	0	0	0	0	0	0	0	2	0	0	0	2	0 )
SG_123=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_124=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_125=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_126=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_127=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_128=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_129=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_130=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_131=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_132=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_133=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_134=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_135=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_136=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_137=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_138=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_139=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_140=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_141=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_142=$(echo	16	5	0	2	0	0	0	0	1	2	2	1	0	0	2	0 )
SG_143=$(echo	3	0	1	0	0	1	0	0	0	0	0	0	0	0	0	0 )
SG_144=$(echo	3	0	1	0	0	1	0	0	0	0	0	0	0	0	0	0 )
SG_145=$(echo	3	0	1	0	0	1	0	0	0	0	0	0	0	0	0	0 )
SG_146=$(echo	3	0	1	0	0	1	0	0	0	0	0	0	0	0	0	0 )
SG_147=$(echo	6	1	1	0	1	0	0	0	0	0	0	1	0	0	0	1 )
SG_148=$(echo	6	1	1	0	1	0	0	0	0	0	0	1	0	0	0	1 )
SG_149=$(echo	6	3	2	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_150=$(echo	6	3	2	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_151=$(echo	6	3	2	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_152=$(echo	6	3	2	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_153=$(echo	6	3	2	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_154=$(echo	6	3	2	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_155=$(echo	6	3	2	0	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_156=$(echo	6	0	2	0	0	0	0	0	0	3	0	0	0	0	0	0 )
SG_157=$(echo	6	0	2	0	0	0	0	0	0	3	0	0	0	0	0	0 )
SG_158=$(echo	6	0	2	0	0	0	0	0	0	3	0	0	0	0	0	0 )
SG_159=$(echo	6	0	2	0	0	0	0	0	0	3	0	0	0	0	0	0 )
SG_160=$(echo	6	0	2	0	0	0	0	0	0	3	0	0	0	0	0	0 )
SG_161=$(echo	6	0	2	0	0	0	0	0	0	3	0	0	0	0	0	0 )
SG_162=$(echo	12	3	2	0	0	0	0	0	0	0	3	1	0	0	0	2 )
SG_163=$(echo	12	3	2	0	0	0	0	0	0	0	3	1	0	0	0	2 )
SG_164=$(echo	12	3	2	0	0	0	0	0	0	0	3	1	0	0	0	2 )
SG_165=$(echo	12	3	2	0	0	0	0	0	0	0	3	1	0	0	0	2 )
SG_166=$(echo	12	3	2	0	0	0	0	0	0	0	3	1	0	0	0	2 )
SG_167=$(echo	12	3	2	0	0	0	0	0	0	0	3	1	0	0	0	2 )
SG_168=$(echo	6	1	1	0	1	1	0	1	0	0	0	0	0	0	0	0 )
SG_169=$(echo	6	1	1	0	1	1	0	1	0	0	0	0	0	0	0	0 )
SG_170=$(echo	6	1	1	0	1	1	0	1	0	0	0	0	0	0	0	0 )
SG_171=$(echo	6	1	1	0	1	1	0	1	0	0	0	0	0	0	0	0 )
SG_172=$(echo	6	1	1	0	1	1	0	1	0	0	0	0	0	0	0	0 )
SG_173=$(echo	6	1	1	0	1	1	0	1	0	0	0	0	0	0	0	0 )
SG_174=$(echo	6	0	1	0	0	1	0	0	1	0	0	0	0	2	0	0 )
SG_175=$(echo	12	1	1	0	1	1	0	1	1	0	0	1	0	2	0	2 )
SG_176=$(echo	12	1	1	0	1	1	0	1	1	0	0	1	0	2	0	2 )
SG_177=$(echo	12	7	2	0	2	0	0	0	0	0	0	0	0	0	0	0 )
SG_178=$(echo	12	7	2	0	2	0	0	0	0	0	0	0	0	0	0	0 )
SG_179=$(echo	12	7	2	0	2	0	0	0	0	0	0	0	0	0	0	0 )
SG_180=$(echo	12	7	2	0	2	0	0	0	0	0	0	0	0	0	0	0 )
SG_181=$(echo	12	7	2	0	2	0	0	0	0	0	0	0	0	0	0	0 )
SG_182=$(echo	12	7	2	0	2	0	0	0	0	0	0	0	0	0	0	0 )
SG_183=$(echo	12	1	2	0	2	0	0	0	0	3	3	0	0	0	0	0 )
SG_184=$(echo	12	1	2	0	2	0	0	0	0	3	3	0	0	0	0	0 )
SG_185=$(echo	12	1	2	0	2	0	0	0	0	3	3	0	0	0	0	0 )
SG_186=$(echo	12	1	2	0	2	0	0	0	0	3	3	0	0	0	0	0 )
SG_187=$(echo	12	3	2	0	0	0	0	0	1	3	0	0	0	2	0	0 )
SG_188=$(echo	12	3	2	0	0	0	0	0	1	3	0	0	0	2	0	0 )
SG_189=$(echo	12	3	2	0	0	0	0	0	1	3	0	0	0	2	0	0 )
SG_190=$(echo	12	3	2	0	0	0	0	0	1	3	0	0	0	2	0	0 )
SG_191=$(echo	24	7	2	0	2	0	0	0	1	3	3	1	2	0	0	2 )
SG_192=$(echo	24	7	2	0	2	0	0	0	1	3	3	1	2	0	0	2 )
SG_193=$(echo	24	7	2	0	2	0	0	0	1	3	3	1	2	0	0	2 )
SG_194=$(echo	24	7	2	0	2	0	0	0	1	3	3	1	2	0	0	2 )
SG_195=$(echo	12	3	4	0	0	4	0	0	0	0	0	0	0	0	0	0 )
SG_196=$(echo	12	3	4	0	0	4	0	0	0	0	0	0	0	0	0	0 )
SG_197=$(echo	12	3	4	0	0	4	0	0	0	0	0	0	0	0	0	0 )
SG_198=$(echo	12	3	4	0	0	4	0	0	0	0	0	0	0	0	0	0 )
SG_199=$(echo	12	3	4	0	0	4	0	0	0	0	0	0	0	0	0	0 )
SG_200=$(echo	24	3	4	0	0	4	0	0	3	0	0	1	0	0	0	8 )
SG_201=$(echo	24	3	4	0	0	4	0	0	3	0	0	1	0	0	0	8 )
SG_202=$(echo	24	3	4	0	0	4	0	0	3	0	0	1	0	0	0	8 )
SG_203=$(echo	24	3	4	0	0	4	0	0	3	0	0	1	0	0	0	8 )
SG_204=$(echo	24	3	4	0	0	4	0	0	3	0	0	1	0	0	0	8 )
SG_205=$(echo	24	3	4	0	0	4	0	0	3	0	0	1	0	0	0	8 )
SG_206=$(echo	24	3	4	0	0	4	0	0	3	0	0	1	0	0	0	8 )
SG_207=$(echo	24	9	8	6	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_208=$(echo	24	9	8	6	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_209=$(echo	24	9	8	6	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_210=$(echo	24	9	8	6	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_211=$(echo	24	9	8	6	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_212=$(echo	24	9	8	6	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_213=$(echo	24	9	8	6	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_214=$(echo	24	9	8	6	0	0	0	0	0	0	0	0	0	0	0	0 )
SG_215=$(echo	24	3	8	0	0	0	0	0	0	0	6	0	0	0	6	0 )
SG_216=$(echo	24	3	8	0	0	0	0	0	0	0	6	0	0	0	6	0 )
SG_217=$(echo	24	3	8	0	0	0	0	0	0	0	6	0	0	0	6	0 )
SG_218=$(echo	24	3	8	0	0	0	0	0	0	0	6	0	0	0	6	0 )
SG_219=$(echo	24	3	8	0	0	0	0	0	0	0	6	0	0	0	6	0 )
SG_220=$(echo	24	3	8	0	0	0	0	0	0	0	6	0	0	0	6	0 )
SG_221=$(echo	48	9	8	6	0	0	0	0	3	0	6	1	0	0	6	8 )
SG_222=$(echo	48	9	8	6	0	0	0	0	3	0	6	1	0	0	6	8 )
SG_223=$(echo	48	9	8	6	0	0	0	0	3	0	6	1	0	0	6	8 )
SG_224=$(echo	48	9	8	6	0	0	0	0	3	0	6	1	0	0	6	8 )
SG_225=$(echo	48	9	8	6	0	0	0	0	3	0	6	1	0	0	6	8 )
SG_226=$(echo	48	9	8	6	0	0	0	0	3	0	6	1	0	0	6	8 )
SG_227=$(echo	48	9	8	6	0	0	0	0	3	0	6	1	0	0	6	8 )
SG_228=$(echo	48	9	8	6	0	0	0	0	3	0	6	1	0	0	6	8 )
SG_229=$(echo	48	9	8	6	0	0	0	0	3	0	6	1	0	0	6	8 )
SG_230=$(echo	48	9	8	6	0	0	0	0	3	0	6	1	0	0	6	8 )

echo -ne ${L_RED}'###################################################                                                 (50%) \r'${RESET}
sleep 1


echo -ne ${L_RED}'####################################################################################################(100%) \r'${RESET}
echo -e
sleep 1

#  Only for our tests
rm -r  CONTROL/  PDF_results/  TRAIN/  XXX/
mkdir TRASH_atomic/ TRASH_AFLOW/ TRASH_MAT.PROJ/ XXX/
bgn_loop=$(date +%s)

# loop over materials
for ((j=1; j<= $nmaterials ; j++))                                                                                          # j = number of lines (materials 2 create features)
do                                                                                                                          # loop 0.1*

list=$(awk 'NR=='$j'' list.dat)
arr=($list)

material=$(echo ${arr[0]})
space_group=$(echo ${arr[1]})
nspecies=$(echo ${arr[2]})
#code_icsd=$(echo ${arr[3]})
url_entrance=$(echo ${arr[3]})
class=$(echo ${arr[4]})

echo -e ${BOLD}''----------------------------------  $j/$nmaterials $material  ----------------------------------''${RESET}

#===================================================================================================
echo -ne ${BOLD}'Prediction report to finish the job\n'
#===================================================================================================
end_loop=$(date +%s)
time_lapse_loop=$(echo $end_loop - $bgn_loop | bc)
echo -e 'Begin loop in '$bgn_loop', and End loop in '$end_loop', so the time lapse are '$time_lapse_loop' seconds in this loop'

HwMany_loop=$(echo $nmaterials - $j | bc)
predicted_time=$(echo $time_lapse_loop \* $HwMany_loop | bc)
predicted_time_min=$(echo "scale=2; $predicted_time / 60" | bc)
predicted_time_hour=$(echo "scale=2; $predicted_time_min / 60" | bc)
echo -e 'There are '$HwMany_loop' loops missing, '$predicted_time' seconds ('${L_RED}$predicted_time_min' minutes'${RESET}${BOLD}' or '${L_RED}$predicted_time_hour' hours'${RESET}${BOLD}') until finish the job\n'

sleep 2
bgn_loop=$(date +%s)
echo -ne ${RESET}
#===================================================================================================
echo -ne ${BLUE}'stoichiometric features'${RESET}
#===================================================================================================
echo -e

rm n_atom*
for ((i=1; i<= $nspecies ; i++)); do                                                                                        # loop 1.1*
    even=`echo "$i 2 0" | awk '{printf("%.0f",(($1*$2)-$3))}'`

    if echo $material | grep '_'; then n_atoms=$(echo $material | cut -d'_' -f $even); fi
    echo $n_atoms >> n_atoms_$j
done                                                                                                                        # loop 1.1

sum=$(awk '{ sum += $1 } END { print sum }' n_atoms_$j)

rm pwr_out
for POWER in 2 3 5 7; do                                                                                                    # loop 1.2*
    echo 'POWER='$POWER
    for line in $(seq $nspecies); do                                                                                        # loop 1.3*
        x=$(awk NR==$line n_atoms_$j)
        echo "x="$x "sum="$sum "POWER="$POWER
        echo "scale=10; ($x/$sum)^$POWER" | bc
        echo "scale=10; ($x/$sum)^$POWER" | bc >> pwr_in$POWER
        done                                                                                                                # loop 1.3

    sum_POWER=$(awk '{ sum += $1 } END { print sum }' pwr_in$POWER)
    echo "sum_POWER="$sum_POWER "POWER="$POWER
    echo "e(l($sum_POWER)/$POWER)" 
    echo "e(l($sum_POWER)/$POWER)" | bc -l
    echo "e(l($sum_POWER)/$POWER)" | bc -l >> pwr_out
    echo 
done                                                                                                                        # loop 1.2
rm pwr_in* n_atoms_*
cat pwr_out | xargs > stoichiometric_features.dat
stoichiometric_features=$(awk 'NR==1' stoichiometric_features.dat)
rm pwr_out

#===================================================================================================
echo -ne ${BLUE}'atomic absolute features'${RESET}
#===================================================================================================
echo -e

for ((i=1; i<= $nspecies ; i++)); do                                                                                        # loop 2.1*
    ii=`echo "$i 2 1" | awk '{printf("%.0f",(($1*$2)-$3))}'`                                                                # odd entrances between underline in material (2n-1)=(($1*$2)-$3)

    if echo $material | grep '_'; then atom=$(echo $material | cut -d'_' -f $ii); fi                                        # match with the atoms

    atoms=(${!atom})
    echo ''$atom''
    echo ${atoms[@]} >> atom_A_$j-$atom
    cat atom_A_$j-$atom >> atom_A_$j
    done                                                                                                                    # loop 2.1

rm dummy_A.dat
cat atom_A_$j | awk '{print $1 " " $2 " " $3 " " $4 " " $5 " " $6 " " $7 " " $8 " " $9 " " $10 " " $11 " " $12 " " $13 " " $14 " "  $15 " " $16 " " $17 " " $18 " " $19 " " $20 " " $21 " " $22 " " $23 " " $24 " "  $25 " " $26 " " $27 " " $28 " " $29 " " $30 " " $31 " " $32 }' > dummy_A.dat
# $1=Z; $2=atomic_mass; $3=HOMO; $4=LUMO; $5=First_Ionization; $6=Electroaffinity; $7=HOMO-SOC; $8=LUMO-SOC; $9=IP-SOC; $10=EA-SOC; $11=Parameter-SOC; $12=Electronegativity_Pauling; $13=Polarizability; $14=rs; $15=rp; $16=r_atomic; $17=r_valence; $18=r_covalent; $19=Group(1-18); $20=Period; $21=valence_S; $22=valence_P; $23=valence_D; $24=valence_F; $25=Valence_Electron_SP; $26=Valence_Electrons; $27=Empty_states_S; $28=Empty_states_P; $29=Empty_states_D; $30=Empty_states_F; $31=Empty_states+; $32=Empty_states

#===================================================================================================
#FOR EXPLICITIES ATOMIC PROPERTIES
#---------------------------------------------------------------------------------------------------
#awk '{for (i=1; i<=NF; i++){a[NR,i] = $i}} NF>p {p=NF} END {for(j=1; j<=p; j++){str=a[1,j]
#        for(i=2; i<=NR; i++){str=str" "a[i,j];}print str}}' dummy.dat | tr '\n' ' ' > atomic_features.dat                   # transpose each column (one each for time), then delete the newline [this step is necessary for detour the statistical method in gfortran below, in the way the train will contain the explicity properties of atoms"
#===================================================================================================

nsp=$(cat dummy_A.dat | wc -l)                                                                                                 # check number of lines
npf=$(cat dummy_A.dat | awk '{print NF}' | uniq)                                                                               # check if all line has the same number of columns

# Fortran program to make operations between atomic properties of different atoms
echo 'Program feature_list
! INPUT
Real, allocatable                                    :: pf(:,:)  ! Primary features 
Integer                                              :: nsp      ! number of species
Integer                                              :: npf      ! number of primary features
Integer                                              :: nop      ! number of operations
! OUTPUT
Real, allocatable                                    :: ppf(:,:) ! Processed primary features
! Dummy varaible
Integer                                              :: i, j, k

! Open file with atomic properties 
Open(Unit=1,file='\''dummy_A.dat'\'',form="formatted",status="unknown", &
            action="read",position="rewind")
! Allocate variables 

nsp='$nsp'
! nsp = number of lines that will compile
npf='$npf'
! npf = number of columns selected for make the statistical properties
nop=4
! nop = number of operations (mean, max, ---, stdev, red_value) [min value in dummy_W.dat calculation]

allocate(pf(nsp,npf), ppf(npf,nop))
pf=(0.d0,0.d0)
ppf=(0.d0,0.d0)

do i = 1, nsp
   read(1,*) (pf(i,j), j = 1, npf)
!  write(*,*) (pf(i,j), j = 1, npf)
enddo

do k = 1, npf
   ppf(k,1)= sum(pf(1:nsp,k))/nsp                               ! mean value 
   ppf(k,2)= maxval(pf(1:nsp,k))                                ! maximum value 
!   ppf(k,X)= minval(pf(1:nsp,k))                               ! minimum value 
   do j = 1, nsp
      ppf(k,3)= ppf(k,3) + (ppf(k,1)-pf(j,k))**2                ! variance
      ppf(k,4)= ppf(k,4) + 1.d0/pf(j,k)                         ! reduced value 
   enddo
   ppf(k,3)= sqrt(ppf(k,3)/nsp)                                 ! std deviation
   ppf(k,4)= 1.d0/ppf(k,4)
!   ppf(k,5)= ppf(k,X) - ppf(k,3)                                ! range 
enddo

write(*,*) ((ppf(i,j), j=1, nop), i=1, npf)

Close(1)
      
Endprogram feature_list' > Dummy.f95

# Put atomic feature in a list 
gfortran -o Dummy Dummy.f95
./Dummy > atomic_A_features.dat
atomic_a_features=$(awk 'NR==1' atomic_A_features.dat)
#---------------------------------------------------------------------------------------------------
rm Dummy* dummy*

#===================================================================================================
echo -ne ${BLUE}'atomic weighted features'${RESET}
#===================================================================================================
echo -e

for ((i=1; i<= $nspecies ; i++))
    do                                                                                                                      # loop 2.2*
    odd=`echo "$i 2 1" | awk '{printf("%.0f",(($1*$2)-$3))}'`                                                               # odd entrances between underline in material (2n-1)=(($1*$2)-$3)
    even=`echo "$i 2 0" | awk '{printf("%.0f",(($1*$2)-$3))}'`
    echo ''atom position = $odd'; n.atoms position = '$even''
    
    if echo $material | grep '_'; then atom=$(echo $material | cut -d'_' -f $odd); fi                                       # match with the atoms
   
    atoms=(${!atom})
    echo ''$atom''
    echo ${atoms[@]} >> atom_W_$j-$atom
        
    if echo $material | grep '_'; then n_atoms=$(echo $material | cut -d'_' -f $even); fi
    echo ''$n_atoms''
    for k in $(seq 1 $n_atoms); do                                                                                          # loop 2.2.1*
        cat atom_W_$j-$atom >> atom_W_$j-$atom-$n_atoms
        done                                                                                                                # loop 2.2.1

    cat atom_W_$j-$atom-$n_atoms >> atom_W_$j
    # for k in `$n_atoms` ; do seq 1 $n_atoms | xargs -i -- echo $k ; done
    done                                                                                                                    # loop 2.2
#===================================================================================================

rm dummy_W.dat
cat atom_W_$j | awk '{print $1 " " $2 " " $3 " " $4 " " $5 " " $6 " " $7 " " $8 " " $9 " " $10 " " $11 " " $12 " " $13 " " $14 " "  $15 " " $16 " " $17 " " $18 " " $19 " " $20 " " $21 " " $22 " " $23 " " $24 " "  $25 " " $26 " " $27 " " $28 " " $29 " " $30 " " $31 " " $32 }' > dummy_W.dat
# $1=Z; $2=atomic_mass; $3=HOMO; $4=LUMO; $5=First_Ionization; $6=Electroaffinity; $7=HOMO-SOC; $8=LUMO-SOC; $9=IP-SOC; $10=EA-SOC; $11=Parameter-SOC; $12=Electronegativity_Pauling; $13=Polarizability; $14=rs; $15=rp; $16=r_atomic; $17=r_valence; $18=r_covalent; $19=Group(1-18); $20=Period; $21=valence_S; $22=valence_P; $23=valence_D; $24=valence_F; $25=Valence_Electron_SP; $26=Valence_Electrons; $27=Empty_states_S; $28=Empty_states_P; $29=Empty_states_D; $30=Empty_states_F; $31=Empty_states+; $32=Empty_states

nsp=$(cat dummy_W.dat | wc -l)                                                                                              # check number of lines
npf=$(cat dummy_W.dat | awk '{print NF}' | uniq)                                                                            # check if all line has the same number of columns

# Fortran program to make operations between atomic properties of different atoms
echo 'Program feature_list
! INPUT
Real, allocatable                                    :: pf(:,:)  ! Primary features 
Integer                                              :: nsp      ! number of species
Integer                                              :: npf      ! number of primary features
Integer                                              :: nop      ! number of operations
! OUTPUT
Real, allocatable                                    :: ppf(:,:) ! Processed primary features
! Dummy varaible
Integer                                              :: i, j, k

! Open file with atomic properties 
Open(Unit=1,file='\''dummy_W.dat'\'',form="formatted",status="unknown", &
            action="read",position="rewind")
! Allocate variables 

nsp='$nsp'
! nsp = number of lines that will compile
npf='$npf'
! npf = number of columns selected for make the statistical properties
nop=4
! nop = number of operations (mean, ---, min, stdev, red_value) [max value in dummy_W.dat calculation]

allocate(pf(nsp,npf), ppf(npf,nop))
pf=(0.d0,0.d0)
ppf=(0.d0,0.d0)

do i = 1, nsp
   read(1,*) (pf(i,j), j = 1, npf)
!  write(*,*) (pf(i,j), j = 1, npf)
enddo

do k = 1, npf
   ppf(k,1)= sum(pf(1:nsp,k))/nsp                               ! mean value 
!   ppf(k,X)= maxval(pf(1:nsp,k))                               ! maximum value 
   ppf(k,2)= minval(pf(1:nsp,k))                                ! minimum value 
   do j = 1, nsp
      ppf(k,3)= ppf(k,3) + (ppf(k,1)-pf(j,k))**2                ! variance
      ppf(k,4)= ppf(k,4) + 1.d0/pf(j,k)                         ! reduced value 
   enddo
   ppf(k,3)= sqrt(ppf(k,3)/nsp)                                 ! std deviation
   ppf(k,4)= 1.d0/ppf(k,4)
!   ppf(k,5)= ppf(k,2) - ppf(k,X)                                ! range 
enddo

write(*,*) ((ppf(i,j), j=1, nop), i=1, npf)

Close(1)
      
Endprogram feature_list' > Dummy.f95

# Put atomic feature in a list 
gfortran -o Dummy Dummy.f95
./Dummy > atomic_W_features.dat
atomic_W_features=$(awk 'NR==1' atomic_W_features.dat)
#---------------------------------------------------------------------------------------------------
rm Dummy* dummy*

#===================================================================================================
xargs -n1 < atomic_A_features.dat > atomic_A_T_$j                                                                           # transpose line in column (n1)
xargs -n1 < atomic_W_features.dat > atomic_W_T_$j
properties=$(awk '{print NF}' atomic_W_features.dat)

for scramble in $(seq 1 $properties); do                                                                                    # loop 2.3*
    absolute=$(awk NR==$scramble atomic_A_T_$j)
    weighted=$(awk NR==$scramble atomic_W_T_$j)
    echo $absolute $weighted >> column_AW_$j
done                                                                                                                        # loop 2.3

cat column_AW_$j | xargs > atomic_AW_features.dat

atomic_AW_features=$(head -$j atomic_AW_features.dat)
mv atomic_A_features.dat atomic_W_features.dat atomic_AW_features.dat atom_A_* atom_W_* atomic_A_T_* atomic_W_T_* column_AW_* TRASH_atomic/

#===================================================================================================

#===================================================================================================
echo -ne ${BLUE}'structural features'${RESET}
#===================================================================================================
echo -e

rm structural_features.dat

#in_AFLOW=$(echo $url_entrance | sed 's/_//g' | sed 's/ICSD/_ICSD_/g')

SG=$(echo $space_group | cut -d':' -f2 | cut -d'_' -f2 )

if
        [[ $SG -eq 1 || $SG -eq 2 ]] ; then
        bravais=TRI
        echo $bravais
elif
        [[ $SG -eq 3 || $SG -eq 4 || $SG -eq 6 || $SG -eq 7 || $SG -eq 10 || $SG -eq 11 || $SG -eq 13 || $SG -eq 14 ]]; then
        bravais=MCL
        echo $bravais
elif
        [[ $SG -eq 5 || $SG -eq 8 || $SG -eq 9 || $SG -eq 12 || $SG -eq 15 ]]; then
        bravais=MCLC
        echo $bravais
elif
        [[ $SG -ge 16 && $SG -le 19 || $SG -ge 25 && $SG -le 34 || $SG -ge 47 && $SG -le 62 ]]; then
        bravais=ORC
        echo $bravais
elif
        [[ $SG -eq 20 || $SG -eq 21 || $SG -ge 35 && $SG -le 41 || $SG -ge 63 && $SG -le 68 ]]; then
        bravais=ORCC
        echo $bravais
elif
        [[ $SG -eq 22 || $SG -eq 42 || $SG -eq 43 || $SG -eq 69 || $SG -eq 70 ]]; then
        bravais=ORCF
        echo $bravais
elif
        [[ $SG -eq 23 || $SG -eq 24 || $SG -ge 44 && $SG -le 46 || $SG -ge 71 && $SG -le 74 ]]; then
        bravais=ORCI
        echo $bravais
elif
        [[ $SG -ge 75 && $SG -le 78 || $SG -eq 81 || $SG -ge 83 && $SG -le 86 || $SG -ge 89 && $SG -le 96 || $SG -ge 99 && $SG -le 106 || $SG -ge 111 && $SG -le 118 || $SG -ge 123 && $SG -le 138 ]]; then
        bravais=TET
        echo $bravais
elif
        [[ $SG -eq 79 || $SG -eq 80 || $SG -eq 82 || $SG -eq 87 || $SG -eq 88 || $SG -eq 97 || $SG -eq 98 || $SG -ge 107 && $SG -le 110 || $SG -ge 119 && $SG -le 122 || $SG -ge 139 && $SG -le 142 ]]; then
        bravais=BCT
        echo $bravais
elif
        [[ $SG -ge 143 && $SG -le 145 || $SG -eq 147 ||  $SG -ge 149 && $SG -le 154 || $SG -ge 156 && $SG -le 159 || $SG -ge 162 && $SG -le 165 || $SG -ge 168 && $SG -le 194 ]]; then
        bravais=HEX
        echo $bravais
elif
        [[ $SG -eq 146 || $SG -eq 148 || $SG -eq 155 || $SG -eq 160 || $SG -eq 161 || $SG -eq 166 || $SG -eq 167 ]]; then
        bravais=RHL
        echo $bravais
elif
        [[ $SG -eq 195 || $SG -eq 198 || $SG -ge 200 && $SG -le 201 || $SG -eq 205 || $SG -ge 207 && $SG -le 208 || $SG -ge 212 && $SG -le 213 || $SG -eq 215 || $SG -eq 218 || $SG -ge 221 && $SG -le 224 ]]; then
        bravais=CUB
        echo $bravais
elif
        [[ $SG -eq 196 || $SG -eq 24 || $SG -ge 202 && $SG -le 203 || $SG -ge 209 && $SG -le 210 || $SG -eq 216 || $SG -eq 219 || $SG -ge 225 && $SG -le 228 ]]; then
        bravais=FCC
        echo $bravais
elif
        [[ $SG -eq 197 || $SG -eq 199 || $SG -eq 204 || $SG -eq 206 || $SG -eq 211 || $SG -eq 214 || $SG -eq 217 || $SG -eq 220 || $SG -eq 229 || $SG -eq 230 ]]; then
        bravais=BCC
        echo $bravais
fi

echo
echo -ne ${CYAN}'Download entrance '$url_entrance' with crystal '$bravais' in AFLOW'${RESET}
echo

wget aflowlib.duke.edu/AFLOWDATA/ICSD_WEB/$bravais/$url_entrance
wget aflowlib.duke.edu/AFLOWDATA/ICSD_WEB/$bravais/$url_entrance/$url_entrance.png

prototype=$(awk -F">prototype</a>=" '{print $2}' $url_entrance | awk NF)
spacegroup=$(awk -F">spacegroup_relax</a>=" '{print $2}' $url_entrance | awk NF)
Bravais_lattice=$(awk -F">Bravais_lattice_relax</a>=" '{print $2}' $url_entrance | awk NF)
Pearson_symbol=$(awk -F">Pearson_symbol_relax</a>=" '{print $2}' $url_entrance | awk NF)
pointgroup_type=$(awk -F">point_group_type_orig</a>=" '{print $2}' $url_entrance | awk NF)
Egap_type=$(awk -F">Egap_type</a>=" '{print $2}' $url_entrance | awk NF)
Egap=$(awk -F">Egap</a>=" '{print $2}' $url_entrance | awk NF)
nspecies=$(awk -F">nspecies</a>=" '{print $2}' $url_entrance | awk NF)
natoms=$(awk -F">natoms</a>=" '{print $2}' $url_entrance | awk NF)
#valence_cell_iupac=$(awk -F">valence_cell_iupac</a>=" '{print $2}' $url_entrance | awk NF)
#valence_cell_std=$(awk -F">valence_cell_std</a>=" '{print $2}' $url_entrance | awk NF)
density=$(awk -F">density</a>=" '{print $2}' $url_entrance | awk NF)
volume_cell=$(awk -F">volume_cell</a>=" '{print $2}' $url_entrance | awk NF)
volume_atom=$(awk -F">volume_atom</a>=" '{print $2}' $url_entrance | awk NF)
#energy_cell=$(awk -F">energy_cell</a>=" '{print $2}' $url_entrance | awk NF)
#energy_atom=$(awk -F">energy_atom</a>=" '{print $2}' $url_entrance | awk NF)
spin_cell=$(awk -F">spin_cell</a>=" '{print $2}' $url_entrance | awk NF)
spin_atom=$(awk -F">spin_atom</a>=" '{print $2}' $url_entrance | awk NF)
spinF=$(awk -F">spinF</a>=" '{print $2}' $url_entrance | awk NF)

echo -ne ${GREEN} $prototype $spacegroup $Bravais_lattice $Pearson_symbol $pointgroup_type $Egap_type $Egap $nspecies $natoms $density $volume_cell $volume_atom $spin_cell $spin_atom $spinF ${RESET}
header_structural=$(echo prototype spacegroup Bravais_lattice Pearson_symbol pointgroup_type Egap_type Egap nspecies natoms density volume_cell volume_atom spin_cell spin_atom spinF)
echo $prototype $spacegroup $Bravais_lattice $Pearson_symbol $pointgroup_type $Egap_type $Egap $nspecies $natoms $density $volume_cell $volume_atom $spin_cell $spin_atom $spinF >> structural_features.dat
echo -e 

awk NF structural_features.dat

structural_features=$(head -$j structural_features.dat)
mv $url_entrance* TRASH_AFLOW/
#---------------------------------------------------------------------------------------------------

#===================================================================================================
echo -ne ${BLUE}'stability parameters'${RESET}
#===================================================================================================
echo -e

material_project=$(echo $material | sed 's/_//g')
SG=$(echo $space_group | cut -d'_' -f2)

echo
echo -ne ${CYAN}'Downloading files for material '$material_project' in materials project'${RESET}
echo

wget https://www.materialsproject.org/rest/v2/materials/$material_project/vasp?API_KEY=DC0rPN7fFIxTogEA
mv vasp* file_$j.$material_project
same_formula=$(tr ' ' '\n' < file_$j.$material_project | grep e_above_hull | wc -l)

for x in $(seq 1 $same_formula)
do                                                                                                                          # loop 3.1*
number=$(echo $x+1 | bc)
    spacegroup_symbol=$(awk -F'"spacegroup": ' '{print $'$number'}' file_$j.$material_project | awk -F'"symbol": ' '{print $2}' | cut -d',' -f1)     # for awk in stability_features $3
    spacegroup_number=$(awk -F'"spacegroup": ' '{print $'$number'}' file_$j.$material_project | awk -F'"number": ' '{print $2}' | cut -d',' -f1)     # $4 
    cell_length_a=$(awk -F'n_cell_length_a ' '{print $'$number'}' file_$j.$material_project | cut -d'\' -f1 | cut -d' ' -f3)                         # $5
    cell_length_b=$(awk -F'n_cell_length_b ' '{print $'$number'}' file_$j.$material_project | cut -d'\' -f1 | cut -d' ' -f3)                         # $6
    cell_length_c=$(awk -F'n_cell_length_c ' '{print $'$number'}' file_$j.$material_project | cut -d'\' -f1 | cut -d' ' -f3)                         # $7
    cell_angle_alpha=$(awk -F'n_cell_angle_alpha ' '{print $'$number'}' file_$j.$material_project | cut -d'\' -f1 | cut -d' ' -f3)                   # $8
    cell_angle_beta=$(awk -F'n_cell_angle_beta ' '{print $'$number'}' file_$j.$material_project | cut -d'\' -f1 | cut -d' ' -f3)                     # $9
    cell_angle_gamma=$(awk -F'n_cell_angle_gamma ' '{print $'$number'}' file_$j.$material_project | cut -d'\' -f1 | cut -d' ' -f3)                   # $10
    band_gap=$(awk -F'"band_gap": ' '{print $'$number'}' file_$j.$material_project | cut -d' ' -f1 | cut -d',' -f1)                                  # $11
    total_magnetization=$(awk -F'"total_magnetization": ' '{print $'$number'}' file_$j.$material_project | cut -d' ' -f1 | cut -d',' -f1)            # $12
    formation_energy_per_atom=$(awk -F'"formation_energy_per_atom": ' '{print $'$number'}' file_$j.$material_project | cut -d',' -f1)                # $13
    e_above_hull=$(awk -F'"e_above_hull": ' '{print $'$number'}' file_$j.$material_project | cut -d',' -f1)                                          # $14
    icsd_ids=$(awk -F'"icsd_ids": ' '{print $'$number'}' file_$j.$material_project | cut -d']' -f1 | cut -d'[' -f2 | sed 's/, /=/g')                 # $15

#echo -ne ${D_RED}''$material_project' '$x' '$spacegroup_symbol' '$spacegroup_number' '$cell_length_a' '$cell_length_b' '$cell_length_c' '$cell_angle_alpha' '$cell_angle_beta' '$cell_angle_gamma' '$band_gap' '$total_magnetization' '$formation_energy_per_atom' '$e_above_hull' '$icsd_ids''${RESET}
echo ''$material_project' '$x' '$spacegroup_symbol' '$spacegroup_number' '$cell_length_a' '$cell_length_b' '$cell_length_c' '$cell_angle_alpha' '$cell_angle_beta' '$cell_angle_gamma' '$band_gap' '$total_magnetization' '$formation_energy_per_atom' '$e_above_hull' '$icsd_ids'' >> all_$j.$material_project
done                                                                                                                        # loop 3.1

cat all_$j.$material_project >> all_mat-proj.dat

echo -ne ${CYAN}'looking for a SG='$SG' in '$material_project ${RESET}
echo

cat all_$j.$material_project | awk '$4 == "'$SG'"' >> mat.proj_features.dat
echo -ne ${GREEN} $(cat all_$j.$material_project | awk '$4 == "'$SG'"') ${RESET}
lattice_features=$(awk NR==$j mat.proj_features.dat | awk '{print $(1)"_SG_"$(4)" "$(3)" "$(4)" "$(5)" "$(6)" "$(7)" "$(8)" "$(9)" "$(10)" "$(11)" "$(12)}')
stability_features=$(awk NR==$j mat.proj_features.dat | awk '{print $(13)" "$(14)}')                                        # catch formation_energy and energy above hull
header_lattice=$(echo 'mat.proj spacegroup_symbol spacegroup_number cell_length_a cell_length_b cell_length_c cell_angle_alpha cell_angle_beta cell_angle_gamma band_gap total_magnetization')
header_stability=$(echo 'formation_energy_per_atom e_above_hull')

mv file_$j.$material_project all_$j.$material_project TRASH_MAT.PROJ/

#formation_hull=$(grep $SG all_$j.$material_project | awk '{print $(NF-2)" "$(NF-1)}')
#if 
#    [[ $(echo $formation_hull | cut -d' ' -f1 | bc) -ge 0.000 ]]; then
#    stability=LOW
#elif
#    [[ $(echo $formation_hull | cut -d' ' -f1 | bc) -le 0.000 && $(echo $formation_hull | cut -d' ' -f2 | bc) -ge 0.025 ]]; then
#    stability=MEDIUM
#elif
#    [[ $(echo $formation_hull | cut -d' ' -f1 | bc) -le 0.000 && $(echo $formation_hull | cut -d' ' -f2 | bc) -le 0.025 ]]; then
#    stability=HIGH
#fi

#===================================================================================================
echo -ne ${BLUE}'symmetry features'${RESET}
#===================================================================================================
echo -e

if echo $space_group | grep ':'; then symmetry=$(echo $space_group | cut -d':' -f 2); fi
    SG=(${!symmetry})
    echo ${!symmetry} > symmetry_features.dat
symmetry_features=$(head -$j symmetry_features.dat)
#---------------------------------------------------------------------------------------------------

#===================================================================================================
echo -ne ${BLUE}'radial distribution function'${RESET}
#===================================================================================================
echo -e

mkdir PDF_results/

#if echo $code2url4pdf | grep ':'; then code_url=$(echo $code2url4pdf | cut -d':' -f 2); fi
#    line_url=(${!code_url})
#    echo ${!code_url} > url.out
#    url=$(head -$j url.out)
#
#if echo $url | grep '/'; then  name=$(echo $url | cut -d'/' -f 5); fi                                                       # searching for material in $url
#
#    wget $url/CONTCAR.relax.vasp                                                                                            # ex: htt://aflowlib.duke.edu/AFLOWDATA/ICSD_WEB/FCC/As1Ga1_ICSD_610533/CONTCAR.relax.vasp
#
#if scp CONTCAR.relax.vasp POSCAR ; then
#---------------------------------------------------------------------------------------------------
#    awk 'NR==1' CONTCAR.relax.vasp | sed 's/[0-9]/@/g' > header.tmp                                                         # write the atoms in POSCAR
#    sed 's/ .*//' header.tmp > formula.tmp                                                                                  # write the atoms in POSCAR
#    sed '6i '$(cat formula.tmp)'' CONTCAR.relax.vasp | sed 's/@/ /g' > POSCAR                                               # write the atoms in POSCAR
#    scp POSCAR PDF_results/POSCAR_$name 
#    cat POSCAR
##---------------------------------------------------------------------------------------------------
#else
#---------------------------------------------------------------------------------------------------
#	echo -ne ${D_RED}'!!!!!!!!!!POSCAR NOT FOUND!!!!!!!!!!'${RESET}
#	echo -e
#---------------------------------------------------------------------------------------------------
#fi

cat > poscar2pdf.cpp << EOF
//
//  poscar2pdf.cpp
//  
//  Created by Changning Niu on 2/9/16.
//  Copyright © 2016 Changning Niu. All rights reserved.
//  For more information, go to https///github.com/changning/poscar2pdf

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <cmath>
#include <iomanip>
#include <cstdlib>
#include <cstring>
#include <limits>

using namespace std;

// read_poscar/
//		return 1 if reading successful
//		return 2 if POSCAR has no line of elements
//		return 0 if reading failed
int read_poscar (char *file, string& head, double& dLatConst,
                 double dArrVec[3][3], string strArrElem[10], int nArrElem[10],
                 char& cCoord, double dArrAtom[][3], int& nElem, int& nAtom) {
    istringstream iss;
    ifstream poscar;
    string line;
    double x, y, z;
    int num;
    
    poscar.open(file);
    if (!poscar) return 0;
    getline(poscar,head);	// line 1
    getline(poscar,line);
    iss.str(line);			// line 2
    if (iss >> dLatConst) iss.clear();	// read lattice constant
    else return 0;
    for (int i = 0; i < 3; i++) {	// line 3-5/ lattice vectors
        getline(poscar,line);
        iss.str(line);
        if (iss >> x >> y >> z) {
            iss.clear();
            dArrVec[i][0] = x;
            dArrVec[i][1] = y;
            dArrVec[i][2] = z;
        }
        else return 0;
    }
    getline(poscar,line);	// line 6
    iss.str(line);
    nAtom = 0;
    nElem = 0;
    if (iss >> num) {		// if line 6 has integers
        nAtom += num;
        while (iss >> num) {	// count numberf in line 6
            nElem++;
            nAtom += num;
        }
        string strArrMark[10] = {"A","B","C","D","E","F","G","H","I","J"};
        for (int i = 0; i < nElem; i++)     // Mark artificial element types
            strArrElem[i] = strArrMark[i];
    }
    else {                  // if line 6 has element types
        iss.clear();
        iss.str(line);
        num = 0;
        while (iss >> strArrElem[num]) {    // read elements
            num++;
            nElem++;
        }
        if (nElem == 0) return 0;       // if no element read, return 0
        getline(poscar,line);
        iss.clear();
        iss.str(line);
        for (int i = 0; i < nElem; i++) {   // read line 7/ number for elements
            if (iss >> num) {
                nArrElem[i] = num;
                nAtom += num;
            }
            else return 0;
        }
    }
    getline(poscar,line);
    cCoord = line[0];               // read line 8 first character
    if (cCoord == 'S' || cCoord == 's') {   // if it's selective relaxation
        getline(poscar,line);               // ignore this line
        cCoord  = line[0];
    }
    for (int i = 0; i < nAtom; i++) {
        iss.clear();
        getline(poscar,line);
        iss.str(line);
        if (iss >> x >> y >> z) {
            dArrAtom[i][0] = x;
            dArrAtom[i][1] = y;
            dArrAtom[i][2] = z;
        }
        else return 0;
    }
    return 1;
}

// cart_to_direct/
// Converts atomic coordinates in Cartesian format to Directional format.
//    return 1 if successful, 0 if failed.
int cart_to_direct(double dArrVec[3][3], double dArrAtom[][3], int nAtom) {
    double det;
    double newAtom[nAtom][3];
    double rev[3][3];
    det = dArrVec[0][0] * dArrVec[1][1] * dArrVec[2][2]
        - dArrVec[0][0] * dArrVec[1][2] * dArrVec[2][1]
        - dArrVec[0][1] * dArrVec[1][0] * dArrVec[2][2]
        + dArrVec[0][1] * dArrVec[1][2] * dArrVec[2][0]
        + dArrVec[0][2] * dArrVec[1][0] * dArrVec[2][1]
        - dArrVec[0][2] * dArrVec[1][1] * dArrVec[2][0];
    rev[0][0] = (dArrVec[1][1] * dArrVec[2][2] - dArrVec[1][2] * dArrVec[2][1]);
    rev[0][1] = (dArrVec[0][2] * dArrVec[2][1] - dArrVec[0][1] * dArrVec[2][2]);
    rev[0][2] = (dArrVec[0][1] * dArrVec[1][2] - dArrVec[0][2] * dArrVec[1][1]);
    rev[1][0] = (dArrVec[1][2] * dArrVec[2][0] - dArrVec[1][0] * dArrVec[2][2]);
    rev[1][1] = (dArrVec[0][0] * dArrVec[2][2] - dArrVec[0][2] * dArrVec[2][0]);
    rev[1][2] = (dArrVec[0][2] * dArrVec[1][0] - dArrVec[0][0] * dArrVec[1][2]);
    rev[2][0] = (dArrVec[1][0] * dArrVec[2][1] - dArrVec[1][1] * dArrVec[2][0]);
    rev[2][1] = (dArrVec[0][1] * dArrVec[2][0] - dArrVec[0][0] * dArrVec[2][1]);
    rev[2][2] = (dArrVec[0][0] * dArrVec[1][1] - dArrVec[0][1] * dArrVec[1][0]);
    for (int i = 0; i < nAtom; i++) {
        newAtom[i][0] = dArrAtom[i][0] * rev[0][0] + dArrAtom[i][1] * rev[1][0] + dArrAtom[i][2] * rev[2][0];
        newAtom[i][1] = dArrAtom[i][0] * rev[0][1] + dArrAtom[i][1] * rev[1][1] + dArrAtom[i][2] * rev[2][1];
        newAtom[i][2] = dArrAtom[i][0] * rev[0][2] + dArrAtom[i][1] * rev[1][2] + dArrAtom[i][2] * rev[2][2];
    }
    for (int i = 0; i < nAtom; i++) {
        dArrAtom[i][0] = newAtom[i][0] / det;
        dArrAtom[i][1] = newAtom[i][1] / det;
        dArrAtom[i][2] = newAtom[i][2] / det;
    }
    return 1;
}

// Bubble sort
// Based on codes from http///www.algolist.net/Algorithms/Sorting/Bubble_sort
void bubbleSort(double arr[], int n) {
    bool swapped = true;
    int j = 0;
    double tmp;
    while (swapped) {
        swapped = false;
        j++;
        for (int i = 0; i < n - j; i++) {
            if (arr[i] > arr[i + 1]) {
                tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
        }
    }
}

int main(int argc, char* argv[]) {
    double dMax, dMin, dStep;   // min/max and step of desired PDF radius
    double dMax2, dMin2;        // squared min/max for acceleration
    char *file;                 // pointer to POSCAR
    int nElem;                  // number of elements
    int nAtom;                  // number of atoms
    string head;                // line 1 of POSCAR
    double dLatConst;           // line 2 of POSCAR
    double dArrVec[3][3];       // line 3-5/ lattice vectors
    string strArrElem[10];      // element names
    int nArrElem[10];           // number of atoms of each element
    char cCoord;                // line 8/ directional or cartesian
    double dArrAtom[500][3];    // atomic coordinates
    double dArrAtom2[500][3];   // atomic coordinates in Cartesian
    string strArrAtom[500];     // element of each atom
    int count;
    double A1, B1, C1, A2, B2, C2, A3, B3, C3;// coefficients A_i, B_i, C_i for finding min d
    double d1, d2, d3, dMinCell;// distances between two opposite sides of cell
    int nCell;                  // number of cells outside each side to build supercell
    int nPairs;                 // number of pairs of elements
    int nData;                  // number of data points of PDF
    int nSCatom;                // number of atoms in the supercell
    double dTemp;               // temperary usage
    
    // Check input
    if (argc != 5) {
        cout << "Usage/ poscar2pdf POSCAR 0.1 0.1 4.0\n";
        exit(1);
    }
    file = argv[1];
    dMin = atof(argv[2]);
    dStep = atof(argv[3]);
    dMax = atof(argv[4]);
    if (dMin == 0.0) {
        cout << "Min value must be larger than 0.\n";
        exit(1);
    }
    // Read POSCAR
    if (read_poscar(file, head, dLatConst, dArrVec, strArrElem, nArrElem, cCoord, dArrAtom, nElem, nAtom) == 0) {
        cout << "Errors occurred when reading POSCAR.\n";
        exit(1);
    }
    else if (cCoord == 'C' && cCoord == 'c') {
        cart_to_direct(dArrVec, dArrAtom, nAtom);
    }
    
    // Get atomic species for each atom
    count = 0;
    for (int i = 0; i < nElem; i++) {
        for (int j = 0; j < nArrElem[i]; j++) {
            strArrAtom[count++] = strArrElem[i];
        }
    }
    
    // If (dMax - dMin) / dStep is not integer, decrease dMax slightly
    nData = (int)((dMax - dMin) / dStep) + 1;
    dMax = (nData - 1) * dStep + dMin;
    dMin2 = dMin * dMin / dLatConst / dLatConst;
    dMax2 = dMax * dMax / dLatConst / dLatConst;
    if (nData > 10000) {
        cout << "Number of PDF data points exceeds 10000. Change the code.\n";
        exit(1);
    }
    
    // Determine the size of supercell and expand by Cartesian
    A1 = dArrVec[1][1] * dArrVec[2][2] - dArrVec[2][1] * dArrVec[1][2];
    B1 = dArrVec[2][1] * dArrVec[0][2] - dArrVec[0][1] * dArrVec[2][2];
    C1 = dArrVec[0][1] * dArrVec[1][2] - dArrVec[1][1] * dArrVec[0][2];
    A2 = dArrVec[1][0] * dArrVec[2][2] - dArrVec[2][0] * dArrVec[1][2];
    B2 = dArrVec[2][0] * dArrVec[0][2] - dArrVec[0][0] * dArrVec[2][2];
    C2 = dArrVec[0][0] * dArrVec[1][2] - dArrVec[1][0] * dArrVec[0][2];
    A3 = dArrVec[1][0] * dArrVec[2][1] - dArrVec[2][0] * dArrVec[1][1];
    B3 = dArrVec[2][0] * dArrVec[0][1] - dArrVec[0][0] * dArrVec[2][1];
    C3 = dArrVec[0][0] * dArrVec[1][1] - dArrVec[1][0] * dArrVec[0][1];
    d1 = abs(A1 * dArrVec[0][0] + B1 * dArrVec[0][1] + C1 * dArrVec[0][2]);
    d2 = abs(A2 * dArrVec[1][0] + B2 * dArrVec[1][1] + C2 * dArrVec[1][2]);
    d3 = abs(A3 * dArrVec[2][0] + B3 * dArrVec[2][1] + C3 * dArrVec[2][2]);
    dMinCell = fmin(d1, fmin(d2, d3)) * dLatConst;
    nCell = (int)(dMax / dMinCell + 1);
    nSCatom = nAtom * (int)(pow((nCell * 2 + 1), 3));
    if (nSCatom > 100000) {
        cout << "Supercell needs over 100000 atoms. Change the code to suit your calculation.\n";
        exit(1);
    }
    double dArrSC[100000][3];          // declare array containing supercell coordinates
    double dArrSCr[100000];            // declare array to hold temp radii from one center atom
    string strArrSC[100000];           // declare array containing elements in supercell
    count = 0;
    for (int i = -nCell; i <= nCell; i++) {
        for (int j = -nCell; j <= nCell; j++) {
            for (int k = -nCell; k <= nCell; k++) {
                for (int m = 0; m < nAtom; m++) {
                    dArrSC[count][0] = (dArrAtom[m][0] + i) * dArrVec[0][0]
                                     + (dArrAtom[m][1] + j) * dArrVec[1][0]
                                     + (dArrAtom[m][2] + k) * dArrVec[2][0];
                    dArrSC[count][1] = (dArrAtom[m][0] + i) * dArrVec[0][1]
                                     + (dArrAtom[m][1] + j) * dArrVec[1][1]
                                     + (dArrAtom[m][2] + k) * dArrVec[2][1];
                    dArrSC[count][2] = (dArrAtom[m][0] + i) * dArrVec[0][2]
                                     + (dArrAtom[m][1] + j) * dArrVec[1][2]
                                     + (dArrAtom[m][2] + k) * dArrVec[2][2];
                    strArrSC[count] = strArrAtom[m];
                    count++;
                }
            }
        }
    }
    if (count != nSCatom) {
        cout << "Error when generating supercell.\n";
        exit(1);
    }
    
    // Convert atomic coordinates to Cartesian
    for (int i = 0; i < nAtom; i++) {
        dArrAtom2[i][0] = dArrAtom[i][0] * dArrVec[0][0]
                        + dArrAtom[i][1] * dArrVec[1][0]
                        + dArrAtom[i][2] * dArrVec[2][0];
        dArrAtom2[i][1] = dArrAtom[i][0] * dArrVec[0][1]
                        + dArrAtom[i][1] * dArrVec[1][1]
                        + dArrAtom[i][2] * dArrVec[2][1];
        dArrAtom2[i][2] = dArrAtom[i][0] * dArrVec[0][2]
                        + dArrAtom[i][1] * dArrVec[1][2]
                        + dArrAtom[i][2] * dArrVec[2][2];
    }
    
    // Calculate pair distribution function
    nPairs = (nElem + 1) * nElem / 2;
    if (nPairs > 20) {
        cout << "Pair of elements exceeds 20. Change the code.\n";
        exit(1);
    }
    double dArrPDF[10000][20]; // declare the array containing PDF data
    for (int i = 0; i < nData; i++) {
        dArrPDF[i][0] = dMin + i * dStep;   // first column is r
        for (int j = 1; j <= nPairs + 1; j++) {
            dArrPDF[i][j] = 0.0;        // initialize PDF data
        }
    }
    int count2 = 0; // used to count pairs
    for (int i = 0; i < nElem; i++) {   // This and next loop scan all pairs
        for (int j = 0; j <= i; j++) {
            count2++;
            for (int atom = 0; atom < nAtom; atom++) {  // This loop scan all atoms as center atom
                if (strArrAtom[atom] == strArrElem[i]) {
                    count = 0;          // used to count number of atoms of supercell in the range
                    for (int SCatom = 0; SCatom < nSCatom; SCatom++) {// This loop scan all supercell atoms
                        if (strArrSC[SCatom] == strArrElem[j]) { // if this is the pair of elements we want
                            dTemp = pow((dArrSC[SCatom][0]-dArrAtom2[atom][0]), 2)
                                  + pow((dArrSC[SCatom][1]-dArrAtom2[atom][1]), 2)
                                  + pow((dArrSC[SCatom][2]-dArrAtom2[atom][2]), 2);
                            if (dTemp <= dMax2 && dTemp >= dMin2) {
                                dArrSCr[count] = sqrt(dTemp) * dLatConst;
                                count++;
                            }
                        }
                    }
                    bubbleSort(dArrSCr, count);
                    int num = 0;
                    for (int m = 0; m < count; m++) {   // check each recorded radius
                        for (int n = num; n < nData; n++) {
                            if (dArrSCr[m] >= dArrPDF[n][0] && dArrSCr[m] < dArrPDF[n][0] + dStep) {
                                dArrPDF[n][count2] += 1.0;
                                num = n;
                                break;
                            }
                        }
                    }
                }
            }
            for (int k = 0; k < nData; k++) {   // divide counted integers by volume and number of center atom
                dArrPDF[k][count2] /= (4*3.14159*pow(dArrPDF[k][0],2)*dStep*nArrElem[i]);
            }
        }
    }
    
    // Calculate total PDF
    for (int i = 0; i < nAtom; i++) {
        count = 0;
        for (int j = 0; j < nSCatom; j++) {
            dTemp = pow((dArrSC[j][0]-dArrAtom2[i][0]), 2)
                  + pow((dArrSC[j][1]-dArrAtom2[i][1]), 2)
                  + pow((dArrSC[j][2]-dArrAtom2[i][2]), 2);
            if (dTemp <= dMax2 && dTemp >= dMin2) {
                dArrSCr[count] = sqrt(dTemp) * dLatConst;
                count++;
            }
        }
        bubbleSort(dArrSCr, count);
        int num = 0;
        for (int m = 0; m < count; m++) {
            for (int n = num; n < nData; n++) {
                if (dArrSCr[m] >= dArrPDF[n][0] && dArrSCr[m] < dArrPDF[n][0] + dStep) {
                    dArrPDF[n][nPairs+1] += 1.0;
                    num = n;
                    break;
                }
            }
        }
    }
    for (int k = 0; k < nData; k++) {
        dArrPDF[k][nPairs+1] /= (4*3.14159*pow(dArrPDF[k][0],2)*dStep*nAtom);
    }
				    
    // Output
    ofstream os;
    char output[] = "PDF_";
    strcat(output, argv[1]);
    strcat(output, ".txt");
    os.open(output);
    os << "  r  ";
    for (int i = 0; i < nElem; i++) {
        for (int j = 0; j <= i; j++) {
            os << setw(5) << strArrElem[i];
            os << "-";
            os << setw(2) << strArrElem[j];
        }
    }
    os << "  Total "<< "\n";
    for (int i = 0; i < nData; i++) {
        os << setw(5) << fixed << setprecision(3) << dArrPDF[i][0];
        for (int j = 1; j <= nPairs+1; j++) {
            os << setw(8) << fixed << setprecision(4) << dArrPDF[i][j];
        }
        os << "\n";
    }
    os.close();
    return 0;
}
EOF
#---------------------------------------------------------------------------------------------------
#c++ poscar2pdf.cpp -o poscar2pdf
#./poscar2pdf POSCAR $START $STEP $END 

#scp PDF_POSCAR.txt PDF_$name.txt
#scp PDF_$name.txt PDF_results/
#sed '1d' PDF_POSCAR.txt | awk '{print $NF}' | xargs > PDF_last-column_T_$name.txt                                           # remove first line, get the last column and transpose it
#PDF=$(awk 'NR==1' PDF_last-column_T_$name.txt)

#---------------------------------------------------------------------------------------------------

echo $material $stoichiometric_features $class >> output_stoichiometric.dat
echo $material $atomic_AW_features $class >> output_atomic.dat
echo $material $structural_features $class >> output_structural.dat
echo $material $symmetry_features $class >> output_symmetry.dat
echo $material $lattice_features $class >> output_lattice.dat
echo $material $stability_features $class >> output_stability.dat
echo $material $PDF $class >> output_pdf.dat

echo $material $stoichiometric_features $atomic_AW_features $symmetry_features $PDF $class $stability_features $structural_features $lattice_features >> output_loop.dat

rm POSCAR* CONTCAR*                                                                                                         # don't move this 'rm', important for loop
done                                                                                                                        # loop 0.1

sed 's/ /,/g' output_loop.dat > output_loop.csv
sed 's/ / /g' output_loop.dat > input_test.dat

#===================================================================================================
# verification and cleaning
#===================================================================================================

awk '{print NF}' input_test.dat > ncolumns.out                                                                              # count number of columns in each line
cat ncolumns.out
max_ncolumns=$(sort -t= -nr -k1 ncolumns.out | head -1)

#echo "Max number of columns? followed by [ENTER]:"
#read max_ncolumns
#rm -r CONTROL
#mkdir CONTROL
#cd CONTROL/
#for n in $(seq $max_ncolumns)
#do
#        grep -n $n ../ncolumns.out > column_$n                                                                             # looking for a line with a diferent number of max columns, what indicate a line with error
#done
#find . -type f -empty -exec rm "{}" \;                                                                                     # find and exclude empty files (DON'T TOUCH)
#ls -lS > the_trial.out
#cat the_trial.out
#cat column_* > ../lines.out
#cd ../

cat input_test.dat | awk 'NF=='$max_ncolumns'' > output_test.dat                                                            # remove possible line with a wrong number of columns

#===================================================================================================
# initial header
#===================================================================================================

header_stoichiometric=$(echo 'stoich_2 stoich_3 stoich_5 stoich_7 stoich_10')

header_atomic_Z=$(echo 'Z^A_{mean} Z^W_{mean} Z_{max} Z_{min} Z^A_{stdev} Z^W_{stdev} Z^A_{redvalue} Z^W_{redvalue}')

header_atomic_AtomicMass=$(echo 'm^A_{mean} m^W_{mean} m_{max} m_{min} m^A_{stdev} m^W_{stdev} m^A_{redvalue} m^W_{redvalue}')

header_atomic_HOMO=$(echo 'HOMO^A_{mean} HOMO^W_{mean} HOMO_{max} HOMO_{min} HOMO^A_{stdev} HOMO^W_{stdev} HOMO^A_{redvalue} HOMO^W_{redvalue}')
header_atomic_LUMO=$(echo 'LUMO^A_{mean} LUMO^W_{mean} LUMO_{max} LUMO_{min} LUMO^A_{stdev} LUMO^W_{stdev} LUMO^A_{redvalue} LUMO^W_{redvalue}')
header_atomic_FirstIonization=$(echo 'IP^A_{mean} IP^W_{mean} IP_{max} IP_{min} IP^A_{stdev} IP^W_{stdev} IP^A_{redvalue} IP^W_{redvalue}')
header_atomic_Electroaffinity=$(echo 'EA^A_{mean} EA^W_{mean} EA_{max} EA_{min} EA^A_{stdev} EA^W_{stdev} EA^A_{redvalue} EA^W_{redvalue}')
header_atomic_HOMOSOC=$(echo 'HOMO_{SOC}^A_{mean} HOMO_{SOC}^W_{mean} HOMO_{SOC}{max} HOMO_{SOC}{min} HOMO_{SOC}^A_{stdev} HOMO_{SOC}^W_{stdev} HOMO_{SOC}^A_{redvalue} HOMO_{SOC}^W_{redvalue}')
header_atomic_LUMOSOC=$(echo 'LUMO_{SOC}^A_{mean} LUMO_{SOC}^W_{mean} LUMO_{SOC}{max} LUMO_{SOC}{min} LUMO_{SOC}^A_{stdev} LUMO_{SOC}^W_{stdev} LUMO_{SOC}^A_{redvalue} LUMO_{SOC}^W_{redvalue}')
header_atomic_FirstIonizationSOC=$(echo 'IP_{SOC}^A_{mean} IP_{SOC}^W_{mean} IP_{SOC}{max} IP_{SOC}{min} IP_{SOC}^A_{stdev} IP_{SOC}^W_{stdev} IP_{SOC}^A_{redvalue} IP_{SOC}^W_{redvalue}')
header_atomic_ElectroaffinitySOC=$(echo 'EA_{SOC}^A_{mean} EA_{SOC}^W_{mean} EA_{SOC}{max} EA_{SOC}{min} EA_{SOC}^A_{stdev} EA_{SOC}^W_{stdev} EA_{SOC}^A_{redvalue} EA_{SOC}^W_{redvalue}')
header_atomic_SplitSOC=$(echo 'Split_{SOC}^A_{mean} Split_{SOC}^W_{mean} Split_{SOC}{max} Split_{SOC}{min} Split_{SOC}^A_{stdev} Split_{SOC}^W_{stdev} Split_{SOC}^A_{redvalue} Split_{SOC}^W_{redvalue}')

header_atomic_Electronegativity=$(echo 'EN^A_{mean} EN^W_{mean} EN_{max} EN_{min} EN^A_{stdev} EN^W_{stdev} EN^A_{redvalue} EN^W_{redvalue}')

header_atomic_Polarizability=$(echo 'POL^A_{mean} POL^W_{mean} POL_{max} POL_{min} POL^A_{stdev} POL^W_{stdev} POL^A_{redvalue} POL^W_{redvalue}')

header_atomic_rs=$(echo 'r_s^A_{mean} r_s^W_{mean} r_s_{max} r_s_{min} r_s^A_{stdev} r_s^W_{stdev} r_s^A_{redvalue} r_s^W_{redvalue}')
header_atomic_rp=$(echo 'r_p^A_{mean} r_p^W_{mean} r_p_{max} r_p_{min} r_p^A_{stdev} r_p^W_{stdev} r_p^A_{redvalue} r_p^W_{redvalue}')
header_atomic_ratomic=$(echo 'r_{atomic}^A_{mean} r_{atomic}^W_{mean} r_{atomic}{max} r_{atomic}{min} r_{atomic}^A_{stdev} r_{atomic}^W_{stdev} r_{atomic}^A_{redvalue} r_{atomic}^W_{redvalue}')
header_atomic_rvalence=$(echo 'r_{valence}^A_{mean} r_{valence}^W_{mean} r_{valence}{max} r_{valence}{min} r_{valence}^A_{stdev} r_{valence}^W_{stdev} r_{valence}^A_{redvalue} r_{valence}^W_{redvalue}')
header_atomic_rcovalent=$(echo 'r_{covalent}^A_{mean} r_{covalent}^W_{mean} r_{covalent}{max} r_{covalent}{min} r_{covalent}^A_{stdev} r_{covalent}^W_{stdev} r_{covalent}^A_{redvalue} r_{covalent}^W_{redvalue}')

header_atomic_Group=$(echo 'Group^A_{mean} Group^W_{mean} Group_{max} Group_{min} Group^A_{stdev} Group^W_{stdev} Group^A_{redvalue} Group^W_{redvalue}')
header_atomic_Period=$(echo 'Period^A_{mean} Period^W_{mean} Period_{max} Period_{min} Period^A_{stdev} Period^W_{stdev} Period^A_{redvalue} Period^W_{redvalue}')

header_atomic_ValenceElectrons_S=$(echo 'VEs^A_{mean} VEs^W_{mean} VEs_{max} VEs_{min} VEs^A_{stdev} VEs^W_{stdev} VEs^A_{redvalue} VEs^W_{redvalue}')
header_atomic_ValenceElectrons_P=$(echo 'VEp^A_{mean} VEp^W_{mean} VEp_{max} VEp_{min} VEp^A_{stdev} VEp^W_{stdev} VEp^A_{redvalue} VEp^W_{redvalue}')
header_atomic_ValenceElectrons_D=$(echo 'VEd^A_{mean} VEd^W_{mean} VEd_{max} VEd_{min} VEd^A_{stdev} VEd^W_{stdev} VEd^A_{redvalue} VEd^W_{redvalue}')
header_atomic_ValenceElectrons_F=$(echo 'VEf^A_{mean} VEf^W_{mean} VEf_{max} VEf_{min} VEf^A_{stdev} VEf^W_{stdev} VEf^A_{redvalue} VEf^W_{redvalue}')
header_atomic_ValenceElectrons_SP=$(echo 'VEsp^A_{mean} VEsp^W_{mean} VEsp_{max} VEsp_{min} VEsp^A_{stdev} VEsp^W_{stdev} VEsp^A_{redvalue} VEsp^W_{redvalue}')
header_atomic_ValenceElectrons=$(echo 'VE^A_{mean} VE^W_{mean} VE_{max} VE_{min} VE^A_{stdev} VE^W_{stdev} VE^A_{redvalue} VE^W_{redvalue}')
header_atomic_EmptyStates_S=$(echo 'ESs^A_{mean} ESs^W_{mean} ESs_{max} ESs_{min} ESs^A_{stdev} ESs^W_{stdev} ESs^A_{redvalue} ESs^W_{redvalue}')
header_atomic_EmptyStates_P=$(echo 'ESp^A_{mean} ESp^W_{mean} ESp_{max} ESp_{min} ESp^A_{stdev} ESp^W_{stdev} ESp^A_{redvalue} ESp^W_{redvalue}')
header_atomic_EmptyStates_D=$(echo 'ESd^A_{mean} ESd^W_{mean} ESd_{max} ESd_{min} ESd^A_{stdev} ESd^W_{stdev} ESd^A_{redvalue} ESd^W_{redvalue}')
header_atomic_EmptyStates_F=$(echo 'ESf^A_{mean} ESf^W_{mean} ESf_{max} ESf_{min} ESf^A_{stdev} ESf^W_{stdev} ESf^A_{redvalue} ESf^W_{redvalue}')
header_atomic_EmptyStates_out=$(echo 'ES+^A_{mean} ES+^W_{mean} ES+_{max} ES+_{min} ES+^A_{stdev} ES+^W_{stdev} ES+^A_{redvalue} ES+^W_{redvalue}')
header_atomic_EmptyStates=$(echo 'ES^A_{mean} ES^W_{mean} ES_{max} ES_{min} ES^A_{stdev} ES^W_{stdev} ES^A_{redvalue} ES^W_{redvalue}')
#---------------------------------------------------------------------------------------------------
header_atomic=$(echo $header_atomic_Z $header_atomic_AtomicMass $header_atomic_HOMO $header_atomic_LUMO $header_atomic_FirstIonization $header_atomic_Electroaffinity $header_atomic_HOMOSOC $header_atomic_LUMOSOC $header_atomic_FirstIonizationSOC $header_atomic_ElectroaffinitySOC $header_atomic_SplitSOC $header_atomic_Electronegativity $header_atomic_Polarizability $header_atomic_rs $header_atomic_rp $header_atomic_ratomic $header_atomic_rvalence $header_atomic_rcovalent $header_atomic_Group $header_atomic_Period $header_atomic_ValenceElectrons_S $header_atomic_ValenceElectrons_P $header_atomic_ValenceElectrons_D $header_atomic_ValenceElectrons_F $header_atomic_ValenceElectrons_SP $header_atomic_ValenceElectrons $header_atomic_EmptyStates_S $header_atomic_EmptyStates_P $header_atomic_EmptyStates_D $header_atomic_EmptyStates_F $header_atomic_EmptyStates_out $header_atomic_EmptyStates)

header_structural=$(echo $header_structural)
#prototype spacegroup Bravais_lattice Pearson_symbol pointgroup_type Egap_type Egap nspecies natoms density volume_cell volume_atom spin_cell spin_atom spinF

header_lattice=$(echo $header_lattice)
header_stability=$(echo $header_stability)
#mat.proj spacegroup_symbol spacegroup_number cell_length_a cell_length_b cell_length_c cell_angle_alpha cell_angle_beta cell_angle_gamma band_gap total_magnetization formation_energy_per_atom e_above_hull

header_symmetry=$(echo 'Order C2 C3 C4 C6 C3.2 C4.3 C6.5 mir.H mir.V mir.D inv S2 S3 S4 S6')

header_pdf=$(seq $START $STEP $END | xargs)

header_other=$(echo 'CLASS')

#===================================================================================================
#0)

rm train_stoichiometric.dat
echo material $header_stoichiometric $header_other > train_atomic.dat
cat output_stoichiometric.dat >> train_stoichiometric.dat
        awk '{print $NF}' train_stoichiometric.dat | uniq -c > nsample_stoichiometric.dat

rm train_atomic.dat
echo material $header_atomic $header_other > train_atomic.dat
cat output_atomic.dat >> train_atomic.dat
        awk '{print $NF}' train_atomic.dat | uniq -c > nsample_atomic.dat

rm train_structural.dat
echo material $header_structural $header_other > train_structural.dat
cat output_structural.dat >> train_structural.dat
        awk '{print $NF}' train_structural.dat | uniq -c > nsample_structural.dat

rm train_lattice.dat
echo material $header_lattice $header_other > train_lattice.dat
cat output_lattice.dat >> train_lattice.dat
	awk '{print $NF}' train_lattice.dat | uniq -c > nsample_lattice.dat

rm train_stability.dat
echo material $header_stability $header_other > train_stability.dat
cat output_stability.dat >> train_stability.dat
        awk '{print $NF}' train_stability.dat | uniq -c > nsample_stability.dat

rm train_symmetry.dat
echo material $header_symmetry $header_other > train_symmetry.dat
cat output_symmetry.dat >> train_symmetry.dat
        awk '{print $NF}' train_symmetry.dat | uniq -c > nsample_symmetry.dat

rm train_pdf_$START-$STEP-$END.dat
echo material $header_pdf $header_other > train_pdf_$START-$STEP-$END.dat
cat output_pdf.dat >> train_pdf_$START-$STEP-$END.dat
        awk '{print $NF}' train_pdf_$START-$STEP-$END.dat | uniq -c > nsample_pdf_$START-$STEP-$END.dat
                
rm train_stch_atom_strc_latt_symm_other_stab.dat
echo material $header_stoichiometric $header_atomic $header_structural $header_lattice $header_pdf $header_symmetry $header_other $header_stability > train_stch_atom_strc_latt_symm_other_stab.dat
cat output_test.dat >> train_stch_atom_strc_latt_symm_other_stab.dat
scp train_stch_atom_strc_latt_symm_other_stab.dat final.dat                                                                            # if you alread have final.dat, comment this line

#===================================================================================================
#lines=$(cat final.dat | wc -l)
#for ((j=1; j<=$lines ; j++)); do
#material=$(awk -v colname=material '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{print $colnum}' final.dat) 
#code=$(awk -v colname=code '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{print $colnum}' final.dat) 
#bravais=$(awk -v colname=Bravais_lattice '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{print $colnum}' final.dat) 
#spacegroup=$(awk -v colname=spacegroup '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{print $colnum}' final.dat) 
#type=$(awk -v colname=Egap_type '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{print $colnum}' final.dat) 
#nspecies=$(awk -v colname=nspecies '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{print $colnum}' final.dat) 
#order=$(awk -v colname=Order '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{print $colnum}' final.dat) 
#centrosymetric=$(awk -v colname=i '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{print $colnum}' final.dat) 
#magnetism=$(awk -v colname=spin_cell '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{print $colnum}' final.dat) 
#CLASS=$(awk -v colname=CLASS '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{print $colnum}' final.dat) 
#echo $material $code $bravais $spacegroup $type $nspecies $order $centrosymetric $magnetism $CLASS >> SUMMARY
#done
#===================================================================================================

#===================================================================================================
#1)
#---------------------------------------------------------------------------------------------------
### Only metallic systems (Egap = 0)

awk NR==1 final.dat > train_metallic.dat
awk -v colname=Egap '(NR==1){colnum=-1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;} BEGIN {OFS=" "}{gsub(0,"@" ,$(colnum)); print}' final.dat | grep @ | sed 's/@/0/g' >> train_metallic.dat
awk -v colname=Egap '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_metallic.dat > final.dat
#---------------------------------------------------------------------------------------------------

bad_columns=$(echo prototype spacegroup Pearson_symbol pointgroup_type Egap_type mat.proj spacegroup_symbol spacegroup_number band_gap total_magnetization)
#bad_columns=$(echo prototype spacegroup Pearson_symbol pointgroup_type Egap_type mat.proj spacegroup_symbol spacegroup_number)

scp final.dat train_all.tmp0
for remove in $bad_columns; do                                                                                              # remove column with nominal features
    awk -v colname=$remove '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_all.tmp0 > train_all.tmp1     # search specific column by name in header
    mv train_all.tmp1 train_all.tmp0
    done
    mv train_all.tmp0 train_all.bravais
    awk -v colname=Bravais_lattice '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_all.bravais > train_all.dat
    awk -F ' ' '{print $NF}' train_all.dat | uniq -c > nsample_all.dat                                                      # count how many of each class in the last column

echo -e ${CYAN}"DONE!!! HAVE a NICE DAY!!!"${RESET}
#---------------------------------------------------------------------------------------------------
#2) Split the materials in number of species

for nspecies in "2" "3"; do
    awk -v colname=nspecies '(NR==1){colnum=-1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;} BEGIN {OFS=" "}{gsub('$nspecies',"@",$(colnum)); print}' train_all.dat > train_nsp_$nspecies.tmp0
    grep @ train_nsp_$nspecies.tmp0 > train_nsp_$nspecies.tmp1                                                              # substitute specific character in a specific column

    sed -i 's/@/'$nspecies'/g' train_nsp_$nspecies.tmp1
    awk NR==1 train_all.dat >> train_nsp_$nspecies.dat
    cat train_nsp_$nspecies.tmp1 >> train_nsp_$nspecies.dat

    awk '{print $NF}' train_nsp_$nspecies.dat | uniq -c > nsample_nsp_$nspecies.dat
    done

echo -e ${CYAN}"Binaries and Ternaries DONE!!!"${RESET}

#===================================================================================================
#3) Split the materials in each Bravais Lattice

for bravais in "TRI" "MCL" "MCLC" "ORC" "ORCC" "ORCF" "ORCI" "TET" "BCT" "HEX" "RHL" "CUB" "FCC" "BCC"; do                  # rm train_crystal_$bravais.tmp HEADER_crystal.tmp output_crystal.dat
    grep $bravais train_all.bravais > train_crystal_$bravais.tmp0
    awk NR==1 train_all.bravais >> train_crystal_$bravais.bravais
    cat train_crystal_$bravais.tmp0 >> train_crystal_$bravais.bravais

    awk -v colname=Bravais_lattice '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_crystal_$bravais.bravais > train_crystal_$bravais.dat
    awk '{print $NF}' train_crystal_$bravais.dat | uniq -c > nsample_crystal_$bravais.dat

    sed 's/CLASS/'$bravais'/g' nsample_crystal_$bravais.dat >> nsample_crystal_ALL.dat                                      # substitute the word CLASS and concatene all the "nsample_crystal_$bravais.dat"
    sed '1d' train_crystal_$bravais.dat >> train_crystal_$bravais.out                                                       # removing header, just after search for "Bravais_lattice" column
    cat train_crystal_$bravais.out >> train_crystal_ALL.tmp0
    done

awk NR==1 train_all.bravais >> train_crystal_ALL.tmp1
cat train_crystal_ALL.tmp0 >> train_crystal_ALL.tmp1
awk -v colname=Bravais_lattice '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_crystal_ALL.tmp1 > train_crystal_ALL.dat
   
cat train_crystal_TRI.out >> train_crystal_1TRICLINIC.tmp
    cat train_crystal_1TRICLINIC.tmp >> train_crystal_1TRICLINIC.dat
    awk '{print $NF}' train_crystal_1TRICLINIC.dat | uniq -c > nsample_crystal_1TRICLINIC.dat

cat train_crystal_MCL.out >> train_crystal_2MONOCLINIC.tmp
cat train_crystal_MCLC.out >> train_crystal_2MONOCLINIC.tmp
    cat train_crystal_2MONOCLINIC.tmp >> train_crystal_2MONOCLINIC.dat
    awk '{print $NF}' train_crystal_2MONOCLINIC.dat | uniq -c > nsample_crystal_2MONOCLINIC.dat

cat train_crystal_ORC.out >> train_crystal_3ORTHORHOMBIC.tmp
cat train_crystal_ORCC.out >> train_crystal_3ORTHORHOMBIC.tmp
cat train_crystal_ORCF.out >> train_crystal_3ORTHORHOMBIC.tmp
cat train_crystal_ORCI.out >> train_crystal_3ORTHORHOMBIC.tmp
    cat train_crystal_3ORTHORHOMBIC.tmp >> train_crystal_3ORTHORHOMBIC.dat
    awk '{print $NF}' train_crystal_3ORTHORHOMBIC.dat | uniq -c > nsample_crystal_3ORTHORHOMBIC.dat

cat train_crystal_TET.out >> train_crystal_4TETRAGONAL.tmp
cat train_crystal_BCT.out >> train_crystal_4TETRAGONAL.tmp
    cat train_crystal_4TETRAGONAL.tmp >> train_crystal_4TETRAGONAL.dat
    awk '{print $NF}' train_crystal_4TETRAGONAL.dat | uniq -c > nsample_crystal_4TETRAGONAL.dat

cat train_crystal_HEX.out >> train_crystal_5HEXAGONAL.tmp
cat train_crystal_RHL.out >> train_crystal_5HEXAGONAL.tmp
    cat train_crystal_5HEXAGONAL.tmp >> train_crystal_5HEXAGONAL.dat
    awk '{print $NF}' train_crystal_5HEXAGONAL.dat | uniq -c > nsample_crystal_5HEXAGONAL.dat

#cat train_crystal_RHL.out >> train_crystal_TRIGONAL.tmp
#    cat train_crystal_TRIGONAL.tmp >> train_crystal_TRIGONAL.dat

cat train_crystal_CUB.out >> train_crystal_6CUBIC.tmp
cat train_crystal_FCC.out >> train_crystal_6CUBIC.tmp
cat train_crystal_BCC.out >> train_crystal_6CUBIC.tmp
    cat train_crystal_6CUBIC.tmp >> train_crystal_6CUBIC.dat
    awk '{print $NF}' train_crystal_6CUBIC.dat | uniq -c > nsample_crystal_6CUBIC.dat

echo -e ${CYAN}"BRAVAIS DONE!!!"${RESET}

#===================================================================================================
#4) Split the materials in each Bravais Lattice and number of species

for nspecies in "2" "3"; do
    for bravais in "TRI" "MCL" "MCLC" "ORC" "ORCC" "ORCF" "ORCI" "TET" "BCT" "HEX" "RHL" "CUB" "FCC" "BCC"; do
        awk -v colname=nspecies '(NR==1){colnum=-1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;} BEGIN {OFS=" "}{gsub('$nspecies',"@",$(colnum)); print}' train_crystal_$bravais.bravais > train_crystal_$bravais-$nspecies.tmp0
        grep @ train_crystal_$bravais-$nspecies.tmp0 > train_crystal_$bravais-$nspecies.tmp1                                # substitute specific character in a specific column
        sed -i 's/@/'$nspecies'/g' train_crystal_$bravais-$nspecies.tmp1                                                    # search for all number of species in that crystallography
        awk NR==1 train_crystal_$bravais.bravais > train_crystal_$bravais-$nspecies.bravais
        cat train_crystal_$bravais-$nspecies.tmp1 >> train_crystal_$bravais-$nspecies.bravais
        awk -v colname=Bravais_lattice '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_crystal_$bravais-$nspecies.bravais > train_crystal_$bravais-$nspecies.dat
        awk '{print $NF}' train_crystal_$bravais-$nspecies.dat | uniq -c > nsample_crystal_$bravais-$nspecies.dat

        sed '1d' train_crystal_$bravais-$nspecies.dat >> train_crystal_ALL-$nspecies.tmp                                    # removing the header
        awk '{print $NF}' train_crystal_$bravais-$nspecies.dat | uniq -c > nsample_crystal_$bravais-$nspecies.dat           # count the number of samples in train with the same specifications
        sed 's/CLASS/'$bravais'/g' nsample_crystal_$bravais-$nspecies.dat >> nsample_crystal_ALL-$nspecies.dat
        done

awk NR==1 train_nsp_$nspecies.dat > train_crystal_ALL-$nspecies.dat
cat train_crystal_ALL-$nspecies.tmp >> train_crystal_ALL-$nspecies.dat

cat train_crystal_TRI-$nspecies.dat >> train_crystal_1TRICLINIC-$nspecies.tmp
    cat train_crystal_1TRICLINIC-$nspecies.tmp >> train_crystal_1TRICLINIC-$nspecies.dat
    awk '{print $NF}' train_crystal_1TRICLINIC-$nspecies.dat | uniq -c > nsample_crystal_1TRICLINIC-$nspecies.dat

cat train_crystal_MCL-$nspecies.dat >> train_crystal_2MONOCLINIC-$nspecies.tmp
cat train_crystal_MCLC-$nspecies.dat >> train_crystal_2MONOCLINIC-$nspecies.tmp
    cat train_crystal_2MONOCLINIC-$nspecies.tmp >> train_crystal_2MONOCLINIC-$nspecies.dat
    awk '{print $NF}' train_crystal_2MONOCLINIC-$nspecies.dat | uniq -c > nsample_crystal_2MONOCLINIC-$nspecies.dat

cat train_crystal_ORC-$nspecies.dat >> train_crystal_3ORTHORHOMBIC-$nspecies.tmp
cat train_crystal_ORCC-$nspecies.dat >> train_crystal_3ORTHORHOMBIC-$nspecies.tmp
cat train_crystal_ORCF-$nspecies.dat >> train_crystal_3ORTHORHOMBIC-$nspecies.tmp
cat train_crystal_ORCI-$nspecies.dat >> train_crystal_3ORTHORHOMBIC-$nspecies.tmp
    cat train_crystal_3ORTHORHOMBIC-$nspecies.tmp >> train_crystal_3ORTHORHOMBIC-$nspecies.dat
    awk '{print $NF}' train_crystal_3ORTHORHOMBIC-$nspecies.dat | uniq -c > nsample_crystal_3ORTHORHOMBIC-$nspecies.dat

cat train_crystal_TET-$nspecies.dat >> train_crystal_4TETRAGONAL-$nspecies.tmp
cat train_crystal_BCT-$nspecies.dat >> train_crystal_4TETRAGONAL-$nspecies.tmp
    cat train_crystal_4TETRAGONAL-$nspecies.tmp >> train_crystal_4TETRAGONAL-$nspecies.dat
    awk '{print $NF}' train_crystal_4TETRAGONAL-$nspecies.dat | uniq -c > nsample_crystal_4TETRAGONAL-$nspecies.dat

cat train_crystal_HEX-$nspecies.dat >> train_crystal_5HEXAGONAL-$nspecies.tmp
cat train_crystal_RHL-$nspecies.dat >> train_crystal_5HEXAGONAL-$nspecies.tmp
    cat train_crystal_5HEXAGONAL-$nspecies.tmp >> train_crystal_5HEXAGONAL-$nspecies.dat
    awk '{print $NF}' train_crystal_5HEXAGONAL-$nspecies.dat | uniq -c > nsample_crystal_5HEXAGONAL-$nspecies.dat

cat train_crystal_CUB-$nspecies.dat >> train_crystal_6CUBIC-$nspecies.tmp
cat train_crystal_FCC-$nspecies.dat >> train_crystal_6CUBIC-$nspecies.tmp
cat train_crystal_BCC-$nspecies.dat >> train_crystal_6CUBIC-$nspecies.tmp
    cat train_crystal_6CUBIC-$nspecies.tmp >> train_crystal_6CUBIC-$nspecies.dat
    awk '{print $NF}' train_crystal_6CUBIC-$nspecies.dat | uniq -c > nsample_crystal_6CUBIC-$nspecies.dat

    done

echo -e ${CYAN}"BRAVAIS Binaries and Ternaries DONE!!!"${RESET}

#===================================================================================================
#5) Extract only the non-magnetic materials

scp final.dat final_nmag.tmp0
for magnetic_features in spinF spin_atom spin_cell; do
awk NR==1 final_nmag.tmp0 > final_nmag.tmp1
awk -v colname=$magnetic_features '(NR==1){colnum=-1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;} BEGIN {OFS=" "}{gsub("0","@",$(colnum))}1' final_nmag.tmp0 | grep @ >> final_nmag.tmp1
awk -v colname=$magnetic_features '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' final_nmag.tmp1 > final_nmag.tmp0
done

mv final_nmag.tmp0 train_all_nmag.tmp0
for remove in $bad_columns; do
    awk -v colname=$remove '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_all_nmag.tmp0 > train_all_nmag.tmp1
    mv train_all_nmag.tmp1 train_all_nmag.tmp0
    done
    mv train_all_nmag.tmp0 train_all_nmag.bravais
    awk -v colname=Bravais_lattice '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_all_nmag.bravais > train_all_nmag.dat
    awk -F ' ' '{print $NF}' train_all_nmag.dat | uniq -c > nsample_all_nmag.dat

echo -e ${CYAN}"NON.Magetics DONE!!!"${RESET}
#---------------------------------------------------------------------------------------------------
#6) Split the non magnetic materials in number of species

for nspecies in "2" "3"; do
    awk -v colname=nspecies '(NR==1){colnum=-1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;} BEGIN {OFS=" "}{gsub('$nspecies',"@",$(colnum)); print}' train_all_nmag.dat > train_nmag_nsp_$nspecies.tmp0
    grep @ train_nmag_nsp_$nspecies.tmp0 > train_nmag_nsp_$nspecies.tmp1                                                    # substitute specific character in a specific column
    awk NR==1 train_all_nmag.dat > train_nmag_nsp_$nspecies.tmp2                                                            # put again the header lost in grep process
    cat train_nmag_nsp_$nspecies.tmp1 >> train_nmag_nsp_$nspecies.tmp2
    awk -v colname=nspecies '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_nmag_nsp_$nspecies.tmp2 > train_nmag_nsp_$nspecies.dat
    awk -F ' ' '{print $NF}' train_nmag_nsp_$nspecies.dat | uniq -c > nsample_nmag_nsp_$nspecies.dat
    done

echo -e ${CYAN}"NON.Mag Binaries and Ternaries DONE!!!"${RESET}

#===================================================================================================
#7) Split the non magnetic materials in each Bravais Lattice

for bravais in "TRI" "MCL" "MCLC" "ORC" "ORCC" "ORCF" "ORCI" "TET" "BCT" "HEX" "RHL" "CUB" "FCC" "BCC"; do
    grep $bravais train_all_nmag.bravais > train_nmag_crystal_$bravais.tmp0
    awk NR==1 train_all_nmag.bravais > train_nmag_crystal_$bravais.bravais
    cat train_nmag_crystal_$bravais.tmp0 >> train_nmag_crystal_$bravais.bravais

    awk -v colname=Bravais_lattice '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_nmag_crystal_$bravais.bravais > train_nmag_crystal_$bravais.dat
    awk '{print $NF}' train_nmag_crystal_$bravais.dat | uniq -c > nsample_nmag_crystal_$bravais.dat

    sed 's/CLASS/'$bravais'/g' nsample_nmag_crystal_$bravais.dat >> nsample_nmag_crystal_ALL.dat                            # substitute the word CLASS and concatene all the "nsample_crystal_$bravais.dat"
    sed '1d' train_nmag_crystal_$bravais.dat >> train_nmag_crystal_$bravais.out                                             # removing header, just after search for "Bravais_lattice" column
    cat train_nmag_crystal_$bravais.out >> train_nmag_crystal_ALL.tmp
    done

cat train_nmag_crystal_$bravais.dat >> train_nmag_crystal_ALL.OUT
cat train_nmag_crystal_ALL.tmp >> train_nmag_crystal_ALL.OUT

awk -v colname=Bravais_lattice '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_nmag_crystal_ALL.OUT > train_nmag_crystal_ALL.dat
   
cat train_nmag_crystal_TRI.out >> train_nmag_crystal_1TRICLINIC.tmp
    cat train_nmag_crystal_1TRICLINIC.tmp >> train_nmag_crystal_1TRICLINIC.dat
    awk '{print $NF}' train_nmag_crystal_1TRICLINIC.dat | uniq -c > nsample_nmag_crystal_1TRICLINIC.dat

cat train_nmag_crystal_MCL.out >> train_nmag_crystal_2MONOCLINIC.tmp
cat train_nmag_crystal_MCLC.out >> train_nmag_crystal_2MONOCLINIC.tmp
    cat train_nmag_crystal_2MONOCLINIC.tmp >> train_nmag_crystal_2MONOCLINIC.dat
    awk '{print $NF}' train_nmag_crystal_2MONOCLINIC.dat | uniq -c > nsample_nmag_crystal_2MONOCLINIC.dat

cat train_nmag_crystal_ORC.out >> train_nmag_crystal_3ORTHORHOMBIC.tmp
cat train_nmag_crystal_ORCC.out >> train_nmag_crystal_3ORTHORHOMBIC.tmp
cat train_nmag_crystal_ORCF.out >> train_nmag_crystal_3ORTHORHOMBIC.tmp
cat train_nmag_crystal_ORCI.out >> train_nmag_crystal_3ORTHORHOMBIC.tmp
    cat train_nmag_crystal_3ORTHORHOMBIC.tmp >> train_nmag_crystal_3ORTHORHOMBIC.dat
    awk '{print $NF}' train_nmag_crystal_3ORTHORHOMBIC.dat | uniq -c > nsample_nmag_crystal_3ORTHORHOMBIC.dat

cat train_nmag_crystal_TET.out >> train_nmag_crystal_4TETRAGONAL.tmp
cat train_nmag_crystal_BCT.out >> train_nmag_crystal_4TETRAGONAL.tmp
    cat train_nmag_crystal_4TETRAGONAL.tmp >> train_nmag_crystal_4TETRAGONAL.dat
    awk '{print $NF}' train_nmag_crystal_4TETRAGONAL.dat | uniq -c > nsample_nmag_crystal_4TETRAGONAL.dat

cat train_nmag_crystal_HEX.out >> train_nmag_crystal_5HEXAGONAL.tmp
cat train_nmag_crystal_RHL.out >> train_nmag_crystal_5HEXAGONAL.tmp
    cat train_nmag_crystal_5HEXAGONAL.tmp >> train_nmag_crystal_5HEXAGONAL.dat
    awk '{print $NF}' train_nmag_crystal_5HEXAGONAL.dat | uniq -c > nsample_nmag_crystal_5HEXAGONAL.dat

cat train_nmag_crystal_CUB.out >> train_nmag_crystal_6CUBIC.tmp
cat train_nmag_crystal_FCC.out >> train_nmag_crystal_6CUBIC.tmp
cat train_nmag_crystal_BCC.out >> train_nmag_crystal_6CUBIC.tmp
    cat train_nmag_crystal_6CUBIC.tmp >> train_nmag_crystal_6CUBIC.dat
    awk '{print $NF}' train_nmag_crystal_6CUBIC.dat | uniq -c > nsample_nmag_crystal_6CUBIC.dat

echo -e ${CYAN}"NON.Mag BRAVAIS DONE!!!"${RESET}

#===================================================================================================
#8) Split the non magnetics materials in each Bravais Lattice and number of species

for nspecies in "2" "3"; do
    for bravais in "TRI" "MCL" "MCLC" "ORC" "ORCC" "ORCF" "ORCI" "TET" "BCT" "HEX" "RHL" "CUB" "FCC" "BCC"; do
        awk -v colname=nspecies '(NR==1){colnum=-1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;} BEGIN {OFS=" "}{gsub('$nspecies',"@",$(colnum)); print}' train_nmag_crystal_$bravais.bravais > train_nmag_crystal_$bravais-$nspecies.tmp0
        grep @ train_nmag_crystal_$bravais-$nspecies.tmp0 > train_nmag_crystal_$bravais-$nspecies.tmp1                           # substitute specific character in a specific column
        sed -i 's/@/'$nspecies'/g' train_nmag_crystal_$bravais-$nspecies.tmp1                                                    # search for all number of species in that crystallography
        awk NR==1 train_nmag_crystal_$bravais.bravais > train_nmag_crystal_$bravais-$nspecies.bravais
        cat train_nmag_crystal_$bravais-$nspecies.tmp1 >> train_nmag_crystal_$bravais-$nspecies.bravais
        awk -v colname=Bravais_lattice '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_nmag_crystal_$bravais-$nspecies.bravais > train_nmag_crystal_$bravais-$nspecies.dat
        awk '{print $NF}' train_nmag_crystal_$bravais-$nspecies.dat | uniq -c > nsample_crystal_$bravais-$nspecies.dat

        sed '1d' train_nmag_crystal_$bravais-$nspecies.dat >> train_nmag_crystal_ALL-$nspecies.tmp                               # removing the header
        awk '{print $NF}' train_nmag_crystal_$bravais-$nspecies.dat | uniq -c > nsample_crystal_$bravais-$nspecies.dat           # count the number of samples in train with the same specifications
        sed 's/CLASS/'$bravais'/g' nsample_crystal_$bravais-$nspecies.dat >> nsample_crystal_ALL-$nspecies.dat
        done

awk NR==1 train_nsp_$nspecies.dat > train_nmag_crystal_ALL-$nspecies.dat
cat train_nmag_crystal_ALL-$nspecies.tmp >> train_nmag_crystal_ALL-$nspecies.dat

cat train_nmag_crystal_TRI-$nspecies.dat >> train_nmag_crystal_1TRICLINIC-$nspecies.tmp
    cat train_nmag_crystal_1TRICLINIC-$nspecies.tmp >> train_nmag_crystal_1TRICLINIC-$nspecies.dat
    awk '{print $NF}' train_nmag_crystal_1TRICLINIC-$nspecies.dat | uniq -c > nsample_nmag_crystal_1TRICLINIC-$nspecies.dat

cat train_nmag_crystal_MCL-$nspecies.dat >> train_nmag_crystal_2MONOCLINIC-$nspecies.tmp
cat train_nmag_crystal_MCLC-$nspecies.dat >> train_nmag_crystal_2MONOCLINIC-$nspecies.tmp
    cat train_nmag_crystal_2MONOCLINIC-$nspecies.tmp >> train_nmag_crystal_2MONOCLINIC-$nspecies.dat
    awk '{print $NF}' train_nmag_crystal_2MONOCLINIC-$nspecies.dat | uniq -c > nsample_nmag_crystal_2MONOCLINIC-$nspecies.dat

cat train_nmag_crystal_ORC-$nspecies.dat >> train_nmag_crystal_3ORTHORHOMBIC-$nspecies.tmp
cat train_nmag_crystal_ORCC-$nspecies.dat >> train_nmag_crystal_3ORTHORHOMBIC-$nspecies.tmp
cat train_nmag_crystal_ORCF-$nspecies.dat >> train_nmag_crystal_3ORTHORHOMBIC-$nspecies.tmp
cat train_nmag_crystal_ORCI-$nspecies.dat >> train_nmag_crystal_3ORTHORHOMBIC-$nspecies.tmp
    cat train_nmag_crystal_3ORTHORHOMBIC-$nspecies.tmp >> train_nmag_crystal_3ORTHORHOMBIC-$nspecies.dat
    awk '{print $NF}' train_nmag_crystal_3ORTHORHOMBIC-$nspecies.dat | uniq -c > nsample_nmag_crystal_3ORTHORHOMBIC-$nspecies.dat

cat train_nmag_crystal_TET-$nspecies.dat >> train_nmag_crystal_4TETRAGONAL-$nspecies.tmp
cat train_nmag_crystal_BCT-$nspecies.dat >> train_nmag_crystal_4TETRAGONAL-$nspecies.tmp
    cat train_nmag_crystal_4TETRAGONAL-$nspecies.tmp >> train_nmag_crystal_4TETRAGONAL-$nspecies.dat
    awk '{print $NF}' train_nmag_crystal_4TETRAGONAL-$nspecies.dat | uniq -c > nsample_nmag_crystal_4TETRAGONAL-$nspecies.dat

cat train_nmag_crystal_HEX-$nspecies.dat >> train_nmag_crystal_5HEXAGONAL-$nspecies.tmp
cat train_nmag_crystal_RHL-$nspecies.dat >> train_nmag_crystal_5HEXAGONAL-$nspecies.tmp
    cat train_nmag_crystal_5HEXAGONAL-$nspecies.tmp >> train_nmag_crystal_5HEXAGONAL-$nspecies.dat
    awk '{print $NF}' train_nmag_crystal_5HEXAGONAL-$nspecies.dat | uniq -c > nsample_nmag_crystal_5HEXAGONAL-$nspecies.dat

cat train_nmag_crystal_CUB-$nspecies.dat >> train_nmag_crystal_6CUBIC-$nspecies.tmp
cat train_nmag_crystal_FCC-$nspecies.dat >> train_nmag_crystal_6CUBIC-$nspecies.tmp
cat train_nmag_crystal_BCC-$nspecies.dat >> train_nmag_crystal_6CUBIC-$nspecies.tmp
    cat train_nmag_crystal_6CUBIC-$nspecies.tmp >> train_nmag_crystal_6CUBIC-$nspecies.dat
    awk '{print $NF}' train_nmag_crystal_6CUBIC-$nspecies.dat | uniq -c > nsample_nmag_crystal_6CUBIC-$nspecies.dat

    done

echo -e ${CYAN}"NON.Mag BRAVAIS Binaries and Ternaries DONE!!!"${RESET}

#===================================================================================================
#9) Extracting non-centrossymetric non-magnetic systems

scp final.dat final_ncentro.tmp0
awk -v colname=inv '(NR==1){colnum=-1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;} BEGIN {OFS=" "}{gsub(0,"@",$(colnum)); print}' final_ncentro.tmp0 | grep @ > final_ncentro.tmp1
sed -i 's/@/0/g' final_ncentro.tmp1
awk NR==1 final.dat > final_ncentro.tmp2
cat final_ncentro.tmp1 >> final_ncentro.tmp2

for magnetic_features in spinF spin_atom spin_cell; do
awk NR==1 final_ncentro.tmp2 > final_ncentro.tmp1
awk -v colname=$magnetic_features '(NR==1){colnum=-1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;} BEGIN {OFS=" "}{gsub("0","@",$(colnum))}1' final_ncentro.tmp2 | grep @ >> final_ncentro.tmp1
awk -v colname=$magnetic_features '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' final_ncentro.tmp1 > final_ncentro.tmp2
done

for remove in $bad_columns; do
    awk -v colname=$remove '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' final_ncentro.tmp2 > final_ncentro.tmp1
    mv final_ncentro.tmp1 final_ncentro.tmp2
    done

mv final_ncentro.tmp2 train_all_ncentro_nmag.bravais
awk -v colname=Bravais_lattice '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_all_ncentro_nmag.bravais > train_all_ncentro_nmag.dat
awk -F ' ' '{print $NF}' train_all_ncentro_nmag.dat | uniq -c > nsample_all_ncentro_nmag.dat
echo -e ${CYAN}"NON.Magetics Centrosymetric DONE!!!"${RESET}
#---------------------------------------------------------------------------------------------------
#10) Extracting centrossymetric non-magnetic systems

scp final.dat final_centro.tmp0
awk -v colname=inv '(NR==1){colnum=-1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;} BEGIN {OFS=" "}{gsub(1,"@",$(colnum)); print}' final_centro.tmp0 | grep @ > final_centro.tmp1
sed -i 's/@/0/g' final_centro.tmp1
awk NR==1 final.dat > final_centro.tmp2
cat final_centro.tmp1 >> final_centro.tmp2

for magnetic_features in spinF spin_atom spin_cell; do
awk NR==1 final_centro.tmp2 > final_centro.tmp1
awk -v colname=$magnetic_features '(NR==1){colnum=-1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;} BEGIN {OFS=" "}{gsub("0","@",$(colnum))}1' final_centro.tmp2 | grep @ >> final_centro.tmp1
awk -v colname=$magnetic_features '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' final_centro.tmp1 > final_centro.tmp2
done

for remove in $bad_columns; do
    awk -v colname=$remove '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' final_centro.tmp2 > final_centro.tmp1
    mv final_centro.tmp1 final_centro.tmp2
    done

mv final_centro.tmp2 train_all_centro_nmag.bravais
awk -v colname=Bravais_lattice '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_all_centro_nmag.bravais > train_all_centro_nmag.dat
awk -F ' ' '{print $NF}' train_all_centro_nmag.dat | uniq -c > nsample_all_centro_nmag.dat

echo -e ${CYAN}"NON.Magetics NON.Centrosymetric DONE!!!"${RESET}

#===================================================================================================
#11) Split the materials in number of species

for nspecies in "2" "3"
do
    awk -v colname=nspecies '(NR==1){colnum=-1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;} BEGIN {OFS=" "}{gsub('$nspecies',"@",$(colnum)); print}' train_all_ncentro_nmag.dat | grep @ > train_ncentro_nmag_nsp_$nspecies.tmp0
    sed -i 's/@/'$nspecies'/g' train_ncentro_nmag_nsp_$nspecies.tmp0
    awk NR==1 train_all_ncentro_nmag.dat >> train_ncentro_nmag_nsp_$nspecies.dat
    cat train_ncentro_nmag_nsp_$nspecies.tmp0 >> train_ncentro_nmag_nsp_$nspecies.dat
    awk '{print $NF}' train_ncentro_nmag_nsp_$nspecies.dat | uniq -c > nsample_ncentro_nmag_nsp_$nspecies.dat
    done
echo -e ${CYAN}"NON.Magetics NON.Centrosymetric Binaries and Ternaries DONE!!!"${RESET}
#---------------------------------------------------------------------------------------------------
for nspecies in "2" "3"
do
    awk -v colname=nspecies '(NR==1){colnum=-1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;} BEGIN {OFS=" "}{gsub('$nspecies',"@",$(colnum)); print}' train_all_centro_nmag.dat | grep @ > train_centro_nmag_nsp_$nspecies.tmp0
    sed -i 's/@/'$nspecies'/g' train_centro_nmag_nsp_$nspecies.tmp0
    awk NR==1 train_all_centro_nmag.dat >> train_centro_nmag_nsp_$nspecies.dat
    cat train_centro_nmag_nsp_$nspecies.tmp0 >> train_centro_nmag_nsp_$nspecies.dat
    awk '{print $NF}' train_centro_nmag_nsp_$nspecies.dat | uniq -c > nsample_centro_nmag_nsp_$nspecies.dat
    done

echo -e ${CYAN}"NON.Magetics Centrosymetric Binaries and Ternaries DONE!!!"${RESET}

#===================================================================================================
#12) Split the materials in each Bravais Lattice (non-centrossymetric/non-magnetic)

for bravais in "TRI" "MCL" "MCLC" "ORC" "ORCC" "ORCF" "ORCI" "TET" "BCT" "HEX" "RHL" "CUB" "FCC" "BCC"; do
    grep $bravais train_all_ncentro_nmag.bravais > train_ncentro_nmag_crystal.tmp
    awk NR==1 train_all_ncentro_nmag.bravais > train_ncentro_nmag_crystal_$bravais.bravais
    cat train_ncentro_nmag_crystal.tmp >> train_ncentro_nmag_crystal_$bravais.bravais

    awk -v colname=Bravais_lattice '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_ncentro_nmag_crystal_$bravais.bravais > train_ncentro_nmag_crystal_$bravais.dat
    awk '{print $NF}' train_ncentro_nmag_crystal_$bravais.dat | uniq -c > nsample_ncentro_nmag_crystal_$bravais.dat

    sed 's/CLASS/'$bravais'/g' nsample_ncentro_nmag_crystal_$bravais.dat >> nsample_train_ncentro_nmag_crystal_ALL.dat
    sed '1d' train_ncentro_nmag_crystal_$bravais.dat >> train_ncentro_nmag_crystal_$bravais.out
    cat train_ncentro_nmag_crystal_$bravais.out >> train_ncentro_nmag_crystal_ALL.out
    done

awk NR==1 train_all_ncentro_nmag.bravais > train_ncentro_nmag_crystal_ALL.bravais
    cat train_ncentro_nmag_crystal_ALL.out >> train_ncentro_nmag_crystal_ALL.bravais
    awk -v colname=Bravais_lattice '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_ncentro_nmag_crystal_ALL.bravais > train_ncentro_nmag_crystal_ALL.dat
    awk '{print $NF}' train_ncentro_nmag_crystal_ALL.dat | uniq -c > nsample_ncentro_nmag_crystal_ALL2.dat

cat train_ncentro_nmag_crystal_TRI.out >> train_ncentro_nmag_crystal_1TRICLINIC.tmp
    cat train_ncentro_nmag_crystal_1TRICLINIC.tmp >> train_ncentro_nmag_crystal_1TRICLINIC.dat
    awk '{print $NF}' train_ncentro_nmag_crystal_1TRICLINIC.dat | uniq -c > nsample_ncentro_nmag_crystal_1TRICLINIC.dat

cat train_ncentro_nmag_crystal_MCL.out >> train_ncentro_nmag_crystal_2MONOCLINIC.tmp
cat train_ncentro_nmag_crystal_MCLC.out >> train_ncentro_nmag_crystal_2MONOCLINIC.tmp
    cat train_ncentro_nmag_crystal_2MONOCLINIC.tmp >> train_ncentro_nmag_crystal_2MONOCLINIC.dat
    awk '{print $NF}' train_ncentro_nmag_crystal_2MONOCLINIC.dat | uniq -c > nsample_ncentro_nmag_crystal_2MONOCLINIC.dat

cat train_ncentro_nmag_crystal_ORC.out >> train_ncentro_nmag_crystal_3ORTHORHOMBIC.tmp
cat train_ncentro_nmag_crystal_ORCC.out >> train_ncentro_nmag_crystal_3ORTHORHOMBIC.tmp
cat train_ncentro_nmag_crystal_ORCF.out >> train_ncentro_nmag_crystal_3ORTHORHOMBIC.tmp
cat train_ncentro_nmag_crystal_ORCI.out >> train_ncentro_nmag_crystal_3ORTHORHOMBIC.tmp
    cat train_ncentro_nmag_crystal_3ORTHORHOMBIC.tmp >> train_ncentro_nmag_crystal_3ORTHORHOMBIC.dat
    awk '{print $NF}' train_ncentro_nmag_crystal_3ORTHORHOMBIC.dat | uniq -c > nsample_ncentro_nmag_crystal_3ORTHORHOMBIC.dat

cat train_ncentro_nmag_crystal_TET.out >> train_ncentro_nmag_crystal_4TETRAGONAL.tmp
cat train_ncentro_nmag_crystal_BCT.out >> train_ncentro_nmag_crystal_4TETRAGONAL.tmp
    cat train_ncentro_nmag_crystal_4TETRAGONAL.tmp >> train_ncentro_nmag_crystal_4TETRAGONAL.dat
    awk '{print $NF}' train_ncentro_nmag_crystal_4TETRAGONAL.dat | uniq -c > nsample_ncentro_nmag_crystal_4TETRAGONAL.dat

cat train_ncentro_nmag_crystal_HEX.out >> train_ncentro_nmag_crystal_5HEXAGONAL.tmp
cat train_ncentro_nmag_crystal_RHL.out >> train_ncentro_nmag_crystal_TRIGONAL.tmp
    cat train_ncentro_nmag_crystal_5HEXAGONAL.tmp >> train_ncentro_nmag_crystal_5HEXAGONAL.dat
    awk '{print $NF}' train_ncentro_nmag_crystal_5HEXAGONAL.dat | uniq -c > nsample_ncentro_nmag_crystal_5HEXAGONAL.dat

cat train_ncentro_nmag_crystal_CUB.out >> train_ncentro_nmag_crystal_6CUBIC.tmp
cat train_ncentro_nmag_crystal_FCC.out >> train_ncentro_nmag_crystal_6CUBIC.tmp
cat train_ncentro_nmag_crystal_BCC.out >> train_ncentro_nmag_crystal_6CUBIC.tmp
    cat train_ncentro_nmag_crystal_6CUBIC.tmp >> train_ncentro_nmag_crystal_6CUBIC.dat
    awk '{print $NF}' train_ncentro_nmag_crystal_6CUBIC.dat | uniq -c > nsample_ncentro_nmag_crystal_6CUBIC.dat

echo -e ${CYAN}"NON.Magetics NON.Centrosymetric BRAVAIS DONE!!!"${RESET}

#===================================================================================================
#13) Split the materials in each Bravais Lattice (centrossymetric/non-magnetic)

for bravais in "TRI" "MCL" "MCLC" "ORC" "ORCC" "ORCF" "ORCI" "TET" "BCT" "HEX" "RHL" "CUB" "FCC" "BCC"; do
    grep $bravais train_all_centro_nmag.bravais > train_centro_nmag_crystal.tmp
    awk NR==1 train_all_centro_nmag.bravais > train_centro_nmag_crystal_$bravais.bravais
    cat train_centro_nmag_crystal.tmp >> train_centro_nmag_crystal_$bravais.bravais

    awk -v colname=Bravais_lattice '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_centro_nmag_crystal_$bravais.bravais > train_centro_nmag_crystal_$bravais.dat
    awk '{print $NF}' train_centro_nmag_crystal_$bravais.dat | uniq -c > nsample_centro_nmag_crystal_$bravais.dat

    sed 's/CLASS/'$bravais'/g' nsample_centro_nmag_crystal_$bravais.dat >> nsample_train_centro_nmag_crystal_ALL.dat
    sed '1d' train_centro_nmag_crystal_$bravais.dat >> train_centro_nmag_crystal_$bravais.out
    cat train_centro_nmag_crystal_$bravais.out >> train_centro_nmag_crystal_ALL.out
    done

awk NR==1 train_all_centro_nmag.bravais > train_centro_nmag_crystal_ALL.bravais
    cat train_centro_nmag_crystal_ALL.out >> train_centro_nmag_crystal_ALL.bravais
    awk -v colname=Bravais_lattice '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train_centro_nmag_crystal_ALL.bravais > train_centro_nmag_crystal_ALL.dat
    awk '{print $NF}' train_centro_nmag_crystal_ALL.dat | uniq -c > nsample_centro_nmag_crystal_ALL2.dat

cat train_centro_nmag_crystal_TRI.out >> train_centro_nmag_crystal_1TRICLINIC.tmp
    cat train_centro_nmag_crystal_1TRICLINIC.tmp >> train_centro_nmag_crystal_1TRICLINIC.dat
    awk '{print $NF}' train_centro_nmag_crystal_1TRICLINIC.dat | uniq -c > nsample_centro_nmag_crystal_1TRICLINIC.dat

cat train_centro_nmag_crystal_MCL.out >> train_centro_nmag_crystal_2MONOCLINIC.tmp
cat train_centro_nmag_crystal_MCLC.out >> train_centro_nmag_crystal_2MONOCLINIC.tmp
    cat train_centro_nmag_crystal_2MONOCLINIC.tmp >> train_centro_nmag_crystal_2MONOCLINIC.dat
    awk '{print $NF}' train_centro_nmag_crystal_2MONOCLINIC.dat | uniq -c > nsample_centro_nmag_crystal_2MONOCLINIC.dat

cat train_centro_nmag_crystal_ORC.out >> train_centro_nmag_crystal_3ORTHORHOMBIC.tmp
cat train_centro_nmag_crystal_ORCC.out >> train_centro_nmag_crystal_3ORTHORHOMBIC.tmp
cat train_centro_nmag_crystal_ORCF.out >> train_centro_nmag_crystal_3ORTHORHOMBIC.tmp
cat train_centro_nmag_crystal_ORCI.out >> train_centro_nmag_crystal_3ORTHORHOMBIC.tmp
    cat train_centro_nmag_crystal_3ORTHORHOMBIC.tmp >> train_centro_nmag_crystal_3ORTHORHOMBIC.dat
    awk '{print $NF}' train_centro_nmag_crystal_3ORTHORHOMBIC.dat | uniq -c > nsample_centro_nmag_crystal_3ORTHORHOMBIC.dat

cat train_centro_nmag_crystal_TET.out >> train_centro_nmag_crystal_4TETRAGONAL.tmp
cat train_centro_nmag_crystal_BCT.out >> train_centro_nmag_crystal_4TETRAGONAL.tmp
    cat train_centro_nmag_crystal_4TETRAGONAL.tmp >> train_centro_nmag_crystal_4TETRAGONAL.dat
    awk '{print $NF}' train_centro_nmag_crystal_4TETRAGONAL.dat | uniq -c > nsample_centro_nmag_crystal_4TETRAGONAL.dat

cat train_centro_nmag_crystal_HEX.out >> train_centro_nmag_crystal_5HEXAGONAL.tmp
cat train_centro_nmag_crystal_RHL.out >> train_centro_nmag_crystal_TRIGONAL.tmp
    cat train_centro_nmag_crystal_5HEXAGONAL.tmp >> train_centro_nmag_crystal_5HEXAGONAL.dat
    awk '{print $NF}' train_centro_nmag_crystal_5HEXAGONAL.dat | uniq -c > nsample_centro_nmag_crystal_5HEXAGONAL.dat

cat train_centro_nmag_crystal_CUB.out >> train_centro_nmag_crystal_6CUBIC.tmp
cat train_centro_nmag_crystal_FCC.out >> train_centro_nmag_crystal_6CUBIC.tmp
cat train_centro_nmag_crystal_BCC.out >> train_centro_nmag_crystal_6CUBIC.tmp
    cat train_centro_nmag_crystal_6CUBIC.tmp >> train_centro_nmag_crystal_6CUBIC.dat
    awk '{print $NF}' train_centro_nmag_crystal_6CUBIC.dat | uniq -c > nsample_centro_nmag_crystal_6CUBIC.dat

echo -e ${CYAN}"NON.Magetics Centrosymetric BRAVAIS DONE!!!"${RESET}

#===================================================================================================

#===================================================================================================
# print specifics trains
#===================================================================================================
#while true; do
#echo -e ${L_RED}"What can I do for you, master?"${NC}
#echo "1.  give me all materials"
#echo -n "Enter your choice, or 0 for exit: "
#read choice
#case $choice in
#     0)
#     echo "OK, see you!"
#     break
#     ;;
#===================================================================================================
#     *)
#     echo "That is not a valid choice. Send me a email to felipe.gollino@gmail.com"
#     ;;
#esac  
#done
#===================================================================================================

cat > SISSO.in << EOF
!>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
! basic parameters
!>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
task=FCDI                                                                                          ! FCDI: iterative FC and DI; FC: one-off FC; DI: one-off DI
restart=.false.                                                                                    ! for FCDI and when the file CONTINUE is present
desc_dim=2                                                                                         ! dimension of the descriptor (<=2 for quali)
ptype=quali                                                                                        ! property type: quanti(quantitative property),quali(qualitative property)
nprop=1                                                                                            ! number of properties (multi-task learning if nprop >1)
nsample=(nsample.dat)                                                                              ! number of samples for each property (seperate them by comma for nprop>1)
width=0.01                                                                                         ! boundary tolerance (width) for classification (count in outside points very close to the domain)

!>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
! parameters for feature construction
! implemented operators:(+)(-)(*)(/)(exp)(exp-)(^-1)(^2)(^3)(sqrt)(cbrt)(log)(|-|)(scd)(^6)(sin)(cos)
! scd: standard Cauchy distribution
!>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
nsf=(ncolumn - 2)                                                                                  ! number of scalar features (one number for one material
rung=2                                                                                             ! rung (0,1,2,3) of the feature space to be constructed
maxcomplexity=10                                                                                   ! max feature complexity (number of operators in a feature)
opset='(+)(-)(*)(/)(exp)(exp-)(^-1)(^2)(^3)(sqrt)(cbrt)(log)(|-|)(^6)'                             ! ONE operator set for feature trans
ndimtype=14                                                                                        ! number of dimension type (or unit) of the primary features
maxfval_lb=1e-3                                                                                    ! features having the max. abs. data value <maxfval_lb will not be selected
maxfval_ub=1e5                                                                                     ! features having the max. abs. data value >maxfval_ub will not be selected
subs_sis=5000                                                                                      ! SIS-selected (single) subspace size
dimclass=(1:5)(6:13)(14:21)(22:93)(94:101)(102:109)(110:149)(150:261)(262:263)(264:264)(265:266)(267:269)(270:272)(273:288)
												   ! group features according to their dimension/unit; those not in any (): dimensionless

!>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
! parameters for descriptor identification
!>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
method=L0                                                                                          ! sparsification operator: L1L0 or L0
fs_size_DI=                                                                                        ! to be set by SISSO automatically if task=FCDI: feature-space size
fs_size_L0=                                                                                        ! to be set by SISSO automatically if (task=FCDI and method =L0): size for L0
metric=LS_RMSE                                                                                     ! for ptype=quanti; metric for model selection: LS_RMSE,LS_MaxAE
nm_output=1000                                                                                     ! number of the best models to output

EOF

#===================================================================================================

echo '#!/bin/bash -xv

#########################################################################
# Job submission requested parameters, see 'man sbatch'.                #
#########################################################################

#SBATCH --job-name "(=＾● ⋏ ●＾=)"
#SBATCH --nodes 1
##SBATCH --ntasks 64
##SBATCH --cpus-per-task 1
#SBATCH --ntasks-per-node 32
##SBATCH --mem 5000               ## MB
##SBATCH --mem-per-cpu 4096       ## MB
##SBATCH --time 96:00:00          ## min, min:sec, h:min:sec, d-h:min:sec
#SBATCH --partition medium        ## short, medium, long, verylong, nanopetro
#SBATCH --mail-type END           ## BEGIN, END and FAIL
#SBATCH --mail-user felipe.gollino@gmail.com
#SBATCH --output slurm.log
#SBATCH --error slurm.err
##SBATCH --nodelist=n[13-14]
##SBATCH --exclude=n[16,11]
##SBATCH --contiguous
##SBATCH --exclusive
##SBATCH --dependency=afterany:job_id[:jobid...]

export QE=pw.x

#########################################################################
# Setup and copy files to computing node, '/home/scratch'.              #
#########################################################################

# Remove annoying or confusing files.
##rm ${SLURM_SUBMIT_DIR}/INPUT_TMP.*

SCRATCH="/home/scratch/${USER}/codigo_${SLURM_JOB_ID}"
RESULT_DIR=${SLURM_SUBMIT_DIR}/results_${SLURM_JOB_ID}

# Generate information files in original folder.
echo `scontrol show hostnames ${SLURM_NODELIST}` > \
    NODELIST_${SLURM_JOB_ID}
echo ${SCRATCH} > SCRATCH_${SLURM_JOB_ID}

# Make scratch.
mkdir -p ${SCRATCH}
echo ${SLURM_SUBMIT_DIR} > ${SCRATCH}/orig.workdir

# Copy data to scratch.
rsync -av --exclude 'results_*' --exclude 'slurm-*' \
    ${SLURM_SUBMIT_DIR}/* ${SCRATCH}

# Switch to working directory.
cd ${SCRATCH}

#########################################################################
# Setup environment.                                                    #
#########################################################################

ulimit -s unlimited
ulimit -l unlimited

export OMP_NUM_THREADS=1

# Setup code  environment.
module load intel/compilers
module load intel/mpi
##module purge
module load quantum-espresso
module load qe-environ
module load vasp/5.3

#########################################################################
# Run the job.                                                          #
#########################################################################

echo "------------------------------------------------------------------"
echo "Beginning of the job:" `date`
echo "Hostname: " `hostname`
echo "PWD: " ${PWD}

# Run.
## QUANTUM ESPRESSO
#mpirun -n ${SLURM_NTASKS} ${QE} < input.in > output.out
#mpirun -n ${SLURM_NTASKS} ${QE} < bands.in > bands.out
#go srun -n ${SLURM_NTASKS} ${QE} < input.in > output.out

## VASP
#srun -n $SLURM_NTASKS vasp-spinorbit > ${SLURM_SUBMIT_DIR}/output.out

## SISSO
mpirun -n $SLURM_NTASKS /home/cmera/bin/FCDI > ${SLURM_SUBMIT_DIR}/z.out

echo "End of the job:" `date`
echo "------------------------------------------------------------------"

# Cleanup, sleep, then copy back to original folder.
mkdir -p ${RESULT_DIR}
rsync -av ./* ${RESULT_DIR}
cd ${SLURM_SUBMIT_DIR}
rm -rf ${SCRATCH}

# Remove files with no more use.
rm ${SLURM_SUBMIT_DIR}/SCRATCH_${SLURM_JOB_ID}
rm ${SLURM_SUBMIT_DIR}/NODELIST_${SLURM_JOB_ID}
rm ${RESULT_DIR}/orig.workdir

rm -r  ${SLURM_SUBMIT_DIR}/results_*

#PWD=${PWD}
#mail -s ''${SLURM_JOB_ID}':'$PWD'' < /dev/null "felipe.gollino@gmail.com"

############################## END OF JOB ###############################' > job

#===================================================================================================

#cat > check_vector_size.sh  << EOF
#Check the each vector size in train
#ncol_max=$(awk '{print NF}' train* | sort -nu | head -n 1)
#ncol_min=$(awk '{print NF}' train* | sort -nu | tail -n 1)
#if test "$ncol_max"="$ncol_min"; then
#    echo "OK"
#else
#    echo "ERROR" > ERROR
#fi
#EOF

#PWD=${PWD}
carpeta=$(ls train_*.dat | sed 's/train_//g' | cut -d"." -f1)
mkdir ${PWD}/TRAIN/
for distribution in $carpeta; do
mkdir ${PWD}/TRAIN/$distribution/
scp train_$distribution.dat nsample_$distribution.dat SISSO.in job ${PWD}/TRAIN/$distribution/
done

mkdir ${PWD}/TRAIN/XXX/
scp train_*.dat ${PWD}/TRAIN/XXX/
scp * XXX/
mv TRASH* PDF_results XXX/
rm  *features.dat  PDF*  poscar2pdf*  *.tmp*  *.out  input*  output*  list.dat  train*  nsample*  SISSO*  atom*  non*  *.sh  atomic*  column*  final*  job  all* XXX/*.tmp*
scp XXX/personal* XXX/*.csv .
sed -i 's/ /\t/g' final.dat

#find . -name "ERROR" > where_ERROR.dat

tar -czvf XXX.tar.gz XXX/
mail -s ''$PWD'' < /dev/null "felipe.gollino@gmail.com"

#===================================================================================================
# awk '{print NF}' train.dat                                                                                                                          # Print the number of columns

# awk '{print $NF}' train.dat | uniq -c > nsample.dat                                                                                                 # Count the number of samples in each class

# sed -i '/XXX/d' train.dat                                                                                                                           # Exclude lines with characters XXX

# sort -r -k"NF" train.dat                                                                                                                            # Re-sort in (-r for reverse) order for column k

# wc -l train.dat                                                                                                                                     # Count number of lines

# shuf -n 1 $FILE                                                                                                                                     # Get "n" random lines in a $FILE

# for x in $(seq $(awk '{print NF}' train.dat | uniq)); do y=$(echo ''$x - 1'' | bc); z=$(awk 'NR==1' train.dat | cut -d' ' -f$x); echo ''$y' '$z''; done > dimclass
                                                                                                                                                      # Create dimclass file, show position and the name of each feature

# awk '!NF{$0=")("}1' dimclass | sed 's/[a-zA-Z_.^{}]//g' | tr -d '\n' > dimclass_x                                                                   # Use after put "( blank line", replace the spaces for ")(" exclude all character except the numbers to create the flag for SISSO.in

# grep -o '#class#' train* | wc -l                                                                                                                   # print how may times the word '#class#' appears in train

# sort yourfile.txt | uniq -d                                                                                                                        # show repeated lines
# sort yourfile.txt | uniq -u                                                                                                                        # show uniques lines

# for dup in $(sort -k1,1 -u file.txt | cut -d' ' -f1); do grep -n -- "$dup" file.txt; done                                                          # show unique lines relative to a column

# bad_columns=$(echo ...)
# for remove in $bad_columns; do awk -v colname=$remove '(NR==1){colnum=1;for(i=1;i<=NF;i++)if($(i)==colname)colnum=i;}{$(colnum)=""; print}' train.dat > train.tmp; mv train.tmp train.dat; done
                                                                                                                                                     # remove columns
# tar -xzvf archive.tar.gz
#===================================================================================================

# POS-PROCESSING...
#===================================================================================================
# Analysis of the features in Best models
rm b_models.dat
rows=$(wc models/top1000_002d | cut -d' ' -f2)
for line in $(seq $rows); do
ranking=$(awk NR==$line models/top1000_002d | awk '{print $1}')
data_overlap=$(awk NR==$line models/top1000_002d | awk '{print $2}')
size_overlap=$(awk NR==$line models/top1000_002d | awk '{print $3}')
featureID_x=$(awk NR==$line models/top1000_002d | awk '{print $5}')
featureID_y=$(awk NR==$line models/top1000_002d | awk '{print $6}' | sed 's/)//g')
descriptor_x=$(awk NR==$featureID_x feature_space/Uspace.name | awk '{print $1}')
descriptor_y=$(awk NR==$featureID_y feature_space/Uspace.name | awk '{print $1}')
echo $ranking $data_overlap $size_overlap $descriptor_x $descriptor_y
echo $ranking $data_overlap $size_overlap $descriptor_x $descriptor_y >> b_models.dat; done
echo >> b_models.dat
for prime_feature in $(awk NR==1 train.dat) A_{mean} W_{mean} {max} {min} A_{stdev} W_{stdev} A_{redvalue} W_{redvalue}; do
count=$(grep -o $prime_feature b_models.dat | wc -l); echo -e $prime_feature $count >> b_models_COUNT.dat; done
sort -nk2 b_models_COUNT.dat >> b_models_COUNT_sort.dat | echo >> b_models_COUNT.dat
cat b_models_COUNT.dat b_models_COUNT_sort.dat >> b_models.dat | rm b_models_COUNT*
#===================================================================================================
