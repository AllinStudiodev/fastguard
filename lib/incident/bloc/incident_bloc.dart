import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fastguard/repository/incident_repository/incident_repository.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class IncidentBloc extends Bloc<IncidentEvent, IncidentState> {
  //ambil query di firebase incident repository
  final IncidentRepository _incidentRepository;
  StreamSubscription _incidentSubscription;

  //constructornya
  IncidentBloc({@required IncidentRepository incidentRepository})
      : assert(incidentRepository != null),
        _incidentRepository = incidentRepository;

  @override
  IncidentState get initialState => IncidentLoading();

  @override
  Stream<IncidentState> mapEventToState(IncidentEvent event) async* {
    if (event is LoadIncident) {
      yield* _mapLoadIncidentToState();
    } else if (event is AddIncident) {
      yield* _mapAddIncidentToState(event);
    } else if (event is IncidentUpdated) {
      yield* _mapIncidentUpdateToState(event);
    }
  }

  Stream<IncidentState> _mapLoadIncidentToState() async* {
    _incidentSubscription?.cancel();
    _incidentSubscription = _incidentRepository
        .incidents()
        .listen((incident) => add(IncidentUpdated(incident)));
  }

  Stream<IncidentState> _mapAddIncidentToState(AddIncident event) async* {
    _incidentRepository.addNewIncident(event.incident);
  }

  Stream<IncidentState> _mapIncidentUpdateToState(
      IncidentUpdated event) async* {
    yield IncidentLoaded(event.incident);
  }
}
