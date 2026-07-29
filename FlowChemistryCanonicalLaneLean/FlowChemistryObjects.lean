import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

/-!
# Flow Chemistry Objects

This module gives the theorem package a local analytic vocabulary: reaction rates,
concentrations, temperature, pressure, flow reactors, and the kinetic and thermodynamic
laws used by the admitted analytic lane.
-/

namespace HautevilleHouse
namespace FlowChemistryCanonicalLaneLean

abbrev Time := ℝ
abbrev Concentration := ℝ
abbrev Temperature := ℝ
abbrev Pressure := ℝ

structure KineticConstants where
  rateConstant : ℝ
  activationEnergy : ℝ
  gasConstant : ℝ
  arrheniusPrefactor : ℝ

def defaultKineticConstants : KineticConstants := {
  rateConstant := 0.0
  activationEnergy := 0.0
  gasConstant := 8.314
  arrheniusPrefactor := 0.0
}

structure FlowReactor where
  inletConcentration : Concentration
  outletConcentration : Concentration
  temperature : Temperature
  pressure : Pressure
  volume : ℝ
  flowRate : ℝ
  reactionOrder : ℕ
  kinetic : KineticConstants

def defaultFlowReactor : FlowReactor := {
  inletConcentration := 1.0
  outletConcentration := 0.0
  temperature := 300.0
  pressure := 1.0
  volume := 1.0
  flowRate := 1.0
  reactionOrder := 1
  kinetic := defaultKineticConstants
}

structure ThermodynamicState where
  enthalpy : ℝ
  entropy : ℝ
  gibbsFreeEnergy : ℝ
  equilibriumConstant : ℝ
  temperature : Temperature
  pressure : Pressure

def defaultThermodynamicState : ThermodynamicState := {
  enthalpy := 0.0
  entropy := 0.0
  gibbsFreeEnergy := 0.0
  equilibriumConstant := 1.0
  temperature := 298.0
  pressure := 1.0
}

def rateLaw (F : FlowReactor) : ℝ :=
  F.kinetic.rateConstant * F.inletConcentration ^ (F.reactionOrder : ℕ)

def conversion (F : FlowReactor) : ℝ :=
  (F.inletConcentration - F.outletConcentration) / F.inletConcentration

def reactionQuotient (state : ThermodynamicState) : ℝ :=
  Real.exp (-state.gibbsFreeEnergy / (state.temperature * 8.314))

def vanHoffEquation (T1 T2 : Temperature) (K1 K2 : ℝ) (ΔH : ℝ) : Prop :=
  Real.log (K2 / K1) = (ΔH / 8.314) * ((1/T1) - (1/T2))

def arrheniusLaw (k : KineticConstants) (T : Temperature) : ℝ :=
  k.arrheniusPrefactor * Real.exp (-k.activationEnergy / (k.gasConstant * T))

end FlowChemistryCanonicalLaneLean
end HautevilleHouse
