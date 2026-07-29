import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace FlowChemistryCanonicalLaneLean

structure EquilibriumReaction where
  reactants : List String
  products : List String
  equilibriumConstant : ℝ

def zeroEquilibriumReaction : EquilibriumReaction := {
  reactants := []
  products := []
  equilibriumConstant := 1
}

structure EquilibriumNetwork where
  reactions : List EquilibriumReaction
  equilibriumSatisfied : Prop
  equilibriumProof : equilibriumSatisfied

def zeroEquilibriumNetwork : EquilibriumNetwork := {
  reactions := []
  equilibriumSatisfied := True
  equilibriumProof := trivial
}

def EquilibriumClosed (N : EquilibriumNetwork) : Prop :=
  N.equilibriumSatisfied

theorem zero_equilibrium_closed : EquilibriumClosed zeroEquilibriumNetwork := by
  rfl

end FlowChemistryCanonicalLaneLean
end HautevilleHouse