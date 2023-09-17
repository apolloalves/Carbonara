from prompt_toolkit import prompt
from prompt_toolkit.shortcuts import checkboxlist

options = [
    ("Opção 1", "opcao1"),
    ("Opção 2", "opcao2"),
    ("Opção 3", "opcao3"),
    ("Sair", "sair")
]

result = prompt(
    "Escolha uma opção:",
    style="fg:#888",
    completer=checkboxlist(options),
    complete_while_typing=True,
)

if "opcao1" in result:
    print("Opção 1 selecionada!")
if "opcao2" in result:
    print("Opção 2 selecionada!")
if "opcao3" in result:
    print("Opção 3 selecionada!")
if "sair" in result:
    print("Saindo do menu.")
