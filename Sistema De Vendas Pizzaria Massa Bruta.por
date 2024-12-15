programa
{
    // Constantes
    const inteiro MAX_PIZZAS = 100

    // Variáveis globais
    cadeia sabores[MAX_PIZZAS]
    real precos[MAX_PIZZAS]
    inteiro totalSabores = 0

    inteiro idsVendas[MAX_PIZZAS]
    inteiro quantidadesVendas[MAX_PIZZAS]
    real totalVendas = 0.0 // Corrigido para 0.0 (real)
    inteiro totalVendasRealizadas = 0

    funcao inicio()
    {
        inteiro opcao = -1 // Inicializando opcao com um valor padrão

        // Menu principal
        enquanto (opcao != 0)
        {
            escreva("\n===== Menu Principal =====\n")
            escreva("1 - Cadastros\n")
            escreva("2 - Lançamento\n")
            escreva("3 - Relatórios\n")
            escreva("0 - Sair\n")
            leia(opcao)

            escolha(opcao)
            {
                caso 1:
                    menuCadastro()
                caso 2:
                    menuLancamento()
                caso 3:
                    menuRelatorios()
                caso 0:
                    escreva("Saindo...\n")
                caso contrario:
                    escreva("Opção inválida. Tente novamente.\n")
            }
        }
    }

    // Função para o menu de cadastro
    funcao menuCadastro()
    {
        inteiro opcaoCadastro

        escreva("\n===== Menu de Cadastros =====\n")
        escreva("1.1 - Cadastrar sabor e preço\n")
        escreva("1.2 - Reajuste de preço\n")
        leia(opcaoCadastro)

        escolha(opcaoCadastro)
        {
            caso 1:
                cadastrarSabor()
            caso 2:
                reajustarPrecos()
            caso contrario:
                escreva("Opção inválida. Tente novamente.\n")
        }
    }

    // Função para cadastrar sabores e preços
    funcao cadastrarSabor()
    {
        se (totalSabores < MAX_PIZZAS)
        {
            escreva("Informe o nome do sabor da pizza: ")
            leia(sabores[totalSabores])

            escreva("Informe o preço do sabor: ")
            leia(precos[totalSabores])

            totalSabores++
            escreva("Sabor cadastrado com sucesso!\n")
        }
        senao
        {
            escreva("Limite máximo de sabores atingido.\n")
        }
    }

    // Função para reajustar os preços
    funcao reajustarPrecos()
    {
        real indice

        escreva("Informe o índice de reajuste (em %): ")
        leia(indice)

        para (inteiro i = 0; i < totalSabores; i++)
        {
            precos[i] = precos[i] + (precos[i] * (indice / 100))
        }

        escreva("Reajuste aplicado com sucesso!\n")
    }

    // Função para o menu de lançamento
    funcao menuLancamento()
    {
        inteiro opcaoLancamento

        escreva("\n===== Menu de Lançamento =====\n")
        escreva("2.1 - Registrar venda\n")
        leia(opcaoLancamento)

        escolha(opcaoLancamento)
        {
            caso 1:
                registrarVenda()
            caso contrario:
                escreva("Opção inválida. Tente novamente.\n")
        }
    }

    // Função para registrar uma venda
    funcao registrarVenda()
    {
        inteiro idPizza, quantidade

        escreva("Informe o número do sabor da pizza (0 a ", totalSabores-1, "): ")
        leia(idPizza)

        se (idPizza >= 0 e idPizza < totalSabores)
        {
            escreva("Informe a quantidade: ")
            leia(quantidade)

            real valorTotal = quantidade * precos[idPizza]
            escreva("Total a pagar: R$", valorTotal, "\n")

            // Armazenar venda
            idsVendas[totalVendasRealizadas] = idPizza
            quantidadesVendas[totalVendasRealizadas] = quantidade
            totalVendas = totalVendas + valorTotal
            totalVendasRealizadas++
        }
        senao
        {
            escreva("ID do sabor inválido.\n")
        }
    }

    // Função para o menu de relatórios
    funcao menuRelatorios()
    {
        inteiro opcaoRelatorios

        escreva("\n===== Menu de Relatórios =====\n")
        escreva("3.1 - Relatório de vendas\n")
        escreva("3.2 - Tabela de preços\n")
        leia(opcaoRelatorios)

        escolha(opcaoRelatorios)
        {
            caso 1:
                relatorioVendas()
            caso 2:
                tabelaPrecos()
            caso contrario:
                escreva("Opção inválida. Tente novamente.\n")
        }
    }

    // Função para gerar o relatório de vendas
    funcao relatorioVendas()
    {
        escreva("\n===== Relatório de Vendas =====\n")

        para (inteiro i = 0; i < totalVendasRealizadas; i++)
        {
            inteiro idPizza = idsVendas[i]
            inteiro quantidade = quantidadesVendas[i]
            real valorTotal = quantidade * precos[idPizza]

            escreva("Venda ", i + 1, ": Pizza ", sabores[idPizza], ", Quantidade: ", quantidade, ", Total: R$", valorTotal, "\n")
        }

        escreva("\nTotal geral de vendas: R$", totalVendas, "\n")
    }

    // Função para listar a tabela de preços
    funcao tabelaPrecos()
    {
        escreva("\n===== Tabela de Preços =====\n")

        para (inteiro i = 0; i < totalSabores; i++)
        {
            escreva("Pizza ", i, ": ", sabores[i], " - R$", precos[i], "\n")
        }
    }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5231; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */