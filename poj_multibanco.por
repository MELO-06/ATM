algoritmo
	declare saldo, opcao, levantado, depositado, indicetabela, x numerico
		   loop, continuar logico
		   codigo literal
		   notas[6] registro (valor, quantidade NUMERICO)
		   operacoes[100] registro (operacao LITERAL valor NUMERICO)
	notas[1].valor <- 5
	notas[2].valor <- 10
	notas[3].valor <- 20
	notas[4].valor <- 50
	notas[5].valor <- 100
	notas[6].valor <- 200
	para x <- 1 ate 6 faca
		notas[x].quantidade <- 100
	codigo <- "0000"
	loop <- verdadeiro
	password (codigo, verdadeiro)
	enquanto loop faca
		inicio
			limpar_tela()
			escreva "-------- Menu Multibanco --------"
			escreva "[1] Levantamentos"
			escreva "[2] Depósitos"
			escreva "[3] Transferências"
			escreva "[4] Alterar Código"
			escreva "[5] Stock de Notas"
			leia opcao
			limpar_tela() 
			se opcao = 1 entao
				inicio
					levantado <- levantar(saldo)
					saldo <- saldo - levantado
					indicetabela <- indicetabela + 1
					se levantado <> 0 entao
							operacao("levantamento", levantado, indicetabela)
					continuar <- maisops(indicetabela, saldo)
					se nao continuar entao
						loop <- falso
					//operacao(levantado, indicetabela)
				fim
			senao se opcao = 2 entao
				inicio
					depositado <- depositar()
					saldo <- saldo + depositado
					indicetabela <- indicetabela + 1
					operacao("deposito", depositado, indicetabela)
					//operacao(depositado, indicetabela)
					continuar <- maisops(indicetabela, saldo)
					se nao continuar entao
						loop <- falso
				fim
			senao se opcao = 3 entao
				escreva "3"
			senao se opcao = 4 entao
				inicio
					limpar_tela()
					escreva "Insira o novo código"
					leia codigo
					codigo <- codigo
					continuar <- maisops(indicetabela, saldo)
					se continuar entao
						inicio
							limpar_tela()
							password(codigo, falso)
						fim
					senao 
						loop <- falso
				fim
			senao se opcao = 5 entao
				inicio
					para x <- 1 ate 6 faca
						escreva "A máquina tem ", notas[x].quantidade, " notas de ", notas[x].valor, " €"
					escreva " "
					continuar <- maisops(indicetabela, saldo)
					se continuar entao
							limpar_tela()
					senao 
						loop <- falso
				fim
			//loop <- falso
		fim
fim_algoritmo
sub-rotina password (codigo literal primeira logico)
	declare codigointroduzido literal
		se primeira entao
			escreva "Marque o código pessoal (Predefinição : 0000)"
		senao
			escreva "Marque o código pessoal"
		leia codigointroduzido
		se codigointroduzido <> codigo entao
			repita 
				escreva "Código incorreto! Tente Novamente"
				leia codigointroduzido
			ate codigointroduzido = codigo
		limpar_tela()
fim_sub_rotina password
sub-rotina depositar ()
	declare valoradepositar, notasaadicionar numerico
	escreva "Insira um valor a depositar"
	leia valoradepositar
	se resto(valoradepositar, 5) <> 0 entao
		repita
			escreva "A máquina apenas aceita notas"
			escreva "Insira um novo valor a depositar"
			leia valoradepositar
			limpar_tela()
	ate resto(valoradepositar, 5) = 0
	notasaadicionar <- valoradepositar
	repita
					//inicio
						se notasaadicionar >= 200 entao
							inicio
								notasaadicionar <- notasaadicionar - 200
								notas[6].quantidade <- notas[6].quantidade + 1
							fim
						se notasaadicionar >= 100 entao
							inicio
								notasaadicionar <- notasaadicionar - 100
								notas[5].quantidade <- notas[5].quantidade + 1
							fim
						se notasaadicionar >= 50 entao
							inicio
								notasaadicionar <- notasaadicionar - 50
								notas[4].quantidade <- notas[4].quantidade + 1
							fim
						se notasaadicionar >= 20 entao
							inicio
								notasaadicionar <- notasaadicionar - 20
								notas[3].quantidade <- notas[3].quantidade + 1
							fim
						se notasaadicionar >= 10 entao
							inicio
								notasaadicionar <- notasaadicionar - 10
								notas[2].quantidade <- notas[2].quantidade + 1
							fim
						se notasaadicionar >= 5 entao
							inicio
								notasaadicionar <- notasaadicionar - 5
								notas[1].quantidade <- notas[1].quantidade + 1
							fim
						ate notasaadicionar = 0
	retorne valoradepositar
fim_sub_rotina depositar
sub-rotina levantar (saldo numerico)
	declare valoralevantar, opcao, notasatirar numerico
		   achou logico
		escreva "-------- Menu Levantar --------"
		escreva "[1] 20 EUROS"
		escreva "[2] 40 EUROS"
		escreva "[3] 60 EUROS"
		escreva "[4] 100 EUROS"
		escreva "[5] 200 EUROS"
		escreva "[6] Outras Quantias"
		escreva "[7] Voltar"
		leia opcao
		se opcao = 1 entao
			valoralevantar <- 20
		senao se opcao = 2 entao
			valoralevantar <- 40
		senao se opcao = 3 entao
			valoralevantar <- 60
		senao se opcao = 4 entao
			valoralevantar <- 100
		senao se opcao = 5 entao
			valoralevantar <- 200
		senao se opcao = 6 entao
			inicio
				limpar_tela()
				escreva "Qual a quantia que deseja levantar?"
				leia valoralevantar
				se valoralevantar >= 10 entao
					inicio
						se resto(valoralevantar, 5) <> 0 entao
							repita
								escreva "A máquina apenas tem notas"
								escreva "Insira um novo valor a levantar"
								leia valoralevantar
								limpar_tela()
							ate resto(valoralevantar, 5) = 0
					fim
				senao
						repita 
							escreva "A quantidade minima a levantar é de 10 €"
							escreva "Insira um novo valor a levantar"
							leia valoralevantar 
							limpar_tela()
						ate valoralevantar >= 10
			fim
		senao se opcao = 7 entao
			retorne 0
		se valoralevantar <= saldo entao
			inicio
			notasatirar <- valoralevantar
				//para x <- 1 ate 6 faca
					//inicio
						//se notas[x].valor = notasatirar entao
							//inicio
								//achou <- verdadeiro
								//notas[x].quantidade <- notas[x].quantidade - 1
							//fim
					//fim
				//se achou = falso entao
					//inicio
					repita
					//inicio
						se notasatirar >= 200 entao
							inicio
								notasatirar <- notasatirar - 200
								notas[6].quantidade <- notas[6].quantidade - 1
							fim
						se notasatirar >= 100 entao
							inicio
								notasatirar <- notasatirar - 100
								notas[5].quantidade <- notas[5].quantidade - 1
							fim
						se notasatirar >= 50 entao
							inicio
								notasatirar <- notasatirar - 50
								notas[4].quantidade <- notas[4].quantidade - 1
							fim
						se notasatirar >= 20 entao
							inicio
								notasatirar <- notasatirar - 20
								notas[3].quantidade <- notas[3].quantidade - 1
							fim
						se notasatirar >= 10 entao
							inicio
								notasatirar <- notasatirar - 10
								notas[2].quantidade <- notas[2].quantidade - 1
							fim
						se notasatirar >= 5 entao
							inicio
								notasatirar <- notasatirar - 5
								notas[1].quantidade <- notas[1].quantidade - 1
							fim
						ate notasatirar = 0
					//fim					
				retorne valoralevantar
			fim
		senao
			escreva "Não tem saldo suficiente para levantar ", valoralevantar, " €"
			retorne 0
fim_sub_rotina levantar
sub-rotina maisops (indicetabela, saldo numerico)
	declare input, input2 literal
		x, data numerico
	repita 
		escreva "Deseja efetuar mais operaçoes? S | N"
		leia input
	ate (input = "S" ou input = "N")
	se input = "S" entao
		retorne verdadeiro
	senao
		repita 
			escreva "Deseja imprimir talao? S | N"
			leia input2
		ate (input2 = "S" ou input2 = "N")
			se input2 = "S" entao
				inicio
					limpar_tela()
					escreva "-------- Multibanco --------"
					data <- obtenha_data()
					escreva "Saldo:            ", saldo, " €" 
					escreva "Ações:            ", obtenha_dia(data),"/",obtenha_mes(data),"/",obtenha_ano(data)
					para x <- 1 ate indicetabela faca
						escreva operacoes[x].operacao, operacoes[x].valor, " €"
				fim
		retorne falso 
fim_sub_rotina maisops
sub-rotina operacao(tipo literal quantia, indicetabela numerico)
	se tipo = "levantamento" entao
		operacoes[indicetabela].operacao <- "Levantamento: "
	senao se tipo = "deposito" entao
		operacoes[indicetabela].operacao <- "Deposito: "
	operacoes[indicetabela].valor <- quantia
fim_sub_rotina operacao
