% Aqui listamos todas as opções de mochilas dadas no enunciado
mochila(amarela). mochila(azul). mochila(branca). mochila(verde). mochila(vermelha).
nome(denis). nome(joao). nome(lenin). nome(otavio). nome(will).
mes(agosto). mes(dezembro). mes(janeiro). mes(maio). mes(setembro).
jogo(tres_ou_mais). jogo(caca_palavras). jogo(cubo_vermelho). jogo(jogo_da_forca). jogo(prob_logica).
materia(biologia). materia(geografia). materia(historia). materia(matematica). materia(portugues).
suco(laranja). suco(limao). suco(maracuja). suco(morango). suco(uva).

alldifferent([]).
alldifferent([H|T]) :- not(member(H, T)), alldifferent(T).

modelo([(M1,N1,Me1,J1,Ma1,S1), (M2,N2,Me2,J2,Ma2,S2), (M3,N3,Me3,J3,Ma3,S3), (M4,N4,Me4,J4,Ma4,S4), (M5,N5,Me5,J5,Ma5,S5)]) :-

    % 1. Posições Fixas (Eliminam milhares de combinações instantaneamente)
    N5 = lenin, [cite: 34, 35]
    S1 = limao,
    S3 = morango,
    J3 = jogo_da_forca,
    (N1 = otavio; N5 = otavio), % Como N5 é Lenin, o Prolog já sabe que N1 é Otávio!

    % 2. Definição de Nomes (Já temos alguns fixos)
    nome(N1), nome(N2), nome(N3), nome(N4), nome(N5), 
    alldifferent([N1,N2,N3,N4,N5]), [cite: 31, 60]

    % 3. Matérias e Jogos (Relacionando com o que já sabemos)
    materia(Ma1), materia(Ma2), materia(Ma3), materia(Ma4), materia(Ma5),
    alldifferent([Ma1,Ma2,Ma3,Ma4,Ma5]),
    (N1=joao, Ma1=historia; N2=joao, Ma2=historia; N3=joao, Ma3=historia; N4=joao, Ma4=historia; N5=joao, Ma5=historia),

    jogo(J1), jogo(J2), jogo(J3), jogo(J4), jogo(J5),
    alldifferent([J1,J2,J3,J4,J5]),
    (J1=cubo_vermelho; J5=cubo_vermelho),
    (J1=jogo_da_forca, (J2=tres_ou_mais); J2=jogo_da_forca, (J1=tres_ou_mais; J3=tres_ou_mais); J3=jogo_da_forca, (J2=tres_ou_mais; J4=tres_ou_mais); J4=jogo_da_forca, (J3=tres_ou_mais; J5=tres_ou_mais); J5=jogo_da_forca, (J4=tres_ou_mais)),

    % 4. Sucos e Meses (Aplicando restrições de vizinhança cedo)
    suco(S1), suco(S2), suco(S3), suco(S4), suco(S5),
    alldifferent([S1,S2,S3,S4,S5]),
    (Ma1=biologia, S1=morango; Ma2=biologia, S2=morango; Ma3=biologia, S3=morango; Ma4=biologia, S4=morango; Ma5=biologia, S5=morango),
    (Ma1=matematica, S1=maracuja; Ma2=matematica, S2=maracuja; Ma3=matematica, S3=maracuja; Ma4=matematica, S4=maracuja; Ma5=matematica, S5=maracuja),

    mes(Me1), mes(Me2), mes(Me3), mes(Me4), mes(Me5),
    alldifferent([Me1,Me2,Me3,Me4,Me5]),
    (Ma1=matematica, Me1=dezembro; Ma2=matematica, Me2=dezembro; Ma3=matematica, Me3=dezembro; Ma4=matematica, Me4=dezembro; Ma5=matematica, Me5=dezembro),

    % 5. Mochilas (Por último, pois as cores dependem de tudo o anterior)
    mochila(M1), mochila(M2), mochila(M3), mochila(M4), mochila(M5),
    alldifferent([M1,M2,M3,M4,M5]),
    (M1=branca, N2=will; M2=branca, N3=will; M3=branca, N4=will; M4=branca, N5=will), [cite: 36, 40]
    
    % Resto das regras de vizinhança...
    (S1=uva, J1=prob_logica; S2=uva, J2=prob_logica; S3=uva, J3=prob_logica; S4=uva, J4=prob_logica; S5=uva, J5=prob_logica),
    (S1=uva, Ma2=portugues; S2=uva, Ma3=portugues; S3=uva, Ma4=portugues; S4=uva, Ma5=portugues),
    (J1=jogo_da_forca, (M2=vermelha); J2=jogo_da_forca, (M1=vermelha; M3=vermelha); J3=jogo_da_forca, (M2=vermelha; M4=vermelha); J4=jogo_da_forca, (M3=vermelha; M5=vermelha); J5=jogo_da_forca, (M4=vermelha)).

imprime_lista([]) :- write('\n FIM \n').
imprime_lista([H|T]) :- write(H), write('\n'), imprime_lista(T).

main :- statistics(cputime, T1), modelo(L), imprime_lista(L), statistics(cputime, T2), Tempo is T2 - T1, write('Tempo: '), write(Tempo), fail.
main.