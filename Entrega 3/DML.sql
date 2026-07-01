-- Populando Pessoa (Mesclando Clientes e Funcionários)
INSERT INTO pessoa (nome, cpf, telefone) VALUES
('Ana Clara Souza', '111.222.333-44', '(44) 99999-1111'),
('Carlos Eduardo Lima', '222.333.444-55', '(44) 99999-2222'),
('Mariana Santos', '333.444.555-66', '(44) 99999-3333'),
('João Pereira', '444.555.666-77', '(44) 99999-4444'),
('Beatriz Costa', '555.666.777-88', '(44) 99999-5555'),
('Lucas Almeida', '666.777.888-99', '(44) 99999-6666'),
('Fernanda Silva', '777.888.999-00', '(44) 99999-7777'),
('Ricardo Gomes', '888.999.000-11', '(44) 99999-8888'),
('Juliana Rocha', '999.000.111-22', '(44) 99999-9999'),
('Pedro Henrique', '000.111.222-33', '(44) 99999-0000');

-- Populando Clientes (IDs 1 a 8)
INSERT INTO cliente (id_pessoa_FK, data_cadastro, pontos_fidelidade, email) VALUES
(1, '2025-01-15', 150, 'ana.souza@email.com'),
(2, '2025-02-10', 20, 'carlos.lima@email.com'),
(3, '2025-03-05', 300, 'mariana.santos@email.com'),
(4, '2025-04-20', 50, 'joao.pereira@email.com'),
(5, '2025-05-12', 0, 'beatriz.costa@email.com'),
(6, '2025-06-01', 500, 'lucas.almeida@email.com'),
(7, '2025-07-18', 75, 'fernanda.silva@email.com'),
(8, '2025-08-22', 10, 'ricardo.gomes@email.com');

-- Populando Funcionários (IDs 9 e 10 - Operadores de Caixa)
INSERT INTO funcionario (id_pessoa_FK, matricula, cargo, salario) VALUES
(9, 'F2026-001', 'Atendente de Farmácia', 2500.00),
(10, 'F2026-002', 'Farmacêutico Responsável', 5400.00);

-- Populando Produtos
INSERT INTO produto (nome_comercial, codigo_barras, preco_venda) VALUES
('Dipirona Monoidratada 500mg', '7891112223334', 8.50),
('Paracetamol 750mg', '7892223334445', 12.00),
('Ibuprofeno 400mg', '7893334445556', 15.90),
('Shampoo Anticaspa Clear', '7894445556667', 22.90),
('Protetor Solar FPS 50', '7895556667778', 55.00),
('Sabonete Líquido Facial', '7896667778889', 35.50),
('Vitamina C 1g', '7897778889990', 29.90),
('Loratadina 10mg', '7898889990001', 14.20),
('Fralda Descartável P', '7899990001112', 45.00),
('Escova Dental Macia', '7890001112223', 18.00);

-- Populando Vendas
INSERT INTO venda (data_hora, valor_total, forma_pagamento, id_pessoa_cliente_FK, id_pessoa_funcionario_FK) VALUES
('2026-06-25 10:30:00', 20.50, 'PIX', 1, 9),
('2026-06-25 11:15:00', 55.00, 'Cartão de Crédito', 2, 9),
('2026-06-25 14:20:00', 15.90, 'Dinheiro', 3, 10),
('2026-06-26 09:05:00', 90.50, 'Cartão de Débito', 4, 9),
('2026-06-26 16:40:00', 22.90, 'PIX', 5, 10),
('2026-06-27 12:10:00', 103.00, 'Cartão de Crédito', 6, 9),
('2026-06-28 08:50:00', 14.20, 'Dinheiro', 7, 9),
('2026-06-29 18:30:00', 45.00, 'PIX', 8, 10),
('2026-06-30 15:45:00', 29.90, 'Cartão de Débito', 1, 10),
('2026-07-01 10:00:00', 35.50, 'PIX', 2, 9);

-- Populando Itens da Venda
INSERT INTO item_venda (id_venda_FK, id_produto_FK, quantidade_vendida, valor_unitario, subtotal) VALUES
(1, 1, 1, 8.50, 8.50),
(1, 2, 1, 12.00, 12.00),
(2, 5, 1, 55.00, 55.00),
(3, 3, 1, 15.90, 15.90),
(4, 5, 1, 55.00, 55.00),
(4, 6, 1, 35.50, 35.50),
(5, 4, 1, 22.90, 22.90),
(6, 9, 2, 45.00, 90.00),
(6, 2, 1, 13.00, 13.00),
(7, 8, 1, 14.20, 14.20);