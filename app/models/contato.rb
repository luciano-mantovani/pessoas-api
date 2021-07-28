class Contato < ApplicationRecord
    enum tipo: {telefone: 0, celular: 1, email: 2}

    belongs_to :pessoa
end
