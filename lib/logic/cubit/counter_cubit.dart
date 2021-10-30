import 'dart:convert';
import 'dart:developer';
import 'package:flutterblocexampl/logic/models/data_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:http/http.dart' as http;
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0, isIncreased: false)) {
    getCounterValue();
  }
  void emitIncrease() {
    emit(CounterState(counterValue: state.counterValue + 1, isIncreased: true));
    updateCounterValue(1);
  }

  void emitDecrease() {
    emit(
        CounterState(counterValue: state.counterValue - 1, isIncreased: false));
    updateCounterValue(-1);
  }

  Future getCounterValue() async {
    try {
      var body =
          await http.get(Uri.parse('http://192.168.1.5:8090/api/counter'));
      var map = DataG.fromJson(json.decode(body.body)[0]);
      emit(CounterState(counterValue: map.countervalue, isIncreased: false));
    } on Exception catch (err) {
      log(err.toString());
    }
  }

  Future updateCounterValue(int amount) async {
    try {
      await http.get(Uri.parse('http://192.168.1.5:8090/api/counter/$amount'));
    } on Exception catch (err) {
      log(err.toString());
    }
  }
}
