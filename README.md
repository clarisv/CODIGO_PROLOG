# 🧩 Solução de Problema de Lógica em Prolog

[cite_start]Este projeto apresenta a resolução de um quebra-cabeça lógico envolvendo cinco alunos em um laboratório de computação[cite: 6]. [cite_start]O objetivo é identificar as características únicas de cada aluno (mochila, nome, mês de nascimento, jogo favorito, matéria preferida e suco) com base em um conjunto de restrições de posicionamento e vizinhança[cite: 7].

## 🚀 Desempenho e Eficiência
[cite_start]Graças à otimização das regras de filtragem e ao posicionamento estratégico de valores fixos no início da busca, o sistema apresenta alta performance[cite: 13, 23]:
* [cite_start]**Tempo de Execução:** Aproximadamente 0,031 segundos[cite: 24].
* [cite_start]**Ambiente:** SWI-Prolog (threaded, 64 bits, version 10.0.2)[cite: 25].

## 🛠️ Tecnologias e Estratégias
* [cite_start]**Linguagem:** Prolog (Interpretador SWI-Prolog)[cite: 9].
* [cite_start]**Paradigma:** Programação Lógica[cite: 7].
* [cite_start]**Mecanismo de Busca:** Backtracking nativo para exploração exaustiva do espaço de estados[cite: 14, 21].
* [cite_start]**Garantia de Unicidade:** Implementação recursiva do predicado `alldifferent/1` para evitar duplicatas de atributos[cite: 12].

## 📋 Como Executar
1. Certifique-se de ter o **SWI-Prolog** instalado em sua máquina.
2. Carregue o arquivo do projeto no console:
   ```prolog
   consult('trabalho.pl').
