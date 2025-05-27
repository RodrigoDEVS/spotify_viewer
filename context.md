# Contexto del Proyecto Spotify Viewer

## Estructura

- lib/data: fuentes de datos (API, local)
- lib/domain: entidades y casos de uso
- lib/presentation: widgets, blocs/cubits, vistas

## Estructura de la aplicacion

- lib/
  - data/
    - api_source/
      - auth_api_source.dart
      - authenticated_request.dart
      - music_api_source.dart
    - local_storage/
      - local_storage.dart
    - models/
      - music_search_response.dart
    - repositories/
      - music_repository_impl.dart
      - music_repository.dart
  - presentation/
    - bloc/
      - bloc/
        - search/
          - search_bloc.dart
          - search_event.dart
          - search_state.dart
      - cubit/
        - auth/
          - auth_cubit.dart
        - dashboard/
          - page_view_navigation_cubit.dart
          - page_view_navigation_state.dart
    - screens/
      - dashboard/
        - dashboard.dart
        - library_view.dart
        - search_view.dart
        - suggestions_view.dart
        - widgets/
          - dashboard_bottom_navigation_bar.dart
          - dashboard_page_view.dart
      - home_page/
        - home_page.dart
      - initial_page/
        - initial_page.dart
    - theme/
      - app_theme.dart
    - utils/
      - snackbar_utils.dart
- .env
- main.dart

## Arquitectura

- Clean Architecture
- Uso de BLoC/Cubit para gestión de estado

## Convenciones

- Los Cubits van en lib/presentation/bloc/cubit/
- Los repositorios en lib/data/repositories/
- Los casos de uso en lib/domain/usecases/

## Dependencias principales

- app_links
- flutter_bloc
- http
- shared_preferences
- url_launcher

## Flujo de autenticación

- El flujo de login con Spotify se inicia desde AuthApiSource.authenticateWithSpotify()
