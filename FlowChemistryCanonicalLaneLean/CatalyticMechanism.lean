import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace FlowChemistryCanonicalLaneLean

structure CatalyticCycle where
  catalyst : String
  turnoverNumber : ℝ
  steps : List String

def zeroCatalyticCycle : CatalyticCycle := {
  catalyst := ""
  turnoverNumber := 0
  steps := []
}

structure CatalyticMechanism where
  cycles : List CatalyticCycle
  catalystRegenerated : Prop
  catalystRegenerationProof : catalystRegenerated

def zeroCatalyticMechanism : CatalyticMechanism := {
  cycles := []
  catalystRegenerated := True
  catalystRegenerationProof := trivial
}

def CatalystRegenerationClosed (M : CatalyticMechanism) : Prop :=
  M.catalystRegenerated

theorem zero_catalyst_regeneration_closed : CatalystRegenerationClosed zeroCatalyticMechanism := by
  rfl

end FlowChemistryCanonicalLaneLean
end HautevilleHouse