import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kulak_egitimi/oyun_kulak_egitimi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kulakEgitimiConfig.title.length, 33);
    expect(kulakEgitimiConfig.tagline.length, 33);
    for (final s in kulakEgitimiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kulakEgitimiConfig.gameId, kulakEgitimiId);
    expect(kulakEgitimiRules.gameId, kulakEgitimiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kulakEgitimiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kulakEgitimiId, optionalMechanics: kulakEgitimiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kulakEgitimiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
