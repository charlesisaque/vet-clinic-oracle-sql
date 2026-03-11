# 🐾 Banco de Dados - Clínica Veterinária

Este projeto contém a **modelagem e implementação de um banco de dados relacional** para uma clínica veterinária.
O objetivo é organizar informações de **clientes, animais, veterinários e atendimentos**.

O banco foi desenvolvido utilizando **SQL (Oracle)** e segue conceitos de **modelagem relacional e integridade referencial**.

---

# 📊 Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas:

## 👤 Cliente

Armazena os dados dos donos dos animais.

Principais campos:

* ID_CLIENTE (Primary Key)
* NOME_COMPLETO
* CPF_CNPJ
* TELEFONE1
* TELEFONE2
* RUA
* BAIRRO
* CIDADE

Relacionamento:

* Um **cliente pode possuir vários animais**.

---

## 🐶 Animal

Armazena informações dos animais cadastrados na clínica.

Principais campos:

* ID_ANIMAL (Primary Key)
* ID_CLIENTE (Foreign Key)
* NOME_ANIMAL
* ESPECIE_ANIMAL
* RACA_ANIMAL
* PESO_ATUAL
* DATA_NASCIMENTO

Relacionamento:

* Cada **animal pertence a um cliente**.
* Um **animal pode ter vários atendimentos**.

---

## 👨‍⚕️ Veterinário

Armazena os dados dos veterinários da clínica.

Principais campos:

* ID_VETERINARIO (Primary Key)
* NOME
* CRMV
* ESPECIALIDADE
* TURNO

Relacionamento:

* Um **veterinário pode realizar vários atendimentos**.

---

## 🩺 Atendimento

Registra os atendimentos realizados na clínica.

Principais campos:

* ID_ATENDIMENTO (Primary Key)
* ID_ANIMAL (Foreign Key)
* ID_VETERINARIO (Foreign Key)
* DATA_CONSULTA
* VALOR_COBRADO
* COMENTARIO
* REMEDIOS

Relacionamento:

* Cada **atendimento está vinculado a um animal e a um veterinário**.

---

# 🧠 Diagrama do Banco de Dados

![Diagrama do Banco](diagram/diagrama_clinica_veterinaria.png)

---

# 🗂 Estrutura do Projeto

```
veterinary-clinic-database
│
├── sql
│   └── clinica_veterinaria.sql
│
├── diagram
│   └── diagrama_clinica_veterinaria.png
│
└── README.md
```

---

# ⚙️ Tecnologias Utilizadas

* SQL
* Oracle Database
* Modelagem Relacional

---

# 🎯 Objetivo do Projeto

Este projeto foi desenvolvido com finalidade **educacional**, com o objetivo de praticar:

* Modelagem de banco de dados
* Criação de tabelas SQL
* Chaves primárias e estrangeiras
* Integridade referencial
* Organização de projetos para GitHub

---

# 👨‍💻 Autor

Projeto desenvolvido por **Isaque Charles**.

