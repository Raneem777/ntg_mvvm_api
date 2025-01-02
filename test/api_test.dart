import 'package:mocktail/mocktail.dart';
import 'package:ntg_mvvm_api/apis/ApiServices.dart';
import 'package:ntg_mvvm_api/reposetory/Model/data.dart';
import 'package:ntg_mvvm_api/reposetory/repo.dart';
import 'package:test/test.dart';

class MockApiServices extends Mock implements ApiServeces {}

void main() {
  late MockApiServices mockApiServices;
  late Repo repository;

  group("Api test-", () {
    setUp(() {
      mockApiServices = MockApiServices();
      repository = Repo();
      repository.serv = mockApiServices;
    });
    test('fetchUser returns data on success', () async {
      final mockData = [
        ModelData(id: 1, title: "Test", body: "This is a test")
      ];
      when(() => mockApiServices.fetchPost()).thenAnswer((_) async => mockData);

      // Act
      final result = await repository.fetchUser();

      // Assert
      expect(result, mockData);

      // Verify
      verify(() => mockApiServices.fetchPost()).called(1);
    });

    test('fetchUser handles null responses gracefully', () async {
      // Arrange
      when(() => mockApiServices.fetchPost()).thenAnswer((_) async => null);

      // Act
      final result = await repository.fetchUser();

      // Assert
      expect(result, null);

      // Verify
      verify(() => mockApiServices.fetchPost()).called(1);
    });

    test('fetchUser throws exception when API fails', () async {
      // Arrange
      when(() => mockApiServices.fetchPost()).thenThrow(Exception("API Error"));

      // Act & Assert
      expect(() => repository.fetchUser(), throwsA(isA<Exception>()));

      // Verify
      verify(() => mockApiServices.fetchPost()).called(1);
    });
  });
}
