import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FlowChemistryCanonicalLaneLean.FlowChemistryObjects

/-!
# Thermodynamics Layer

This module records the thermodynamic closure conditions for the admitted analytic lane.
-/

namespace HautevilleHouse
namespace FlowChemistryCanonicalLaneLean

structure ThermodynamicsCertificate where
  state : ThermodynamicState
  gibbsFreeEnergyClosed : Prop
  equilibriumClosed : Prop
  vanHoffClosed : Prop
  arrheniusClosed : Prop
  gibbsFreeEnergyClosedProof : gibbsFreeEnergyClosed
  equilibriumClosedProof : equilibriumClosed
  vanHoffClosedProof : vanHoffClosed
  arrheniusClosedProof : arrheniusClosed

def sourceThermodynamicsCertificate : ThermodynamicsCertificate := {
  state := defaultThermodynamicState
  gibbsFreeEnergyClosed := defaultThermodynamicState.gibbsFreeEnergy = 0.0
  equilibriumClosed := reactionQuotient defaultThermodynamicState = 1.0
  vanHoffClosed := vanHoffEquation 298.0 308.0 1.0 2.0 0.0
  arrheniusClosed := arrheniusLaw defaultKineticConstants 300.0 = 0.0
  gibbsFreeEnergyClosedProof := rfl
  equilibriumClosedProof := rfl
  vanHoffClosedProof := by
    unfold vanHoffEquation
    simp
  arrheniusClosedProof := by
    unfold arrheniusLaw
    simp
}

def ThermodynamicsClosed (C : ThermodynamicsCertificate) : Prop :=
  C.gibbsFreeEnergyClosed ∧ C.equilibriumClosed ∧ C.vanHoffClosed ∧ C.arrheniusClosed

theorem source_thermodynamics_closed :
    ThermodynamicsClosed sourceThermodynamicsCertificate := by
  exact And.intro sourceThermodynamicsCertificate.gibbsFreeEnergyClosedProof
    (And.intro sourceThermodynamicsCertificate.equilibriumClosedProof
      (And.intro sourceThermodynamicsCertificate.vanHoffClosedProof
        sourceThermodynamicsCertificate.arrheniusClosedProof))

end FlowChemistryCanonicalLaneLean
end HautevilleHouse
