import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FlowChemistryCanonicalLaneLean

def FlowChemistryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem flow_chemistry_endgame (A : AdmissibleClass) :
    FlowChemistryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FlowChemistryCanonicalLaneLean
end HautevilleHouse
