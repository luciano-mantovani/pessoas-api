class Pessoa < ApplicationRecord
    enum tipo_entidade: {fisica: 0, juridica: 1}

    validates :nome, presence: true, uniqueness: true;
    validates :tipo_entidade, presence: true
end
