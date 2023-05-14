# Lexical Analyzer

Um analisador léxico (também conhecido como scanner) é uma das etapas iniciais de um compilador. Ele é responsável por ler o código fonte do programa e dividir as suas sequências de caracteres em tokens, que são unidades léxicas com significado semântico.

O analisador léxico examina os caracteres do programa, agrupando-os em tokens que são representados por um par (tipo, valor), onde o tipo indica a categoria do token (por exemplo, identificador, número, operador) e o valor é uma sequência de caracteres que representa o token em si.

Além disso, o analisador léxico pode ser responsável por ignorar espaços em branco, comentários e outras informações que não afetam a semântica do programa.

Os tokens gerados pelo analisador léxico são passados para o analisador sintático (parser), que utiliza esses tokens para construir uma árvore sintática que representa a estrutura do programa.

![untitled](https://user-images.githubusercontent.com/45442173/236529203-16298c11-b5da-4800-ab1d-7e47ad0b6c7d.png)

## Como funciona o flex

![untitled (1)](https://user-images.githubusercontent.com/45442173/236550435-7b1c88d4-f17d-4555-9198-c656e0f5cfd4.png)

## Executar

### Docker

```sh
docker build -t lexical-analyzer .

```

```sh
docker run lexical-analyzer
```

### SH

```sh
sh run.sh
```