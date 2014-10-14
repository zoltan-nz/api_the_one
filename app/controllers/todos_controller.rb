class TodosController < ApplicationController

  def index
    render json: {
               todos: [
                   {
                       id: 1,
                       body: 'First Todo'
                   },
                   {
                       id: 2,
                       body: 'Second Todo'
                   }
               ]

           }
  end

  def create
    render json: {}
  end
end
