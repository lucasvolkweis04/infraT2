# ✈️ Integração e Gestão de Dados Aéreos: Do Relacional ao NoSQL Distribuído (infraT2)

## 🎯 O Contexto e o Desafio

Sistemas de aviação lidam com um volume massivo de informações globais em tempo real. Enquanto bancos de dados relacionais garantem a integridade rigorosa para transações iniciais, a necessidade de alta disponibilidade e escalabilidade global frequentemente exige a adoção de bancos de dados NoSQL distribuídos.

O objetivo deste projeto é demonstrar a arquitetura e a transição de dados entre esses dois mundos. O sistema realiza a gestão de voos, aeroportos, reservas e passageiros em um banco relacional clássico e implementa um pipeline ETL (Extração, Transformação e Carga) para replicar essas informações em um ambiente NoSQL distribuído na AWS, utilizando DataStax Cassandra. O foco é garantir a consistência dos dados, viabilizando consultas analíticas e operacionais em ambas as plataformas.

---

## 🏗️ Arquitetura e Tecnologias

O projeto foi estruturado para simular um ambiente corporativo real de migração e sincronização de dados:

**Banco de Dados Relacional (Origem)**  
Responsável pelas operações transacionais (ACID) iniciais e armazenamento estruturado dos dados de voos, passageiros e aeroportos.

**Pipeline ETL**  
Lógica de extração dos dados relacionais, transformação para o modelo orientado a colunas/famílias, e carga contínua.

**DataStax Cassandra (Destino)**  
Banco de dados NoSQL altamente escalável.

**Infraestrutura Cloud**  
Hospedagem da instância do Cassandra utilizando **Amazon Web Services (AWS)**, permitindo consultas distribuídas e alta disponibilidade.

---

## 🗄️ Modelagem de Consultas (Fluxos Operacionais)

Para validar a modelagem e a eficiência do sistema, foram desenvolvidas quatro sequências lógicas de consultas (Queries), que simulam o uso real da aplicação por clientes e administradores.

---

### 🗺️ Sequência 1: Planejamento e Detalhamento de Voo

**Q1 (Busca de Voos)**  
Encontra todos os voos disponíveis entre dois aeroportos específicos para uma data de partida fornecida. Permite ao usuário visualizar as opções de rota.

**Q2 (Detalhes da Aeronave)**  
A partir da Q1, obtém detalhes profundos sobre o voo selecionado, incluindo dados da companhia aérea, modelo do avião e capacidade total.

---

### 👥 Sequência 2: Gestão de Passageiros

**Q3 (Manifesto de Voo)**  
Retorna a lista completa de passageiros com reservas confirmadas para um determinado voo.

**Q4 (Ficha do Passageiro)**  
A partir da Q3, exibe os detalhes individuais de um passageiro selecionado, englobando informações restritas de contato e endereço.

---

### 🛫 Sequência 3: Operações de Aeroporto e Status

**Q5 (Painel de Partidas)**  
Lista todos os voos que partem de um aeroporto específico em uma data determinada (incluindo companhia e aeronave). Fundamental para o gerenciamento do pátio e planejamento diário.

**Q6 (Rastreio de Reserva)**  
Permite que funcionários ou clientes verifiquem o status atualizado de uma reserva específica através do `booking_id`.

---

### 📊 Sequência 4: Análise de Tráfego e Demanda

**Q7 (Previsão de Tráfego Aéreo)**  
Calcula a quantidade total de aeronaves com destino programado para uma cidade específica, auxiliando na previsão de capacidade do aeroporto.

**Q8 (Estimativa de Fluxo de Pessoas)**  
Retorna a quantidade total de passageiros em deslocamento para essa mesma cidade em um determinado dia, gerando métricas de demanda turística ou comercial.

---

## 👨🏻‍💻 Autoria

Desenvolvido por **Lucas Volkweis** como **Trabalho 2 (T2)** da disciplina de **Infraestrutura e Gestão de Dados (PUCRS)**.
