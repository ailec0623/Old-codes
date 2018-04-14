class Automaton(object):
    def __init__(self):
        self.states = "q1"

    def read_commands(self, commands):
        # Return True if we end in our accept state, False otherwise
        for a in commands:
          if self.states == "q1":
              if a == "1":
                  self.states = "q2"
          elif self.states == "q2":
              if a == "0":
                  self.states = "q3"
          elif self.states == "q3":
              self.states = "q2"

        if self.states == 'q2':
            return True
        else:
            return False

              
my_automaton = Automaton()
