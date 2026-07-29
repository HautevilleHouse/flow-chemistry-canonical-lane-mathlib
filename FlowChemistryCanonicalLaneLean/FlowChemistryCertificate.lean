import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FlowChemistryCanonicalLaneLean

structure FlowChemistryCertificate where
  kinetics : ReactionKineticsCertificate
  orbitals : MolecularOrbitalCertificate
  thermodynamics : ThermodynamicsCertificate
  equilibrium : ChemicalEquilibriumCertificate
  kineticsClosed : Prop
  orbitalsClosed : Prop
  thermodynamicsClosed : Prop
  equilibriumClosed : Prop
  kineticsProof : kineticsClosed
  orbitalsProof : orbitalsClosed
  thermodynamicsProof : thermodynamicsClosed
  equilibriumProof : equilibriumClosed

def sourceFlowChemistryCertificate : FlowChemistryCertificate := {
  kinetics := sourceReactionKineticsCertificate
  orbitals := sourceMolecularOrbitalCertificate
  thermodynamics := sourceThermodynamicsCertificate
  equilibrium := sourceChemicalEquilibriumCertificate
  kineticsClosed := ReactionKineticsClosed sourceReactionKineticsCertificate
  orbitalsClosed := MolecularOrbitalClosed sourceMolecularOrbitalCertificate
  thermodynamicsClosed := ThermodynamicsClosed sourceThermodynamicsCertificate
  equilibriumClosed := ChemicalEquilibriumClosed sourceChemicalEquilibriumCertificate
  kineticsProof := source_reaction_kinetics_closed
  orbitalsProof := source_molecular_orbital_closed
  thermodynamicsProof := source_thermodynamics_closed
  equilibriumProof := source_chemical_equilibrium_closed
}

def FlowChemistryCertificateClosed (C : FlowChemistryCertificate) : Prop :=
  C.kineticsClosed ∧ C.orbitalsClosed ∧ C.thermodynamicsClosed ∧ C.equilibriumClosed

theorem source_flow_chemistry_certificate_closed :
    FlowChemistryCertificateClosed sourceFlowChemistryCertificate := by
  exact And.intro sourceFlowChemistryCertificate.kineticsProof
    (And.intro sourceFlowChemistryCertificate.orbitalsProof
      (And.intro sourceFlowChemistryCertificate.thermodynamicsProof
        sourceFlowChemistryCertificate.equilibriumProof))

end FlowChemistryCanonicalLaneLean
end HautevilleHouse