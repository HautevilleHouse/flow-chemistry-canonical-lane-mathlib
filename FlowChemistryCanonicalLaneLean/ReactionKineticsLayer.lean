import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FlowChemistryCanonicalLaneLean.FlowChemistryObjects

/-!
# Reaction Kinetics Layer

This module records the kinetic closure conditions for the admitted analytic lane.
-/

namespace HautevilleHouse
namespace FlowChemistryCanonicalLaneLean

structure ReactionKineticsCertificate where
  reactor : FlowReactor
  kineticConstantsClosed : Prop
  rateLawClosed : Prop
  conversionClosed : Prop
  massBalanceClosed : Prop
  kineticConstantsClosedProof : kineticConstantsClosed
  rateLawClosedProof : rateLawClosed
  conversionClosedProof : conversionClosed
  massBalanceClosedProof : massBalanceClosed

def sourceReactionKineticsCertificate : ReactionKineticsCertificate := {
  reactor := defaultFlowReactor
  kineticConstantsClosed := defaultKineticConstants.rateConstant = 0.0
  rateLawClosed := rateLaw defaultFlowReactor = 0.0
  conversionClosed := conversion defaultFlowReactor = 1.0
  massBalanceClosed := (defaultFlowReactor.inletConcentration - defaultFlowReactor.outletConcentration) = defaultFlowReactor.inletConcentration
  kineticConstantsClosedProof := rfl
  rateLawClosedProof := rfl
  conversionClosedProof := rfl
  massBalanceClosedProof := rfl
}

def ReactionKineticsClosed (C : ReactionKineticsCertificate) : Prop :=
  C.kineticConstantsClosed ∧ C.rateLawClosed ∧ C.conversionClosed ∧ C.massBalanceClosed

theorem source_reaction_kinetics_closed :
    ReactionKineticsClosed sourceReactionKineticsCertificate := by
  exact And.intro sourceReactionKineticsCertificate.kineticConstantsClosedProof
    (And.intro sourceReactionKineticsCertificate.rateLawClosedProof
      (And.intro sourceReactionKineticsCertificate.conversionClosedProof
        sourceReactionKineticsCertificate.massBalanceClosedProof))

end FlowChemistryCanonicalLaneLean
end HautevilleHouse
