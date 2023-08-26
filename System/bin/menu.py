def show_menu(options):
    print("Selecione uma opção:")
    for index, option in enumerate(options, start=1):
        print(f"{index}. {option}")
    print("0. Sair")

def main():
    menu_options = ["Opção 1", "Opção 2", "Opção 3"]

    while True:
        show_menu(menu_options)
        choice = input("Digite o número da opção desejada: ")

        if choice == '0':
            print("Saindo do menu.")
            break

        try:
            choice = int(choice)
            if 1 <= choice <= len(menu_options):
                print(f"Executando '{menu_options[choice - 1]}'...")
            else:
                print("Opção inválida. Tente novamente.")
        except ValueError:
            print("Digite um número válido.")

if __name__ == "__main__":
    main()
