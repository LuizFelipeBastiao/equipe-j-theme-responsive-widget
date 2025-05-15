# theme_responsive_widget

Este é um projeto Flutter que visa oferecer uma experiência de usuário fluida e moderna, com foco em responsividade e personalização visual. As principais funcionalidades do app incluem:

- Containers animados que proporcionam transições suaves e interativas.
- Tela de Onboarding para guiar novos usuários e apresentar as funcionalidades principais do app.
- Troca dinâmica de tema, permitindo alternar entre modo claro e escuro em tempo real.
- Splash screen nativa, garantindo uma abertura elegante do aplicativo enquanto os recursos são carregados.
- Roteamento estruturado para navegação entre telas, incluindo login, home e outras seções.
- Funcionalidade de login com validação de credenciais.
- Recuperação e troca de senha, facilitando o acesso dos usuários que esqueceram suas credenciais.

A estrutura do projeto é organizada para facilitar a manutenção, reutilização e escalabilidade, separando claramente temas, cores, widgets comuns, modelos de dados e páginas.

## Como rodar o projeto

Siga os passos abaixo para rodar o aplicativo Flutter localmente:

1. Certifique-se de que o [Flutter SDK](https://flutter.dev/docs/get-started/install) está instalado no seu computador.

2. Clone este repositório:
   ```bash
   git clone https://github.com/LuizFelipeBastiao/equipe-j-theme-responsive-widget.git
   ```

3. Entre na pasta do projeto:
   ```bash
   cd equipe-j-theme-responsive-widget/theme_responsive_widget
   ```
   
4. Instale as dependências do Flutter:
   ```bash
   flutter pub get
   ```
   
5. Rode o projeto:
   ```bash
   flutter run
   ```

6. Você pode optar também:
   - Acesse o [GitPod](https://gitpod.io/#https://github.com/LuizFelipeBastiao/equipe-j-theme-responsive-widget)
   - O ambiente já vem configurado com Flutter.
   - Use o terminal do Gitpod para rodar:
   ```bash
    flutter pub get
    flutter run
   ```
7. Estrutura:
   - Veja abaixo:

   ```bash
      lib/
      ├── common/
      │ ├── colors/
      │ │ └── colors_const.dart
      │ ├── themes/
      │ │ ├── theme_controller.dart
      │ │ ├── theme_data_dark.dart
      │ │ └── theme_data_light.dart
      │ └── widgets/
      │ ├── loading_spinner.dart
      │ └── switch_theme_button.dart
      ├── data/
      │ └── user_dao.dart
      ├── models/
      │ └── user_model.dart
      ├── pages/
      │ ├── home/
      │ │ └── home_page.dart
      │ ├── login/
      │ │ ├── form/
      │ │ │ └── login_form.dart
      │ │ └── login_page.dart
      │ └── splash/
      │ └── splash_page.dart
   ```
