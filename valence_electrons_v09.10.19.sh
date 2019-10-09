### material nsp SG class
### Ta_1_s_1 (1-230) 2 'class'
rm prediction* atom* new* FORMULA.OUT formula.out
input=0.dat
nmaterials=$(wc -l $input | cut -d' ' -f1)
#nmaterials=$(echo $nmaterials+1 | bc)
#======= Colors ========
D_RED='\e[31m'
L_RED='\e[91m'
NO_COLOR='\e[0m'

sed -i '/H_/d'  $input # 01
sed -i '/Ne_/d' $input # 10
sed -i '/Ar_/d' $input # 18
sed -i '/Kr_/d' $input # 36
sed -i '/Xe_/d' $input # 54
sed -i '/La_/d' $input # 57
sed -i '/Ce_/d' $input # 58
sed -i '/Pr_/d' $input # 59
sed -i '/Nd_/d' $input # 60
sed -i '/Pm_/d' $input # 61
sed -i '/Sm_/d' $input # 62
sed -i '/Eu_/d' $input # 63
sed -i '/Gd_/d' $input # 64
sed -i '/Tb_/d' $input # 65
sed -i '/Dy_/d' $input # 66
sed -i '/Ho_/d' $input # 67
sed -i '/Er_/d' $input # 68
sed -i '/Tm_/d' $input # 69
sed -i '/Yb_/d' $input # 70
sed -i '/Lu_/d' $input # 71
sed -i '/Po_/d' $input # 84
sed -i '/At_/d' $input # 85
sed -i '/Rn_/d' $input # 86
sed -i '/Fr_/d' $input # 87
sed -i '/Ra_/d' $input # 88
sed -i '/Ac_/d' $input # 89
sed -i '/Th_/d' $input # 90
sed -i '/Pa_/d' $input # 91
sed -i '/U_/d'  $input # 92

#        	Z       Column Period	CAS     VE	        S	P	D	F
H=$(echo	1	1      1	I 	1	) #     1	0	0	0
He=$(echo	2	18     1	VIII	2	) #     2	0	0	0
Li=$(echo	3	1      2	I	1	) #     1	0	0	0
Be=$(echo	4	2      2	II	2	) #     2	0	0	0
B=$(echo	5	13     2	III	3	) #     2	1	0	0
C=$(echo	6	14     2	IV	4	) #     2	2	0	0
N=$(echo	7	15     2	V	5	) #     2	3	0	0
O=$(echo	8	16     2	VI	6	) #     2	4	0	0
F=$(echo	9	17     2	VII	7	) #     2	5	0	0
Ne=$(echo	10	18     2	VIII	8	) #     2	6	0	0
Na=$(echo	11	1      3	I	1	) #     1	0	0	0
Mg=$(echo	12	2      3	II	2	) #     2	0	0	0
Al=$(echo	13	13     3	III	3	) #     2	1	0	0
Si=$(echo	14	14     3	IV	4	) #     2	2	0	0
P=$(echo	15	15     3	V	5	) #     2	3	0	0
S=$(echo	16	16     3	VI	6	) #     2	4	0	0
Cl=$(echo	17	17     3	VII	7	) #     2	5	0	0
Ar=$(echo	18	18     3	VIII	8	) #     2	6	0	0
K=$(echo	19	1      4	I	1	) #     1	0	0	0
Ca=$(echo	20	2      4	II	2	) #     2	0	0	0
Sc=$(echo	21	3      4	III	3	) #     2	0	1	0
Ti=$(echo	22	4      4	IV	4	) #     2	0	2	0
V=$(echo	23	5      4	V	5	) #     2	0	3	0
Cr=$(echo	24	6      4	VI	6	) #     1	0	5	0
Mn=$(echo	25	7      4	VII	7	) #     2	0	5	0
Fe=$(echo	26	8      4	VIII	8	) #     2	0	6	0
Co=$(echo	27	9      4	VIII	9	) #     2	0	7	0
Ni=$(echo	28	10     4	VIII	10	) #     1	0	9	0
Cu=$(echo	29	11     4	I	11	) #     1	0	10	0
Zn=$(echo	30	12     4	II	12	) #     2	0	10	0
Ga=$(echo	31	13     4	III	13	) #     2	1	10	0
Ge=$(echo	32	14     4	IV	14	) #     2	2	10	0
As=$(echo	33	15     4	V	15	) #     2	3	10	0
Se=$(echo	34	16     4	VI	16	) #     2	4	10	0
Br=$(echo	35	17     4	VII	17	) #     2	5	10	0
Kr=$(echo	36	18     4	VIII	18	) #     2	6	10	0
Rb=$(echo	37	1      5	I	1	) #     1	0	0	0
Sr=$(echo	38	2      5	II	2	) #     2	0	0	0
Y=$(echo	39	3      5	III	3	) #     2	0	1	0
Zr=$(echo	40	4      5	IV	4	) #     2	0	2	0
Nb=$(echo	41	5      5	V	5	) #     1	0	4	0
Mo=$(echo	42	6      5	VI	6	) #     1	0	5	0
Tc=$(echo	43	7      5	VII	7	) #     2	0	5	0
Ru=$(echo	44	8      5	VIII	8	) #     1	0	7	0
Rh=$(echo	45	9      5	VIII	9	) #     1	0	8	0
Pd=$(echo	46	10     5	VIII	10	) #     0	0	10	0
Ag=$(echo	47	11     5	I	11	) #     1	0	10	0
Cd=$(echo	48	12     5	II	12	) #     2	0	10	0
In=$(echo	49	13     5	III	13	) #     2	1	10	0
Sn=$(echo	50	14     5	IV	14	) #     2	2	10	0
Sb=$(echo	51	15     5	V	15	) #     2	3	10	0
Te=$(echo	52	16     5	VI	16	) #     2	4	10	0
I=$(echo	53	17     5	VII	17	) #     2	5	10	0
Xe=$(echo	54	18     5	VIII	18	) #     2	6	10	0
Cs=$(echo	55	1      6	I	1	) #     1	0	0	0
Ba=$(echo	56	2      6	II	2	) #     2	0	0	0
La=$(echo	57	3      6	III	3	) #     2	0	1	0
Ce=$(echo	58	3      6	III    	3	) #     2	0	1	1
Pr=$(echo	59	3      6	III	2	) #     2	0	0	3
Nd=$(echo	60	3      6	III	2	) #     2	0	0	4
Pm=$(echo	61	3      6	III	2	) #     2	0	0	5
Sm=$(echo	62	3      6	III	2	) #     2	0	0	6
Eu=$(echo	63	3      6	III	2	) #     2	0	0	7
Gd=$(echo	64	3      6	III	3	) #     2	0	1	7
Tb=$(echo	65	3      6	III	2	) #     2	0	0	9
Dy=$(echo	66	3      6	III	2	) #     2	0	0	10
Ho=$(echo	67	3      6	III	2	) #     2	0	0	11
Er=$(echo	68	3      6	III	2	) #     2	0	0	12
Tm=$(echo	69	3      6	III	2	) #     2	0	0	13
Yb=$(echo	70	3      6	III	2	) #     2	0	0	14
Lu=$(echo	71	3      6	III	3	) #     2	0	1	14
Hf=$(echo	72	4      6	IV	4	) #     2	0	2	14
Ta=$(echo	73	5      6	V	5	) #     2	0	3	14
W=$(echo	74	6      6	VI	6	) #     2	0	4	14
Re=$(echo	75	7      6	VII	7	) #     2	0	5	14
Os=$(echo	76	8      6	VIII	8	) #     2	0	6	14
Ir=$(echo	77	9      6	VIII	9	) #     2	0	7	14
Pt=$(echo	78	10     6	VIII	10	) #     1	0	9	14
Au=$(echo	79	11     6	I	11	) #     1	0	10	14
Hg=$(echo	80	12     6	II	12	) #     2	0	10	14
Tl=$(echo	81	13     6	III	13	) #     2	1	10	14
Pb=$(echo	82	14     6	IV	14	) #     2	2	10	14
Bi=$(echo	83	15     6	V	15	) #     2	3	10	14
Po=$(echo	84	16     6	VI	16	) #     2	4	10	14
At=$(echo	85	17     6	VII	17	) #     2	5	10	14
Rn=$(echo	86	18     6	VIII	18	) #     2	6	10	14
Fr=$(echo	87	1      7	I	2	) #     2	0	0	0
Ra=$(echo	88	2      7	II	2	) #     2	0	0	0
Ac=$(echo	89	3      7	III	3	) #     2	0	1	0
Th=$(echo	90	3      7	III	4	) #     2	0	2	0
Pa=$(echo	91	3      7	III	3	) #     2	0	1	2
U=$(echo	92	3      7	III	3	) #     2	0	1	3
Np=$(echo	93	3      7	III	3	) #     2	0	1	4
Pu=$(echo	94	3      7	III	2	) #     2	0	0	6
Am=$(echo	95	3      7	III	2	) #     2	0	0	7
Cm=$(echo	96	3      7	III	3	) #     2	0	1	7
Bk=$(echo	97	3      7	III	2	) #     2	0	0	9
Cf=$(echo	98	3      7	III	2	) #     2	0	0	10
Es=$(echo	99	3      7	III	2	) #     2	0	0	11
Fm=$(echo	100	3      7	III	2	) #     2	0	0	12
Md=$(echo	101	3      7	III	2	) #     2	0	0	13
No=$(echo	102	3      7	III	2	) #     2	0	0	14
Lr=$(echo	103	3      7	III	3	) #     2	1	0	14
Rf=$(echo	104	4      7	IV	4	) #     2	0	2	14
Db=$(echo	105	5      7	V	5	) #     2	0	3	14
Sg=$(echo	106	6      7	VI	6	) #     2	0	4	14
Bh=$(echo	107	7      7	VII	7	) #     2	0	5	14
Hs=$(echo	108	8      7	VIII	8	) #     2	0	6	14          
Mt=$(echo	109	9      7	VIII	        )       
Ds=$(echo	110	10     7	VIII	        )         
Rg=$(echo	111	11     7	I	        )         
Cn=$(echo	112	12     7	II	        )         
Nh=$(echo	113	13     7	III	        )
Fl=$(echo	114	14     7	IV	        ) 
Mc=$(echo	115	15     7	V	        ) 
Lv=$(echo	116	16     7	VI	        )
Ts=$(echo	117	17     7	VII	        ) 
Og=$(echo	118	18     7	VIII	        ) 

for ((j= 1; j<= $nmaterials ; j++)); do                                                            # loop I (begin)

list=$(awk 'NR=='$j'' $input)
arr=($list)
material=$(echo ${arr[0]})
spacegroup=$(echo ${arr[1]})
nspecies=$(echo ${arr[2]})
class=$(echo ${arr[3]})

echo -e ${L_RED}''----------------------------------  $j/$nmaterials $material  ----------------------------------''${NO_COLOR}

for ((i=1; i<= $nspecies ; i++)); do                                                               # loop II (begin)
    odd=`echo "$i 2 1" | awk '{printf("%.0f",(($1*$2)-$3))}'`
    even=`echo "$i 2 0" | awk '{printf("%.0f",(($1*$2)-$3))}'`
    
    if echo $material | grep '_'; then atom=$(echo $material | cut -d'_' -f $odd); fi
    if echo $material | grep '_'; then natoms=$(echo $material | cut -d'_' -f $even); fi

    atoms=(${!atom})
    echo ''$atom''
    echo '('$atom' '${atoms[@]}')'$natoms >> atom_$j-$atom
    echo '('$atom' '${atoms[@]}') '$natoms >> new_atom_$j-$atom

    cat atom_$j-$atom >> atom_$j
    cat new_atom_$j-$atom >> new_atom_$j

    sort atom_$j -k3n | xargs
    classification=$(sort atom_$j -k3n | xargs)
    formula=$(sort new_atom_$j -k3n | awk '{print $1 $NF}' | sed 's/(//g' | sed 's/)//g' | sed 's/ //g')
    new_formula=$(echo $formula | sed 's/ //g')
    sort atom_$j -k3n | xargs > skeleton.tmp
    skeleton=$(awk '{print $5$6" "$11$12" "$17$18" "$23$24" "$29$30}' skeleton.tmp  | sed 's/[0-9])/_/g' | sed 's/I[0-9]/I/g' | sed 's/ I/-I/g' | sed 's/ V/-V/g')
    min=$(awk '{print $4" "$10" "$16" "$22" "$28}' skeleton.tmp | tr ' ' '\n' | awk 'NF' | sort | head -1)
    max=$(awk '{print $4" "$10" "$16" "$22" "$28}' skeleton.tmp | tr ' ' '\n' | awk 'NF' | sort | tail -1)
    split_period=$(echo $max-$min | bc)
    nelectrons=$(awk '{print $6"@ "$12"@ "$18"@ "$24"@ "$30"@"}'  skeleton.tmp | sed 's/)/*/g' | sed 's/ /+/g' | sed 's/++@//g' | sed 's/+@//g' | sed 's/@//g' | bc)

    echo $skeleton
    done                                                                                           # loop II (end)

#class=$(awk NR==$j $input | awk '{print $NF}')
echo $material $classification $new_formula $skeleton $spacegroup $nelectrons $split_period >> formula.out
rm atom* new_atom* skeleton*

done                                                                                               # loop I  (end)

echo "material" "prototype" "formula" "SG" "nelectrons" "split" > FORMULA.OUT
awk '{print $1" "$(NF-4)" "$(NF-3)" "$(NF-2)" "$(NF-1)" "$(NF)}' formula.out >> FORMULA.OUT
sed -i 's/ /\t/g' FORMULA.OUT