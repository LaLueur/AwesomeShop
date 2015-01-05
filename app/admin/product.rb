ActiveAdmin.register Product do

  index do
    column :name do |this|
      link_to this.name, admin_product_path(this)
    end
    column :categories do |this|
      this.categories.map { |category|
        category.name}.join(', ')
    end
    column :description
    column :price do |this|
      number_to_currency this.price
    end
    column :image do |this|
      a :href => admin_product_path(this) do
        image_tag this.image_url(:small) if this.image?
      end
    end
    # column :price, :sortable => :price do |product|
    #   div :class => "price" do
    #     number_to_currency product.price, :unit => '&pound;'
    #   end
    # end
  end


  form(:html => { :multipart => true })  do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Product' do
      f.input :name
      f.input :description
      f.input :price
      f.input :image, :as => :file
    end
    f.input :categories, :as => :check_boxes
    # f.inputs :for => :product_categories do |c|
    #   c.input :category_id, as: :select, collection: Category.all
    # end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :name
      div do
        a :href => admin_product_path(product) do
          image_tag product.image_url(:thumb)
        end
      end
      row :description
      row :price
      row :categories do |this|
        this.categories.map { |category|
          category.name }.join(', ')
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :description, :price, :id, :image, category_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
end
