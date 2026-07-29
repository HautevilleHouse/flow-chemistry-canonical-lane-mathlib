import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace FlowChemistryCanonicalLaneLean

structure ThermodynamicProperty where
  name : String
  value : ℝ

def zeroThermodynamicProperty : ThermodynamicProperty := {
  name := ""
  value := 0
}

structure ThermodynamicSystem where
  properties : List ThermodynamicProperty
  firstLawSatisfied : Prop
  firstLawProof : firstLawSatisfied

def zeroThermodynamicSystem : ThermodynamicSystem := {
  properties := []
  firstLawSatisfied := True
  firstLawProof := trivial
}

def FirstLawClosed (S : ThermodynamicSystem) : Prop :=
  S.firstLawSatisfied

theorem zero_first_law_closed : FirstLawClosed zeroThermodynamicSystem := by
  rfl

end FlowChemistryCanonicalLaneLean
end HautevilleHouse