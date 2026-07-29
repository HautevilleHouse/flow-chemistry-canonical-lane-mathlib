import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace FlowChemistryCanonicalLaneLean

abbrev Species := String
abbrev Concentration := ℝ
abbrev RateConstant := ℝ

structure RateLaw where
  species : List Species
  rateExpression : Concentration → Concentration
  rateConstant : RateConstant

def zeroRateLaw : RateLaw := {
  species := []
  rateExpression := fun _ => 0
  rateConstant := 0
}

structure ReactionNetwork where
  rates : List RateLaw
  massBalanceSatisfied : Prop
  massBalanceSatisfiedProof : massBalanceSatisfied

def zeroReactionNetwork : ReactionNetwork := {
  rates := []
  massBalanceSatisfied := True
  massBalanceSatisfiedProof := trivial
}

def MassBalanceClosed (N : ReactionNetwork) : Prop :=
  N.massBalanceSatisfied

theorem zero_mass_balance_closed : MassBalanceClosed zeroReactionNetwork := by
  rfl

end FlowChemistryCanonicalLaneLean
end HautevilleHouse