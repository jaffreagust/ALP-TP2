{-# OPTIONS_GHC -w #-}
module Parse where
import Common
import Data.Maybe
import Data.Char
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t6 t7 t15 t16
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 (LamTerm)
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,139) ([0,30356,14,16384,0,20480,14802,0,256,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,18432,264,0,0,0,256,0,9472,925,0,0,0,128,0,0,0,16384,2242,0,2120,1,0,0,8192,1057,0,33828,0,4096,0,0,0,0,0,0,0,0,0,0,0,8457,0,8480,4,9216,132,0,0,0,1,0,1024,0,2048,0,0,0,0,16,0,10240,7401,0,24644,0,0,0,37888,3700,0,16914,0,0,0,18432,264,0,0,0,0,0,0,2,16384,2,0,33040,1,0,0,0,0,0,16384,0,0,0,0,0,0,24,0,42144,115,4096,385,32768,52882,1,0,0,8192,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseStmt","%start_parseStmts","%start_term","Def","Defexp","Exp","RExp","RLExp","ConsExp","SucExp","NAbs","Atom","Type","Defs","'='","':'","'\\\\'","'.'","'('","')'","'->'","VAR","TYPEE","DEF","LET","IN","ZERO","SUC","REC","NAT","LIST","NIL","CONS","RLL","%eof"]
        bit_start = st * 37
        bit_end = (st + 1) * 37
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..36]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (19) = happyShift action_13
action_0 (21) = happyShift action_14
action_0 (24) = happyShift action_15
action_0 (26) = happyShift action_5
action_0 (27) = happyShift action_16
action_0 (29) = happyShift action_17
action_0 (30) = happyShift action_18
action_0 (31) = happyShift action_19
action_0 (34) = happyShift action_20
action_0 (35) = happyShift action_21
action_0 (36) = happyShift action_22
action_0 (6) = happyGoto action_25
action_0 (7) = happyGoto action_4
action_0 (8) = happyGoto action_26
action_0 (9) = happyGoto action_7
action_0 (10) = happyGoto action_8
action_0 (11) = happyGoto action_9
action_0 (12) = happyGoto action_10
action_0 (13) = happyGoto action_11
action_0 (14) = happyGoto action_12
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (26) = happyShift action_5
action_1 (7) = happyGoto action_23
action_1 (16) = happyGoto action_24
action_1 _ = happyReduce_29

action_2 (19) = happyShift action_13
action_2 (21) = happyShift action_14
action_2 (24) = happyShift action_15
action_2 (27) = happyShift action_16
action_2 (29) = happyShift action_17
action_2 (30) = happyShift action_18
action_2 (31) = happyShift action_19
action_2 (34) = happyShift action_20
action_2 (35) = happyShift action_21
action_2 (36) = happyShift action_22
action_2 (8) = happyGoto action_6
action_2 (9) = happyGoto action_7
action_2 (10) = happyGoto action_8
action_2 (11) = happyGoto action_9
action_2 (12) = happyGoto action_10
action_2 (13) = happyGoto action_11
action_2 (14) = happyGoto action_12
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (26) = happyShift action_5
action_3 (7) = happyGoto action_4
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_3

action_5 (24) = happyShift action_36
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (37) = happyAccept
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_8

action_8 _ = happyReduce_10

action_9 _ = happyReduce_12

action_10 _ = happyReduce_14

action_11 (21) = happyShift action_14
action_11 (24) = happyShift action_15
action_11 (29) = happyShift action_17
action_11 (34) = happyShift action_20
action_11 (14) = happyGoto action_35
action_11 _ = happyReduce_16

action_12 _ = happyReduce_18

action_13 (24) = happyShift action_34
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (19) = happyShift action_13
action_14 (21) = happyShift action_14
action_14 (24) = happyShift action_15
action_14 (27) = happyShift action_16
action_14 (29) = happyShift action_17
action_14 (30) = happyShift action_18
action_14 (31) = happyShift action_19
action_14 (34) = happyShift action_20
action_14 (35) = happyShift action_21
action_14 (36) = happyShift action_22
action_14 (8) = happyGoto action_33
action_14 (9) = happyGoto action_7
action_14 (10) = happyGoto action_8
action_14 (11) = happyGoto action_9
action_14 (12) = happyGoto action_10
action_14 (13) = happyGoto action_11
action_14 (14) = happyGoto action_12
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_19

action_16 (24) = happyShift action_32
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_20

action_18 (21) = happyShift action_14
action_18 (24) = happyShift action_15
action_18 (29) = happyShift action_17
action_18 (30) = happyShift action_18
action_18 (34) = happyShift action_20
action_18 (12) = happyGoto action_31
action_18 (13) = happyGoto action_11
action_18 (14) = happyGoto action_12
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (21) = happyShift action_14
action_19 (24) = happyShift action_15
action_19 (29) = happyShift action_17
action_19 (34) = happyShift action_20
action_19 (14) = happyGoto action_30
action_19 _ = happyFail (happyExpListPerState 19)

action_20 _ = happyReduce_21

action_21 (21) = happyShift action_14
action_21 (24) = happyShift action_15
action_21 (29) = happyShift action_17
action_21 (34) = happyShift action_20
action_21 (14) = happyGoto action_29
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (21) = happyShift action_14
action_22 (24) = happyShift action_15
action_22 (29) = happyShift action_17
action_22 (34) = happyShift action_20
action_22 (14) = happyGoto action_28
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (26) = happyShift action_5
action_23 (7) = happyGoto action_23
action_23 (16) = happyGoto action_27
action_23 _ = happyReduce_29

action_24 (37) = happyAccept
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (37) = happyAccept
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_4

action_27 _ = happyReduce_28

action_28 (21) = happyShift action_14
action_28 (24) = happyShift action_15
action_28 (29) = happyShift action_17
action_28 (34) = happyShift action_20
action_28 (14) = happyGoto action_43
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (21) = happyShift action_14
action_29 (24) = happyShift action_15
action_29 (29) = happyShift action_17
action_29 (34) = happyShift action_20
action_29 (14) = happyGoto action_42
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (21) = happyShift action_14
action_30 (24) = happyShift action_15
action_30 (29) = happyShift action_17
action_30 (34) = happyShift action_20
action_30 (14) = happyGoto action_41
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_15

action_32 (17) = happyShift action_40
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (22) = happyShift action_39
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (18) = happyShift action_38
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_17

action_36 (17) = happyShift action_37
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (19) = happyShift action_13
action_37 (21) = happyShift action_14
action_37 (24) = happyShift action_15
action_37 (27) = happyShift action_16
action_37 (29) = happyShift action_17
action_37 (30) = happyShift action_18
action_37 (31) = happyShift action_19
action_37 (34) = happyShift action_20
action_37 (35) = happyShift action_21
action_37 (36) = happyShift action_22
action_37 (8) = happyGoto action_52
action_37 (9) = happyGoto action_7
action_37 (10) = happyGoto action_8
action_37 (11) = happyGoto action_9
action_37 (12) = happyGoto action_10
action_37 (13) = happyGoto action_11
action_37 (14) = happyGoto action_12
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (21) = happyShift action_48
action_38 (25) = happyShift action_49
action_38 (32) = happyShift action_50
action_38 (33) = happyShift action_51
action_38 (15) = happyGoto action_47
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_22

action_40 (19) = happyShift action_13
action_40 (21) = happyShift action_14
action_40 (24) = happyShift action_15
action_40 (27) = happyShift action_16
action_40 (29) = happyShift action_17
action_40 (30) = happyShift action_18
action_40 (31) = happyShift action_19
action_40 (34) = happyShift action_20
action_40 (35) = happyShift action_21
action_40 (36) = happyShift action_22
action_40 (8) = happyGoto action_46
action_40 (9) = happyGoto action_7
action_40 (10) = happyGoto action_8
action_40 (11) = happyGoto action_9
action_40 (12) = happyGoto action_10
action_40 (13) = happyGoto action_11
action_40 (14) = happyGoto action_12
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (21) = happyShift action_14
action_41 (24) = happyShift action_15
action_41 (29) = happyShift action_17
action_41 (34) = happyShift action_20
action_41 (14) = happyGoto action_45
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_13

action_43 (21) = happyShift action_14
action_43 (24) = happyShift action_15
action_43 (29) = happyShift action_17
action_43 (34) = happyShift action_20
action_43 (14) = happyGoto action_44
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_11

action_45 _ = happyReduce_9

action_46 (28) = happyShift action_57
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (20) = happyShift action_55
action_47 (23) = happyShift action_56
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (21) = happyShift action_48
action_48 (25) = happyShift action_49
action_48 (32) = happyShift action_50
action_48 (33) = happyShift action_51
action_48 (15) = happyGoto action_54
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_23

action_50 _ = happyReduce_24

action_51 (32) = happyShift action_53
action_51 _ = happyFail (happyExpListPerState 51)

action_52 _ = happyReduce_5

action_53 _ = happyReduce_25

action_54 (22) = happyShift action_61
action_54 (23) = happyShift action_56
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (19) = happyShift action_13
action_55 (21) = happyShift action_14
action_55 (24) = happyShift action_15
action_55 (27) = happyShift action_16
action_55 (29) = happyShift action_17
action_55 (30) = happyShift action_18
action_55 (31) = happyShift action_19
action_55 (34) = happyShift action_20
action_55 (35) = happyShift action_21
action_55 (36) = happyShift action_22
action_55 (8) = happyGoto action_60
action_55 (9) = happyGoto action_7
action_55 (10) = happyGoto action_8
action_55 (11) = happyGoto action_9
action_55 (12) = happyGoto action_10
action_55 (13) = happyGoto action_11
action_55 (14) = happyGoto action_12
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (21) = happyShift action_48
action_56 (25) = happyShift action_49
action_56 (32) = happyShift action_50
action_56 (33) = happyShift action_51
action_56 (15) = happyGoto action_59
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (19) = happyShift action_13
action_57 (21) = happyShift action_14
action_57 (24) = happyShift action_15
action_57 (27) = happyShift action_16
action_57 (29) = happyShift action_17
action_57 (30) = happyShift action_18
action_57 (31) = happyShift action_19
action_57 (34) = happyShift action_20
action_57 (35) = happyShift action_21
action_57 (36) = happyShift action_22
action_57 (8) = happyGoto action_58
action_57 (9) = happyGoto action_7
action_57 (10) = happyGoto action_8
action_57 (11) = happyGoto action_9
action_57 (12) = happyGoto action_10
action_57 (13) = happyGoto action_11
action_57 (14) = happyGoto action_12
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_7

action_59 (23) = happyShift action_56
action_59 _ = happyReduce_26

action_60 _ = happyReduce_6

action_61 _ = happyReduce_27

happyReduce_3 = happySpecReduce_1  6 happyReduction_3
happyReduction_3 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  6 happyReduction_4
happyReduction_4 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (Eval happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happyReduce 4 7 happyReduction_5
happyReduction_5 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Def happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 6 8 happyReduction_6
happyReduction_6 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (LAbs happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 6 8 happyReduction_7
happyReduction_7 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (LLet happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_1  8 happyReduction_8
happyReduction_8 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happyReduce 4 9 happyReduction_9
happyReduction_9 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (LRec happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_1  9 happyReduction_10
happyReduction_10 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happyReduce 4 10 happyReduction_11
happyReduction_11 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (LRL happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_1  10 happyReduction_12
happyReduction_12 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  11 happyReduction_13
happyReduction_13 (HappyAbsSyn8  happy_var_3)
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (LCons happy_var_2 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  11 happyReduction_14
happyReduction_14 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  12 happyReduction_15
happyReduction_15 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (LSuc happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  12 happyReduction_16
happyReduction_16 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  13 happyReduction_17
happyReduction_17 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (LApp happy_var_1 happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  13 happyReduction_18
happyReduction_18 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  14 happyReduction_19
happyReduction_19 (HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn8
		 (LVar happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  14 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn8
		 (LZero
	)

happyReduce_21 = happySpecReduce_1  14 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn8
		 (LNil
	)

happyReduce_22 = happySpecReduce_3  14 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  15 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn15
		 (EmptyT
	)

happyReduce_24 = happySpecReduce_1  15 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn15
		 (NatT
	)

happyReduce_25 = happySpecReduce_2  15 happyReduction_25
happyReduction_25 _
	_
	 =  HappyAbsSyn15
		 (ListT
	)

happyReduce_26 = happySpecReduce_3  15 happyReduction_26
happyReduction_26 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (FunT happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  15 happyReduction_27
happyReduction_27 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_2  16 happyReduction_28
happyReduction_28 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1 : happy_var_2
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_0  16 happyReduction_29
happyReduction_29  =  HappyAbsSyn16
		 ([]
	)

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TEOF -> action 37 37 tk (HappyState action) sts stk;
	TEquals -> cont 17;
	TColon -> cont 18;
	TAbs -> cont 19;
	TDot -> cont 20;
	TOpen -> cont 21;
	TClose -> cont 22;
	TArrow -> cont 23;
	TVar happy_dollar_dollar -> cont 24;
	TTypeE -> cont 25;
	TDef -> cont 26;
	TLet -> cont 27;
	TIn -> cont 28;
	TZero -> cont 29;
	TSucc -> cont 30;
	TR -> cont 31;
	TNat -> cont 32;
	TList -> cont 33;
	TNil -> cont 34;
	TCons -> cont 35;
	TRL -> cont 36;
	_ -> happyError' (tk, [])
	})

happyError_ explist 37 tk = happyError' (tk, explist)
happyError_ explist _ tk = happyError' (tk, explist)

happyThen :: () => P a -> (a -> P b) -> P b
happyThen = (thenP)
happyReturn :: () => a -> P a
happyReturn = (returnP)
happyThen1 :: () => P a -> (a -> P b) -> P b
happyThen1 = happyThen
happyReturn1 :: () => a -> P a
happyReturn1 = happyReturn
happyError' :: () => ((Token), [String]) -> P a
happyError' tk = (\(tokens, explist) -> happyError) tk
parseStmt = happySomeParser where
 happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn6 z -> happyReturn z; _other -> notHappyAtAll })

parseStmts = happySomeParser where
 happySomeParser = happyThen (happyParse action_1) (\x -> case x of {HappyAbsSyn16 z -> happyReturn z; _other -> notHappyAtAll })

term = happySomeParser where
 happySomeParser = happyThen (happyParse action_2) (\x -> case x of {HappyAbsSyn8 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


data ParseResult a = Ok a | Failed String
                     deriving Show                     
type LineNumber = Int
type P a = String -> LineNumber -> ParseResult a

getLineNo :: P LineNumber
getLineNo = \s l -> Ok l

thenP :: P a -> (a -> P b) -> P b
m `thenP` k = \s l-> case m s l of
                         Ok a     -> k a s l
                         Failed e -> Failed e
                         
returnP :: a -> P a
returnP a = \s l-> Ok a

failP :: String -> P a
failP err = \s l -> Failed err

catchP :: P a -> (String -> P a) -> P a
catchP m k = \s l -> case m s l of
                        Ok a     -> Ok a
                        Failed e -> k e s l

happyError :: P a
happyError = \ s i -> Failed $ "Línea "++(show (i::LineNumber))++": Error de parseo\n"++(s)

data Token = TVar String
               | TTypeE
               | TDef
               | TAbs
               | TDot
               | TOpen
               | TClose 
               | TColon
               | TArrow
               | TEquals
               | TEOF
               | TLet
               | TIn
               | TZero
               | TSucc
               | TR
               | TNat
               | TList
               | TNil
               | TCons
               | TRL
               deriving Show

----------------------------------
lexer cont s = case s of
                    [] -> cont TEOF []
                    ('\n':s)  ->  \line -> lexer cont s (line + 1)
                    ('0':cs) -> cont TZero cs
                    (c:cs)
                          | isSpace c -> lexer cont cs
                          | isAlpha c -> lexVar (c:cs)
                    ('-':('-':cs)) -> lexer cont $ dropWhile ((/=) '\n') cs
                    ('{':('-':cs)) -> consumirBK 0 0 cont cs	
                    ('-':('}':cs)) -> \ line -> Failed $ "Línea "++(show line)++": Comentario no abierto"
                    ('-':('>':cs)) -> cont TArrow cs
                    ('\\':cs)-> cont TAbs cs
                    ('.':cs) -> cont TDot cs
                    ('(':cs) -> cont TOpen cs
                    ('-':('>':cs)) -> cont TArrow cs
                    (')':cs) -> cont TClose cs
                    (':':cs) -> cont TColon cs
                    ('=':cs) -> cont TEquals cs
                    unknown -> \line -> Failed $ 
                     "Línea "++(show line)++": No se puede reconocer "++(show $ take 10 unknown)++ "..."
                    where lexVar cs = case span isAlpha cs of
                              ("E",rest)    -> cont TTypeE rest
                              ("def",rest)  -> cont TDef rest
                              ("let",rest)  -> cont TLet rest
                              ("in",rest)   -> cont TIn rest
                              ("Nat",rest)  -> cont TNat rest
                              ("suc",rest)  -> cont TSucc rest
                              ("R",rest)    -> cont TR rest
                              ("List",rest) -> cont TList rest
                              ("nil",rest)  -> cont TNil rest
                              ("cons",rest) -> cont TCons rest
                              ("RL",rest)   -> cont TRL rest
                              (var,rest)    -> cont (TVar var) rest
                          consumirBK anidado cl cont s = case s of
                              ('-':('-':cs)) -> consumirBK anidado cl cont $ dropWhile ((/=) '\n') cs
                              ('{':('-':cs)) -> consumirBK (anidado+1) cl cont cs	
                              ('-':('}':cs)) -> case anidado of
                                                  0 -> \line -> lexer cont cs (line+cl)
                                                  _ -> consumirBK (anidado-1) cl cont cs
                              ('\n':cs) -> consumirBK anidado (cl+1) cont cs
                              (_:cs) -> consumirBK anidado cl cont cs     
                                           
stmts_parse s = parseStmts s 1
stmt_parse s = parseStmt s 1
term_parse s = term s 1
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
