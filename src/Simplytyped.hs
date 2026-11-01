module Simplytyped
  ( conversion
  ,    -- conversion a terminos localmente sin nombre
    eval
  ,          -- evaluador
    infer
  ,         -- inferidor de tipos
    quote          -- valores -> terminos
  )
where

import           Data.List
import           Data.Maybe
import           Prelude                 hiding ( (>>=) )
import           Text.PrettyPrint.HughesPJ      ( render )
import           PrettyPrinter
import           Common

-----------------------
-- conversion
-----------------------

-- conversion a términos localmente sin nombres
conversion :: LamTerm -> Term
conversion = aux []
  where
    aux :: [String] -> LamTerm -> Term
    aux env (LVar x) =
      case elemIndex x env of
        Just i  -> Bound i
        Nothing -> Free (Global x)

    aux env (LAbs x t body) =
      Lam t (aux (x : env) body)

    aux env (LApp t1 t2) =
      aux env t1 :@: aux env t2

    aux env (LLet x t1 t2) =
      Let (aux env t1) (aux (x : env) t2)

    aux _ LZero =
      Zero

    aux env (LSuc t) =
      Suc (aux env t)

    aux env (LRec t1 t2 t3) =
      Rec (aux env t1) (aux env t2) (aux env t3)

    aux _   LNil            = Nil

    aux env (LCons t1 t2)   = Cons (go env t1) (go env t2)
    
    aux env (LRL t1 t2 t3)  = RL (go env t1) (go env t2) (go env t3)

----------------------------
--- evaluador de términos
----------------------------

-- substituye una variable por un término en otro término
sub :: Int -> Term -> Term -> Term
sub i t (Bound j) | i == j    = t
sub _ _ (Bound j) | otherwise = Bound j
sub _ _ (Free n   )           = Free n
sub i t (u   :@: v)           = sub i t u :@: sub i t v
sub i t (Lam t'  u)           = Lam t' (sub (i + 1) t u)
sub i t (Let u v) = Let (sub i t u) (sub (i + 1) t v)
sub _ _ Zero        = Zero
sub i t (Suc u)     = Suc (sub i t u)
sub i t (Rec u v w) = Rec (sub i t u) (sub i t v) (sub i t w) 
sub _ _ Nil         = Nil
sub i t (Cons u v)  = Cons (sub i t u) (sub i t v)
sub i t (RL u v w)  = RL (sub i t u) (sub i t v) (sub i t w)

-- convierte un valor en el término equivalente
quote :: Value -> Term
quote (VLam t f)        = Lam t f
quote (VNum NZero)      = Zero
quote (VNum (NSuc nv))  = Suc (quote (VNum nv))
quote (VList VNil) = Nil
quote (VList (VCons nv lv)) =
  Cons (quote (VNum nv)) (quote (VList lv))

-- evalúa un término en un entorno dado
eval :: NameEnv Value Type -> Term -> Value

-- Variable libre: se busca en el entorno global
eval env (Free n) =
  case lookup n env of
    Just (v, _) -> v
    Nothing     -> error ("Variable libre no definida: " ++ show n)

-- Bound a nivel superior: no debería ocurrir (se maneja por sustitución)
eval _   (Bound _) =
  error "eval: Bound inesperado (¿sub con índice equivocado?)"

eval _   (Lam t body) =
  VLam t body

eval env (t :@: u) =
  case eval env t of
    VLam _ body ->
      let v = eval env u                   
      in eval env (sub 0 (quote v) body)    
    _ -> error "eval: se intentó aplicar algo que no es una función"

eval env (Let t1 t2) =
  let v = eval env t1
  in eval env (sub 0 (quote v) t2)

eval _ Zero = VNum NZero

eval env (Suc t) =
  case eval env t of
    VNum nv -> VNum (NSuc nv)
    _       -> error "eval: suc esperaba un natural"

eval env (Rec t1 t2 t3) =
  case eval env t3 of
    VNum NZero -> eval env t1
    VNum (NSuc nv) ->
      let nTerm   = quote (VNum nv)
          recTerm = Rec t1 t2 nTerm
      in eval env (t2 :@: recTerm :@: nTerm)
    _ -> error "eval: R esperaba un natural en el tercer argumento"

eval _ Nil = VList VNil

eval env (Cons t1 t2) =
  case (eval env t1, eval env t2) of
    (VNum nv, VList lv) -> VList (VCons nv lv)
    _ -> error "eval: cons esperaba un Nat y una List Nat"

eval env (RL t1 t2 t3) =
  case eval env t3 of
    VList VNil -> eval env t1
    VList (VCons nv lv) ->
      let nTerm   = quote (VNum nv)
          recTerm = RL t1 t2 (quote (VList lv))
      in eval env (t2 :@: nTerm :@: recTerm)
    _ -> error "eval: RL esperaba una List Nat en el tercer argumento"

----------------------
--- type checker
-----------------------

-- infiere el tipo de un término
infer :: NameEnv Value Type -> Term -> Either String Type
infer = infer' []

-- definiciones auxiliares
ret :: Type -> Either String Type
ret = Right

err :: String -> Either String Type
err = Left

(>>=)
  :: Either String Type -> (Type -> Either String Type) -> Either String Type
(>>=) v f = either Left f v
-- fcs. de error

matchError :: Type -> Type -> Either String Type
matchError t1 t2 =
  err
    $  "se esperaba "
    ++ render (printType t1)
    ++ ", pero "
    ++ render (printType t2)
    ++ " fue inferido."

notfunError :: Type -> Either String Type
notfunError t1 = err $ render (printType t1) ++ " no puede ser aplicado."

notfoundError :: Name -> Either String Type
notfoundError n = err $ show n ++ " no está definida."

-- infiere el tipo de un término a partir de un entorno local de variables y un entorno global
infer' :: Context -> NameEnv Value Type -> Term -> Either String Type
infer' c _ (Bound i) = ret (c !! i)
infer' _ e (Free  n) = case lookup n e of
  Nothing     -> notfoundError n
  Just (_, t) -> ret t

infer' c e (t :@: u) = infer' c e t >>= \tt -> infer' c e u >>= \tu ->
  case tt of
    FunT t1 t2 -> if (tu == t1) then ret t2 else matchError t1 tu
    _          -> notfunError tt

infer' c e (Lam t u) = infer' (t : c) e u >>= \tu -> ret $ FunT t tu

-- Let (Ejercicio 3)
infer' c e (Let t1 t2) =
  infer' c e t1 >>= \tt1 -> infer' (tt1 : c) e t2

-- Naturales (Ejercicio 4)
infer' _ _ Zero = ret NatT

infer' c e (Suc t) =
  infer' c e t >>= \tt ->
    case tt of
      NatT -> ret NatT
      _    -> matchError NatT tt

infer' c e (Rec t1 t2 t3) =
  infer' c e t1 >>= \tt1 ->
  infer' c e t2 >>= \tt2 ->
  infer' c e t3 >>= \tt3 ->
    case tt3 of
      NatT ->
        case tt2 of
          FunT a (FunT b r)
            | a == tt1 && b == NatT && r == tt1 -> ret tt1
          _ -> matchError (FunT tt1 (FunT NatT tt1)) tt2
      _ -> matchError NatT tt3

-- Listas (Ejercicio 6)
infer' _ _ Nil = ret ListT

infer' c e (Cons t1 t2) =
  infer' c e t1 >>= \tt1 ->
  infer' c e t2 >>= \tt2 ->
    case tt1 of
      NatT ->
        case tt2 of
          ListT -> ret ListT
          _     -> matchError ListT tt2
      _ -> matchError NatT tt1

infer' c e (RL t1 t2 t3) =
  infer' c e t1 >>= \tt1 ->
  infer' c e t2 >>= \tt2 ->
  infer' c e t3 >>= \tt3 ->
    case tt3 of
      ListT ->
        case tt2 of
          FunT a (FunT b r)
            | a == NatT && b == tt1 && r == tt1 -> ret tt1
          _ -> matchError (FunT NatT (FunT tt1 tt1)) tt2
      _ -> matchError ListT tt3

