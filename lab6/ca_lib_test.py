import cellpylib as cpl
import numpy as np

np.random.seed(0)
cellular_automaton = cpl.init_random2d(64, 64)
# cellular_automaton = cpl.init_random2d(256, 256)

def vote_rule(neighbor, c, t):
    """Vote rule for cellular automaton

    Args:
        neighbor (_type_): neighbor cell state
        c (_type_): current cell index
        t (_type_): time step
    """
    return 1 if np.sum(neighbor) > 4 else 0

cellular_automaton = cpl.evolve2d(cellular_automaton, timesteps=2, neighbourhood='Moore',
                                  apply_rule=vote_rule, memoize='recursive')

# cpl.plot2d_animate(cellular_automaton, save=True)

print(cellular_automaton.size)
# cpl.plot2d(cellular_automaton)