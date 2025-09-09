class ProductsController < ApplicationController
  def create
    # byebug
    product = Product.new(product_params)
    binding.pry
    if product.save
     return render json: { data: product, status: :ok, message: "product created successfully" }
    else
     return render json: { errors: product.errors, status: :unprocessable_entity }
    end
  end
  
  def update
   product = Product.find_by(id: params[:id])
   if product.present? && product.update(product_params)
      return render json: {data: product, status: :ok, message: "product updated successfully"}
    else
     return render json: { errors: "Product not found", status: :unprocessable_entity }
   end
  end

  def show
   product = Product.find_by(id: params[:id])
   if product.present?
      return render json: { data: product, status: :ok }
    else
     return render json: { errors: "Product not found", status: :unprocessable_entity }
   end
  end

  def destroy
   product = Product.find_by(id: params[:id])
   if product.present? && product.destroy
      return render json: { message: "Product deleted successfully", status: :ok }
    else
     return render json: { errors: "Product not found", status: :unprocessable_entity }
   end
  end

  def index
    render json: { data: Product.all, status: :ok }
  end

  private

  def product_params
    params.require(:product).permit(:id, :name, :description, :price, :stock)
  end
end
