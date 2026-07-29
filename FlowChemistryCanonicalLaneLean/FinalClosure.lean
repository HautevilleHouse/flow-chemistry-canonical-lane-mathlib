import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FlowChemistryCanonicalLaneLean.ReactorKinetics
import HautevilleHouse.FlowChemistryCanonicalLaneLean.MolecularOrbitals
import HautevilleHouse.FlowChemistryCanonicalLaneLean.ThermodynamicEnsemble
import HautevilleHouse.FlowChemistryCanonicalLaneLean.EquilibriumConstant
import HautevilleHouse.FlowChemistryCanonicalLaneLean.CatalyticMechanism

namespace HautevilleHouse
namespace FlowChemistryCanonicalLaneLean

def FlowChemistryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem flow_chemistry_endgame (A : AdmissibleClass) : FlowChemistryClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FlowChemistryCanonicalLaneLean
end HautevilleHouse