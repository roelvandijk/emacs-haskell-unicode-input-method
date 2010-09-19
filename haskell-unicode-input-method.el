;; Haskell Unicode helper functions
;; Copyright: 2010 Roel van Dijk <vandijk.roel@gmail.com>
;; License: BSD3, see the accompanying file LICENSE.

(require 'quail)

(quail-define-package
 "haskell-unicode" "UTF-8" "\\" t
 "Haskell Unicode input method.
Designed to be used with the Haskell UnicodeSyntax language
extension in combination with the x-unicode-symbols set of
packages (base-unicode-symbols and containers-unicode-symbols).
" nil t nil nil nil nil nil nil nil nil t)

(quail-define-rules
 ;; Greek letters
 ("alpha"            ?α)
 ("Alpha"            ?Α)
 ("beta"             ?β)
 ("Beta"             ?Β)
 ("gamma"            ?γ)
 ("Gamma"            ?Γ)
 ("delta"            ?δ)
 ("Delta"            ?Δ)
 ("epsilon"          ?ε)
 ("Epsilon"          ?Ε)
 ("zeta"             ?ζ)
 ("Zeta"             ?Ζ)
 ("eta"              ?η)
 ("Eta"              ?Η)
 ("theta"            ?θ)
 ("Theta"            ?Θ)
 ("iota"             ?ι)
 ("Iota"             ?Ι)
 ("kappa"            ?κ)
 ("Kappa"            ?Κ)
 ("lambda"           ?λ)
 ("Lambda"           ?Λ)
 ("lamda"            ?λ)
 ("Lamda"            ?Λ)
 ("mu"               ?μ)
 ("Mu"               ?Μ)
 ("nu"               ?ν)
 ("Nu"               ?Ν)
 ("xi"               ?ξ)
 ("Xi"               ?Ξ)
 ("omicron"          ?ο)
 ("Omicron"          ?Ο)
 ("pi"               ?π)
 ("Pi"               ?Π)
 ("rho"              ?ρ)
 ("Rho"              ?Ρ)
 ("sigma"            ?σ)
 ("Sigma"            ?Σ)
 ("tau"              ?τ)
 ("Tau"              ?Τ)
 ("upsilon"          ?υ)
 ("Upsilon"          ?Υ)
 ("phi"              ?φ)
 ("Phi"              ?Φ)
 ("chi"              ?χ)
 ("Chi"              ?Χ)
 ("psi"              ?ψ)
 ("Psi"              ?Ψ)
 ("omega"            ?ω)
 ("Omega"            ?Ω)
 ("digamma"          ?ϝ)
 ("Digamma"          ?Ϝ)
 ("san"              ?ϻ)
 ("San"              ?Ϻ)
 ("qoppa"            ?ϙ)
 ("Qoppa"            ?Ϙ)
 ("sampi"            ?ϡ)
 ("Sampi"            ?Ϡ)
 ("stigma"           ?ϛ)
 ("Stigma"           ?Ϛ)
 ("heta"             ?ͱ)
 ("Heta"             ?Ͱ)
 ("sho"              ?ϸ)
 ("Sho"              ?Ϸ)

 ;; Types
 ("::"               ?∷)

 ;; Quantifiers
 ("forall"           ?∀)
 ("exists"           ?∃)

 ;; Arrows
 ("->"               ?→)
 ("-->"              ?⟶)
 ("<-"               ?←)
 ("<--"              ?⟵)
 ("<->"              ?↔)
 ("<-->"             ?⟷)

 ("=>"               ?⇒)
 ("==>"              ?⟹)
 ("<="               ?⇐)
 ("<=="              ?⟸)
 ("<=>"              ?⇔)
 ("<==>"             ?⟺)

 ("|->"              ?↦)
 ("|-->"             ?⟼)
 ("<-|"              ?↤)
 ("<--|"             ?⟻)

 ("|=>"              ?⤇)
 ("|==>"             ?⟾)
 ("<=|"              ?⤆)
 ("<==|"             ?⟽)

 ("~>"               ?⇝)
 ("~~>"              ?⟿)
 ("<~"               ?⇜)
 ("<~~"              ?⬳)

 (">->"              ?↣)
 ("<-<"              ?↢)
 ("->>"              ?↠)
 ("<<-"              ?↞)

 (">->>"             ?⤖)
 ("<<-<"             ?⬻)

 ("<|-"              ?⇽)
 ("-|>"              ?⇾)
 ("<|-|>"            ?⇿)

 ("<-/-"             ?↚)
 ("-/->"             ?↛)

 ("<-|-"             ?⇷)
 ("-|->"             ?⇸)
 ("<-|->"            ?⇹)

 ("<-||-"            ?⇺)
 ("-||->"            ?⇻)
 ("<-||->"           ?⇼)

 ("-o->"             ?⇴)
 ("<-o-"             ?⬰)

 ;; Boolean operators
 ("not"              ?¬)
 ("&&"               ?∧)
 ("||"               ?∨)

 ;; Relational operators
 ("=="               ?≡)
 ("/="               ?≢)
 ("<="               ?≤)
 (">="               ?≥)
 ("/<"               ?≮)
 ("/>"               ?≯)

 ;; Arithmetic
 ("/"                ?÷)
 ("*"                ?⋅)

 ;; Containers / Collections
 ("++"               ?⧺)
 ("+++"              ?⧻)
 ("|||"              ?⫴)
 ("empty"            ?∅)
 ("elem"             ?∈)
 ("notElem"          ?∉)
 ("member"           ?∈)
 ("notMember"        ?∉)
 ("union"            ?∪)
 ("intersection"     ?∩)
 ("isSubsetOf"       ?⊆)
 ("isProperSubsetOf" ?⊂)

 ;; Other
 ("<<"               ?≪)
 (">>"               ?≫)
 ("<<<"              ?⋘)
 (">>>"              ?⋙)
 ("<|"               ?⊲)
 ("|>"               ?⊳)
 ("><"               ?⋈)
 ("mempty"           ?∅)
 ("mappend"          ?⊕)
 ("<*>"              ?⊛)
 ("."                ?∘)
 ("undefined"        ?⊥)
 (":="               ?≔)
 ("=:"               ?≕)
 ("=def"             ?≝)
 ("=?"               ?≟)
)
