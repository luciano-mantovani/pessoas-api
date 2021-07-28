class PessoasController < ApplicationController

    def index
        @pessoas = Pessoa.all.order(:id)
    end

    def show
        @pessoa = Pessoa.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Registro não encontrado"}, status: 404
    end

    def create
        @pessoa = Pessoa.new(pessoa_params)
        #pessoa.attributes = pessoa_params
        if @pessoa.save
            #render json: {id: pessoa.id }, status: 201
            render :show, status: 201
        else
            render json: {error: pessoa.errors.full_messages }, status: 422
        end
    end

    def update
        @pessoa = Pessoa.find(params[:id])
        @pessoa.attributes = pessoa_params
        if @pessoa.save
            render :show, status: 201
        else
            render json: {error: pessoa.errors.full_messages }, status: 422
        end
    end

    def destroy
        pessoa = Pessoa.find(params[:id])
        if pessoa.destroy
            render json: {}, status: 200
        else
            render json: {error: pessoa.errors.full_messages }, status: 422
        end
    end

    
    # def new
    #     render json: {
    #         tipos_entidade: Pessoas.tipo_entidade
    #     }
    # end


    private

    def pessoa_params
        params.permit(:nome, :tipo_entidade, contatos_attributes: [:id, :tipo, :valor, :_destroy])
    end
    
end    