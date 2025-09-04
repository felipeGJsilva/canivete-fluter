# 🛠️ Swiss Army Knife - Aplicativo Multifuncional

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.19.0+-02569B?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.3.0+-0175C2?style=for-the-badge&logo=dart)
![Platforms](https://img.shields.io/badge/Platforms-Web|Android-green?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

Um aplicativo Flutter completo que reúne diversas ferramentas úteis em um só lugar. Desenvolvido para funcionar perfeitamente tanto na Web quanto em dispositivos Android.

</div>

## 📋 Índice

- [✨ Funcionalidades](#-funcionalidades)
- [🚀 Começando](#-começando)
- [📦 Estrutura do Projeto](#-estrutura-do-projeto)
- [🏃‍♂️ Como Executar](#-como-executar)
- [📱 Build e Deploy](#-build-e-deploy)
- [🧩 Funcionalidades Detalhadas](#-funcionalidades-detalhadas)
- [🛠️ Tecnologias Utilizadas](#-tecnologias-utilizadas)
- [📝 Licença](#-licença)

## ✨ Funcionalidades

| Ferramenta | Descrição | Ícone |
|------------|-----------|-------|
| **📏 Conversor de Unidades** | Conversão entre unidades de medida (metros, pés, polegadas, etc.) | 📏 |
| **📐 Conversor de Medidas** | Conversão entre sistemas métrico e imperial | 📐 |
| **📝 Ferramentas de Texto** | Manipulação e análise de texto (contar, inverter, maiúsculas, etc.) | 📝 |
| **🧮 Calculadora** | Calculadora básica com operações fundamentais | 🧮 |
| **🔐 Gerador de Senhas** | Geração de senhas seguras e personalizáveis | 🔐 |
| **💱 Conversor de Moedas** | Conversão entre moedas com taxas de câmbio | 💱 |
| **⏰ Data e Hora** | Cálculos e conversões de tempo | ⏰ |

## 🚀 Começando

### Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- **Flutter SDK** (versão 3.19.0 ou superior)
- **Dart** (versão 3.3.0 ou superior)
- **Git**
- **Android Studio** (para desenvolvimento Android)
- **Google Chrome** (para teste web)

### 📥 Instalação do Flutter

1. **Baixe o Flutter SDK**:
   ```bash
   # Clone o repositório do Flutter
   git clone https://github.com/flutter/flutter.git -b stable
   ```

2. **Adicione o Flutter ao PATH**:
   ```bash
   # Windows: Adicione ao environment variables
   # Caminho: C:\flutter\bin
   
   # macOS/Linux: Adicione ao ~/.bashrc ou ~/.zshrc
   export PATH="$PATH:[PATH_TO_FLUTTER]/flutter/bin"
   ```

3. **Verifique a instalação**:
   ```bash
   flutter doctor
   ```

4. **Instale as dependências**:
   ```bash
   flutter pub get
   ```

## 📦 Estrutura do Projeto

```
swiss_army_knife/
├── lib/
│   ├── main.dart                 # Ponto de entrada do aplicativo
│   ├── home_page.dart            # Tela principal com navegação
│   └── body/                     # Pasta contendo todas as ferramentas
│       ├── unit_converter.dart      # Conversor de unidades
│       ├── measurement_converter.dart # Conversor de medidas
│       ├── text_tools.dart          # Ferramentas de texto
│       ├── calculator.dart          # Calculadora
│       ├── password_generator.dart  # Gerador de senhas
│       ├── currency_converter.dart  # Conversor de moedas
│       └── date_time_tools.dart     # Ferramentas de data/hora
├── android/                      # Configurações Android
├── web/                         # Configurações Web
├── pubspec.yaml                 # Dependências do projeto
└── README.md                    # Este arquivo
```

## 🏃‍♂️ Como Executar

### 1. Clone o Repositório

```bash
git clone <url-do-repositorio>
cd swiss_army_knife
```

### 2. Instale as Dependências

```bash
flutter pub get
```

### 3. Execute o Aplicativo

**Para Web (Chrome):**
```bash
flutter run -d chrome
```

**Para Android (Dispositivo Físico):**
```bash
# Conecte seu dispositivo Android via USB
flutter run -d android
```

**Para Android (Emulador):**
```bash
# Inicie o emulador do Android Studio primeiro
flutter run -d emulator-5554
```

### 4. Modo Desenvolvimento

```bash
# Modo debug (com hot reload)
flutter run -d chrome --debug

# Modo profile (para análise de performance)
flutter run -d chrome --profile

# Modo release (otimizado)
flutter run -d chrome --release
```

## 📱 Build e Deploy

### 🌐 Build para Web

```bash
# Build básico para produção
flutter build web --release

# Build otimizado com renderizador HTML
flutter build web --release --web-renderer html

# Build com tree shaking (redução de tamanho)
flutter build web --release --tree-shake-icons

# Servir localmente o build de produção
python3 -m http.server 8000 -d build/web
```

**Arquivos Gerados:**
- `build/web/` - Contém todos os arquivos estáticos
- `build/web/index.html` - Página principal
- `build/web/main.dart.js` - Código JavaScript compilado

### 🤖 Build para Android

```bash
# Gerar APK para distribuição
flutter build apk --release

# Gerar App Bundle (Google Play)
flutter build appbundle --release

# Gerar APK dividido por ABI
flutter build apk --release --split-per-abi
```

**Arquivos Gerados:**
- `build/app/outputs/flutter-apk/` - APKs gerados
- `build/app/outputs/bundle/` - App bundles

### 🔧 Configuração de Deploy

**Para Web:**
1. Os arquivos em `build/web/` podem ser implantados em qualquer servidor web
2. Configure o servidor para servir `index.html` para todas as rotas
3. Recomendado: Use Firebase Hosting, Netlify ou Vercel

**Para Android:**
1. Gere o App Bundle: `flutter build appbundle`
2. Acesse o Google Play Console
3. Crie uma nova release e faça upload do arquivo `.aab`

## 🧩 Funcionalidades Detalhadas

### 📏 Conversor de Unidades
- Conversão entre: Metros, Quilômetros, Centímetros, Milímetros
- Sistema imperial: Pés, Polegadas, Jardas, Milhas
- Precisão de até 6 casas decimais

### 📐 Conversor de Medidas
- **Comprimento**: Metro ↔ Pé, Polegada, Centímetro, etc.
- **Peso**: Quilograma ↔ Libra, Onça, Grama, etc.
- **Temperatura**: Celsius ↔ Fahrenheit ↔ Kelvin
- **Volume**: Litro ↔ Galão, Metro Cúbico, etc.

### 📝 Ferramentas de Texto
- Contador de caracteres e palavras
- Inversão de texto
- Conversão para maiúsculas/minúsculas
- Formatação de texto
- Remoção de espaços extras

### 🧮 Calculadora
- Operações básicas: +, -, ×, ÷
- Funções: Porcentagem, backspace, clear
- Interface intuitiva e responsiva

### 🔐 Gerador de Senhas
- Personalização de comprimento (4-32 caracteres)
- Opções de caracteres: maiúsculas, minúsculas, números, símbolos
- Geração segura de senhas

### 💱 Conversor de Moedas
- Conversão entre múltiplas moedas
- Taxas de câmbio configuráveis
- Interface intuitiva para seleção de moedas

### ⏰ Data e Hora
- Seleção de data e hora
- Cálculo de diferenças entre datas
- Interface de calendário integrada

## 🛠️ Tecnologias Utilizadas

- **Flutter 3.19.0+** - Framework principal
- **Dart 3.3.0+** - Linguagem de programação
- **Material Design 3** - Design system
- **Responsive Framework** - Layout adaptativo

### Dependências Principais

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0        # Para requisições HTTP (conversor de moedas)
  intl: ^0.18.1       # Internacionalização e formatação

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
```

## 🐛 Solução de Problemas

### Erros Comuns

1. **Flutter não encontrado**
   ```bash
   # Verifique o PATH
   echo $PATH
   # Adicione o Flutter ao PATH
   export PATH="$PATH:[PATH_TO_FLUTTER]/bin"
   ```

2. **Dependências não instaladas**
   ```bash
   flutter pub get
   flutter clean
   flutter pub get
   ```

3. **Dispositivo não reconhecido**
   ```bash
   # Liste dispositivos disponíveis
   flutter devices
   # Habilite depuração USB no dispositivo Android
   ```

### Performance

- **Web**: ~2.5MB (compressed)
- **Android**: ~15MB (APK)
- **Tempo de carregamento**: <3s

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para detalhes.

## 🤝 Contribuindo

1. Faça o fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📞 Suporte

Se você encontrar algum problema ou tiver dúvidas:

1. Verifique a [documentação do Flutter](https://flutter.dev/docs)
2. Procure por issues similares no GitHub
3. Crie uma nova issue com detalhes do problema

## 🔄 Atualizações

Para manter o projeto atualizado:

```bash
# Atualize o Flutter
flutter upgrade

# Atualize as dependências
flutter pub upgrade

# Verifique por packages desatualizados
flutter pub outdated
```

---

<div align="center">

**Desenvolvido com ❤️ usando Flutter**

[![Flutter](https://img.shields.io/badge/Made%20with-Flutter-02569B?style=for-the-badge&logo=flutter)](https://flutter.dev)

</div>