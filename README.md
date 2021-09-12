# Solving a Time–Dependent 1D Wave PDE

This project explores the **numerical analysis** of a time-dependent **1D Wave PDE** problem, and numerical **implementation** of its solution. The problem is approached from the perspective of **Numerical Linear Algebra**.

[Project Page](https://jamesakl.com/nla-wave)

The continuous system is first space-discretized, then time-discretized, while using finite-difference approximations, to produce a discrete approximate system. An **iterative solution** is then designed, and initial values are chosen. Convergence is analyzed via the Courant–Friedrichs–Lewy convgerence (CFL) condition. The implementation reduces computational cost via sparse matrix structures as well as memory allocations via replacing 2D operations with 1D operations wherever possible.

The project page details the methodology, mathematical formulation, discretization, convergence guarantees, function headers, and results.

The project scripts have been implemented in MATLAB and are mostly compatible with open-source MATLAB cognates such as [GNU Octave](https://www.gnu.org/software/octave/).