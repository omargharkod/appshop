abstract class CounterState {}

class CounterinitialState extends CounterState {}

class CounterchangeState extends CounterState {}

class Countermainsage extends CounterState {
  Countermainsage(double age);
}

class Countermainshight extends CounterState {}

class Countermainsweidth extends CounterState {}

class Counterplusage extends CounterState {
  Counterplusage(double age);
}

class Counterplushight extends CounterState {}

class Counterpluswidth extends CounterState {}

class Counterismale extends CounterState {}

class Counterisfemale extends CounterState {}
