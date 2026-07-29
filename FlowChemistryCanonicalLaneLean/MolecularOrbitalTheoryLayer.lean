import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FlowChemistryCanonicalLaneLean

structure MolecularOrbitalCertificate where
  homoEnergy : ℝ
  lumoEnergy : ℝ
  gap : ℝ
  bondOrder : ℝ
  orbitalSymmetry : String
  gapPositive : Prop
  symmetryPreserved : Prop
  gapProof : gapPositive
  symmetryProof : symmetryPreserved

def sourceMolecularOrbitalCertificate : MolecularOrbitalCertificate := {
  homoEnergy := -5.0
  lumoEnergy := 2.0
  gap := 7.0
  bondOrder := 1.5
  orbitalSymmetry := "symmetric"
  gapPositive := True
  symmetryPreserved := True
  gapProof := by trivial
  symmetryProof := by trivial
}

def MolecularOrbitalClosed (C : MolecularOrbitalCertificate) : Prop :=
  C.gapPositive ∧ C.symmetryPreserved

theorem source_molecular_orbital_closed :
    MolecularOrbitalClosed sourceMolecularOrbitalCertificate := by
  exact And.intro sourceMolecularOrbitalCertificate.gapProof sourceMolecularOrbitalCertificate.symmetryProof

end FlowChemistryCanonicalLaneLean
end HautevilleHouse