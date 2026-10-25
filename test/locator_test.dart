import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/features/portfolio_feature/data/data_source/local/portfolio_datasources.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/repositories/portfolio_repository.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/usecases/get_works_usecase.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/bloc/works_bloc.dart';
import 'package:portfolio_web_project/locator.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await sl.reset();
  });

  tearDown(() async {
    await sl.reset();
  });

  test('setup registers the complete portfolio dependency graph lazily', () async {
    setup();

    expect(sl.isRegistered<PortfolioDatasources>(), isTrue);
    expect(sl.isRegistered<PortfolioRepository>(), isTrue);
    expect(sl.isRegistered<GetWorksUsecase>(), isTrue);
    expect(sl.isRegistered<WorksBloc>(), isTrue);

    final dataSourceOne = sl<PortfolioDatasources>();
    final dataSourceTwo = sl<PortfolioDatasources>();
    final repositoryOne = sl<PortfolioRepository>();
    final repositoryTwo = sl<PortfolioRepository>();
    final usecaseOne = sl<GetWorksUsecase>();
    final usecaseTwo = sl<GetWorksUsecase>();
    final blocOne = sl<WorksBloc>();
    final blocTwo = sl<WorksBloc>();

    expect(identical(dataSourceOne, dataSourceTwo), isTrue);
    expect(identical(repositoryOne, repositoryTwo), isTrue);
    expect(identical(usecaseOne, usecaseTwo), isTrue);
    expect(identical(blocOne, blocTwo), isTrue);

    await blocOne.close();
  });
}
