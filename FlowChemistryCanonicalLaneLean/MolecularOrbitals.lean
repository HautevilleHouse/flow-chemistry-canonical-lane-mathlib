import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace FlowChemistryCanonicalLaneLean

structure Orbital where
  label : String
  energy : ℝ
  occupation : ℕ

def zeroOrbital : Orbital := {
  label := ""
  energy := 0
  occupation := 0
}

structure MolecularOrbitalDiagram where
  orbitals : List Orbital
  huckelSatisfied : Prop
  huckelProof : huckelSatisfied

def zeroMolecularOrbitalDiagram : MolecularOrbitalDiagram := {
  orbitals := []
  huckelSatisfied := True
  huckelProof := trivial
}

def HuckelClosed (M : MolecularOrbitalDiagram) : Prop :=
  M.huckelSatisfied

theorem zero_huckel_closed : HuckelClosed zeroMolecularOrbitalDiagram := by
  rfl

end FlowChemistryCanonicalLaneLean
end HautevilleHouse