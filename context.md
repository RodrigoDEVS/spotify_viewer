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
    - local_storage/
      - local_storage.dart
  - presentation/
    - bloc/
      - cubit/
        - auth/
          - auth_cubit.dart
        - dashboard/
          - page_view_navigation_cubit.dart
          - page_view_navigation_state.dart
    - screens/
      - dashboard/
        - dashboard.dart
        - widgets/
          - dashboard_bottom_navigation_bar.dart
          - dashboard_page_view.dart
      - home_page/
        - home_page.dart
      - initial_page/
        - initial_page.dart
    - utils/
      - snackbar_utils.dart
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
