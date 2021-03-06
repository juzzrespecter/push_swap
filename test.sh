#!/bin/bash

# ------------------
RED="\x1b[31m"
GREEN="\x1b[32m"
YELLOW="\x1b[1;33m"
ORANGE="\x1b[1;31m"
END="\x1b[0m"
# ------------------

# ------------------
STEPS="5"
m_steps=(10 20 50 100)
b_steps=(200 300 400 500)
bb_steps=(700 900 1000 1500)
# ------------------

# ------------------
CHECKER="./checker"
# ------------------

make

# ======= small  tests ========

echo "--------- input 1 ----------"
x=1
while [ $x -le $STEPS ]
do
	ARGS="$(ruby -e "puts (0..0).to_a.shuffle.join(' ')")"
	RES_N="$(./push_swap $(echo $ARGS) | wc | awk '{print $1}')"
	echo -e -n "Number of instr: $RES_N "
	if [ "$RES_OK" = "OK" ]; then
		echo -e -n "${GREEN}[$RES_OK]"
	else
		echo -e -n "${GREEN} [OK]${END}"
	fi
	if [ "$RES_N" -ne 0 ]; then
		echo -e "${RED} [KO]${END}"
	else
		echo -e "${GREEN} [OK]${END}"
	fi
	x=$(( $x + 1 ))
done
echo "----------------------------"

echo "--------- input 3 ----------"
x=1
while [ $x -le $STEPS ]
do
	ARGS="$(ruby -e "puts (0..2).to_a.shuffle.join(' ')")"
	RES_N="$(./push_swap $(echo $ARGS) | wc | awk '{print $1}')"
	RES_OK=$(./push_swap $(echo $ARGS) | $CHECKER $(echo $ARGS))
	echo -e -n "Number of instr: $RES_N "
	if [ "$RES_OK" = "OK" ]; then
		echo -e -n "${GREEN}[$RES_OK]"
	else
		echo -e -n "${GREEN} [OK]${END}"
	fi
	if [ "$RES_N" -gt 2 ]; then
		echo -e "${RED} [KO]${END}"
	else
		echo -e "${GREEN} [OK]${END}"
	fi
	x=$(( $x + 1 ))
done
echo "----------------------------"

echo "--------- input 5 ----------"
x=1
while [ $x -le $STEPS ]
do
	ARGS="$(ruby -e "puts (0..4).to_a.shuffle.join(' ')")"
	RES_N="$(./push_swap $(echo $ARGS) | wc | awk '{print $1}')"
	RES_OK=$(./push_swap $(echo $ARGS) | $CHECKER $(echo $ARGS))
	echo -e -n "Number of instr: $RES_N "
	if [ "$RES_OK" = "OK" ]; then
		echo -e -n "${GREEN}[$RES_OK]"
	else
		echo -e -n "${GREEN}[OK]${END}"
	fi
	if [ "$RES_N" -gt 12 ]; then
		echo -e "${RED} [KO]${END}"
	else
		echo -e "${GREEN} [OK]${END}"
	fi
	x=$(( $x + 1 ))
done
echo "----------------------------"

# =============================


# ======= medium tests ========

for i in "${m_steps[@]}"
do
	x=1
	echo "--------- input $i ----------"
	while [ $x -le $STEPS ]
	do
		ARGS="$(ruby -e "puts (0..$i - 1).to_a.shuffle.join(' ')")"
		RES_N="$(./push_swap $(echo $ARGS) | wc | awk '{print $1}')"
		RES_OK=$(./push_swap $(echo $ARGS) | $CHECKER $(echo $ARGS))
		echo -e -n "Number of instr: $RES_N "
		if [ "$RES_OK" = "OK" ]; then
			echo -e -n "${GREEN}[$RES_OK]"
		else
			echo -e -n "${RED}[$RES_OK]"
		fi
		echo -n -e "${END}"
		if [ "$RES_N" -gt "700" ]; then
			if [ "$RES_N" -gt "1100" ]; then
				if [ "$RES_N" -gt "1500" ]; then
					echo -e "${RED} [KO]${END}"
				else
					echo -e "${ORANGE} [NOT GOOD!]${END}"
				fi
			else
				echo -e "${YELLOW} [GOOD]${END}"
			fi
		else
			echo -e "${GREEN} [OK]${END}"
		fi
		x=$(( $x + 1 ))
	done
	echo "-----------------------------"
done

# =============================


# ======== big tests ==========

for i in "${b_steps[@]}"
do
	x=1
	echo "--------- input $i ----------"
	while [ $x -le $STEPS ]
	do
		ARGS="$(ruby -e "puts (0..$i - 1).to_a.shuffle.join(' ')")"
		RES_N="$(./push_swap $(echo $ARGS) | wc | awk '{print $1}')"
		RES_OK=$(./push_swap $(echo $ARGS) | $CHECKER $(echo $ARGS))
		echo -n -e "Number of instr: $RES_N "
		if [ "$RES_OK" = "OK" ]; then
			echo -e -n "${GREEN}[$RES_OK]"
		else
			echo -e -n "${RED}[$RES_OK]"
		fi
		echo -ne "${END}"
		if [ "$RES_N" -gt "5500" ]; then
			if [ "$RES_N" -gt "8500" ]; then
				if [ "$RES_N" -gt "11500" ]; then
					echo -e "${RED} [KO]${END}"
				else
					echo -e "${ORANGE} [NOT GOOD!]${END}"
				fi
			else
				echo -e "${YELLOW} [GOOD]${END}"
			fi
		else
			echo -e "${GREEN} [OK]${END}"
		fi
		x=$(( $x + 1 ))
	done
	echo "------------------------------"
done

# =============================


# ======== bbig tests =========

for i in "${bb_steps[@]}"
do
	x=1
	echo "--------- input $i ----------"
	while [ $x -le $STEPS ]
	do
		ARGS="$(ruby -e "puts (0..$i - 1).to_a.shuffle.join(' ')")"
		RES_N="$(./push_swap $(echo $ARGS) | wc | awk '{print $1}')"
		RES_OK=$(./push_swap $(echo $ARGS) | $CHECKER $(echo $ARGS))
		echo -n -e "Number of instr: $RES_N "
		if [ "$RES_OK" = "OK" ]; then
			echo -e -n "${GREEN}[$RES_OK]"
		else
			echo -e -n "${RED}[$RES_OK]"
		fi
		echo -e "${END}"
		x=$(( $x + 1 ))
	done
	echo "------------------------------"
done

# =============================
